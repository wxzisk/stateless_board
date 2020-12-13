//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
//Date        : Tue Jan  7 17:57:41 2020
//Host        : WIN-6LRTIFRL70S running 64-bit major release  (build 9200)
//Command     : generate_target FIFO_between_wrapper.bd
//Design      : FIFO_between_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module FIFO_between_wrapper
   (empty,
    eth_in,
    full,
    pcie_out,
    rd_clk,
    rd_en,
    rst,
    wr_clk,
    wr_en);
  output empty;
  output [31:0]eth_in;
  output full;
  input [31:0]pcie_out;
  input rd_clk;
  input rd_en;
  input rst;
  input wr_clk;
  input wr_en;

  wire empty;
  wire [31:0]eth_in;
  wire full;
  wire [31:0]pcie_out;
  wire rd_clk;
  wire rd_en;
  wire rst;
  wire wr_clk;
  wire wr_en;

  FIFO_between FIFO_between_i
       (.empty(empty),
        .eth_in(eth_in),
        .full(full),
        .pcie_out(pcie_out),
        .rd_clk(rd_clk),
        .rd_en(rd_en),
        .rst(rst),
        .wr_clk(wr_clk),
        .wr_en(wr_en));
endmodule
