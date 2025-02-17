#Makefile
RTL=../RTL/*.sv
TOP=../TOP/async_fifo_top.sv
TBModule=async_fifo_top
DUTModule=asynch_fifo_dut

lib :
	vlib work
	
cmp :
	vlog -coveropt 3 +acc +cover $(RTL) ../TEST/async_fifo_pkg.sv $(TOP) +incdir+../RTL +incdir+../ENV +incdir+../TEST

sim :
	vsim -vopt $(TBModule) -c -do "run -all; exit"

sim1 :
	vsim -vopt $(TBModule) -c -do "run -all; exit" +ASYNC_FIFO_WRITE_READ_TEST

all : lib cmp sim

tc1 : lib cmp sim1