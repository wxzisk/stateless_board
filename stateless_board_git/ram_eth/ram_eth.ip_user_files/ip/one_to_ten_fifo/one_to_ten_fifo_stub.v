// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4_AR70877 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Thu Aug 13 19:09:20 2020
// Host        : WIN-5I8J21IIVL5 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               e:/test/pcie_eth_10g_8.11/ram_eth/ram_eth.srcs/sources_1/ip/one_to_ten_fifo/one_to_ten_fifo_stub.v
// Design      : one_to_ten_fifo
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku040-ffva1156-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_2_1,Vivado 2017.4_AR70877" *)
module one_to_ten_fifo(rst, wr_clk, rd_clk, din, wr_en, rd_en, dout, full, 
  empty, prog_full, wr_rst_busy, rd_rst_busy)
/* synthesis syn_black_box black_box_pad_pin="rst,wr_clk,rd_clk,din[63:0],wr_en,rd_en,dout[63:0],full,empty,prog_full,wr_rst_busy,rd_rst_busy" */;
  input rst;
  input wr_clk;
  input rd_clk;
  input [63:0]din;
  input wr_en;
  input rd_en;
  output [63:0]dout;
  output full;
  output empty;
  output prog_full;
  output wr_rst_busy;
  output rd_rst_busy;
endmodule
