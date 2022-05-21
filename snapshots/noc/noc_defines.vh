`define RV_EXU_NOC
`define EXU_NOC_HEIGHT 2
`define EXU_NOC_WIDTH 2

// WRAPPER_DIV is located on north[0]
`define I_DIV_WR_UP   north_down[0]
`define I_DIV_WR_DOWN north_up[0]
`define I_DIV_SND     west_down[0]
`define I_DIV_RCV     west_up[0]
`define POS_DIV_WRAPPER_X 0
`define POS_DIV_WRAPPER_Y 1
`define POS_DIV_WRAPPER '{ `POS_DIV_WRAPPER_X, `POS_DIV_WRAPPER_Y }
`define POS_DIV_RCV_X 1
`define POS_DIV_RCV_Y 0
`define POS_DIV_RCV '{ `POS_DIV_RCV_X, `POS_DIV_RCV_Y }
// POS_DIV_SND is never used

`define I_MUL_WR_UP   north_down[1]
`define I_MUL_WR_DOWN north_up[1]
`define I_MUL_SND     east_down[0]
`define I_MUL_RCV     east_up[0]
`define POS_MUL_WRAPPER_X 0
`define POS_MUL_WRAPPER_Y 2
`define POS_MUL_WRAPPER '{ `POS_MUL_WRAPPER_X, `POS_MUL_WRAPPER_Y }
`define POS_MUL_RCV_X 1
`define POS_MUL_RCV_Y 3
`define POS_MUL_RCV '{ `POS_MUL_RCV_X, `POS_MUL_RCV_Y }
// POS_MUL_SND is never used

`define I_ALU_WR_UP    south_down[0]

`define I_ALU_WR_DOWN0 south_up[0]
`define I_ALU_WR_DOWN1 south_up[1]

`define I_ALU_SND0     west_down[1]
`define I_ALU_SND1     east_down[1]
`define I_ALU_RCV      west_up[1]

`define POS_ALU_WRAPPER0_X 3
`define POS_ALU_WRAPPER0_Y 1
`define POS_ALU_WRAPPER0 '{ `POS_ALU_WRAPPER0_X, `POS_ALU_WRAPPER0_Y }
`define POS_ALU_WRAPPER1_X 3
`define POS_ALU_WRAPPER1_Y 2 
`define POS_ALU_WRAPPER1 '{ `POS_ALU_WRAPPER1_X, `POS_ALU_WRAPPER1_Y }

`define POS_ALU_RCV_X      2
`define POS_ALU_RCV_Y      0
`define POS_ALU_RCV      '{ `POS_ALU_RCV_X, `POS_ALU_RCV_Y }

`define ALU_PACKET0  { a_in, b_in, ap, brimm_in }
`define ALU_PADDING0 { flush_upper_x, flush_lower_r, csr_ren_in }
`define ALU_PACKET1  { csr_rddata_in, pc_in, pp_in }
`define ALU_PADDING1 { enable, valid_in }
`define ALU_PACKET_RESULT { result_ff, flush_path_out, pc_ff, predict_p_out }
`define ALU_PADDING_RESULT { flush_upper_out, flush_final_out, pred_correct_out }