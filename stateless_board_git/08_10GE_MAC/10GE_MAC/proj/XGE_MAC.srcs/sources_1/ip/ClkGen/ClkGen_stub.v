// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Thu Jun 07 15:28:45 2018
// Host        : GVI-QD02 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               e:/workspace/MC02/10GE_MAC/design/XGE_MAC.srcs/sources_1/ip/ClkGen/ClkGen_stub.v
// Design      : ClkGen
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku040-ffva1156-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module ClkGen(clkout_100M, reset, locked, clkin_p, clkin_n)
/* synthesis syn_black_box black_box_pad_pin="clkout_100M,reset,locked,clkin_p,clkin_n" */;
  output clkout_100M;
  input reset;
  output locked;
  input clkin_p;
  input clkin_n;
endmodule
