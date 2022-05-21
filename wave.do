onerror {resume}
quietly virtual signal -install /tb_top/rvtop/swerv/exu/i_alu_s { (context /tb_top/rvtop/swerv/exu/i_alu_s )&{flush_upper_x , flush_lower_r , enable , valid_in , ap , csr_ren_in ,csr_rddata_in ,a_in ,b_in ,pc_in , pp_in ,brimm_in }} alu_snd
quietly virtual function -install /tb_top/rvtop/swerv/exu/i_alu_wrapper -env /tb_top/rvtop/swerv/exu/i_alu_s { &{/tb_top/rvtop/swerv/exu/i_alu_wrapper/flush_upper_x, /tb_top/rvtop/swerv/exu/i_alu_wrapper/flush_lower_r, /tb_top/rvtop/swerv/exu/i_alu_wrapper/enable, /tb_top/rvtop/swerv/exu/i_alu_wrapper/valid_in, /tb_top/rvtop/swerv/exu/i_alu_wrapper/ap, /tb_top/rvtop/swerv/exu/i_alu_wrapper/csr_ren_in, /tb_top/rvtop/swerv/exu/i_alu_wrapper/csr_rddata_in, /tb_top/rvtop/swerv/exu/i_alu_wrapper/a_in, /tb_top/rvtop/swerv/exu/i_alu_wrapper/b_in, /tb_top/rvtop/swerv/exu/i_alu_wrapper/pc_in, /tb_top/rvtop/swerv/exu/i_alu_wrapper/pp_in, /tb_top/rvtop/swerv/exu/i_alu_wrapper/brimm_in }} wr_rcv
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_top/rvtop/swerv/exu/ed/clk_fast
add wave -noupdate /tb_top/rvtop/swerv/exu/ed/clk_slow
add wave -noupdate /tb_top/rvtop/swerv/exu/ed/rising
add wave -noupdate /tb_top/rvtop/swerv/exu/ed/q
add wave -noupdate -divider {ALU Sender}
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_s/i_sender0/state
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_s/i_sender0/nextstate
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_s/i_sender1/state
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_s/i_sender1/nextstate
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_s/flush_upper_x
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_s/flush_lower_r
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_s/enable
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_s/valid_in
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_s/ap
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_s/csr_ren_in
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_s/csr_rddata_in
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_s/a_in
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_s/b_in
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_s/pc_in
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_s/pp_in
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_s/brimm_in
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_s/alu_snd
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_s/sender_enable
add wave -noupdate -divider {ALU Receiver}
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_r/i_receiver/state
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_r/i_receiver/nextstate
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_r/result_ff
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_r/flush_upper_out
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_r/flush_final_out
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_r/flush_path_out
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_r/pc_ff
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_r/pred_correct_out
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_r/predict_p_out
add wave -noupdate -divider {Mul Wrapper}
add wave -noupdate /tb_top/rvtop/swerv/exu/i_mul_wrapper/rs1_in
add wave -noupdate /tb_top/rvtop/swerv/exu/i_mul_wrapper/rs2_in
add wave -noupdate /tb_top/rvtop/swerv/exu/i_mul_wrapper/result_x
add wave -noupdate /tb_top/rvtop/swerv/exu/i_mul_wrapper/mul_p
add wave -noupdate -divider {ALU wrapper > Receiver}
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/i_receiver0/state
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/i_receiver0/nextstate
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/i_receiver1/state
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/i_receiver1/nextstate
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/flush_upper_x
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/flush_lower_r
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/enable
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/valid_in
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/ap
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/csr_ren_in
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/csr_rddata_in
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/a_in
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/b_in
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/pc_in
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/pp_in
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/brimm_in
add wave -noupdate -expand /tb_top/rvtop/swerv/exu/i_alu_wrapper/wr_rcv
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/valid0
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/valid1
add wave -noupdate -divider {ALU Wrapper > Sender}
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/i_sender/dst_addr
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/i_sender/state
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/i_sender/nextstate
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/i_sender/enable
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/i_sender/ack
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/i_sender/cnt
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/i_sender/padding
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/i_sender/packet
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/result_ff
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/flush_upper_out
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/flush_final_out
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/flush_path_out
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/pc_ff
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/pred_correct_out
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/predict_p_out
add wave -noupdate -divider ALU
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/i_alu/scan_mode
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/i_alu/flush_upper_x
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/i_alu/flush_lower_r
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/i_alu/enable
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/i_alu/valid_in
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/i_alu/ap
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/i_alu/csr_ren_in
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/i_alu/csr_rddata_in
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/i_alu/a_in
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/i_alu/b_in
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/i_alu/pc_in
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/i_alu/pp_in
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/i_alu/brimm_in
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/i_alu/result_ff
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/i_alu/flush_upper_out
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/i_alu/flush_final_out
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/i_alu/flush_path_out
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/i_alu/pc_ff
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/i_alu/pred_correct_out
add wave -noupdate /tb_top/rvtop/swerv/exu/i_alu_wrapper/i_alu/predict_p_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {69404 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {14404 ps} {248437 ps}
