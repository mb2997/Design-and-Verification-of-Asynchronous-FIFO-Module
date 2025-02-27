class async_fifo_drv #(parameter DATA_WIDTH=8, ADDR_WIDTH=4) extends uvm_driver #(async_fifo_trans);

    `uvm_component_utils(async_fifo_drv)

    //Taking instance of virtual interface -> We need that to pass data from driver to DUT
    virtual async_fifo_if vif;

    //function new - constructor
    function new(string name = "async_fifo_drv", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    // task reset();

    //     vif.wrst_n = 0;
    //     vif.rrst_n = 0;
    //     fork
    //         @(negedge vif.wclk);
    //         @(negedge vif.rclk);
    //     join
                    
    //     fork
    //         @(negedge vif.wclk);
    //         @(negedge vif.rclk);
    //     join
    //     vif.wrst_n = 1;
    //     vif.rrst_n = 1;
                    
    // endtask

    task run_phase(uvm_phase phase);
        //reset();
        forever 
        begin
            seq_item_port.get_next_item(req);
            data_send_to_dut(req);
            seq_item_port.item_done();
        end
    endtask

    task data_send_to_dut(async_fifo_trans req);

        fork
			begin
				@(negedge vif.wclk);
				vif.wdata <= req.wdata;
				vif.winc <= req.winc;
			end
			
			begin
				@(negedge vif.rclk);
				vif.rinc <= req.rinc;
			end
		join_any

    endtask
    
endclass : async_fifo_drv