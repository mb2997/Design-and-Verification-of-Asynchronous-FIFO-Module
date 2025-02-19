class async_fifo_simultaneous_write_read_test #(parameter DATA_WIDTH=8, ADDR_WIDTH=4) extends generator;

	localparam FIFO_DEPTH = 1 << ADDR_WIDTH;

	function new(mailbox #(transaction)gen2drv);
		super.new(gen2drv);
    endfunction

    task run();

        repeat(FIFO_DEPTH)
		begin
			trans_h = new();
			assert(trans_h.randomize() with {winc == 1 && rinc == 1;})
			else 
    			$fatal("trans_h.randomize() FAILED, Randomization Failed");

			gen2drv.put(trans_h);
			trans_h.print("async_fifo_simultaneous_write_read_test");
		end

    endtask

endclass