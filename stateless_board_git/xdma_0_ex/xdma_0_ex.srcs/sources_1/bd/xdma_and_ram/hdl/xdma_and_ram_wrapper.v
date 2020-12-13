//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
//Date        : Fri Dec 11 13:52:44 2020
//Host        : DESKTOP-P8TPC4Q running 64-bit major release  (build 9200)
//Command     : generate_target xdma_and_ram_wrapper.bd
//Design      : xdma_and_ram_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module xdma_and_ram_wrapper
   (addrb,
    axi_aclk,
    axi_aresetn,
    c2h_dsc_byp_ctl,
    c2h_dsc_byp_dst_addr,
    c2h_dsc_byp_len,
    c2h_dsc_byp_load,
    c2h_dsc_byp_ready,
    c2h_dsc_byp_src_addr,
    dinb,
    doutb,
    enb,
    h2c_dsc_byp_ctl,
    h2c_dsc_byp_dst_addr,
    h2c_dsc_byp_len,
    h2c_dsc_byp_load,
    h2c_dsc_byp_ready,
    h2c_dsc_byp_src_addr,
    pci_exp_rxn,
    pci_exp_rxp,
    pci_exp_txn,
    pci_exp_txp,
    refclk_clk_n,
    refclk_clk_p,
    status_ports_c2h_sts0,
    status_ports_c2h_sts1,
    status_ports_h2c_sts0,
    status_ports_h2c_sts1,
    sys_rst_n,
    web);
  input [31:0]addrb;
  output axi_aclk;
  output axi_aresetn;
  input [15:0]c2h_dsc_byp_ctl;
  input [63:0]c2h_dsc_byp_dst_addr;
  input [27:0]c2h_dsc_byp_len;
  input c2h_dsc_byp_load;
  output c2h_dsc_byp_ready;
  input [63:0]c2h_dsc_byp_src_addr;
  input [63:0]dinb;
  output [63:0]doutb;
  input enb;
  input [15:0]h2c_dsc_byp_ctl;
  input [63:0]h2c_dsc_byp_dst_addr;
  input [27:0]h2c_dsc_byp_len;
  input h2c_dsc_byp_load;
  output h2c_dsc_byp_ready;
  input [63:0]h2c_dsc_byp_src_addr;
  input [7:0]pci_exp_rxn;
  input [7:0]pci_exp_rxp;
  output [7:0]pci_exp_txn;
  output [7:0]pci_exp_txp;
  input [0:0]refclk_clk_n;
  input [0:0]refclk_clk_p;
  output [7:0]status_ports_c2h_sts0;
  output [7:0]status_ports_c2h_sts1;
  output [7:0]status_ports_h2c_sts0;
  output [7:0]status_ports_h2c_sts1;
  input sys_rst_n;
  input [7:0]web;

  wire [31:0]addrb;
  wire axi_aclk;
  wire axi_aresetn;
  wire [15:0]c2h_dsc_byp_ctl;
  wire [63:0]c2h_dsc_byp_dst_addr;
  wire [27:0]c2h_dsc_byp_len;
  wire c2h_dsc_byp_load;
  wire c2h_dsc_byp_ready;
  wire [63:0]c2h_dsc_byp_src_addr;
  wire [63:0]dinb;
  wire [63:0]doutb;
  wire enb;
  wire [15:0]h2c_dsc_byp_ctl;
  wire [63:0]h2c_dsc_byp_dst_addr;
  wire [27:0]h2c_dsc_byp_len;
  wire h2c_dsc_byp_load;
  wire h2c_dsc_byp_ready;
  wire [63:0]h2c_dsc_byp_src_addr;
  wire [7:0]pci_exp_rxn;
  wire [7:0]pci_exp_rxp;
  wire [7:0]pci_exp_txn;
  wire [7:0]pci_exp_txp;
  wire [0:0]refclk_clk_n;
  wire [0:0]refclk_clk_p;
  wire [7:0]status_ports_c2h_sts0;
  wire [7:0]status_ports_c2h_sts1;
  wire [7:0]status_ports_h2c_sts0;
  wire [7:0]status_ports_h2c_sts1;
  wire sys_rst_n;
  wire [7:0]web;

  xdma_and_ram xdma_and_ram_i
       (.addrb(addrb),
        .axi_aclk(axi_aclk),
        .axi_aresetn(axi_aresetn),
        .c2h_dsc_byp_ctl(c2h_dsc_byp_ctl),
        .c2h_dsc_byp_dst_addr(c2h_dsc_byp_dst_addr),
        .c2h_dsc_byp_len(c2h_dsc_byp_len),
        .c2h_dsc_byp_load(c2h_dsc_byp_load),
        .c2h_dsc_byp_ready(c2h_dsc_byp_ready),
        .c2h_dsc_byp_src_addr(c2h_dsc_byp_src_addr),
        .dinb(dinb),
        .doutb(doutb),
        .enb(enb),
        .h2c_dsc_byp_ctl(h2c_dsc_byp_ctl),
        .h2c_dsc_byp_dst_addr(h2c_dsc_byp_dst_addr),
        .h2c_dsc_byp_len(h2c_dsc_byp_len),
        .h2c_dsc_byp_load(h2c_dsc_byp_load),
        .h2c_dsc_byp_ready(h2c_dsc_byp_ready),
        .h2c_dsc_byp_src_addr(h2c_dsc_byp_src_addr),
        .pci_exp_rxn(pci_exp_rxn),
        .pci_exp_rxp(pci_exp_rxp),
        .pci_exp_txn(pci_exp_txn),
        .pci_exp_txp(pci_exp_txp),
        .refclk_clk_n(refclk_clk_n),
        .refclk_clk_p(refclk_clk_p),
        .status_ports_c2h_sts0(status_ports_c2h_sts0),
        .status_ports_c2h_sts1(status_ports_c2h_sts1),
        .status_ports_h2c_sts0(status_ports_h2c_sts0),
        .status_ports_h2c_sts1(status_ports_h2c_sts1),
        .sys_rst_n(sys_rst_n),
        .web(web));
endmodule
