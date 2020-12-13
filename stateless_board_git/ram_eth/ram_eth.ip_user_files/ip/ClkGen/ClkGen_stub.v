// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4_AR70877 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Thu Aug 13 13:58:20 2020
// Host        : WIN-5I8J21IIVL5 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               E:/test/pcie_eth_10g_8.11/ram_eth/ram_eth.srcs/sources_1/ip/ClkGen/ClkGen_stub.v
// Design      : ClkGen
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku040-ffva1156-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module ClkGen(clkout_200M, reset, locked, clk_in1_p, clk_in1_n)
/* synthesis syn_black_box black_box_pad_pin="clkout_200M,reset,locked,clk_in1_p,clk_in1_n" */;
  output clkout_200M;
  input reset;
  output locked;
  input clk_in1_p;
  input clk_in1_n;
endmodule
