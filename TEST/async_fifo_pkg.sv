`include "async_fifo_if.sv"

package async_fifo_pkg;
    
    int no_of_trans = 20;
    bit sb_enable = 1;

    import uvm_pkg::*;
    `include "uvm_macros.svh"

    `include "async_fifo_trans.sv"
    
    `include "async_fifo_seqs.sv"

    `include "async_fifo_seqr.sv"

    `include "async_fifo_drv.sv"

    `include "async_fifo_mon.sv"

    `include "async_fifo_agent.sv"

    `include "async_fifo_sb.sv"

    `include "async_fifo_env.sv"

    `include "async_fifo_test.sv"

endpackage