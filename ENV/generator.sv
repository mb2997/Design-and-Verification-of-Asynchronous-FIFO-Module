class generator #(parameter DATA_WIDTH=8, ADDR_WIDTH=4);

	transaction trans_h;
	mailbox #(transaction) gen2drv;
	virtual async_fifo_interface vif;

	function new(mailbox #(transaction) gen2drv);
		this.gen2drv = gen2drv;
	endfunction

	virtual task run();

		repeat(no_of_trans)
		begin
			trans_h = new();
			assert(trans_h.randomize()) 
			else 
			$fatal("trans_h.randomize() FAILED, Randomization Failed");
			
			gen2drv.put(trans_h);
			trans_h.print("Generator: ");
		end

	endtask

endclass