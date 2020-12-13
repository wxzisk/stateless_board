-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
-- Date        : Fri Dec 11 14:04:37 2020
-- Host        : DESKTOP-P8TPC4Q running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               D:/pcie_eth_10g/xdma_0_ex/xdma_0_ex.srcs/sources_1/bd/xdma_and_ram/ip/xdma_and_ram_xdma_0_0/xdma_and_ram_xdma_0_0_stub.vhdl
-- Design      : xdma_and_ram_xdma_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku040-ffva1156-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xdma_and_ram_xdma_0_0 is
  Port ( 
    sys_clk : in STD_LOGIC;
    sys_clk_gt : in STD_LOGIC;
    sys_rst_n : in STD_LOGIC;
    user_lnk_up : out STD_LOGIC;
    pci_exp_txp : out STD_LOGIC_VECTOR ( 7 downto 0 );
    pci_exp_txn : out STD_LOGIC_VECTOR ( 7 downto 0 );
    pci_exp_rxp : in STD_LOGIC_VECTOR ( 7 downto 0 );
    pci_exp_rxn : in STD_LOGIC_VECTOR ( 7 downto 0 );
    axi_aclk : out STD_LOGIC;
    axi_aresetn : out STD_LOGIC;
    usr_irq_req : in STD_LOGIC_VECTOR ( 0 to 0 );
    usr_irq_ack : out STD_LOGIC_VECTOR ( 0 to 0 );
    msi_enable : out STD_LOGIC;
    msi_vector_width : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awready : in STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 255 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_rvalid : in STD_LOGIC;
    m_axi_awid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awlock : out STD_LOGIC;
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wdata : out STD_LOGIC_VECTOR ( 255 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_wvalid : out STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_arid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arlock : out STD_LOGIC;
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_rready : out STD_LOGIC;
    c2h_dsc_byp_ready_0 : out STD_LOGIC;
    c2h_dsc_byp_src_addr_0 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    c2h_dsc_byp_dst_addr_0 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    c2h_dsc_byp_len_0 : in STD_LOGIC_VECTOR ( 27 downto 0 );
    c2h_dsc_byp_ctl_0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    c2h_dsc_byp_load_0 : in STD_LOGIC;
    h2c_dsc_byp_ready_0 : out STD_LOGIC;
    h2c_dsc_byp_src_addr_0 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    h2c_dsc_byp_dst_addr_0 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    h2c_dsc_byp_len_0 : in STD_LOGIC_VECTOR ( 27 downto 0 );
    h2c_dsc_byp_ctl_0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    h2c_dsc_byp_load_0 : in STD_LOGIC;
    c2h_sts_0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    h2c_sts_0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    c2h_sts_1 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    h2c_sts_1 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    int_qpll1lock_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    int_qpll1outrefclk_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    int_qpll1outclk_out : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );

end xdma_and_ram_xdma_0_0;

architecture stub of xdma_and_ram_xdma_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "sys_clk,sys_clk_gt,sys_rst_n,user_lnk_up,pci_exp_txp[7:0],pci_exp_txn[7:0],pci_exp_rxp[7:0],pci_exp_rxn[7:0],axi_aclk,axi_aresetn,usr_irq_req[0:0],usr_irq_ack[0:0],msi_enable,msi_vector_width[2:0],m_axi_awready,m_axi_wready,m_axi_bid[3:0],m_axi_bresp[1:0],m_axi_bvalid,m_axi_arready,m_axi_rid[3:0],m_axi_rdata[255:0],m_axi_rresp[1:0],m_axi_rlast,m_axi_rvalid,m_axi_awid[3:0],m_axi_awaddr[63:0],m_axi_awlen[7:0],m_axi_awsize[2:0],m_axi_awburst[1:0],m_axi_awprot[2:0],m_axi_awvalid,m_axi_awlock,m_axi_awcache[3:0],m_axi_wdata[255:0],m_axi_wstrb[31:0],m_axi_wlast,m_axi_wvalid,m_axi_bready,m_axi_arid[3:0],m_axi_araddr[63:0],m_axi_arlen[7:0],m_axi_arsize[2:0],m_axi_arburst[1:0],m_axi_arprot[2:0],m_axi_arvalid,m_axi_arlock,m_axi_arcache[3:0],m_axi_rready,c2h_dsc_byp_ready_0,c2h_dsc_byp_src_addr_0[63:0],c2h_dsc_byp_dst_addr_0[63:0],c2h_dsc_byp_len_0[27:0],c2h_dsc_byp_ctl_0[15:0],c2h_dsc_byp_load_0,h2c_dsc_byp_ready_0,h2c_dsc_byp_src_addr_0[63:0],h2c_dsc_byp_dst_addr_0[63:0],h2c_dsc_byp_len_0[27:0],h2c_dsc_byp_ctl_0[15:0],h2c_dsc_byp_load_0,c2h_sts_0[7:0],h2c_sts_0[7:0],c2h_sts_1[7:0],h2c_sts_1[7:0],int_qpll1lock_out[1:0],int_qpll1outrefclk_out[1:0],int_qpll1outclk_out[1:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "xdma_and_ram_xdma_0_0_core_top,Vivado 2017.4";
begin
end;
