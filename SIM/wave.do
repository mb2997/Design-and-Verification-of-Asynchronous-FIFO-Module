onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group ASYNC_FIFO_TOP_TB -radix unsigned /async_fifo_top_tb/rdata
add wave -noupdate -expand -group ASYNC_FIFO_TOP_TB -radix unsigned /async_fifo_top_tb/wfull
add wave -noupdate -expand -group ASYNC_FIFO_TOP_TB -radix unsigned /async_fifo_top_tb/rempty
add wave -noupdate -expand -group ASYNC_FIFO_TOP_TB -radix unsigned /async_fifo_top_tb/wdata
add wave -noupdate -expand -group ASYNC_FIFO_TOP_TB -radix unsigned /async_fifo_top_tb/winc
add wave -noupdate -expand -group ASYNC_FIFO_TOP_TB -radix unsigned /async_fifo_top_tb/wclk
add wave -noupdate -expand -group ASYNC_FIFO_TOP_TB -radix unsigned /async_fifo_top_tb/wrst_n
add wave -noupdate -expand -group ASYNC_FIFO_TOP_TB -radix unsigned /async_fifo_top_tb/rinc
add wave -noupdate -expand -group ASYNC_FIFO_TOP_TB -radix unsigned /async_fifo_top_tb/rclk
add wave -noupdate -expand -group ASYNC_FIFO_TOP_TB -radix unsigned /async_fifo_top_tb/rrst_n
add wave -noupdate -expand -group ASYNC_FIFO_TOP_TB -radix unsigned /async_fifo_top_tb/error
add wave -noupdate -expand -group ASYNC_FIFO_DUT -radix unsigned /async_fifo_top_tb/DUT/rdata
add wave -noupdate -expand -group ASYNC_FIFO_DUT -radix unsigned /async_fifo_top_tb/DUT/wfull
add wave -noupdate -expand -group ASYNC_FIFO_DUT -radix unsigned /async_fifo_top_tb/DUT/rempty
add wave -noupdate -expand -group ASYNC_FIFO_DUT -radix unsigned /async_fifo_top_tb/DUT/wdata
add wave -noupdate -expand -group ASYNC_FIFO_DUT -radix unsigned /async_fifo_top_tb/DUT/winc
add wave -noupdate -expand -group ASYNC_FIFO_DUT -radix unsigned /async_fifo_top_tb/DUT/wclk
add wave -noupdate -expand -group ASYNC_FIFO_DUT -radix unsigned /async_fifo_top_tb/DUT/wrst_n
add wave -noupdate -expand -group ASYNC_FIFO_DUT -radix unsigned /async_fifo_top_tb/DUT/rinc
add wave -noupdate -expand -group ASYNC_FIFO_DUT -radix unsigned /async_fifo_top_tb/DUT/rclk
add wave -noupdate -expand -group ASYNC_FIFO_DUT -radix unsigned /async_fifo_top_tb/DUT/rrst_n
add wave -noupdate -expand -group ASYNC_FIFO_DUT -radix unsigned /async_fifo_top_tb/DUT/waddr
add wave -noupdate -expand -group ASYNC_FIFO_DUT -radix unsigned /async_fifo_top_tb/DUT/raddr
add wave -noupdate -expand -group ASYNC_FIFO_DUT -radix unsigned /async_fifo_top_tb/DUT/wptr
add wave -noupdate -expand -group ASYNC_FIFO_DUT -radix unsigned /async_fifo_top_tb/DUT/rptr
add wave -noupdate -expand -group ASYNC_FIFO_DUT -radix unsigned /async_fifo_top_tb/DUT/wq2_rptr
add wave -noupdate -expand -group ASYNC_FIFO_DUT -radix unsigned /async_fifo_top_tb/DUT/rq2_wptr
add wave -noupdate -expand -group SYNC_R2W_MODULE -radix unsigned /async_fifo_top_tb/DUT/SYNC_R2W/wq2_rptr
add wave -noupdate -expand -group SYNC_R2W_MODULE -radix unsigned /async_fifo_top_tb/DUT/SYNC_R2W/rptr
add wave -noupdate -expand -group SYNC_R2W_MODULE -radix unsigned /async_fifo_top_tb/DUT/SYNC_R2W/wclk
add wave -noupdate -expand -group SYNC_R2W_MODULE -radix unsigned /async_fifo_top_tb/DUT/SYNC_R2W/wrst_n
add wave -noupdate -expand -group SYNC_R2W_MODULE -radix unsigned /async_fifo_top_tb/DUT/SYNC_R2W/wq1_rptr
add wave -noupdate -expand -group SYNC_W2R_MODULE -radix unsigned /async_fifo_top_tb/DUT/SYNC_W2R/rq2_wptr
add wave -noupdate -expand -group SYNC_W2R_MODULE -radix unsigned /async_fifo_top_tb/DUT/SYNC_W2R/wptr
add wave -noupdate -expand -group SYNC_W2R_MODULE -radix unsigned /async_fifo_top_tb/DUT/SYNC_W2R/rclk
add wave -noupdate -expand -group SYNC_W2R_MODULE -radix unsigned /async_fifo_top_tb/DUT/SYNC_W2R/rrst_n
add wave -noupdate -expand -group SYNC_W2R_MODULE -radix unsigned /async_fifo_top_tb/DUT/SYNC_W2R/rq1_wptr
add wave -noupdate -expand -group FIFOMEM_MODULE -radix unsigned /async_fifo_top_tb/DUT/FIFOMEM/rdata
add wave -noupdate -expand -group FIFOMEM_MODULE -radix unsigned /async_fifo_top_tb/DUT/FIFOMEM/wdata
add wave -noupdate -expand -group FIFOMEM_MODULE -radix unsigned /async_fifo_top_tb/DUT/FIFOMEM/waddr
add wave -noupdate -expand -group FIFOMEM_MODULE -radix unsigned /async_fifo_top_tb/DUT/FIFOMEM/raddr
add wave -noupdate -expand -group FIFOMEM_MODULE -radix unsigned /async_fifo_top_tb/DUT/FIFOMEM/wclken
add wave -noupdate -expand -group FIFOMEM_MODULE -radix unsigned /async_fifo_top_tb/DUT/FIFOMEM/wfull
add wave -noupdate -expand -group FIFOMEM_MODULE -radix unsigned /async_fifo_top_tb/DUT/FIFOMEM/wclk
add wave -noupdate -expand -group FIFOMEM_MODULE -radix unsigned -childformat {{{/async_fifo_top_tb/DUT/FIFOMEM/fifo[0]} -radix unsigned} {{/async_fifo_top_tb/DUT/FIFOMEM/fifo[1]} -radix unsigned} {{/async_fifo_top_tb/DUT/FIFOMEM/fifo[2]} -radix unsigned} {{/async_fifo_top_tb/DUT/FIFOMEM/fifo[3]} -radix unsigned} {{/async_fifo_top_tb/DUT/FIFOMEM/fifo[4]} -radix unsigned} {{/async_fifo_top_tb/DUT/FIFOMEM/fifo[5]} -radix unsigned} {{/async_fifo_top_tb/DUT/FIFOMEM/fifo[6]} -radix unsigned} {{/async_fifo_top_tb/DUT/FIFOMEM/fifo[7]} -radix unsigned} {{/async_fifo_top_tb/DUT/FIFOMEM/fifo[8]} -radix unsigned} {{/async_fifo_top_tb/DUT/FIFOMEM/fifo[9]} -radix unsigned} {{/async_fifo_top_tb/DUT/FIFOMEM/fifo[10]} -radix unsigned} {{/async_fifo_top_tb/DUT/FIFOMEM/fifo[11]} -radix unsigned} {{/async_fifo_top_tb/DUT/FIFOMEM/fifo[12]} -radix unsigned} {{/async_fifo_top_tb/DUT/FIFOMEM/fifo[13]} -radix unsigned} {{/async_fifo_top_tb/DUT/FIFOMEM/fifo[14]} -radix unsigned} {{/async_fifo_top_tb/DUT/FIFOMEM/fifo[15]} -radix unsigned}} -subitemconfig {{/async_fifo_top_tb/DUT/FIFOMEM/fifo[0]} {-height 15 -radix unsigned} {/async_fifo_top_tb/DUT/FIFOMEM/fifo[1]} {-height 15 -radix unsigned} {/async_fifo_top_tb/DUT/FIFOMEM/fifo[2]} {-height 15 -radix unsigned} {/async_fifo_top_tb/DUT/FIFOMEM/fifo[3]} {-height 15 -radix unsigned} {/async_fifo_top_tb/DUT/FIFOMEM/fifo[4]} {-height 15 -radix unsigned} {/async_fifo_top_tb/DUT/FIFOMEM/fifo[5]} {-height 15 -radix unsigned} {/async_fifo_top_tb/DUT/FIFOMEM/fifo[6]} {-height 15 -radix unsigned} {/async_fifo_top_tb/DUT/FIFOMEM/fifo[7]} {-height 15 -radix unsigned} {/async_fifo_top_tb/DUT/FIFOMEM/fifo[8]} {-height 15 -radix unsigned} {/async_fifo_top_tb/DUT/FIFOMEM/fifo[9]} {-height 15 -radix unsigned} {/async_fifo_top_tb/DUT/FIFOMEM/fifo[10]} {-height 15 -radix unsigned} {/async_fifo_top_tb/DUT/FIFOMEM/fifo[11]} {-height 15 -radix unsigned} {/async_fifo_top_tb/DUT/FIFOMEM/fifo[12]} {-height 15 -radix unsigned} {/async_fifo_top_tb/DUT/FIFOMEM/fifo[13]} {-height 15 -radix unsigned} {/async_fifo_top_tb/DUT/FIFOMEM/fifo[14]} {-height 15 -radix unsigned} {/async_fifo_top_tb/DUT/FIFOMEM/fifo[15]} {-height 15 -radix unsigned}} /async_fifo_top_tb/DUT/FIFOMEM/fifo
add wave -noupdate -expand -group RPTR_EMPTY -radix unsigned /async_fifo_top_tb/DUT/RPTR_EMPTY/rempty
add wave -noupdate -expand -group RPTR_EMPTY -radix unsigned /async_fifo_top_tb/DUT/RPTR_EMPTY/raddr
add wave -noupdate -expand -group RPTR_EMPTY -radix unsigned /async_fifo_top_tb/DUT/RPTR_EMPTY/rptr
add wave -noupdate -expand -group RPTR_EMPTY -radix unsigned /async_fifo_top_tb/DUT/RPTR_EMPTY/rq2_wptr
add wave -noupdate -expand -group RPTR_EMPTY -radix unsigned /async_fifo_top_tb/DUT/RPTR_EMPTY/rinc
add wave -noupdate -expand -group RPTR_EMPTY -radix unsigned /async_fifo_top_tb/DUT/RPTR_EMPTY/rclk
add wave -noupdate -expand -group RPTR_EMPTY -radix unsigned /async_fifo_top_tb/DUT/RPTR_EMPTY/rrst_n
add wave -noupdate -expand -group RPTR_EMPTY -radix unsigned /async_fifo_top_tb/DUT/RPTR_EMPTY/rbin
add wave -noupdate -expand -group RPTR_EMPTY -radix unsigned /async_fifo_top_tb/DUT/RPTR_EMPTY/rgraynext
add wave -noupdate -expand -group RPTR_EMPTY -radix unsigned /async_fifo_top_tb/DUT/RPTR_EMPTY/rbinnext
add wave -noupdate -expand -group RPTR_EMPTY -radix unsigned /async_fifo_top_tb/DUT/RPTR_EMPTY/rempty_val
add wave -noupdate -expand -group WPTR_FULL -radix unsigned /async_fifo_top_tb/DUT/WPTR_FULL/wfull
add wave -noupdate -expand -group WPTR_FULL -radix unsigned /async_fifo_top_tb/DUT/WPTR_FULL/waddr
add wave -noupdate -expand -group WPTR_FULL -radix unsigned /async_fifo_top_tb/DUT/WPTR_FULL/wptr
add wave -noupdate -expand -group WPTR_FULL -radix unsigned /async_fifo_top_tb/DUT/WPTR_FULL/wq2_rptr
add wave -noupdate -expand -group WPTR_FULL -radix unsigned /async_fifo_top_tb/DUT/WPTR_FULL/winc
add wave -noupdate -expand -group WPTR_FULL -radix unsigned /async_fifo_top_tb/DUT/WPTR_FULL/wclk
add wave -noupdate -expand -group WPTR_FULL -radix unsigned /async_fifo_top_tb/DUT/WPTR_FULL/wrst_n
add wave -noupdate -expand -group WPTR_FULL -radix unsigned /async_fifo_top_tb/DUT/WPTR_FULL/wbin
add wave -noupdate -expand -group WPTR_FULL -radix unsigned /async_fifo_top_tb/DUT/WPTR_FULL/wgraynext
add wave -noupdate -expand -group WPTR_FULL -radix unsigned /async_fifo_top_tb/DUT/WPTR_FULL/wbinnext
add wave -noupdate -expand -group WPTR_FULL -radix unsigned /async_fifo_top_tb/DUT/WPTR_FULL/wfull_val
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {141783 ps} 0} {{Cursor 2} {249236834 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 176
configure wave -valuecolwidth 99
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
WaveRestoreZoom {0 ps} {472481 ps}
