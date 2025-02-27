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
	vlog $(RTL) $(PKG) $(TB) +incdir+../ENV +incdir+../TEST

sim :
	vsim -vopt $(TBModule) -c -do "run -all; exit"

run-all : lib cmp sim