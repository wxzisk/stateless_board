//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
//Date        : Sat Aug 24 21:27:09 2019
//Host        : DESKTOP-25POSLT running 64-bit major release  (build 9200)
//Command     : generate_target PCIe_wrapper.bd
//Design      : PCIe_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module PCIe_wrapper
   (addrb_0,
    clkb_0,
    dinb_0,
    doutb_0,
    enb_0,
    pci_exp_rxn,
    pci_exp_rxp,
    pci_exp_txn,
    pci_exp_txp,
    rstb_0,
    sys_clk_clk_n,
    sys_clk_clk_p,
    sys_ddr_clk_n,
    sys_ddr_clk_p,
    sys_rst,
    sys_rst_n,
    web_0,
    CLK);
  input [31:0]addrb_0;
  output clkb_0;
  input [31:0]dinb_0;
  output [31:0]doutb_0;
  input enb_0;
  input [3:0]pci_exp_rxn;
  input [3:0]pci_exp_rxp;
  output [3:0]pci_exp_txn;
  output [3:0]pci_exp_txp;
  output rstb_0;
  input [0:0]sys_clk_clk_n;
  input [0:0]sys_clk_clk_p;
  input sys_ddr_clk_n;
  input sys_ddr_clk_p;
  input sys_rst;
  input sys_rst_n;
  input [3:0]web_0;
  output CLK;

  wire [31:0]addrb_0;
  wire clkb_0;
  wire [31:0]dinb_0;
  wire [31:0]doutb_0;
  wire enb_0;
  wire [3:0]pci_exp_rxn;
  wire [3:0]pci_exp_rxp;
  wire [3:0]pci_exp_txn;
  wire [3:0]pci_exp_txp;
  wire rstb_0;
  wire [0:0]sys_clk_clk_n;
  wire [0:0]sys_clk_clk_p;
  wire sys_ddr_clk_n;
  wire sys_ddr_clk_p;
  wire sys_rst;
  wire sys_rst_n;
  wire [3:0]web_0;

  PCIe PCIe_i
       (.addrb_0(addrb_0),
        .clkb_0(clkb_0),
        .dinb_0(dinb_0),
        .doutb_0(doutb_0),
        .enb_0(enb_0),
        .pci_exp_rxn(pci_exp_rxn),
        .pci_exp_rxp(pci_exp_rxp),
        .pci_exp_txn(pci_exp_txn),
        .pci_exp_txp(pci_exp_txp),
        .rstb_0(rstb_0),
        .sys_clk_clk_n(sys_clk_clk_n),
        .sys_clk_clk_p(sys_clk_clk_p),
        .sys_ddr_clk_n(sys_ddr_clk_n),
        .sys_ddr_clk_p(sys_ddr_clk_p),
        .sys_rst(sys_rst),
        .sys_rst_n(sys_rst_n),
        .web_0(web_0),
        .CLK(CLK));
endmodule
