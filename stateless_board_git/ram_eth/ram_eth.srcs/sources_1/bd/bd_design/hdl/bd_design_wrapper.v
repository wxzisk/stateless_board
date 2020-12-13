//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
//Date        : Tue Mar 31 13:46:48 2020
//Host        : LAPTOP-AE792R7S running 64-bit major release  (build 9200)
//Command     : generate_target bd_design_wrapper.bd
//Design      : bd_design_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bd_design_wrapper
   (addrb_0,
    axi_aclk,
    dinb_0,
    doutb_0,
    enb_0,
    pcie_rxn,
    pcie_rxp,
    pcie_txn,
    pcie_txp,
    refclk_clk_n,
    refclk_clk_p,
    reset_n,
    user_lnk_up,
    web_0);
  input [31:0]addrb_0;
  output axi_aclk;
  input [63:0]dinb_0;
  output [63:0]doutb_0;
  input enb_0;
  input [7:0]pcie_rxn;
  input [7:0]pcie_rxp;
  output [7:0]pcie_txn;
  output [7:0]pcie_txp;
  input [0:0]refclk_clk_n;
  input [0:0]refclk_clk_p;
  input reset_n;
  output user_lnk_up;
  input [7:0]web_0;

  wire [31:0]addrb_0;
  wire axi_aclk;
  wire [63:0]dinb_0;
  wire [63:0]doutb_0;
  wire enb_0;
  wire [7:0]pcie_rxn;
  wire [7:0]pcie_rxp;
  wire [7:0]pcie_txn;
  wire [7:0]pcie_txp;
  wire [0:0]refclk_clk_n;
  wire [0:0]refclk_clk_p;
  wire reset_n;
  wire user_lnk_up;
  wire [7:0]web_0;

  bd_design bd_design_i
       (.addrb_0(addrb_0),
        .axi_aclk(axi_aclk),
        .dinb_0(dinb_0),
        .doutb_0(doutb_0),
        .enb_0(enb_0),
        .pcie_rxn(pcie_rxn),
        .pcie_rxp(pcie_rxp),
        .pcie_txn(pcie_txn),
        .pcie_txp(pcie_txp),
        .refclk_clk_n(refclk_clk_n),
        .refclk_clk_p(refclk_clk_p),
        .reset_n(reset_n),
        .user_lnk_up(user_lnk_up),
        .web_0(web_0));
endmodule
