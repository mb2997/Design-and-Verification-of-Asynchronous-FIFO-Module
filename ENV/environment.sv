class environment;

	generator gen_h;
	driver drv_h;
	monitor mon_h;
	scoreboard sb_h;

	mailbox #(transaction) gen2drv;
	mailbox #(transaction) wmon2sb;
	mailbox #(transaction) rmon2sb;
	virtual async_fifo_interface vif;

	function new(virtual async_fifo_interface vif);
		gen2drv = new();
		wmon2sb = new();
		rmon2sb = new();
		this.vif = vif;
	endfunction

	function void build();
		gen_h = new(gen2drv);
		drv_h = new(vif, gen2drv);
		mon_h = new(vif, wmon2sb, rmon2sb);
		sb_h = new(vif, wmon2sb, rmon2sb);
	endfunction

	task run();
		fork
			gen_h.run();
			drv_h.run();
			mon_h.run();
			sb_h.run();
		join_any
	endtask

endclass