class driver;

	virtual async_fifo_interface vif;
	mailbox #(transaction) gen2drv;
	transaction trans_h;

	function new(virtual async_fifo_interface vif,
				 mailbox #(transaction) gen2drv);

		this.vif = vif;
		this.gen2drv = gen2drv;

	endfunction

	task reset();

		vif.wrst_n = 0;
		vif.rrst_n = 0;
		fork
			@(negedge vif.wclk);
			@(negedge vif.rclk);
		join

		fork
			@(negedge vif.wclk);
			@(negedge vif.rclk);
		join
		vif.wrst_n = 1;
		vif.rrst_n = 1;

	endtask

	task run();

		forever
		begin
			gen2drv.get(trans_h);
			send_to_dut();
		end

	endtask

	task send_to_dut();

		@(negedge vif.wclk);
		vif.wdata <= trans_h.wdata;
		vif.winc <= trans_h.winc;
		vif.rinc <= trans_h.rinc;

	endtask

endclass