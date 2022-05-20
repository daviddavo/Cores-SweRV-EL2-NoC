onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_top/rvtop/swerv/exu/ed/clk_fast
add wave -noupdate /tb_top/rvtop/swerv/exu/ed/clk_slow
add wave -noupdate /tb_top/rvtop/swerv/exu/ed/rising
add wave -noupdate /tb_top/rvtop/swerv/exu/ed/q
add wave -noupdate -divider {Mul Sender}
add wave -noupdate /tb_top/rvtop/swerv/exu/i_mul_s/noc_sr_flush
add wave -noupdate /tb_top/rvtop/swerv/exu/i_mul_s/i_sender/enable
add wave -noupdate /tb_top/rvtop/swerv/exu/i_mul_s/mul_p
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_s/noc_sr_flush
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_s/i_sender/enable
add wave -noupdate /tb_top/rvtop/swerv/exu/i_mul_s/rs1_in
add wave -noupdate /tb_top/rvtop/swerv/exu/i_mul_s/rs2_in
add wave -noupdate /tb_top/rvtop/swerv/exu/i_mul_s/i_sender/state
add wave -noupdate /tb_top/rvtop/swerv/exu/i_mul_s/i_sender/nextstate
add wave -noupdate /tb_top/rvtop/swerv/exu/i_mul_s/i_sender/padding
add wave -noupdate /tb_top/rvtop/swerv/exu/i_mul_s/i_sender/packet
add wave -noupdate -divider {Div Receiver}
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_r/rst_l
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_r/noc_sr_flush
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_r/finish_dly
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_r/out
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_r/valid
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_r/i_receiver/state
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_r/i_receiver/nextstate
add wave -noupdate -divider {Mul Wrapper}
add wave -noupdate /tb_top/rvtop/swerv/exu/i_mul_wrapper/rs1_in
add wave -noupdate /tb_top/rvtop/swerv/exu/i_mul_wrapper/rs2_in
add wave -noupdate /tb_top/rvtop/swerv/exu/i_mul_wrapper/result_x
add wave -noupdate /tb_top/rvtop/swerv/exu/i_mul_wrapper/mul_p
add wave -noupdate -divider {Mul wrapper > Receiver}
add wave -noupdate /tb_top/rvtop/swerv/exu/i_mul_wrapper/i_receiver/state
add wave -noupdate /tb_top/rvtop/swerv/exu/i_mul_wrapper/i_receiver/nextstate
add wave -noupdate /tb_top/rvtop/swerv/exu/i_mul_wrapper/i_receiver/down/flit
add wave -noupdate /tb_top/rvtop/swerv/exu/i_mul_wrapper/i_receiver/down/enable
add wave -noupdate /tb_top/rvtop/swerv/exu/i_mul_wrapper/i_receiver/down/ack
add wave -noupdate -divider {Div Wrapper > Sender}
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_wrapper/i_sender/flush
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_wrapper/i_sender/ack
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_wrapper/i_sender/cnt
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_wrapper/i_sender/enable
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_wrapper/i_sender/state
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_wrapper/i_sender/nextstate
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_wrapper/i_sender/dst_addr
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_wrapper/i_sender/padding
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_wrapper/i_sender/packet
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1570140 ps} 0}
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
WaveRestoreZoom {1442321 ps} {1587247 ps}
