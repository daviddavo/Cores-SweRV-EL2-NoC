onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_top/rvtop/swerv/exu/ed/clk_fast
add wave -noupdate /tb_top/rvtop/swerv/exu/ed/clk_slow
add wave -noupdate /tb_top/rvtop/swerv/exu/ed/rising
add wave -noupdate /tb_top/rvtop/swerv/exu/ed/q
add wave -noupdate -divider {Div Sender}
add wave -noupdate /tb_top/rvtop/swerv/exu/div_p
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_s/noc_sr_flush
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_s/i_sender/enable
add wave -noupdate -radix hexadecimal -childformat {{/tb_top/rvtop/swerv/exu/i_div_s/dp.valid -radix hexadecimal} {/tb_top/rvtop/swerv/exu/i_div_s/dp.unsign -radix hexadecimal} {/tb_top/rvtop/swerv/exu/i_div_s/dp.rem -radix hexadecimal}} -radixshowbase 0 -expand -subitemconfig {/tb_top/rvtop/swerv/exu/i_div_s/dp.valid {-height 15 -radix hexadecimal -radixshowbase 0} /tb_top/rvtop/swerv/exu/i_div_s/dp.unsign {-height 15 -radix hexadecimal -radixshowbase 0} /tb_top/rvtop/swerv/exu/i_div_s/dp.rem {-height 15 -radix hexadecimal -radixshowbase 0}} /tb_top/rvtop/swerv/exu/i_div_s/dp
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_s/dividend
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_s/divisor
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_s/cancel
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_s/i_sender/state
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_s/i_sender/nextstate
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_s/i_sender/packet
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_s/i_sender/padding
add wave -noupdate -divider {Div Receiver}
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_r/rst_l
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_r/noc_sr_flush
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_r/finish_dly
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_r/out
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_r/valid
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_r/i_receiver/state
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_r/i_receiver/nextstate
add wave -noupdate -divider {Div wrapper}
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_wrapper/dividend
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_wrapper/divisor
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_wrapper/out
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_wrapper/i_div/dp
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_wrapper/i_div/dividend
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_wrapper/i_div/divisor
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_wrapper/i_div/cancel
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_wrapper/i_div/finish_dly
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_wrapper/i_div/out
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_wrapper/valid
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_wrapper/ack
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_wrapper/i_receiver/packet
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_wrapper/i_receiver/padding
add wave -noupdate -divider {Div wrapper > Receiver}
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_wrapper/i_receiver/flush
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_wrapper/i_receiver/state
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_wrapper/i_receiver/nextstate
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_wrapper/i_receiver/down/flit
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_wrapper/i_receiver/down/enable
add wave -noupdate /tb_top/rvtop/swerv/exu/i_div_wrapper/i_receiver/down/ack
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
WaveRestoreCursors {{Cursor 1} {1216797 ps} 0}
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
WaveRestoreZoom {1214886 ps} {1219542 ps}
