//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
//Date        : Mon Jul  1 16:23:19 2019
//Host        : DESKTOP-E6QPMLO running 64-bit major release  (build 9200)
//Command     : generate_target PCIe_wrapper.bd
//Design      : PCIe_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module TOP
   (
    pci_exp_rxn,
    pci_exp_rxp,
    pci_exp_txn,
    pci_exp_txp,
    sys_clk_clk_n,
    sys_clk_clk_p,
    sys_ddr_clk_n,
    sys_ddr_clk_p,
    sys_rst,
    sys_rst_n,
    out_to_eth,
    CLK,
    FIFO_wr_en,
    FIFO_rd_en,
    throughput_rate_0,
    throughput_rate_1,
    throughput_rate_2,
    throughput_rate_3,
    throughput_rate_4,
    throughput_rate_5,
    throughput_rate_6,
    throughput_rate_7,
    throughput_rate_8,
    throughput_rate_9,
    throughput_rate_10,
    throughput_rate_11,
    throughput_rate_12,
    throughput_rate_13,
    throughput_rate_14
    
    
    );
  input [3:0]pci_exp_rxn;
  input [3:0]pci_exp_rxp;
  output [3:0]pci_exp_txn;
  output [3:0]pci_exp_txp;
  input [0:0]sys_clk_clk_n;
  input [0:0]sys_clk_clk_p;
  input sys_ddr_clk_n;
  input sys_ddr_clk_p;
  input sys_rst;
  input sys_rst_n;
  output [31:0] out_to_eth;
  output CLK;
  output FIFO_wr_en;
  output FIFO_rd_en;
  input [31:0] throughput_rate_0;
  input [31:0] throughput_rate_1;
  input [31:0] throughput_rate_2;
  input [31:0] throughput_rate_3;
  input [31:0] throughput_rate_4;
  input [31:0] throughput_rate_5;
  input [31:0] throughput_rate_6;
  input [31:0] throughput_rate_7;
  input [31:0] throughput_rate_8;
  input [31:0] throughput_rate_9;
  input [31:0] throughput_rate_10;
  input [31:0] throughput_rate_11;
  input [31:0] throughput_rate_12;
  input [31:0] throughput_rate_13;
  input [31:0] throughput_rate_14;
  
  (*DONT_TOUCH= "{TURE|FALSE}" *) wire [31:0]addrb_0; 
   wire [31:0]dinb_0;
//  (*DONT_TOUCH= "{TURE|FALSE}" *) wire  [31:0]doutb_0;
   (*DONT_TOUCH= "{TURE|FALSE}" *)wire enb_0;
   (*DONT_TOUCH= "{TURE|FALSE}" *)wire [3:0]web_0;

  wire [3:0]pci_exp_rxn;
  wire [3:0]pci_exp_rxp;
  wire [3:0]pci_exp_txn;
  wire [3:0]pci_exp_txp;
  wire [0:0]sys_clk_clk_n;
  wire [0:0]sys_clk_clk_p;
  wire sys_ddr_clk_n;
  wire sys_ddr_clk_p;
  wire sys_rst;
  wire sys_rst_n;
  
  wire clkb_0;
  (*DONT_TOUCH= "{TURE|FALSE}" *) wire rstb_0;
  
  reg [31:0] throughput_rate [14:0] ;
  
  assign FIFO_rd_en=web_0[0];
  assign FIFO_wr_en=~web_0[0];
  PCIe_wrapper PCIe_wrapper_i
       (.pci_exp_rxn(pci_exp_rxn),
        .pci_exp_rxp(pci_exp_rxp),
        .pci_exp_txn(pci_exp_txn),
        .pci_exp_txp(pci_exp_txp),
        .sys_clk_clk_n(sys_clk_clk_n),
        .sys_clk_clk_p(sys_clk_clk_p),
        .sys_ddr_clk_n(sys_ddr_clk_n),
        .sys_ddr_clk_p(sys_ddr_clk_p),
        .sys_rst(sys_rst),
        .sys_rst_n(sys_rst_n),
        .clkb_0(clkb_0),
        .addrb_0(addrb_0),
        .dinb_0(dinb_0),
        .doutb_0(out_to_eth),
        .enb_0(enb_0),
        .rstb_0(rstb_0),
        .web_0(web_0),
        .CLK(CLK)
        );
        
    ram_test u_ram_test(
        .clkb_0(clkb_0),
        .rstb_0(rstb_0),
        .addrb_0(addrb_0),
        .dinb_0(dinb_0),
        .enb_0(enb_0),
        .web_0(web_0)
            );
            
//always@(posedge clkb_0 or negedge sys_rst_n)
//begin
//    if(~sys_rst_n)
//        throughput_rate[0] <= 0;
//    else if(throughput_rate_0 != 0)
//        throughput_rate[0] <= throughput_rate_0;
//    else
//        throughput_rate[0]<=throughput_rate[0];
//end


    
endmodule
