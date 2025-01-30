onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group ASYNC_FIFO_TOP_TB /async_fifo_top_tb/rdata
add wave -noupdate -expand -group ASYNC_FIFO_TOP_TB /async_fifo_top_tb/wfull
add wave -noupdate -expand -group ASYNC_FIFO_TOP_TB /async_fifo_top_tb/rempty
add wave -noupdate -expand -group ASYNC_FIFO_TOP_TB /async_fifo_top_tb/wdata
add wave -noupdate -expand -group ASYNC_FIFO_TOP_TB /async_fifo_top_tb/winc
add wave -noupdate -expand -group ASYNC_FIFO_TOP_TB /async_fifo_top_tb/wclk
add wave -noupdate -expand -group ASYNC_FIFO_TOP_TB /async_fifo_top_tb/wrst_n
add wave -noupdate -expand -group ASYNC_FIFO_TOP_TB /async_fifo_top_tb/rinc
add wave -noupdate -expand -group ASYNC_FIFO_TOP_TB /async_fifo_top_tb/rclk
add wave -noupdate -expand -group ASYNC_FIFO_TOP_TB /async_fifo_top_tb/rrst_n
add wave -noupdate -expand -group ASYNC_FIFO_TOP_TB /async_fifo_top_tb/error
add wave -noupdate -expand -group ASYNC_FIFO_TOP_TB /async_fifo_top_tb/WriteFIFO/i
add wave -noupdate -expand -group ASYNC_FIFO_DUT /async_fifo_top_tb/DUT/rdata
add wave -noupdate -expand -group ASYNC_FIFO_DUT /async_fifo_top_tb/DUT/wfull
add wave -noupdate -expand -group ASYNC_FIFO_DUT /async_fifo_top_tb/DUT/rempty
add wave -noupdate -expand -group ASYNC_FIFO_DUT /async_fifo_top_tb/DUT/wdata
add wave -noupdate -expand -group ASYNC_FIFO_DUT /async_fifo_top_tb/DUT/winc
add wave -noupdate -expand -group ASYNC_FIFO_DUT /async_fifo_top_tb/DUT/wclk
add wave -noupdate -expand -group ASYNC_FIFO_DUT /async_fifo_top_tb/DUT/wrst_n
add wave -noupdate -expand -group ASYNC_FIFO_DUT /async_fifo_top_tb/DUT/rinc
add wave -noupdate -expand -group ASYNC_FIFO_DUT /async_fifo_top_tb/DUT/rclk
add wave -noupdate -expand -group ASYNC_FIFO_DUT /async_fifo_top_tb/DUT/rrst_n
add wave -noupdate -expand -group ASYNC_FIFO_DUT /async_fifo_top_tb/DUT/waddr
add wave -noupdate -expand -group ASYNC_FIFO_DUT /async_fifo_top_tb/DUT/raddr
add wave -noupdate -expand -group ASYNC_FIFO_DUT /async_fifo_top_tb/DUT/wptr
add wave -noupdate -expand -group ASYNC_FIFO_DUT /async_fifo_top_tb/DUT/rptr
add wave -noupdate -expand -group ASYNC_FIFO_DUT /async_fifo_top_tb/DUT/wq2_rptr
add wave -noupdate -expand -group ASYNC_FIFO_DUT /async_fifo_top_tb/DUT/rq2_wptr
add wave -noupdate /async_fifo_top_tb/DUT/FIFOMEM/fifo
add wave -noupdate /async_fifo_top_tb/DUT/WPTR_FULL/wfull_val
add wave -noupdate /async_fifo_top_tb/DUT/WPTR_FULL/wgraynext
add wave -noupdate /async_fifo_top_tb/DUT/WPTR_FULL/wq2_rptr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {10849 ps} 0} {{Cursor 2} {249248080 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 161
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
WaveRestoreZoom {0 ps} {512 ns}
