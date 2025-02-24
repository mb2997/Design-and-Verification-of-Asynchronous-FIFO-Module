`include "async_fifo_interface.sv"
import uvm_pkg::*;
package async_fifo_pkg;

	`include "uvm_macros.svh"

	int no_of_trans = 16;
	bit sb_enable = 1;
	
	`include "seq_item.sv"
	`include "gen_seq_item.sv"
	`include "sequencer.sv"
	`include "driver.sv"
	`include "monitor.sv"
	`include "scoreboard.sv"
	`include "agent.sv"
	`include "environment.sv"

    //Testcases  ??
	`include "async_fifo_write_read_test.sv"
	`include "async_fifo_write_full_test.sv"
	`include "async_fifo_read_empty_test.sv"
	`include "async_fifo_b2b_write_read_test.sv"
	`include "async_fifo_read_at_empty_test.sv"
	`include "async_fifo_write_at_full_test.sv"
	`include "async_fifo_simultaneous_write_read_test.sv"
	`include "async_fifo_reset_test.sv"
	`include "async_fifo_write_read_max_data_range_test.sv"
	`include "async_fifo_base_test.sv"

endpackage