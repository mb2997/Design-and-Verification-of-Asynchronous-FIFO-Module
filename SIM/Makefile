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

sim2 :
	vsim -vopt $(TBModule) -c -do "run -all; exit" +ASYNC_FIFO_WRITE_FULL_TEST

sim3 :
	vsim -vopt $(TBModule) -c -do "run -all; exit" +ASYNC_FIFO_READ_EMPTY_TEST

sim4 :
	vsim -vopt $(TBModule) -c -do "run -all; exit" +ASYNC_FIFO_B2B_WRITE_READ_TEST

sim5 :
	vsim -vopt $(TBModule) -c -do "run -all; exit" +ASYNC_FIFO_READ_AT_EMPTY_TEST

sim6 :
	vsim -vopt $(TBModule) -c -do "run -all; exit" +ASYNC_FIFO_WRITE_AT_FULL_TEST

all : lib cmp sim

tc1 : lib cmp sim1

tc2 : lib cmp sim2

tc3 : lib cmp sim3

tc4 : lib cmp sim4

tc5 : lib cmp sim5

tc6 : lib cmp sim6