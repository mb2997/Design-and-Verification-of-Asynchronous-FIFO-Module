class async_fifo_mon #(parameter DATA_WIDTH=8, ADDR_WIDTH=4) extends uvm_monitor;

    `uvm_component_utils(async_fifo_mon)

    async_fifo_trans #(DATA_WIDTH) trans_h;

    virtual async_fifo_if vif;

    uvm_analysis_port #(async_fifo_trans) wmon2sb;
    uvm_analysis_port #(async_fifo_trans) rmon2sb;

    function new(string name = "async_fifo_mon", uvm_component parent = null);
        super.new(name, parent);
        wmon2sb = new("wmon2sb", this);
        rmon2sb = new("rmon2sb", this);
    endfunction

    task run_phase(uvm_phase phase);
        forever
        begin
            data_read_from_dut();
        end
    endtask

    task data_read_from_dut();

        trans_h = async_fifo_trans #(DATA_WIDTH) :: type_id :: create("trans_h");
        
        fork

			begin
				@(posedge vif.wclk);
				trans_h.wdata = vif.wdata;
				trans_h.wfull = vif.wfull;
				trans_h.winc = vif.winc;
				wmon2sb.write(trans_h);
			end

			begin
				@(negedge vif.rclk);
				trans_h.rdata = vif.rdata;
				trans_h.rempty = vif.rempty;
				trans_h.rinc = vif.rinc;
				rmon2sb.write(trans_h);
			end

		join

    endtask

endclass : async_fifo_mon