class async_fifo_b2b_write_read_test #(parameter DATA_WIDTH=8, ADDR_WIDTH=4) extends generator;

	localparam FIFO_DEPTH = 1 << ADDR_WIDTH;

	function new(mailbox #(transaction)gen2drv);
		super.new(gen2drv);
    endfunction

	bit [FIFO_DEPTH-1:0] random_depth;

    task run();

		random_depth = $urandom_range(1, FIFO_DEPTH);

        //Write Operation
        repeat(random_depth)
		begin
			trans_h = new();
			assert(trans_h.randomize() with {winc == 1 && rinc == 0;}) 
			else 
    			$fatal("trans_h.randomize() FAILED, Randomization Failed");

			gen2drv.put(trans_h);
			trans_h.print("async_fifo_b2b_write_read_test");

			trans_h = new();

			assert(trans_h.randomize() with {winc == 0 && rinc == 1;}) 
			else 
    			$fatal("trans_h.randomize() FAILED, Randomization Failed");

			gen2drv.put(trans_h);
			trans_h.print("async_fifo_b2b_write_read_test");
		end

    endtask

endclass