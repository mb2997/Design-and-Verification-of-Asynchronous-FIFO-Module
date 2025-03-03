`include "async_fifo_if.sv"

package async_fifo_pkg;
    
    int no_of_trans = 20;
    bit sb_enable = 1;

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

endpackage