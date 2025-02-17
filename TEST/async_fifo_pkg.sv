`include "async_fifo_interface.sv"

package async_fifo_pkg;

	int no_of_trans = 16;
	
	`include "transaction.sv"
	`include "generator.sv"
	`include "driver.sv"
	`include "monitor.sv"
	`include "scoreboard.sv"
	`include "environment.sv"

    //Testcases
	`include "async_fifo_write_read_gen.sv"
	`include "async_fifo_base_test.sv"

endpackage