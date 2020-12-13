//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
//Date        : Tue Jan  7 17:57:41 2020
//Host        : WIN-6LRTIFRL70S running 64-bit major release  (build 9200)
//Command     : generate_target FIFO_between.bd
//Design      : FIFO_between
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "FIFO_between,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=FIFO_between,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "FIFO_between.hwdef" *) 
module FIFO_between
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ETH_IN DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ETH_IN, LAYERED_METADATA undef" *) output [31:0]eth_in;
  output full;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.PCIE_OUT DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.PCIE_OUT, LAYERED_METADATA undef" *) input [31:0]pcie_out;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.RD_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.RD_CLK, CLK_DOMAIN FIFO_between_rd_clk, FREQ_HZ 100000000, PHASE 0.000" *) input rd_clk;
  input rd_en;
  input rst;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.WR_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.WR_CLK, CLK_DOMAIN FIFO_between_wr_clk, FREQ_HZ 100000000, PHASE 0.000" *) input wr_clk;
  input wr_en;

  wire [31:0]fifo_generator_0_dout;
  wire fifo_generator_0_empty;
  wire fifo_generator_0_full;
  wire [31:0]pcie_out_1;
  wire rd_clk_1;
  wire rd_en_1;
  wire rst_1;
  wire wr_clk_1;
  wire wr_en_1;

  assign empty = fifo_generator_0_empty;
  assign eth_in[31:0] = fifo_generator_0_dout;
  assign full = fifo_generator_0_full;
  assign pcie_out_1 = pcie_out[31:0];
  assign rd_clk_1 = rd_clk;
  assign rd_en_1 = rd_en;
  assign rst_1 = rst;
  assign wr_clk_1 = wr_clk;
  assign wr_en_1 = wr_en;
  FIFO_between_fifo_generator_0_1 fifo_generator_0
       (.din(pcie_out_1),
        .dout(fifo_generator_0_dout),
        .empty(fifo_generator_0_empty),
        .full(fifo_generator_0_full),
        .rd_clk(rd_clk_1),
        .rd_en(rd_en_1),
        .rst(rst_1),
        .wr_clk(wr_clk_1),
        .wr_en(wr_en_1));
endmodule
