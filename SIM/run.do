if [file exists "work"] {vdel -all}
vlib work
vlog -coveropt 3 +acc +cover ../RTL/* ../TB/*
vsim -vopt -coverage async_fifo_top_tb
do wave.do
run -all