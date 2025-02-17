class async_fifo_write_read_gen extends generator;

    function new(mailbox #(transaction)gen2drv);
		super.new(gen2drv);
    endfunction

    task run();

        //Write Operation
        repeat(no_of_trans)
		begin
			trans_h = new();
			assert(trans_h.randomize() with {winc == 1 && rinc == 0;}) 
			else 
    			$fatal("trans_h.randomize() FAILED, Randomization Failed");

			gen2drv.put(trans_h);
			trans_h.print("async_fifo_write_read_gen");
		end

        //Read Operation
        repeat(no_of_trans)
		begin
			trans_h = new();
			assert(trans_h.randomize() with {winc == 0 && rinc == 1;}) 
			else 
    			$fatal("trans_h.randomize() FAILED, Randomization Failed");

			gen2drv.put(trans_h);
			trans_h.print("async_fifo_write_read_gen");
		end

    endtask

endclass