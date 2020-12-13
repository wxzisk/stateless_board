`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/06 23:23:21
// Design Name: 
// Module Name: despatch
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module despatch(
   input wire clk,
   input wire rst_n,
//connect bram port B
    output reg [31:0] addrb,
    (*mark_debug = "true"*)output reg [63:0] dinb,
    output reg enb,
    (*mark_debug = "true"*)output reg [7:0] web,
    input [63:0] doutb,
    
//rec data from eth
    input wire fifo_empty,
    (*mark_debug = "true"*)input wire [63:0] data_from_eth,
    (*mark_debug = "true"*)output reg fifo_rd_en,

//snd data to eth
    input pcie_to_eth_full,
    output reg[63:0] data_to_eth_1,
    output reg to_eth_en,
    
//event header in fifo
    input[63:0] event_header,
    output reg event_header_in,
//connect small fifo    
    input wire full_c2h,
    (*mark_debug = "true"*)output reg  [155:0] din_c2h,
    (*mark_debug = "true"*)output reg wr_en_c2h,
    
    input wire full_h2c,
    (*mark_debug = "true"*)output reg  [155:0] din_h2c,
    (*mark_debug = "true"*)output reg wr_en_h2c,
    
    //dma inform of transferring successfully
    input h_h2c_success,
    input h_c2h_success,
    input c_h2c_success,
    input c_c2h_success
    );
    //for test
//    reg fifo_empty;
//    reg [63:0] data_from_eth;
//    reg fifo_rd_en;
    
//    reg event_header;
//    reg event_header_in;
    
    // c2h means nic to host ?????
    reg [31:0] addr_c2h;
    reg [31:0] addr_h2c;
    

    reg [63:0] dma_addr;
    (*mark_debug = "true"*)reg [28:0] dma_len;

    reg [31:0] bit_num;
    reg dir;
    (*mark_debug = "true"*)reg [15:0] push_data_cnt;
    reg[5:0] state;
    reg[5:0] next_state;
    reg[5:0] p2e_state;
    reg[5:0] p2e_next_state;
    reg[15:0] get_data_cnt;
    reg work_switch;
    reg [31:0] addr_get_from_ram;
    reg [15:0] data_len_from_ram;
    
    //control param of c2h data
    reg[47:0] din;
    wire full;
    reg wr_en;
    wire empty;
    wire[47:0] dout;
    reg rd_en;
    
    reg [1:0] read_header_cnt;
    // record the times of the successful dma transfer
    reg[15:0] h_h2c_success_cnt;
    reg[15:0] h_c2h_success_cnt;
    reg[15:0] c_h2c_success_cnt;
    reg[15:0] c_c2h_success_cnt;
    (*mark_debug = "true"*)reg IB_len_tail;
localparam IDLE = 6'b000001;
localparam READ_HEADER = 6'b000010;
localparam READ_DATA = 6'b000100;
localparam TRANS_DES = 6'b001000;
localparam GET_DES = 6'b010000;
localparam GET_DATA = 6'b100000;
    
always@ (posedge clk or negedge rst_n)
begin
    if(~rst_n)
        state <= IDLE;
    else
        state <= next_state;
end

always@ (posedge clk or negedge rst_n)
begin
    if(~rst_n)
        p2e_state <= IDLE;
    else
        p2e_state <= p2e_next_state;
end

always @(*)
    begin
        case(state)
            IDLE:
                begin
                if(~fifo_empty)
                    next_state <= READ_HEADER;
                else
                    next_state <= IDLE;
                end
            READ_HEADER:
                begin
                if(dir == 1 && read_header_cnt == 3)
                    next_state <= READ_DATA;
                else if(dir == 0 && read_header_cnt == 3) 
                    next_state <= TRANS_DES;
                else 
                    next_state <= READ_HEADER;
                end
            READ_DATA:
                begin
                if(push_data_cnt == dma_len[15:3] + IB_len_tail - 1 && ~fifo_empty)
                    next_state <=TRANS_DES;
                else
                    next_state <= READ_DATA;
                end
            TRANS_DES:
                begin
                    next_state <= IDLE;
                end
            default:
                next_state <= IDLE;
        endcase
    end

always @(*)
    begin
        case(p2e_state)
            IDLE:
                begin
                if(c_h2c_success_cnt >0 && ~pcie_to_eth_full)
                    p2e_next_state <= GET_DES;
                else
                    p2e_next_state <= IDLE;
                end
            GET_DES:
                begin
                    p2e_next_state <= GET_DATA;
                end
            GET_DATA:
                begin
                    if(get_data_cnt == data_len_from_ram[15:3] + 4)
                        p2e_next_state <= IDLE;
                    else
                        p2e_next_state <= GET_DATA;
                end
            default:
                p2e_next_state <= IDLE;
        endcase
    end
    
always@ (posedge clk or negedge rst_n)
    begin
        if(~rst_n)
            read_header_cnt <= 0;
        else if(state == READ_HEADER)
            read_header_cnt <= read_header_cnt + 1'b1;
        else 
            read_header_cnt <= 0;
    end  
    
always@ (posedge clk or negedge rst_n)
    begin
        if(~rst_n)
            work_switch <= 1;
        else if(c_h2c_success_cnt > 0)
            work_switch <= 0;
        else if(p2e_state == GET_DATA)
            work_switch <= 1;
        else
            work_switch <= work_switch;
    end  
      
always @ (posedge clk or negedge rst_n) 
    begin
        if (~rst_n) 
            begin
                dma_addr <= 0;
                dma_len <= 0;   
                bit_num <= 0;
                dir <= 0;                                
            end 
        else if(read_header_cnt == 2 && state == READ_HEADER) 
            begin     
                dma_addr <= {17'd0,data_from_eth[63:17]};
                dma_len <= data_from_eth[16:1];
                bit_num <= data_from_eth[16:1];
                dir <= data_from_eth[0:0];
            end 
        else 
            begin
                dma_addr <= dma_addr;
                dma_len <= dma_len;                       
                bit_num <= bit_num;
                dir <= dir;
            end
    end

//// addrb, dinb, enb, web
always @ (posedge clk or negedge rst_n) 
    begin
        if (!rst_n) 
            begin
                addrb <= 32'd0;
                dinb <= 64'd0;
                web <= 8'd0;
//                get_data_cnt <= 16'd0;
           end
        else if(state == READ_DATA && push_data_cnt > 0)
            begin
                addrb <= addr_c2h + push_data_cnt -1;
                dinb <= data_from_eth;
                web <= 8'hff;
//                get_data_cnt <= 0;
            end
        else if(get_data_cnt >= 4 && get_data_cnt < data_len_from_ram[15:3] + 4)
            begin
                addrb <= addr_get_from_ram + get_data_cnt - 4;
                dinb <= 0;
                web <= 8'h00;
//                get_data_cnt <= get_data_cnt + 1'b1;
            end
        else 
            begin
                addrb <= 0;  
                dinb <= 0;
                web <= 0;
//                get_data_cnt <= 0;           
            end
    end                
always @ (posedge clk or negedge rst_n) 
        begin
            if (!rst_n) 
                begin
                    enb <= 1;
               end
            else 
                begin
                    enb <= 1;       
                end
        end
        
always @ (posedge clk or negedge rst_n) 
    begin
        if (~rst_n) 
            begin
                IB_len_tail <= 0;
            end 
        else if(read_header_cnt == 2 && state == READ_HEADER && data_from_eth[3:1] != 0) 
            begin     
                IB_len_tail<= 1;
            end 
        else if(read_header_cnt == 2 && state == READ_HEADER && data_from_eth[3:1] == 0)
            begin
                IB_len_tail <= 0;
            end
        else 
            IB_len_tail <= IB_len_tail;
    end
                        
always @ (posedge clk or negedge rst_n) 
    begin
        if (!rst_n) 
            begin
                push_data_cnt <= 16'd0;
           end
        else if(state == READ_DATA && ~fifo_empty)
            begin
                push_data_cnt <= push_data_cnt + 1'b1;
            end
        else if(state == IDLE)
            begin
                push_data_cnt <= 0;
            end
        else 
            begin
                push_data_cnt <= push_data_cnt;       
            end
    end

////
always @ (posedge clk or negedge rst_n) 
    begin
        if (~rst_n) 
            begin
                get_data_cnt <= 16'd0;
           end
        else if(p2e_state == GET_DATA)
            begin
                get_data_cnt <= get_data_cnt + 1'b1;
            end
        else 
            begin
                get_data_cnt <= 0;           
            end
    end      
                               
//// din_c2h , wr_en_c2h , din_h2c , wr_en_h2c , dir == 1 means c2h
always @ (posedge clk or negedge rst_n) 
    begin
        if (!rst_n) 
            begin
                din_c2h <= 156'h0;
                wr_en_c2h <= 0;
                din_h2c  <= 156'd0;
                wr_en_h2c <= 0;
                din <= 48'd0;
                wr_en <= 0;
            end
        else if(state == TRANS_DES && dir == 1'b1 && ~full_c2h)
            begin
                din_c2h <={dma_addr, 32'h0, addr_c2h, dma_len};
                wr_en_c2h <= 1'b1;
                din_h2c <= 156'd0;
                wr_en_h2c <= 1'b0;
                din <= 0;
                wr_en <= 0;
            end
        else if(state == TRANS_DES && dir == 1'b0 && ~full_h2c)
            begin
                din_c2h <= 156'd0;
                wr_en_c2h <= 1'b0;
                din_h2c <= {dma_addr, 32'h0, addr_h2c, dma_len};
                wr_en_h2c <= 1'b1;
                din <= {addr_h2c, dma_len[15:0]};
                wr_en <= 1;
            end
        else
            begin
                din_c2h <= 156'd0;
                wr_en_c2h <= 1'b0;
                din_h2c <= 156'd0;
                wr_en_h2c <= 1'b0;
                din <= 0;
                wr_en <= 0;
            end
end                                               

//c-h2c:512-767  c-c2h:768-1023 
always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
            begin
                addr_h2c <= 32'd512;
                addr_c2h <= 32'd768;
            end
        else if(state == TRANS_DES && dir == 0)
            begin
                addr_c2h <= addr_c2h;
                if(addr_h2c + dma_len >767)   
                    addr_h2c <= dma_len + addr_h2c - 32'd255 ;
                else
                    addr_h2c <= dma_len + addr_h2c;   
            end
        else if(state == TRANS_DES && dir == 1)
            begin
                addr_h2c <= addr_h2c;
                if(addr_c2h + dma_len >1023)
                    addr_c2h <= addr_c2h + dma_len - 32'd255;
                else
                    addr_c2h <= addr_c2h + dma_len; 
            end
        else
            begin
                addr_h2c <= addr_h2c;
                addr_c2h <= addr_c2h;
            end
    end

always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
            fifo_rd_en <= 0;
        else if(next_state == READ_HEADER && state == IDLE)
            fifo_rd_en <= 1;
//        else if(next_state == READ_DATA && push_data_cnt <dma_len[15:3] -1'b1)
        else if(next_state == READ_DATA && push_data_cnt <dma_len[15:3] + IB_len_tail)
            fifo_rd_en <= 1;
        else 
            fifo_rd_en <= 0;
    end


// store the descriptor of data from c-c2h
despatch_fifo descriptor
(
    .clk(clk),
    .srst(~rst_n),
    .full(full),
    .din(din),
    .wr_en(wr_en),
    .empty(empty),
    .dout(dout),
    .rd_en(rd_en),
    .wr_rst_busy(),
    .rd_rst_busy()
);

always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
            begin
                rd_en <= 0;
                addr_get_from_ram <= 0;
                data_len_from_ram <= 0;
            end
        else if(p2e_state == GET_DES)
            begin
                rd_en <= 1;
                addr_get_from_ram <= dout[47:16];
                data_len_from_ram <= dout[15:0];
            end
        else
            begin
                rd_en <= 0;
                addr_get_from_ram <= addr_get_from_ram;
                data_len_from_ram <= data_len_from_ram;
            end
    end 

always@ (posedge clk or negedge rst_n)
    begin
        if(~rst_n)
            begin
                data_to_eth_1 <= 64'd0;
                to_eth_en <= 0;
            end
        else if(p2e_state == GET_DES)
            begin
                data_to_eth_1 <=0;
                to_eth_en <= 0;
            end
        else if(get_data_cnt>=16'd1 && get_data_cnt <= 16'd4 && ~pcie_to_eth_full)
            begin
                data_to_eth_1 <= event_header;
                to_eth_en <= 1;
            end
        else if(p2e_state == GET_DATA && get_data_cnt >16'd4 && ~pcie_to_eth_full)
            begin
                data_to_eth_1 <= doutb;
                to_eth_en <= 1;
            end
        else
            begin
                data_to_eth_1 <= 0;
                to_eth_en <= 0;
            end
    end
    
////
always@ (posedge clk or negedge rst_n)
    begin
        if(~rst_n)
            begin
                event_header_in <=0;
            end
        else if(p2e_state == GET_DES)
            begin
                event_header_in <= 1;
            end
        else if(p2e_state == GET_DATA && get_data_cnt <= 16'd2)
            begin
                event_header_in <= 1;
            end
        else if(p2e_state == GET_DATA && get_data_cnt >16'd2)
            begin
                event_header_in <= 0;
            end
        else
            begin
                event_header_in <= 0;
            end
    end
    
always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
            c_h2c_success_cnt <= 0;
        else if(c_h2c_success)
            c_h2c_success_cnt <= c_h2c_success_cnt + 1'b1;
        else if(p2e_state == GET_DES && p2e_next_state == GET_DATA)
            c_h2c_success_cnt <= c_h2c_success_cnt - 1'b1;
        else
            c_h2c_success_cnt <= c_h2c_success_cnt;
    end
    
    // for test
//always@(posedge clk or negedge rst_n)
//        begin
//            if(~rst_n)
//                begin
//                    data_from_eth <= 0;
//                    fifo_empty <= 0;
//                    event_header <= 64'h0;
//                end
//            else
//            begin
//               if(fifo_rd_en == 1'b1)
//                begin
//                 data_from_eth <= 64'h80;//src:64'h0, len 64B, dir 0
//                 fifo_empty <= fifo_empty;
//                end
                
//                if(event_header_in)
//                    event_header <= 64'h3039000a3501fec0;
//                else
//                    event_header <= 64'h0;
//              end   
//        end    
endmodule

