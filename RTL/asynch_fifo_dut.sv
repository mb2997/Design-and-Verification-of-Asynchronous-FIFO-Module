// module asynch_fifo_dut #(parameter DATA_WIDTH=8, ADDR_WIDTH=4) (output logic [DATA_WIDTH-1:0] rdata,
//                                                                 output logic wfull,
//                                                                 output logic rempty,
//                                                                 input [DATA_WIDTH-1:0] wdata,
//                                                                 input winc, wclk, wrst_n,
//                                                                 input rinc, rclk, rrst_n);

//     //Memory model FIFO_DEPTH
//     localparam FIFO_DEPTH = 1 << ADDR_WIDTH;

//     //internal parameters
//     logic [ADDR_WIDTH-1:0] wr_ptr,rd_ptr;				                //read & write pointer to point a memory location
//     logic [DATA_WIDTH-1:0]fifo_mem[0:FIFO_DEPTH-1];			            //FIFO internal memory declaration
//     logic wr_flag, rd_flag, error;
    
//     int i;
    
//     always@(posedge wclk)
//     begin
//         //reset logic
//         if(!wrst_n)
//         begin
//             rdata = 0;
//             wfull = 0;
//             error = 0;
//             wr_ptr = 0;
//             //rd_ptr = 0;
//             wr_flag = 0;
//             //rd_flag = 0;
            
//             //wfull memory reset to 0
//             for(i=0; i<FIFO_DEPTH; i=i+1)
//             begin
//                 fifo_mem[i] = 0;
//             end
//         end
        
//         else
//         begin
//             //write logic in FIFO memory
//             if(winc)
//             begin
//                 if(wfull == 1)
//                 begin
//                     if(error == 0)
//                     begin
//                         // $display("---------------------------------------------------------------");
//                         // $display($time," -- ERROR : FIFO FULL --> We can't write");
//                         // $display("---------------------------------------------------------------");
//                     end
//                     error = 1;		//you are writing on a wfull FIFO memory
                    
//                 end
//                 else
//                 begin
//                     error = 0;
//                     fifo_mem[wr_ptr] = wdata;		//write data_in into FIFO memory
//                     //$display($time," -- Data Written in --> fifo_mem[%0d] = %0d",wr_ptr,wdata);
//                     if(wr_ptr == FIFO_DEPTH-1)
//                     begin
//                         wr_flag = ~wr_flag;			//write flag toggle when write memory becomes wfull
//                         //$display($time," -- Last memory location to write -- ");
//                     end
//                     wr_ptr = wr_ptr + 1;
//                 end
//             end
//         end
//     end

//     always@(posedge rclk)
//     begin
//         //reset logic
//         if(!rrst_n)
//         begin
//             rdata = 0;
//             rempty = 1;
//             error = 0;
//             //wr_ptr = 0;
//             rd_ptr = 0;
//             //wr_flag = 0;
//             rd_flag = 0;
            
//             // //wfull memory reset to 0
//             // for(i=0; i<FIFO_FIFO_DEPTH; i=i+1)
//             // begin
//             //     fifo_mem[i] = 0;
//             // end
//         end
//         else
//         begin
//             if(rinc)
//             begin
//                 if(rempty == 1)
//                 begin
//                     if(error == 0)
//                     begin
//                     // $display("---------------------------------------------------------------");
//                     // $display($time," -- ERROR : FIFO EMPTY --> We can't Read");
//                     // $display("---------------------------------------------------------------");
//                     end
//                     error = 1;		//you are reading from rempty FIFO
                    
//                 end
//                 else
//                 begin
//                     error = 0;
//                     rdata = fifo_mem[rd_ptr];	//data_out from FIFO perticular FIFO memory
//                     //$display($time," -- Data Read from --> fifo_mem[%0d] = %0d",rd_ptr,rdata);
//                     if(rd_ptr == FIFO_DEPTH-1)
//                     begin
//                         rd_flag = ~rd_flag;			//read flag toggle when memory becomes rempty
//                         //$display($time," -- Last memory location to Read -- ");
//                     end
//                     rd_ptr = rd_ptr + 1;
//                 end
//             end
//         end
//     end
    
//     //wfull and rempty logic of FIFO
//     always@(*)
//     begin
//         rempty = 0;
//         wfull = 0;
//         if(wr_ptr == rd_ptr)
//             begin
//                 if(wr_flag != rd_flag)
//                 begin
//                     wfull = 1;
//                 end
//                 if(wr_flag == rd_flag)
//                 begin
//                     rempty = 1;
//                 end
//             end
//     end
//     endmodule    

module asynch_fifo_dut #(parameter DATA_WIDTH=8, ADDR_WIDTH=4) (output [DATA_WIDTH-1:0] rdata,
    output wfull,
    output rempty,
    input [DATA_WIDTH-1:0] wdata,
    input winc, wclk, wrst_n,
    input rinc, rclk, rrst_n);

logic [ADDR_WIDTH-1:0] waddr, raddr;
logic [ADDR_WIDTH:0] wptr, rptr, wq2_rptr, rq2_wptr;

//Sub-module instantiation
sync_r2w #(ADDR_WIDTH) SYNC_R2W (.*);
sync_w2r #(ADDR_WIDTH) SYNC_W2R (.*);

fifomem #(DATA_WIDTH, ADDR_WIDTH) FIFOMEM (.rdata(rdata),
.wdata(wdata),
.waddr(waddr),
.raddr(raddr),
.wclken(winc),
.rclken(rinc),
.wfull(wfull),
.rempty(rempty),
.rclk(rclk),
.wclk(wclk));

rptr_empty #(ADDR_WIDTH) RPTR_EMPTY (.*);

wptr_full #(ADDR_WIDTH) WPTR_FULL (.*);


endmodule