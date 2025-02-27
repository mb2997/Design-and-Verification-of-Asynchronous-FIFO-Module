#Makefile
RTL=../RTL/*.sv
RTLModule=asynch_fifo_dut
TB=../TOP/async_fifo_top.sv
TBModule=async_fifo_top
PKG=../TEST/async_fifo_pkg.sv


help:
	@echo =================================================================================
	@echo " lib   		=>  Make work directory"                            			
	@echo " cmp   		=>  Compile the whole code"
	@echo " sim    		=>  Simulate and run the code"
	@echo " run-all    		=>  Run above all targets sequencially"
	
##	@echo " run-tc1   		=>  Run testcase - 1 for fifo full"
##	@echo " run-tc2    		=>  Run testcase - 2 for fifo empty"
##	@echo " run-tc3    		=>  Run testcase - 3 for fifo reset"
##	@echo " run-tc4    		=>  Run testcase - 4 for fifo RW simultaniously"
	@echo =================================================================================

lib :
	vlib work
	
cmp :
	vlog -coveropt 3 +acc +cover $(RTL) $(PKG) $(TB) +incdir+../ENV +incdir+../TEST

sim :
	vsim -coverage -vopt $(TBModule) -c -do "run -all; exit"

sim1 :
	vsim -coverage -vopt $(TBModule) -c -do "coverage save -onexit tc1.ucdb; run -all; exit" +UVM_TESTNAME=async_fifo_full_test

sim2 :
	vsim -coverage -vopt $(TBModule) -c -do "coverage save -onexit tc2.ucdb; run -all; exit" +UVM_TESTNAME=async_fifo_empty_test

sim3 :
	vsim -coverage -vopt $(TBModule) -c -do "coverage save -onexit tc3.ucdb; run -all; exit" +UVM_TESTNAME=async_fifo_b2b_write_read_test

sim4 :
	vsim -coverage -vopt $(TBModule) -c -do "coverage save -onexit tc4.ucdb; run -all; exit" +UVM_TESTNAME=async_fifo_write_at_full_test

sim5 :
	vsim -coverage -vopt $(TBModule) -c -do "coverage save -onexit tc5.ucdb; run -all; exit" +UVM_TESTNAME=async_fifo_read_at_empty_test

sim6 :
	vsim -coverage -vopt $(TBModule) -c -do "coverage save -onexit tc6.ucdb; run -all; exit" +MID_RESET +UVM_TESTNAME=async_fifo_reset_test

sim7 :
	vsim -coverage -vopt $(TBModule) -c -do "coverage save -onexit tc7.ucdb; run -all; exit" +UVM_TESTNAME=async_fifo_write_read_max_data_range_test

merge :
	vcover merge mergecov.ucdb tc1.ucdb tc2.ucdb tc3.ucdb tc4.ucdb tc5.ucdb tc6.ucdb tc7.ucdb

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

reg : lib cmp sim1 sim2 sim3 sim4 sim5 sim6 sim7 merge report