vlib work
vlog -coveropt 3 +acc +cover ../RTL/*.sv ../TEST/async_fifo_pkg.sv ../TOP/async_fifo_top.sv +incdir+../RTL +incdir+../ENV +incdir+../TEST
vsim -coverage -vopt async_fifo_top +ASYNC_FIFO_RESET_TEST
run 1ns
log -r /*
do wave.do
run -all