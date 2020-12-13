// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4_AR70877 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Sun May  3 16:26:02 2020
// Host        : WIN-6LRTIFRL70S running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/fpga/yxj/with_bram/xdma_0_ex/xdma_0_ex.srcs/sources_1/bd/xdma_and_ram/ip/xdma_and_ram_util_ds_buf_0/xdma_and_ram_util_ds_buf_0_stub.v
// Design      : xdma_and_ram_util_ds_buf_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku040-ffva1156-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "util_ds_buf,Vivado 2017.4_AR70877" *)
module xdma_and_ram_util_ds_buf_0(IBUF_DS_P, IBUF_DS_N, IBUF_OUT, IBUF_DS_ODIV2)
/* synthesis syn_black_box black_box_pad_pin="IBUF_DS_P[0:0],IBUF_DS_N[0:0],IBUF_OUT[0:0],IBUF_DS_ODIV2[0:0]" */;
  input [0:0]IBUF_DS_P;
  input [0:0]IBUF_DS_N;
  output [0:0]IBUF_OUT;
  output [0:0]IBUF_DS_ODIV2;
endmodule
