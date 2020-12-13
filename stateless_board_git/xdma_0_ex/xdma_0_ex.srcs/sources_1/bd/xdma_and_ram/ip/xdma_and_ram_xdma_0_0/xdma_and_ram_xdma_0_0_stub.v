// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Fri Dec 11 14:04:37 2020
// Host        : DESKTOP-P8TPC4Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/pcie_eth_10g/xdma_0_ex/xdma_0_ex.srcs/sources_1/bd/xdma_and_ram/ip/xdma_and_ram_xdma_0_0/xdma_and_ram_xdma_0_0_stub.v
// Design      : xdma_and_ram_xdma_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku040-ffva1156-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "xdma_and_ram_xdma_0_0_core_top,Vivado 2017.4" *)
module xdma_and_ram_xdma_0_0(sys_clk, sys_clk_gt, sys_rst_n, user_lnk_up, 
  pci_exp_txp, pci_exp_txn, pci_exp_rxp, pci_exp_rxn, axi_aclk, axi_aresetn, usr_irq_req, 
  usr_irq_ack, msi_enable, msi_vector_width, m_axi_awready, m_axi_wready, m_axi_bid, 
  m_axi_bresp, m_axi_bvalid, m_axi_arready, m_axi_rid, m_axi_rdata, m_axi_rresp, m_axi_rlast, 
  m_axi_rvalid, m_axi_awid, m_axi_awaddr, m_axi_awlen, m_axi_awsize, m_axi_awburst, 
  m_axi_awprot, m_axi_awvalid, m_axi_awlock, m_axi_awcache, m_axi_wdata, m_axi_wstrb, 
  m_axi_wlast, m_axi_wvalid, m_axi_bready, m_axi_arid, m_axi_araddr, m_axi_arlen, m_axi_arsize, 
  m_axi_arburst, m_axi_arprot, m_axi_arvalid, m_axi_arlock, m_axi_arcache, m_axi_rready, 
  c2h_dsc_byp_ready_0, c2h_dsc_byp_src_addr_0, c2h_dsc_byp_dst_addr_0, c2h_dsc_byp_len_0, 
  c2h_dsc_byp_ctl_0, c2h_dsc_byp_load_0, h2c_dsc_byp_ready_0, h2c_dsc_byp_src_addr_0, 
  h2c_dsc_byp_dst_addr_0, h2c_dsc_byp_len_0, h2c_dsc_byp_ctl_0, h2c_dsc_byp_load_0, 
  c2h_sts_0, h2c_sts_0, c2h_sts_1, h2c_sts_1, int_qpll1lock_out, int_qpll1outrefclk_out, 
  int_qpll1outclk_out)
/* synthesis syn_black_box black_box_pad_pin="sys_clk,sys_clk_gt,sys_rst_n,user_lnk_up,pci_exp_txp[7:0],pci_exp_txn[7:0],pci_exp_rxp[7:0],pci_exp_rxn[7:0],axi_aclk,axi_aresetn,usr_irq_req[0:0],usr_irq_ack[0:0],msi_enable,msi_vector_width[2:0],m_axi_awready,m_axi_wready,m_axi_bid[3:0],m_axi_bresp[1:0],m_axi_bvalid,m_axi_arready,m_axi_rid[3:0],m_axi_rdata[255:0],m_axi_rresp[1:0],m_axi_rlast,m_axi_rvalid,m_axi_awid[3:0],m_axi_awaddr[63:0],m_axi_awlen[7:0],m_axi_awsize[2:0],m_axi_awburst[1:0],m_axi_awprot[2:0],m_axi_awvalid,m_axi_awlock,m_axi_awcache[3:0],m_axi_wdata[255:0],m_axi_wstrb[31:0],m_axi_wlast,m_axi_wvalid,m_axi_bready,m_axi_arid[3:0],m_axi_araddr[63:0],m_axi_arlen[7:0],m_axi_arsize[2:0],m_axi_arburst[1:0],m_axi_arprot[2:0],m_axi_arvalid,m_axi_arlock,m_axi_arcache[3:0],m_axi_rready,c2h_dsc_byp_ready_0,c2h_dsc_byp_src_addr_0[63:0],c2h_dsc_byp_dst_addr_0[63:0],c2h_dsc_byp_len_0[27:0],c2h_dsc_byp_ctl_0[15:0],c2h_dsc_byp_load_0,h2c_dsc_byp_ready_0,h2c_dsc_byp_src_addr_0[63:0],h2c_dsc_byp_dst_addr_0[63:0],h2c_dsc_byp_len_0[27:0],h2c_dsc_byp_ctl_0[15:0],h2c_dsc_byp_load_0,c2h_sts_0[7:0],h2c_sts_0[7:0],c2h_sts_1[7:0],h2c_sts_1[7:0],int_qpll1lock_out[1:0],int_qpll1outrefclk_out[1:0],int_qpll1outclk_out[1:0]" */;
  input sys_clk;
  input sys_clk_gt;
  input sys_rst_n;
  output user_lnk_up;
  output [7:0]pci_exp_txp;
  output [7:0]pci_exp_txn;
  input [7:0]pci_exp_rxp;
  input [7:0]pci_exp_rxn;
  output axi_aclk;
  output axi_aresetn;
  input [0:0]usr_irq_req;
  output [0:0]usr_irq_ack;
  output msi_enable;
  output [2:0]msi_vector_width;
  input m_axi_awready;
  input m_axi_wready;
  input [3:0]m_axi_bid;
  input [1:0]m_axi_bresp;
  input m_axi_bvalid;
  input m_axi_arready;
  input [3:0]m_axi_rid;
  input [255:0]m_axi_rdata;
  input [1:0]m_axi_rresp;
  input m_axi_rlast;
  input m_axi_rvalid;
  output [3:0]m_axi_awid;
  output [63:0]m_axi_awaddr;
  output [7:0]m_axi_awlen;
  output [2:0]m_axi_awsize;
  output [1:0]m_axi_awburst;
  output [2:0]m_axi_awprot;
  output m_axi_awvalid;
  output m_axi_awlock;
  output [3:0]m_axi_awcache;
  output [255:0]m_axi_wdata;
  output [31:0]m_axi_wstrb;
  output m_axi_wlast;
  output m_axi_wvalid;
  output m_axi_bready;
  output [3:0]m_axi_arid;
  output [63:0]m_axi_araddr;
  output [7:0]m_axi_arlen;
  output [2:0]m_axi_arsize;
  output [1:0]m_axi_arburst;
  output [2:0]m_axi_arprot;
  output m_axi_arvalid;
  output m_axi_arlock;
  output [3:0]m_axi_arcache;
  output m_axi_rready;
  output c2h_dsc_byp_ready_0;
  input [63:0]c2h_dsc_byp_src_addr_0;
  input [63:0]c2h_dsc_byp_dst_addr_0;
  input [27:0]c2h_dsc_byp_len_0;
  input [15:0]c2h_dsc_byp_ctl_0;
  input c2h_dsc_byp_load_0;
  output h2c_dsc_byp_ready_0;
  input [63:0]h2c_dsc_byp_src_addr_0;
  input [63:0]h2c_dsc_byp_dst_addr_0;
  input [27:0]h2c_dsc_byp_len_0;
  input [15:0]h2c_dsc_byp_ctl_0;
  input h2c_dsc_byp_load_0;
  output [7:0]c2h_sts_0;
  output [7:0]h2c_sts_0;
  output [7:0]c2h_sts_1;
  output [7:0]h2c_sts_1;
  output [1:0]int_qpll1lock_out;
  output [1:0]int_qpll1outrefclk_out;
  output [1:0]int_qpll1outclk_out;
endmodule
