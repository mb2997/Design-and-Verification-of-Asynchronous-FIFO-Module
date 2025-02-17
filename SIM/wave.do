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
add wave -noupdate -expand -group DUT_TOP -radix unsigned /async_fifo_top/DUT/rdata
add wave -noupdate -expand -group DUT_TOP -radix unsigned /async_fifo_top/DUT/wfull
add wave -noupdate -expand -group DUT_TOP -radix unsigned /async_fifo_top/DUT/rempty
add wave -noupdate -expand -group DUT_TOP -radix unsigned /async_fifo_top/DUT/wdata
add wave -noupdate -expand -group DUT_TOP -radix unsigned /async_fifo_top/DUT/winc
add wave -noupdate -expand -group DUT_TOP -radix unsigned /async_fifo_top/DUT/wclk
add wave -noupdate -expand -group DUT_TOP -radix unsigned /async_fifo_top/DUT/wrst_n
add wave -noupdate -expand -group DUT_TOP -radix unsigned /async_fifo_top/DUT/rinc
add wave -noupdate -expand -group DUT_TOP -radix unsigned /async_fifo_top/DUT/rclk
add wave -noupdate -expand -group DUT_TOP -radix unsigned /async_fifo_top/DUT/rrst_n
add wave -noupdate -expand -group DUT_TOP -radix unsigned /async_fifo_top/DUT/waddr
add wave -noupdate -expand -group DUT_TOP -radix unsigned /async_fifo_top/DUT/raddr
add wave -noupdate -expand -group DUT_TOP -radix unsigned /async_fifo_top/DUT/wptr
add wave -noupdate -expand -group DUT_TOP -radix unsigned /async_fifo_top/DUT/rptr
add wave -noupdate -expand -group DUT_TOP -radix unsigned /async_fifo_top/DUT/wq2_rptr
add wave -noupdate -expand -group DUT_TOP -radix unsigned /async_fifo_top/DUT/rq2_wptr
add wave -noupdate -group SYNC_R2W /async_fifo_top/DUT/SYNC_R2W/wq2_rptr
add wave -noupdate -group SYNC_R2W /async_fifo_top/DUT/SYNC_R2W/rptr
add wave -noupdate -group SYNC_R2W /async_fifo_top/DUT/SYNC_R2W/wclk
add wave -noupdate -group SYNC_R2W /async_fifo_top/DUT/SYNC_R2W/wrst_n
add wave -noupdate -group SYNC_R2W /async_fifo_top/DUT/SYNC_R2W/wq1_rptr
add wave -noupdate -group SYNC_W2R /async_fifo_top/DUT/SYNC_W2R/rq2_wptr
add wave -noupdate -group SYNC_W2R /async_fifo_top/DUT/SYNC_W2R/wptr
add wave -noupdate -group SYNC_W2R /async_fifo_top/DUT/SYNC_W2R/rclk
add wave -noupdate -group SYNC_W2R /async_fifo_top/DUT/SYNC_W2R/rrst_n
add wave -noupdate -group SYNC_W2R /async_fifo_top/DUT/SYNC_W2R/rq1_wptr
add wave -noupdate -expand -group FIFOMEM -radix unsigned /async_fifo_top/DUT/FIFOMEM/rdata
add wave -noupdate -expand -group FIFOMEM -radix unsigned /async_fifo_top/DUT/FIFOMEM/wdata
add wave -noupdate -expand -group FIFOMEM -radix unsigned /async_fifo_top/DUT/FIFOMEM/waddr
add wave -noupdate -expand -group FIFOMEM -radix unsigned /async_fifo_top/DUT/FIFOMEM/raddr
add wave -noupdate -expand -group FIFOMEM -radix unsigned /async_fifo_top/DUT/FIFOMEM/wclken
add wave -noupdate -expand -group FIFOMEM -radix unsigned /async_fifo_top/DUT/FIFOMEM/rclken
add wave -noupdate -expand -group FIFOMEM -radix unsigned /async_fifo_top/DUT/FIFOMEM/wfull
add wave -noupdate -expand -group FIFOMEM -radix unsigned /async_fifo_top/DUT/FIFOMEM/rempty
add wave -noupdate -expand -group FIFOMEM -radix unsigned /async_fifo_top/DUT/FIFOMEM/wclk
add wave -noupdate -expand -group FIFOMEM -radix unsigned /async_fifo_top/DUT/FIFOMEM/rclk
add wave -noupdate -expand -group FIFOMEM -radix unsigned -childformat {{{/async_fifo_top/DUT/FIFOMEM/fifo[0]} -radix unsigned} {{/async_fifo_top/DUT/FIFOMEM/fifo[1]} -radix unsigned} {{/async_fifo_top/DUT/FIFOMEM/fifo[2]} -radix unsigned} {{/async_fifo_top/DUT/FIFOMEM/fifo[3]} -radix unsigned} {{/async_fifo_top/DUT/FIFOMEM/fifo[4]} -radix unsigned} {{/async_fifo_top/DUT/FIFOMEM/fifo[5]} -radix unsigned} {{/async_fifo_top/DUT/FIFOMEM/fifo[6]} -radix unsigned} {{/async_fifo_top/DUT/FIFOMEM/fifo[7]} -radix unsigned} {{/async_fifo_top/DUT/FIFOMEM/fifo[8]} -radix unsigned} {{/async_fifo_top/DUT/FIFOMEM/fifo[9]} -radix unsigned} {{/async_fifo_top/DUT/FIFOMEM/fifo[10]} -radix unsigned} {{/async_fifo_top/DUT/FIFOMEM/fifo[11]} -radix unsigned} {{/async_fifo_top/DUT/FIFOMEM/fifo[12]} -radix unsigned} {{/async_fifo_top/DUT/FIFOMEM/fifo[13]} -radix unsigned} {{/async_fifo_top/DUT/FIFOMEM/fifo[14]} -radix unsigned} {{/async_fifo_top/DUT/FIFOMEM/fifo[15]} -radix unsigned}} -subitemconfig {{/async_fifo_top/DUT/FIFOMEM/fifo[0]} {-radix unsigned} {/async_fifo_top/DUT/FIFOMEM/fifo[1]} {-radix unsigned} {/async_fifo_top/DUT/FIFOMEM/fifo[2]} {-radix unsigned} {/async_fifo_top/DUT/FIFOMEM/fifo[3]} {-radix unsigned} {/async_fifo_top/DUT/FIFOMEM/fifo[4]} {-radix unsigned} {/async_fifo_top/DUT/FIFOMEM/fifo[5]} {-radix unsigned} {/async_fifo_top/DUT/FIFOMEM/fifo[6]} {-radix unsigned} {/async_fifo_top/DUT/FIFOMEM/fifo[7]} {-radix unsigned} {/async_fifo_top/DUT/FIFOMEM/fifo[8]} {-radix unsigned} {/async_fifo_top/DUT/FIFOMEM/fifo[9]} {-radix unsigned} {/async_fifo_top/DUT/FIFOMEM/fifo[10]} {-radix unsigned} {/async_fifo_top/DUT/FIFOMEM/fifo[11]} {-radix unsigned} {/async_fifo_top/DUT/FIFOMEM/fifo[12]} {-radix unsigned} {/async_fifo_top/DUT/FIFOMEM/fifo[13]} {-radix unsigned} {/async_fifo_top/DUT/FIFOMEM/fifo[14]} {-radix unsigned} {/async_fifo_top/DUT/FIFOMEM/fifo[15]} {-radix unsigned}} /async_fifo_top/DUT/FIFOMEM/fifo
add wave -noupdate -group RPTR_EMPTY /async_fifo_top/DUT/RPTR_EMPTY/rempty
add wave -noupdate -group RPTR_EMPTY /async_fifo_top/DUT/RPTR_EMPTY/raddr
add wave -noupdate -group RPTR_EMPTY /async_fifo_top/DUT/RPTR_EMPTY/rptr
add wave -noupdate -group RPTR_EMPTY /async_fifo_top/DUT/RPTR_EMPTY/rq2_wptr
add wave -noupdate -group RPTR_EMPTY /async_fifo_top/DUT/RPTR_EMPTY/rinc
add wave -noupdate -group RPTR_EMPTY /async_fifo_top/DUT/RPTR_EMPTY/rclk
add wave -noupdate -group RPTR_EMPTY /async_fifo_top/DUT/RPTR_EMPTY/rrst_n
add wave -noupdate -group RPTR_EMPTY /async_fifo_top/DUT/RPTR_EMPTY/rbin
add wave -noupdate -group RPTR_EMPTY /async_fifo_top/DUT/RPTR_EMPTY/rgraynext
add wave -noupdate -group RPTR_EMPTY /async_fifo_top/DUT/RPTR_EMPTY/rbinnext
add wave -noupdate -group RPTR_EMPTY /async_fifo_top/DUT/RPTR_EMPTY/rempty_val
add wave -noupdate -group WPTR_FULL /async_fifo_top/DUT/WPTR_FULL/wfull
add wave -noupdate -group WPTR_FULL /async_fifo_top/DUT/WPTR_FULL/waddr
add wave -noupdate -group WPTR_FULL /async_fifo_top/DUT/WPTR_FULL/wptr
add wave -noupdate -group WPTR_FULL /async_fifo_top/DUT/WPTR_FULL/wq2_rptr
add wave -noupdate -group WPTR_FULL /async_fifo_top/DUT/WPTR_FULL/winc
add wave -noupdate -group WPTR_FULL /async_fifo_top/DUT/WPTR_FULL/wclk
add wave -noupdate -group WPTR_FULL /async_fifo_top/DUT/WPTR_FULL/wrst_n
add wave -noupdate -group WPTR_FULL /async_fifo_top/DUT/WPTR_FULL/wbin
add wave -noupdate -group WPTR_FULL /async_fifo_top/DUT/WPTR_FULL/wgraynext
add wave -noupdate -group WPTR_FULL /async_fifo_top/DUT/WPTR_FULL/wbinnext
add wave -noupdate -group WPTR_FULL /async_fifo_top/DUT/WPTR_FULL/wfull_val
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1049270 ps} 0} {{Cursor 2} {999836104 ps} 0}
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
WaveRestoreZoom {0 ps} {2730 ns}
