onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /signal_counter_tb/r_clock
add wave -noupdate /signal_counter_tb/r_signal1
add wave -noupdate /signal_counter_tb/r_signal2
add wave -noupdate /signal_counter_tb/w_counter1
add wave -noupdate /signal_counter_tb/w_counter2
add wave -noupdate -expand /signal_counter_tb/w_counter12
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {414453 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 206
configure wave -valuecolwidth 107
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
WaveRestoreZoom {0 ps} {1010337 ps}
