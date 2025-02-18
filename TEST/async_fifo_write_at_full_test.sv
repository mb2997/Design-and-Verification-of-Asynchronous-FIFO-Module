class async_fifo_write_at_full_test #(parameter DATA_WIDTH=8, ADDR_WIDTH=4) extends generator;

	localparam FIFO_DEPTH = 1 << ADDR_WIDTH;

	function new(mailbox #(transaction)gen2drv);
		super.new(gen2drv);
    endfunction

    task run();

        //Write Operation
        repeat(FIFO_DEPTH+(FIFO_DEPTH/2))
		begin
			trans_h = new();
			assert(trans_h.randomize() with {winc == 1 && rinc == 0;}) 
			else 
    			$fatal("trans_h.randomize() FAILED, Randomization Failed");

			gen2drv.put(trans_h);
			trans_h.print("async_fifo_write_at_full_test");
		end

    endtask

endclass