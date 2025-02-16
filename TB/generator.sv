class generator;

	transaction trans_h;
	mailbox #(transaction) gen2drv;

	function new(mailbox #(transaction) gen2drv);
		this.gen2drv = gen2drv;
	endfunction

	task run();

		repeat(no_of_trans)
		begin
			trans_h = new();
			assert(trans_h.randomize()) 
			else 
    			$fatal("trans_h.randomize() FAILED, Randomization Failed");

			gen2drv.put(trans_h);
		end

	endtask

endclass