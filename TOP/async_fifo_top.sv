import async_fifo_pkg::*;

module async_fifo_top();

    import uvm_pkg::*;
    `include "uvm_macros.svh"

    parameter CYCLE = 10;
    parameter real WCLK_FRQ = 20.00; // Unit: MHz
    parameter real RCLK_FRQ = 17.00; // Unit: MHz
    parameter real WCLK_T = ((1 / WCLK_FRQ) * 1000.00);
    parameter real RCLK_T = ((1 / RCLK_FRQ) * 1000.00);
    parameter DATA_WIDTH = 8;
    parameter ADDR_WIDTH = 4;

    logic wclk, rclk, wrst_n, rrst_n;

    async_fifo_if inf(.*);
    async_fifo_test #(DATA_WIDTH, ADDR_WIDTH) test_h;

    // Design top module instantiation
    asynch_fifo_dut #(DATA_WIDTH, ADDR_WIDTH) DUT (
        .rdata(inf.rdata),
        .wfull(inf.wfull),
        .rempty(inf.rempty),
        .wdata(inf.wdata),
        .winc(inf.winc),
        .wclk(wclk),
        .wrst_n(wrst_n),
        .rinc(inf.rinc),
        .rclk(rclk),
        .rrst_n(rrst_n)
    );

    task reset();

        wrst_n = 0;
        rrst_n = 0;
        fork
            @(negedge wclk);
            @(negedge rclk);
        join
        wrst_n = 1;
        rrst_n = 1;
                    
    endtask

    // Clock generation
    initial begin
        wclk = 0;
        $display("WCLK_T/2 = %.2f", WCLK_T);
        $display("RCLK_T/2 = %.2f", RCLK_T);
        forever #((WCLK_T) / 2) wclk = ~wclk;
    end

    initial begin
        rclk = 0;
        forever #((RCLK_T) / 2) rclk = ~rclk;
    end

    // Test execution
    initial begin
        // test_h = async_fifo_test :: type_id :: create("test_h", null);
        // test_h.set_report_verbosity_level(UVM_NONE);
        fork
            reset();
        join_none
        uvm_config_db#(virtual async_fifo_if) :: set(null, "*", "vif", inf);
        run_test("async_fifo_test");
    end

    // Assertions
    property p_wreset_check;
        @(posedge wclk)
        $fell(wrst_n) |=> (!inf.wfull);
    endproperty
    assert property(p_wreset_check) else $error("Fifo Full should be deasserted after reset");

    property p_rreset_check;
        @(posedge rclk)
        $fell(rrst_n) |=> (inf.rempty && !inf.rdata);
    endproperty
    assert property(p_rreset_check) else $error("Fifo Empty should be asserted after reset");

    property p_fifo_full_vs_empty;
        @(posedge rclk)
        inf.wfull |-> !inf.rempty;
    endproperty
    assert property(p_fifo_full_vs_empty) else $error("Fifo Empty should be deasserted when FIFO is Full");

    property p_fifo_empty_vs_full;
        @(posedge wclk)
        inf.rempty |-> !inf.wfull;
    endproperty
    assert property(p_fifo_empty_vs_full) else $error("Fifo Full should be deasserted when FIFO is Empty");

    property p_fifoflags_wfull;
        @(posedge wclk)
        inf.rinc |-> ##[3:5] !inf.wfull;
    endproperty
    assert property(p_fifoflags_wfull) else $error("After a FIFO read, FIFO cannot be full");

    property p_fifoflags_rempty;
        @(posedge rclk) disable iff(rrst_n)
        inf.winc |-> ##[3:5] !inf.rempty;
    endproperty
    assert property(p_fifoflags_rempty) else $error("After a FIFO write, FIFO cannot be empty");

    property p_fifoflags_full;
        @(posedge wclk) disable iff(wrst_n)
        inf.winc && inf.wfull |=> !inf.winc;
    endproperty
    assert property(p_fifoflags_full) else $error("If FIFO is full, it cannot be written to");

    property p_fifoflags_empty;
        @(posedge rclk) disable iff(rrst_n)
        inf.rinc && inf.rempty |=> !inf.rinc;
    endproperty
    assert property(p_fifoflags_empty) else $error("If FIFO is empty, it cannot be read");

    // Final block to display FIFO contents
    final begin
        foreach (DUT.FIFOMEM.fifo[i]) begin
            $display("async_fifo[%0d] = %0d", i, DUT.FIFOMEM.fifo[i]);
        end
    end

endmodule : async_fifo_top
