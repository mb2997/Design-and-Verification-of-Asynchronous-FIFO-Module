class monitor;

	transaction trans_h;
	virtual async_fifo_interface vif;
	mailbox #(transaction) mon2sb;

	function new(virtual async_fifo_interface vif,
				 mailbox #(transaction) mon2sb);

		this.vif = vif;
		this.mon2sb = mon2sb;

	endfunction

	task run();

		trans_h = new();
		forever
		begin
			data_from_dut();
			mon2sb.put(trans_h);
		end

	endtask

	task data_from_dut();

		fork

			begin
				@(posedge vif.wclk);
				trans_h.wdata = vif.wdata;
				trans_h.wfull = vif.wfull;
				trans_h.winc = vif.winc;
			end

			begin
				@(posedge vif.rclk);
				trans_h.rdata = vif.rdata;
				trans_h.rempty = vif.rempty;
				trans_h.rinc = vif.rinc;
			end

		join

	endtask

endclass