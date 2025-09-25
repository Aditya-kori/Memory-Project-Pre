onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top/pif/clk
add wave -noupdate /top/pif/rst
add wave -noupdate /top/pif/wr_rd
add wave -noupdate /top/pif/valid
add wave -noupdate /top/pif/ready
add wave -noupdate /top/pif/addr
add wave -noupdate /top/pif/wdata
add wave -noupdate /top/pif/rdata
add wave -noupdate /uvm_pkg::uvm_reg_map::do_write/#ublk#215181159#1762/immed__1766
add wave -noupdate /uvm_pkg::uvm_reg_map::do_read/#ublk#215181159#1802/immed__1806
add wave -noupdate /uvm_pkg::uvm_component_name_check_visitor::visit/immed__262
add wave -noupdate /top/uut/RESET
add wave -noupdate /top/uut/PSET
add wave -noupdate /top/uut/HANDSHAKING
add wave -noupdate /top/uut/WRITES
add wave -noupdate /top/uut/READS
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3 ns} 0}
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {331 ns}
