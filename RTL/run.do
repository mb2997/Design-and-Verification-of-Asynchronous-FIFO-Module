if [file exists "work"] {vdel -all}
vlib work
vlog -source -lint sync_w2r.sv wptr_full.sv
vlog -source -lint +define+DEBUG async_fifo_top_tb.sv

#vsim -voptargs=+acc work.top

#do wave.do

#run -all
