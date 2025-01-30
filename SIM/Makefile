RTL=../RTL/*
TB=../TB/*
TBModule=async_fifo_top_tb

clean:
	@if exist work rmdir /s /q work

lib:
	vlib work

cmp:
	vlog -coveropt 3 +acc +cover $(RTL) $(TB)

sim:
	vsim -vopt -coverage $(TBModule) -c -do "run -all; exit"

all: clean lib cmp sim