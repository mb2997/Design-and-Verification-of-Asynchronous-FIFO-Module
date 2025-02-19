class driver;

	virtual async_fifo_interface vif;
	mailbox #(transaction) gen2drv;
	transaction trans_h;

	function new(virtual async_fifo_interface vif,
				 mailbox #(transaction) gen2drv);

		this.vif = vif;
		this.gen2drv = gen2drv;

	endfunction

	task run();
		forever
		begin
			gen2drv.get(trans_h);
			trans_h.print("Driver to Interface: ");
			send_to_dut();
		end
	endtask

	task send_to_dut();

		fork
			begin
				@(negedge vif.wclk);
				vif.wdata <= trans_h.wdata;
				vif.winc <= trans_h.winc;
			end
			
			begin
				@(negedge vif.rclk);
				vif.rinc <= trans_h.rinc;
			end
		join_any

	endtask

endclass