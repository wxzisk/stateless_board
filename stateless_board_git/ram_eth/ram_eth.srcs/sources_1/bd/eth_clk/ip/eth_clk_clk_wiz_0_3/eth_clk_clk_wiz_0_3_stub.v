// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Fri Oct 25 13:33:48 2019
// Host        : DESKTOP-P8TPC4Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/vivado/ram_eth/ram_eth.srcs/sources_1/bd/eth_clk/ip/eth_clk_clk_wiz_0_3/eth_clk_clk_wiz_0_3_stub.v
// Design      : eth_clk_clk_wiz_0_3
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tfgg484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module eth_clk_clk_wiz_0_3(clk_out1, clk_out2, resetn, locked, clk_in1_p, 
  clk_in1_n)
/* synthesis syn_black_box black_box_pad_pin="clk_out1,clk_out2,resetn,locked,clk_in1_p,clk_in1_n" */;
  output clk_out1;
  output clk_out2;
  input resetn;
  output locked;
  input clk_in1_p;
  input clk_in1_n;
endmodule
