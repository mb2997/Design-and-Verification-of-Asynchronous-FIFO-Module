onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group TOP -radix unsigned /async_fifo_top/wclk
add wave -noupdate -expand -group TOP -radix unsigned /async_fifo_top/rclk
add wave -noupdate -expand -group TOP -radix unsigned /async_fifo_top/wrst_n
add wave -noupdate -expand -group TOP -radix unsigned /async_fifo_top/rrst_n
add wave -noupdate -expand -group INTERFACE -radix unsigned /async_fifo_top/inf/wclk
add wave -noupdate -expand -group INTERFACE -radix unsigned /async_fifo_top/inf/wrst_n
add wave -noupdate -expand -group INTERFACE -radix unsigned /async_fifo_top/inf/rclk
add wave -noupdate -expand -group INTERFACE -radix unsigned /async_fifo_top/inf/rrst_n
add wave -noupdate -expand -group INTERFACE -radix unsigned /async_fifo_top/inf/rdata
add wave -noupdate -expand -group INTERFACE -radix unsigned /async_fifo_top/inf/wfull
add wave -noupdate -expand -group INTERFACE -radix unsigned /async_fifo_top/inf/rempty
add wave -noupdate -expand -group INTERFACE -radix unsigned /async_fifo_top/inf/wdata
add wave -noupdate -expand -group INTERFACE -radix unsigned /async_fifo_top/inf/winc
add wave -noupdate -expand -group INTERFACE -radix unsigned /async_fifo_top/inf/rinc
add wave -noupdate -expand -group DUT -radix unsigned /async_fifo_top/DUT/rdata
add wave -noupdate -expand -group DUT -radix unsigned /async_fifo_top/DUT/wfull
add wave -noupdate -expand -group DUT -radix unsigned /async_fifo_top/DUT/rempty
add wave -noupdate -expand -group DUT -radix unsigned /async_fifo_top/DUT/wdata
add wave -noupdate -expand -group DUT -radix unsigned /async_fifo_top/DUT/winc
add wave -noupdate -expand -group DUT -radix unsigned /async_fifo_top/DUT/wclk
add wave -noupdate -expand -group DUT -radix unsigned /async_fifo_top/DUT/wrst_n
add wave -noupdate -expand -group DUT -radix unsigned /async_fifo_top/DUT/rinc
add wave -noupdate -expand -group DUT -radix unsigned /async_fifo_top/DUT/rclk
add wave -noupdate -expand -group DUT -radix unsigned /async_fifo_top/DUT/rrst_n
add wave -noupdate -expand -group DUT -radix unsigned /async_fifo_top/DUT/wr_ptr
add wave -noupdate -expand -group DUT -radix unsigned /async_fifo_top/DUT/rd_ptr
add wave -noupdate -expand -group DUT -radix unsigned /async_fifo_top/DUT/wr_flag
add wave -noupdate -expand -group DUT -radix unsigned /async_fifo_top/DUT/rd_flag
add wave -noupdate -expand -group DUT -radix unsigned /async_fifo_top/DUT/error
add wave -noupdate -expand -group DUT -radix unsigned /async_fifo_top/DUT/i
add wave -noupdate -expand -group DUT -radix unsigned /async_fifo_top/DUT/fifo_mem
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {617652 ps} 0} {{Cursor 2} {999836104 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 267
configure wave -valuecolwidth 71
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
WaveRestoreZoom {0 ps} {1343384 ps}
