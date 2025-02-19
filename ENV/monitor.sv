class monitor;

	transaction trans_h;
	virtual async_fifo_interface vif;
	mailbox #(transaction) wmon2sb;
	mailbox #(transaction) rmon2sb;

	function new(virtual async_fifo_interface vif,
				 mailbox #(transaction) wmon2sb,
				 mailbox #(transaction) rmon2sb);

		this.vif = vif;
		this.wmon2sb = wmon2sb;
		this.rmon2sb = rmon2sb;

	endfunction

	task run();

		trans_h = new();
		forever
		begin
			data_from_dut();
			trans_h.print("Interface to Monitor: ");
		end

	endtask

	task data_from_dut();

		fork

			begin
				@(posedge vif.wclk);
				trans_h.wdata = vif.wdata;
				trans_h.wfull = vif.wfull;
				trans_h.winc = vif.winc;
				wmon2sb.put(trans_h);
			end

			begin
				@(negedge vif.rclk);
				trans_h.rdata = vif.rdata;
				trans_h.rempty = vif.rempty;
				trans_h.rinc = vif.rinc;
				rmon2sb.put(trans_h);
			end

		join_any

	endtask

endclass