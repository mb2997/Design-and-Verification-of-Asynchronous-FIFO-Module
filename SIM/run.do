vlib work
vlog -coveropt 3 +acc +cover ../RTL/*.sv ../TEST/async_fifo_pkg.sv ../TOP/async_fifo_top.sv +incdir+../RTL +incdir+../ENV +incdir+../TEST
vsim -vopt async_fifo_top +ASYNC_FIFO_WRITE_READ_TEST
do wave.do
run -all