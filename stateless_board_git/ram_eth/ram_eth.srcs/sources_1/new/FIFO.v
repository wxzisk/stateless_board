`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/30 14:17:52
// Design Name: 
// Module Name: FIFO
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


module FIFO(
    input [31:0] pcie_out,
    input wr_en,
    input rd_en,
    input wr_clk,
    input rd_clk,
    input rst,
    output [31:0] eth_in,
    output full,
    output empty
        );
        
    FIFO_between FIFO_between(
    .pcie_out(pcie_out),
    .wr_en(1),
    .rd_en(rd_en),
    .wr_clk(wr_clk),
    .rd_clk(rd_clk),
    .rst(rst),
    .eth_in(eth_in),
    .full(full),
    .empty(empty)
    );
endmodule
