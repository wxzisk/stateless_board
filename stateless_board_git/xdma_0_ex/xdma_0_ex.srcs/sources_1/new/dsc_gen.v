`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2020 03:25:15 PM
// Design Name: 
// Module Name: dsc_gen
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


module dsc_gen(
     input wire dsc_byp_ready,
     output reg dsc_byp_load,
     output reg [63:0] dsc_byp_src_addr,
     output reg [63:0] dsc_byp_dst_addr,
     output reg [27:0] dsc_byp_len,
     output reg [15:0] dsc_byp_ctl,
     
     input wire init,
     output reg complete,
     input  wire [63:0]  data_src_addr,
     input wire [63:0]  data_dst_addr,
     input wire [27:0]  data_num,
   
     input wire clk,
     input wire rst_n
    );
    
    reg [27:0]  dma_transfer_limit;

    reg [63:0]  data_src_addr_next;
    reg [63:0]  data_dst_addr_next;
    reg [27:0]  remain;
    
    
    
    
    always @ (posedge clk) begin 
        if (!rst_n) begin
                dma_transfer_limit <= 28'hfff_ffff;//28'hfff_ffff
                complete <= 1'b1;
                dsc_byp_ctl         <= 16'h3; 
                
        end else if(complete == 1'b0) begin
            if (dsc_byp_ready) begin
                if(remain > dma_transfer_limit) begin
                        remain <= remain - dma_transfer_limit;
                        
                        dsc_byp_src_addr <= data_src_addr_next;
                        dsc_byp_dst_addr <= data_dst_addr_next;
                        dsc_byp_len         <= dma_transfer_limit;
                        dsc_byp_ctl         <= 16'h2;
                        data_src_addr_next <= data_src_addr_next + dma_transfer_limit;
                        data_dst_addr_next <= data_dst_addr_next + dma_transfer_limit;
                    end else  begin
                        dsc_byp_src_addr <= data_src_addr_next;
                        dsc_byp_dst_addr <= data_dst_addr_next;
                        dsc_byp_len         <= remain;
                        dsc_byp_ctl         <= 16'h3;    
                     end
                
                if(dsc_byp_ctl ==16'h3) begin
                          dsc_byp_load	= 1'b0;
                          complete <= 1'b1;
                end else begin
                        dsc_byp_load	= 1'b1;
                        complete <= 1'b0;
                end
                
            end else begin
                dsc_byp_load	<= 1'b0;
            end
        
        end else begin
                 if(init == 1'b0) begin
                     data_src_addr_next <= data_src_addr;
                     data_dst_addr_next <= data_dst_addr;
                     remain <= data_num;
                     dsc_byp_ctl<= 16'h2;
                     complete <= 1'b0;                    
                  end
        end
    end
endmodule