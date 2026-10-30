#!/usr/bin/env bash
set -euo pipefail

RV_ROOT="${RV_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}"
NOC_DIR="${NOC_DIR:-${RV_ROOT}/../poc_noc}"
SNAPSHOT="${SNAPSHOT:-noc}"
BUILD_DIR="${RV_ROOT}/build"

echo "=== SweRV EL2 + NoC Open Source Synthesis Build ==="
echo "RV_ROOT:   ${RV_ROOT}"
echo "NOC_DIR:   ${NOC_DIR}"
echo "SNAPSHOT:  ${SNAPSHOT}"
echo "BUILD_DIR: ${BUILD_DIR}"

mkdir -p "${BUILD_DIR}"

if [ ! -d "${NOC_DIR}" ]; then
  echo "Error: ${NOC_DIR} not found!"
  exit 1
fi

echo "--> Step 1: Converting SystemVerilog to Verilog via sv2v..."
nix --extra-experimental-features "nix-command flakes" shell nixpkgs#haskellPackages.sv2v --command sv2v \
  -Isnapshots/${SNAPSHOT} -Idesign/include -Idesign/lib -I"${NOC_DIR}/src/include" \
  -DRV_OPENSOURCE -DRV_EXU_NOC \
  snapshots/${SNAPSHOT}/common_defines.vh design/include/el2_def.sv snapshots/${SNAPSHOT}/el2_pdef.vh snapshots/${SNAPSHOT}/noc_defines.vh "${NOC_DIR}/src/include/common_defines.vh" \
  "${NOC_DIR}/src/include/noc_types.sv" "${NOC_DIR}/src/include/noc_functions.sv" "${NOC_DIR}/src/interfaces/node_port.sv" "${NOC_DIR}/src/node_link.sv" "${NOC_DIR}/src/crossbar_rr.sv" "${NOC_DIR}/src/node.sv" "${NOC_DIR}/src/mesh.sv" "${NOC_DIR}/src/utils/noc_serial_receiver.sv" "${NOC_DIR}/src/utils/noc_serial_sender.sv" \
  design/lib/edge_detector.sv design/lib/el2_lib.sv design/lib/beh_lib.sv design/lib/mem_lib.sv design/lib/ahb_to_axi4.sv design/lib/axi4_to_ahb.sv \
  design/dmi/rvjtag_tap.v design/dmi/dmi_jtag_to_core_sync.v design/dmi/dmi_wrapper.v \
  design/dbg/el2_dbg.sv \
  design/exu/noc_wrappers/el2_exu_div_receiver.sv design/exu/noc_wrappers/el2_exu_div_sender.sv design/exu/noc_wrappers/el2_exu_div_wrapper.sv design/exu/noc_wrappers/el2_exu_mul_receiver.sv design/exu/noc_wrappers/el2_exu_mul_sender.sv design/exu/noc_wrappers/el2_exu_mul_wrapper.sv \
  design/exu/el2_exu_alu_ctl.sv design/exu/el2_exu_mul_ctl.sv design/exu/el2_exu_div_ctl.sv design/exu/el2_exu.sv \
  design/ifu/el2_ifu_aln_ctl.sv design/ifu/el2_ifu_compress_ctl.sv design/ifu/el2_ifu_ifc_ctl.sv design/ifu/el2_ifu_bp_ctl.sv design/ifu/el2_ifu_ic_mem.sv design/ifu/el2_ifu_mem_ctl.sv design/ifu/el2_ifu_iccm_mem.sv design/ifu/el2_ifu.sv \
  design/dec/el2_dec_decode_ctl.sv design/dec/el2_dec_gpr_ctl.sv design/dec/el2_dec_ib_ctl.sv design/dec/el2_dec_tlu_ctl.sv design/dec/el2_dec_trigger.sv design/dec/el2_dec.sv \
  design/lsu/el2_lsu_clkdomain.sv design/lsu/el2_lsu_addrcheck.sv design/lsu/el2_lsu_lsc_ctl.sv design/lsu/el2_lsu_stbuf.sv design/lsu/el2_lsu_bus_buffer.sv design/lsu/el2_lsu_bus_intf.sv design/lsu/el2_lsu_ecc.sv design/lsu/el2_lsu_dccm_mem.sv design/lsu/el2_lsu_dccm_ctl.sv design/lsu/el2_lsu_trigger.sv design/lsu/el2_lsu.sv \
  design/el2_pic_ctrl.sv design/el2_dma_ctrl.sv design/el2_mem.sv design/el2_swerv.sv design/el2_swerv_wrapper.sv \
  --top=el2_swerv_wrapper > "${BUILD_DIR}/swerv_noc.v"

echo "--> Step 2: Running Yosys hierarchy check and synthesis..."
nix --extra-experimental-features "nix-command flakes" shell nixpkgs#yosys --command yosys -p "
  read_verilog ${BUILD_DIR}/swerv_noc.v
  hierarchy -check -top el2_swerv_wrapper
  synth -top el2_swerv_wrapper
  stat
" | tee "${BUILD_DIR}/synth.log"

echo "=== Build Complete! Log saved to ${BUILD_DIR}/synth.log ==="
