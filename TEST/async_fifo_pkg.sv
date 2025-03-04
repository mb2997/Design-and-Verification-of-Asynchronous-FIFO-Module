`include "async_fifo_if.sv"

package async_fifo_pkg;
    
    virtual async_fifo_if vif;

    int no_of_trans = 20;
    bit sb_enable = 1;
    bit fifo_became_full = 0;
    bit fifo_became_empty = 0;
    

    import uvm_pkg::*;
    `include "uvm_macros.svh"

    `include "async_fifo_trans.sv"
    
    `include "async_fifo_seqs.sv"
    `include "async_fifo_full_seqs.sv"
    `include "async_fifo_empty_seqs.sv"
    `include "async_fifo_b2b_write_read_seqs.sv"
    `include "async_fifo_write_at_full_seqs.sv"
    `include "async_fifo_read_at_empty_seqs.sv"
    `include "async_fifo_reset_seqs.sv"
    `include "async_fifo_write_read_max_data_range_seqs.sv"
    `include "async_fifo_write_faster_than_read_seqs.sv"
    `include "async_fifo_read_faster_than_write_seqs.sv"

    `include "async_fifo_seqr.sv"

    `include "async_fifo_drv.sv"

    `include "async_fifo_mon.sv"

    `include "async_fifo_agent.sv"

    `include "async_fifo_sb.sv"

    `include "async_fifo_env.sv"

    `include "async_fifo_test.sv"
    `include "async_fifo_full_test.sv"
    `include "async_fifo_empty_test.sv"
    `include "async_fifo_b2b_write_read_test.sv"
    `include "async_fifo_write_at_full_test.sv"
    `include "async_fifo_read_at_empty_test.sv"
    `include "async_fifo_reset_test.sv"
    `include "async_fifo_write_read_max_data_range_test.sv"
    `include "async_fifo_write_faster_than_read_test.sv"
    `include "async_fifo_read_faster_than_write_test.sv"

    function void get_vif_in_pkg();
        if(!uvm_config_db #(virtual async_fifo_if) :: get(null," ","vif",vif))
            `uvm_fatal("ASYNC_FIFO_PKG :",$sformatf("Can't able to get async_fifo_if... Have you set it ??"))
    endfunction : get_vif_in_pkg

    //Check for full
    task check_fifo_full;
        forever
        begin
            if(vif.wfull)
            begin
                fifo_became_full = 1;
                break;
            end
            else
                #5;
        end
    endtask
    
    //Check for empty
    task check_fifo_empty;
        forever
        begin
            if(vif.rempty)
            begin
                fifo_became_empty = 1;
                break;
            end
            else
                #5;
        end
    endtask
    
    task wait_for_wclk(int no_of_wclk);
        repeat(no_of_wclk)
            @(posedge vif.wclk);
    endtask
    
    task wait_for_rclk(int no_of_rclk);
        repeat(no_of_rclk)
            @(posedge vif.rclk);
    endtask

endpackage