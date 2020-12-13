// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Mon Jul 13 19:42:26 2020
// Host        : DESKTOP-P8TPC4Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/pcie_eth_10g/ram_eth/ram_eth.srcs/sources_1/ip/dsc_gen_fifo/dsc_gen_fifo_stub.v
// Design      : dsc_gen_fifo
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku040-ffva1156-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_2_1,Vivado 2017.4" *)
module dsc_gen_fifo(clk, srst, din, wr_en, rd_en, dout, full, empty, 
  wr_rst_busy, rd_rst_busy)
/* synthesis syn_black_box black_box_pad_pin="clk,srst,din[155:0],wr_en,rd_en,dout[155:0],full,empty,wr_rst_busy,rd_rst_busy" */;
  input clk;
  input srst;
  input [155:0]din;
  input wr_en;
  input rd_en;
  output [155:0]dout;
  output full;
  output empty;
  output wr_rst_busy;
  output rd_rst_busy;
endmodule
