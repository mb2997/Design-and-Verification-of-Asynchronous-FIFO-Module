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
	vsim -coverage -vopt $(TBModule) -c -do "coverage save -onexit async_fifo_write_read_test_cov.ucdb; run -all; exit" +ASYNC_FIFO_WRITE_READ_TEST

sim2 :
	vsim -coverage -vopt $(TBModule) -c -do "coverage save -onexit async_fifo_write_full_test_cov.ucdb; run -all; exit" +ASYNC_FIFO_WRITE_FULL_TEST

sim3 :
	vsim -coverage -vopt $(TBModule) -c -do "coverage save -onexit async_fifo_read_empty_test_cov.ucdb; run -all; exit" +ASYNC_FIFO_READ_EMPTY_TEST

sim4 :
	vsim -coverage -vopt $(TBModule) -c -do "coverage save -onexit async_fifo_b2b_write_read_test_cov.ucdb; run -all; exit" +ASYNC_FIFO_B2B_WRITE_READ_TEST

sim5 :
	vsim -coverage -vopt $(TBModule) -c -do "coverage save -onexit async_fifo_read_at_empty_test_cov.ucdb; run -all; exit" +ASYNC_FIFO_READ_AT_EMPTY_TEST

sim6 :
	vsim -coverage -vopt $(TBModule) -c -do "coverage save -onexit async_fifo_write_at_full_test_cov.ucdb; run -all; exit" +ASYNC_FIFO_WRITE_AT_FULL_TEST

sim7 :
	vsim -coverage -vopt $(TBModule) -c -do "coverage save -onexit async_fifo_reset_test_cov.ucdb; run -all; exit" +ASYNC_FIFO_RESET_TEST

sim8 :
	vsim -coverage -vopt $(TBModule) -c -do "coverage save -onexit async_fifo_simultaneous_write_read_test_cov.ucdb; run -all; exit" +ASYNC_FIFO_SIMULTANEOUS_WRITE_READ_TEST

sim9 :
	vsim -coverage -vopt $(TBModule) -c -do "coverage save -onexit async_fifo_write_read_max_data_range_test_cov.ucdb; run -all; exit" +ASYNC_FIFO_WRITE_READ_MAX_DATA_RANGE_TEST

merge :
	vcover merge mergecov.ucdb async_fifo_write_read_test_cov.ucdb async_fifo_write_full_test_cov.ucdb async_fifo_read_empty_test_cov.ucdb async_fifo_b2b_write_read_test_cov.ucdb async_fifo_read_at_empty_test_cov.ucdb async_fifo_write_at_full_test_cov.ucdb async_fifo_simultaneous_write_read_test_cov.ucdb async_fifo_write_read_max_data_range_test_cov.ucdb

report :
	vcover report -details -html mergecov.ucdb

all : lib cmp sim

tc1 : lib cmp sim1

tc2 : lib cmp sim2

tc3 : lib cmp sim3

tc4 : lib cmp sim4

tc5 : lib cmp sim5

tc6 : lib cmp sim6

tc7 : lib cmp sim7

tc8 : lib cmp sim8

tc9 : lib cmp sim9

reg	: lib cmp sim1 sim2 sim3 sim4 sim5 sim6 sim7 sim8 sim9 merge report