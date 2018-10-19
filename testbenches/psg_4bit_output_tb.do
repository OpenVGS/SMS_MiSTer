onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /psg_4bit_output_tb/clk_tb
add wave -noupdate /psg_4bit_output_tb/WR_n_tb
add wave -noupdate -radix hexadecimal /psg_4bit_output_tb/D_in_tb
add wave -noupdate -radix hexadecimal -childformat {{/psg_4bit_output_tb/output_tb(5) -radix hexadecimal} {/psg_4bit_output_tb/output_tb(4) -radix hexadecimal} {/psg_4bit_output_tb/output_tb(3) -radix hexadecimal} {/psg_4bit_output_tb/output_tb(2) -radix hexadecimal} {/psg_4bit_output_tb/output_tb(1) -radix hexadecimal} {/psg_4bit_output_tb/output_tb(0) -radix hexadecimal}} -subitemconfig {/psg_4bit_output_tb/output_tb(5) {-height 15 -radix hexadecimal} /psg_4bit_output_tb/output_tb(4) {-height 15 -radix hexadecimal} /psg_4bit_output_tb/output_tb(3) {-height 15 -radix hexadecimal} /psg_4bit_output_tb/output_tb(2) {-height 15 -radix hexadecimal} /psg_4bit_output_tb/output_tb(1) {-height 15 -radix hexadecimal} /psg_4bit_output_tb/output_tb(0) {-height 15 -radix hexadecimal}} /psg_4bit_output_tb/output_tb
add wave -noupdate /psg_4bit_output_tb/reset_n_tb
add wave -noupdate -radix hexadecimal /psg_4bit_output_tb/psg_u0/output0
add wave -noupdate -radix hexadecimal /psg_4bit_output_tb/psg_u0/output1
add wave -noupdate -radix hexadecimal /psg_4bit_output_tb/psg_u0/output2
add wave -noupdate -radix hexadecimal /psg_4bit_output_tb/psg_u0/output3
add wave -noupdate -radix hexadecimal /psg_4bit_output_tb/psg_u0/volume0
add wave -noupdate -radix hexadecimal /psg_4bit_output_tb/psg_u0/volume1
add wave -noupdate -radix hexadecimal /psg_4bit_output_tb/psg_u0/volume2
add wave -noupdate -radix hexadecimal /psg_4bit_output_tb/psg_u0/volume3
add wave -noupdate -radix hexadecimal /psg_4bit_output_tb/psg_u0/tone0
add wave -noupdate -radix hexadecimal /psg_4bit_output_tb/psg_u0/tone1
add wave -noupdate -radix hexadecimal /psg_4bit_output_tb/psg_u0/tone2
add wave -noupdate -radix hexadecimal /psg_4bit_output_tb/psg_u0/ctrl3
add wave -noupdate /psg_4bit_output_tb/psg_u0/t0/counter
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2834696 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 246
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {0 ps} {12053960 ps}
