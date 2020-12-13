// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4_AR70877 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Mon May 11 11:39:17 2020
// Host        : DESKTOP-P29M76J running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/yinxj/Desktop/with_bram/xdma_0_ex/xdma_0_ex.srcs/sources_1/bd/xdma_and_ram/ip/xdma_and_ram_axi_bram_ctrl_0_bram_1/xdma_and_ram_axi_bram_ctrl_0_bram_1_stub.v
// Design      : xdma_and_ram_axi_bram_ctrl_0_bram_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku040-ffva1156-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_1,Vivado 2017.4_AR70877" *)
module xdma_and_ram_axi_bram_ctrl_0_bram_1(clka, rsta, ena, wea, addra, dina, douta, clkb, rstb, enb, 
  web, addrb, dinb, doutb, rsta_busy, rstb_busy)
/* synthesis syn_black_box black_box_pad_pin="clka,rsta,ena,wea[7:0],addra[31:0],dina[63:0],douta[63:0],clkb,rstb,enb,web[7:0],addrb[31:0],dinb[63:0],doutb[63:0],rsta_busy,rstb_busy" */;
  input clka;
  input rsta;
  input ena;
  input [7:0]wea;
  input [31:0]addra;
  input [63:0]dina;
  output [63:0]douta;
  input clkb;
  input rstb;
  input enb;
  input [7:0]web;
  input [31:0]addrb;
  input [63:0]dinb;
  output [63:0]doutb;
  output rsta_busy;
  output rstb_busy;
endmodule
