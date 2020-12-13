// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Tue Mar 31 13:54:43 2020
// Host        : LAPTOP-AE792R7S running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               D:/pcie_eth_10g/ram_eth/ram_eth.srcs/sources_1/bd/bd_design/ip/bd_design_axi_bram_ctrl_0_0/bd_design_axi_bram_ctrl_0_0_sim_netlist.v
// Design      : bd_design_axi_bram_ctrl_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku040-ffva1156-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "bd_design_axi_bram_ctrl_0_0,axi_bram_ctrl,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "axi_bram_ctrl,Vivado 2017.4" *) 
(* NotValidForBitStream *)
module bd_design_axi_bram_ctrl_0_0
   (s_axi_aclk,
    s_axi_aresetn,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    bram_rst_a,
    bram_clk_a,
    bram_en_a,
    bram_we_a,
    bram_addr_a,
    bram_wrdata_a,
    bram_rddata_a);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 CLKIF CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME CLKIF, ASSOCIATED_BUSIF S_AXI:S_AXI_CTRL, ASSOCIATED_RESET s_axi_aresetn, FREQ_HZ 250000000, PHASE 0.000, CLK_DOMAIN bd_design_xdma_0_0_axi_aclk" *) input s_axi_aclk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 RSTIF RST" *) (* x_interface_parameter = "XIL_INTERFACENAME RSTIF, POLARITY ACTIVE_LOW" *) input s_axi_aresetn;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWADDR" *) (* x_interface_parameter = "XIL_INTERFACENAME S_AXI, DATA_WIDTH 64, PROTOCOL AXI4, FREQ_HZ 250000000, ID_WIDTH 0, ADDR_WIDTH 13, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 32, NUM_WRITE_OUTSTANDING 16, MAX_BURST_LENGTH 256, PHASE 0.000, CLK_DOMAIN bd_design_xdma_0_0_axi_aclk, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0" *) input [12:0]s_axi_awaddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWLEN" *) input [7:0]s_axi_awlen;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWSIZE" *) input [2:0]s_axi_awsize;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWBURST" *) input [1:0]s_axi_awburst;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWLOCK" *) input s_axi_awlock;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWCACHE" *) input [3:0]s_axi_awcache;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWPROT" *) input [2:0]s_axi_awprot;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWVALID" *) input s_axi_awvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWREADY" *) output s_axi_awready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WDATA" *) input [63:0]s_axi_wdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WSTRB" *) input [7:0]s_axi_wstrb;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WLAST" *) input s_axi_wlast;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WVALID" *) input s_axi_wvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WREADY" *) output s_axi_wready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI BRESP" *) output [1:0]s_axi_bresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI BVALID" *) output s_axi_bvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI BREADY" *) input s_axi_bready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARADDR" *) input [12:0]s_axi_araddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARLEN" *) input [7:0]s_axi_arlen;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARSIZE" *) input [2:0]s_axi_arsize;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARBURST" *) input [1:0]s_axi_arburst;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARLOCK" *) input s_axi_arlock;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARCACHE" *) input [3:0]s_axi_arcache;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARPROT" *) input [2:0]s_axi_arprot;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARVALID" *) input s_axi_arvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARREADY" *) output s_axi_arready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) output [63:0]s_axi_rdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RRESP" *) output [1:0]s_axi_rresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RLAST" *) output s_axi_rlast;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RVALID" *) output s_axi_rvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RREADY" *) input s_axi_rready;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA RST" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MASTER_TYPE BRAM_CTRL, MEM_SIZE 8192, MEM_WIDTH 64, MEM_ECC NONE, READ_WRITE_MODE READ_WRITE" *) output bram_rst_a;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) output bram_clk_a;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) output bram_en_a;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) output [7:0]bram_we_a;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) output [12:0]bram_addr_a;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) output [63:0]bram_wrdata_a;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) input [63:0]bram_rddata_a;

  wire [12:0]bram_addr_a;
  wire bram_clk_a;
  wire bram_en_a;
  wire [63:0]bram_rddata_a;
  wire bram_rst_a;
  wire [7:0]bram_we_a;
  wire [63:0]bram_wrdata_a;
  wire s_axi_aclk;
  wire [12:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire [3:0]s_axi_arcache;
  wire s_axi_aresetn;
  wire [7:0]s_axi_arlen;
  wire s_axi_arlock;
  wire [2:0]s_axi_arprot;
  wire s_axi_arready;
  wire [2:0]s_axi_arsize;
  wire s_axi_arvalid;
  wire [12:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [3:0]s_axi_awcache;
  wire [7:0]s_axi_awlen;
  wire s_axi_awlock;
  wire [2:0]s_axi_awprot;
  wire s_axi_awready;
  wire [2:0]s_axi_awsize;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire [1:0]s_axi_bresp;
  wire s_axi_bvalid;
  wire [63:0]s_axi_rdata;
  wire s_axi_rlast;
  wire s_axi_rready;
  wire [1:0]s_axi_rresp;
  wire s_axi_rvalid;
  wire [63:0]s_axi_wdata;
  wire s_axi_wlast;
  wire s_axi_wready;
  wire [7:0]s_axi_wstrb;
  wire s_axi_wvalid;
  wire NLW_U0_bram_clk_b_UNCONNECTED;
  wire NLW_U0_bram_en_b_UNCONNECTED;
  wire NLW_U0_bram_rst_b_UNCONNECTED;
  wire NLW_U0_ecc_interrupt_UNCONNECTED;
  wire NLW_U0_ecc_ue_UNCONNECTED;
  wire NLW_U0_s_axi_ctrl_arready_UNCONNECTED;
  wire NLW_U0_s_axi_ctrl_awready_UNCONNECTED;
  wire NLW_U0_s_axi_ctrl_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_ctrl_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_ctrl_wready_UNCONNECTED;
  wire [12:0]NLW_U0_bram_addr_b_UNCONNECTED;
  wire [7:0]NLW_U0_bram_we_b_UNCONNECTED;
  wire [63:0]NLW_U0_bram_wrdata_b_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_ctrl_bresp_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_ctrl_rdata_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_ctrl_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;

  (* C_BRAM_ADDR_WIDTH = "10" *) 
  (* C_BRAM_INST_MODE = "EXTERNAL" *) 
  (* C_ECC = "0" *) 
  (* C_ECC_ONOFF_RESET_VALUE = "0" *) 
  (* C_ECC_TYPE = "0" *) 
  (* C_FAMILY = "kintexu" *) 
  (* C_FAULT_INJECT = "0" *) 
  (* C_MEMORY_DEPTH = "1024" *) 
  (* C_SELECT_XPM = "1" *) 
  (* C_SINGLE_PORT_BRAM = "1" *) 
  (* C_S_AXI_ADDR_WIDTH = "13" *) 
  (* C_S_AXI_CTRL_ADDR_WIDTH = "32" *) 
  (* C_S_AXI_CTRL_DATA_WIDTH = "32" *) 
  (* C_S_AXI_DATA_WIDTH = "64" *) 
  (* C_S_AXI_ID_WIDTH = "1" *) 
  (* C_S_AXI_PROTOCOL = "AXI4" *) 
  (* C_S_AXI_SUPPORTS_NARROW_BURST = "0" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  bd_design_axi_bram_ctrl_0_0_axi_bram_ctrl U0
       (.bram_addr_a(bram_addr_a),
        .bram_addr_b(NLW_U0_bram_addr_b_UNCONNECTED[12:0]),
        .bram_clk_a(bram_clk_a),
        .bram_clk_b(NLW_U0_bram_clk_b_UNCONNECTED),
        .bram_en_a(bram_en_a),
        .bram_en_b(NLW_U0_bram_en_b_UNCONNECTED),
        .bram_rddata_a(bram_rddata_a),
        .bram_rddata_b({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .bram_rst_a(bram_rst_a),
        .bram_rst_b(NLW_U0_bram_rst_b_UNCONNECTED),
        .bram_we_a(bram_we_a),
        .bram_we_b(NLW_U0_bram_we_b_UNCONNECTED[7:0]),
        .bram_wrdata_a(bram_wrdata_a),
        .bram_wrdata_b(NLW_U0_bram_wrdata_b_UNCONNECTED[63:0]),
        .ecc_interrupt(NLW_U0_ecc_interrupt_UNCONNECTED),
        .ecc_ue(NLW_U0_ecc_ue_UNCONNECTED),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arburst(s_axi_arburst),
        .s_axi_arcache(s_axi_arcache),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arid(1'b0),
        .s_axi_arlen(s_axi_arlen),
        .s_axi_arlock(s_axi_arlock),
        .s_axi_arprot(s_axi_arprot),
        .s_axi_arready(s_axi_arready),
        .s_axi_arsize(s_axi_arsize),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awburst(s_axi_awburst),
        .s_axi_awcache(s_axi_awcache),
        .s_axi_awid(1'b0),
        .s_axi_awlen(s_axi_awlen),
        .s_axi_awlock(s_axi_awlock),
        .s_axi_awprot(s_axi_awprot),
        .s_axi_awready(s_axi_awready),
        .s_axi_awsize(s_axi_awsize),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(s_axi_bready),
        .s_axi_bresp(s_axi_bresp),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_ctrl_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_ctrl_arready(NLW_U0_s_axi_ctrl_arready_UNCONNECTED),
        .s_axi_ctrl_arvalid(1'b0),
        .s_axi_ctrl_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_ctrl_awready(NLW_U0_s_axi_ctrl_awready_UNCONNECTED),
        .s_axi_ctrl_awvalid(1'b0),
        .s_axi_ctrl_bready(1'b0),
        .s_axi_ctrl_bresp(NLW_U0_s_axi_ctrl_bresp_UNCONNECTED[1:0]),
        .s_axi_ctrl_bvalid(NLW_U0_s_axi_ctrl_bvalid_UNCONNECTED),
        .s_axi_ctrl_rdata(NLW_U0_s_axi_ctrl_rdata_UNCONNECTED[31:0]),
        .s_axi_ctrl_rready(1'b0),
        .s_axi_ctrl_rresp(NLW_U0_s_axi_ctrl_rresp_UNCONNECTED[1:0]),
        .s_axi_ctrl_rvalid(NLW_U0_s_axi_ctrl_rvalid_UNCONNECTED),
        .s_axi_ctrl_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_ctrl_wready(NLW_U0_s_axi_ctrl_wready_UNCONNECTED),
        .s_axi_ctrl_wvalid(1'b0),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(s_axi_rlast),
        .s_axi_rready(s_axi_rready),
        .s_axi_rresp(s_axi_rresp),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wlast(s_axi_wlast),
        .s_axi_wready(s_axi_wready),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wvalid(s_axi_wvalid));
endmodule

(* ORIG_REF_NAME = "SRL_FIFO" *) 
module bd_design_axi_bram_ctrl_0_0_SRL_FIFO
   (bid_gets_fifo_load,
    bvalid_cnt_inc,
    \axi_bid_int_reg[0] ,
    SR,
    s_axi_aclk,
    s_axi_awid,
    p_1_out,
    aw_active_d1_reg,
    aw_active_re,
    axi_bvalid_int_reg,
    s_axi_bready,
    bid_gets_fifo_load_d1,
    Q,
    s_axi_wvalid,
    s_axi_wlast,
    axi_wdata_full_reg,
    axi_wr_burst,
    \bvalid_cnt_reg[2] ,
    s_axi_bid);
  output bid_gets_fifo_load;
  output bvalid_cnt_inc;
  output \axi_bid_int_reg[0] ;
  input [0:0]SR;
  input s_axi_aclk;
  input [0:0]s_axi_awid;
  input p_1_out;
  input aw_active_d1_reg;
  input aw_active_re;
  input axi_bvalid_int_reg;
  input s_axi_bready;
  input bid_gets_fifo_load_d1;
  input [1:0]Q;
  input s_axi_wvalid;
  input s_axi_wlast;
  input axi_wdata_full_reg;
  input axi_wr_burst;
  input [2:0]\bvalid_cnt_reg[2] ;
  input [0:0]s_axi_bid;

  wire \Addr_Counters[0].FDRE_I_n_0 ;
  wire \Addr_Counters[1].FDRE_I_n_0 ;
  wire \Addr_Counters[2].FDRE_I_n_0 ;
  wire \Addr_Counters[3].FDRE_I_n_0 ;
  wire \Addr_Counters[3].XORCY_I_i_1_n_0 ;
  wire CI;
  wire D;
  wire Data_Exists_DFF_i_2_n_0;
  wire Data_Exists_DFF_i_3_n_0;
  wire \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.clr_bram_we_i_2_n_0 ;
  wire \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.clr_bram_we_i_3_n_0 ;
  wire [1:0]Q;
  wire S;
  wire S0_out;
  wire S1_out;
  wire [0:0]SR;
  wire addr_cy_1;
  wire addr_cy_2;
  wire addr_cy_3;
  wire aw_active_d1_reg;
  wire aw_active_re;
  wire \axi_bid_int[0]_i_2_n_0 ;
  wire \axi_bid_int[0]_i_3_n_0 ;
  wire \axi_bid_int_reg[0] ;
  wire axi_bvalid_int_reg;
  wire axi_wdata_full_reg;
  wire axi_wr_burst;
  wire bid_fifo_not_empty;
  wire bid_fifo_rd;
  wire bid_gets_fifo_load;
  wire bid_gets_fifo_load_d1;
  wire bid_gets_fifo_load_d1_i_2_n_0;
  wire bvalid_cnt_inc;
  wire [2:0]\bvalid_cnt_reg[2] ;
  wire p_1_out;
  wire s_axi_aclk;
  wire [0:0]s_axi_awid;
  wire [0:0]s_axi_bid;
  wire s_axi_bready;
  wire s_axi_wlast;
  wire s_axi_wvalid;
  wire sum_A_0;
  wire sum_A_1;
  wire sum_A_2;
  wire sum_A_3;
  wire [7:3]\NLW_Addr_Counters[0].MUXCY_L_I_CARRY4_CARRY8_CO_UNCONNECTED ;
  wire [7:3]\NLW_Addr_Counters[0].MUXCY_L_I_CARRY4_CARRY8_DI_UNCONNECTED ;
  wire [7:4]\NLW_Addr_Counters[0].MUXCY_L_I_CARRY4_CARRY8_O_UNCONNECTED ;
  wire [7:4]\NLW_Addr_Counters[0].MUXCY_L_I_CARRY4_CARRY8_S_UNCONNECTED ;

  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \Addr_Counters[0].FDRE_I 
       (.C(s_axi_aclk),
        .CE(bid_fifo_not_empty),
        .D(sum_A_3),
        .Q(\Addr_Counters[0].FDRE_I_n_0 ),
        .R(SR));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "(CARRY4)" *) 
  (* XILINX_TRANSFORM_PINMAP = "LO:O" *) 
  CARRY8 \Addr_Counters[0].MUXCY_L_I_CARRY4_CARRY8 
       (.CI(CI),
        .CI_TOP(1'b0),
        .CO({\NLW_Addr_Counters[0].MUXCY_L_I_CARRY4_CARRY8_CO_UNCONNECTED [7:3],addr_cy_1,addr_cy_2,addr_cy_3}),
        .DI({\NLW_Addr_Counters[0].MUXCY_L_I_CARRY4_CARRY8_DI_UNCONNECTED [7:3],\Addr_Counters[2].FDRE_I_n_0 ,\Addr_Counters[1].FDRE_I_n_0 ,\Addr_Counters[0].FDRE_I_n_0 }),
        .O({\NLW_Addr_Counters[0].MUXCY_L_I_CARRY4_CARRY8_O_UNCONNECTED [7:4],sum_A_0,sum_A_1,sum_A_2,sum_A_3}),
        .S({\NLW_Addr_Counters[0].MUXCY_L_I_CARRY4_CARRY8_S_UNCONNECTED [7:4],\Addr_Counters[3].XORCY_I_i_1_n_0 ,S0_out,S1_out,S}));
  LUT6 #(
    .INIT(64'h55555554AAAAAAAA)) 
    \Addr_Counters[0].MUXCY_L_I_i_1 
       (.I0(\Addr_Counters[0].FDRE_I_n_0 ),
        .I1(\Addr_Counters[2].FDRE_I_n_0 ),
        .I2(\Addr_Counters[1].FDRE_I_n_0 ),
        .I3(\Addr_Counters[3].FDRE_I_n_0 ),
        .I4(aw_active_re),
        .I5(\axi_bid_int[0]_i_2_n_0 ),
        .O(S));
  LUT6 #(
    .INIT(64'h8AAAAAAAAAAAAAAA)) 
    \Addr_Counters[0].MUXCY_L_I_i_2 
       (.I0(aw_active_re),
        .I1(\axi_bid_int[0]_i_2_n_0 ),
        .I2(\Addr_Counters[2].FDRE_I_n_0 ),
        .I3(\Addr_Counters[3].FDRE_I_n_0 ),
        .I4(\Addr_Counters[0].FDRE_I_n_0 ),
        .I5(\Addr_Counters[1].FDRE_I_n_0 ),
        .O(CI));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \Addr_Counters[1].FDRE_I 
       (.C(s_axi_aclk),
        .CE(bid_fifo_not_empty),
        .D(sum_A_2),
        .Q(\Addr_Counters[1].FDRE_I_n_0 ),
        .R(SR));
  LUT6 #(
    .INIT(64'h55555554AAAAAAAA)) 
    \Addr_Counters[1].MUXCY_L_I_i_1 
       (.I0(\Addr_Counters[1].FDRE_I_n_0 ),
        .I1(\Addr_Counters[0].FDRE_I_n_0 ),
        .I2(\Addr_Counters[2].FDRE_I_n_0 ),
        .I3(\Addr_Counters[3].FDRE_I_n_0 ),
        .I4(aw_active_re),
        .I5(\axi_bid_int[0]_i_2_n_0 ),
        .O(S1_out));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \Addr_Counters[2].FDRE_I 
       (.C(s_axi_aclk),
        .CE(bid_fifo_not_empty),
        .D(sum_A_1),
        .Q(\Addr_Counters[2].FDRE_I_n_0 ),
        .R(SR));
  LUT6 #(
    .INIT(64'h55555554AAAAAAAA)) 
    \Addr_Counters[2].MUXCY_L_I_i_1 
       (.I0(\Addr_Counters[2].FDRE_I_n_0 ),
        .I1(\Addr_Counters[0].FDRE_I_n_0 ),
        .I2(\Addr_Counters[1].FDRE_I_n_0 ),
        .I3(\Addr_Counters[3].FDRE_I_n_0 ),
        .I4(aw_active_re),
        .I5(\axi_bid_int[0]_i_2_n_0 ),
        .O(S0_out));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \Addr_Counters[3].FDRE_I 
       (.C(s_axi_aclk),
        .CE(bid_fifo_not_empty),
        .D(sum_A_0),
        .Q(\Addr_Counters[3].FDRE_I_n_0 ),
        .R(SR));
  LUT6 #(
    .INIT(64'h55555554AAAAAAAA)) 
    \Addr_Counters[3].XORCY_I_i_1 
       (.I0(\Addr_Counters[3].FDRE_I_n_0 ),
        .I1(\Addr_Counters[0].FDRE_I_n_0 ),
        .I2(\Addr_Counters[2].FDRE_I_n_0 ),
        .I3(\Addr_Counters[1].FDRE_I_n_0 ),
        .I4(aw_active_re),
        .I5(\axi_bid_int[0]_i_2_n_0 ),
        .O(\Addr_Counters[3].XORCY_I_i_1_n_0 ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    Data_Exists_DFF
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D),
        .Q(bid_fifo_not_empty),
        .R(SR));
  LUT5 #(
    .INIT(32'hFFF40404)) 
    Data_Exists_DFF_i_1
       (.I0(aw_active_d1_reg),
        .I1(p_1_out),
        .I2(Data_Exists_DFF_i_2_n_0),
        .I3(Data_Exists_DFF_i_3_n_0),
        .I4(bid_fifo_not_empty),
        .O(D));
  LUT4 #(
    .INIT(16'hFFFE)) 
    Data_Exists_DFF_i_2
       (.I0(\Addr_Counters[0].FDRE_I_n_0 ),
        .I1(\Addr_Counters[2].FDRE_I_n_0 ),
        .I2(\Addr_Counters[1].FDRE_I_n_0 ),
        .I3(\Addr_Counters[3].FDRE_I_n_0 ),
        .O(Data_Exists_DFF_i_2_n_0));
  LUT5 #(
    .INIT(32'h15150055)) 
    Data_Exists_DFF_i_3
       (.I0(bid_gets_fifo_load_d1),
        .I1(s_axi_bready),
        .I2(axi_bvalid_int_reg),
        .I3(bvalid_cnt_inc),
        .I4(\axi_bid_int[0]_i_3_n_0 ),
        .O(Data_Exists_DFF_i_3_n_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* srl_bus_name = "U0/\gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_WR_CHNL/BID_FIFO/FIFO_RAM " *) 
  (* srl_name = "U0/\gext_inst.abcv4_0_ext_inst/GEN_AXI4.I_FULL_AXI/I_WR_CHNL/BID_FIFO/FIFO_RAM[0].SRL16E_I " *) 
  SRL16E #(
    .INIT(16'h0000),
    .IS_CLK_INVERTED(1'b0)) 
    \FIFO_RAM[0].SRL16E_I 
       (.A0(\Addr_Counters[0].FDRE_I_n_0 ),
        .A1(\Addr_Counters[1].FDRE_I_n_0 ),
        .A2(\Addr_Counters[2].FDRE_I_n_0 ),
        .A3(\Addr_Counters[3].FDRE_I_n_0 ),
        .CE(CI),
        .CLK(s_axi_aclk),
        .D(s_axi_awid),
        .Q(bid_fifo_rd));
  LUT6 #(
    .INIT(64'h0F02020202020202)) 
    \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.clr_bram_we_i_1 
       (.I0(\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.clr_bram_we_i_2_n_0 ),
        .I1(\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.clr_bram_we_i_3_n_0 ),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(s_axi_wvalid),
        .I5(s_axi_wlast),
        .O(bvalid_cnt_inc));
  LUT4 #(
    .INIT(16'h4440)) 
    \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.clr_bram_we_i_2 
       (.I0(Q[1]),
        .I1(p_1_out),
        .I2(axi_wdata_full_reg),
        .I3(s_axi_wvalid),
        .O(\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.clr_bram_we_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h8B)) 
    \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.clr_bram_we_i_3 
       (.I0(axi_wr_burst),
        .I1(axi_wdata_full_reg),
        .I2(s_axi_wlast),
        .O(\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.clr_bram_we_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hAACFAAC0)) 
    \axi_bid_int[0]_i_1 
       (.I0(s_axi_awid),
        .I1(bid_fifo_rd),
        .I2(\axi_bid_int[0]_i_2_n_0 ),
        .I3(bid_gets_fifo_load),
        .I4(s_axi_bid),
        .O(\axi_bid_int_reg[0] ));
  LUT6 #(
    .INIT(64'hAAAAAAAAA8202020)) 
    \axi_bid_int[0]_i_2 
       (.I0(bid_fifo_not_empty),
        .I1(\axi_bid_int[0]_i_3_n_0 ),
        .I2(bvalid_cnt_inc),
        .I3(axi_bvalid_int_reg),
        .I4(s_axi_bready),
        .I5(bid_gets_fifo_load_d1),
        .O(\axi_bid_int[0]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \axi_bid_int[0]_i_3 
       (.I0(\bvalid_cnt_reg[2] [2]),
        .I1(\bvalid_cnt_reg[2] [0]),
        .I2(\bvalid_cnt_reg[2] [1]),
        .O(\axi_bid_int[0]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h2000)) 
    bid_gets_fifo_load_d1_i_1
       (.I0(p_1_out),
        .I1(aw_active_d1_reg),
        .I2(bvalid_cnt_inc),
        .I3(bid_gets_fifo_load_d1_i_2_n_0),
        .O(bid_gets_fifo_load));
  LUT6 #(
    .INIT(64'h00000000000800FF)) 
    bid_gets_fifo_load_d1_i_2
       (.I0(s_axi_bready),
        .I1(axi_bvalid_int_reg),
        .I2(bid_fifo_not_empty),
        .I3(\bvalid_cnt_reg[2] [1]),
        .I4(\bvalid_cnt_reg[2] [0]),
        .I5(\bvalid_cnt_reg[2] [2]),
        .O(bid_gets_fifo_load_d1_i_2_n_0));
endmodule

(* C_BRAM_ADDR_WIDTH = "10" *) (* C_BRAM_INST_MODE = "EXTERNAL" *) (* C_ECC = "0" *) 
(* C_ECC_ONOFF_RESET_VALUE = "0" *) (* C_ECC_TYPE = "0" *) (* C_FAMILY = "kintexu" *) 
(* C_FAULT_INJECT = "0" *) (* C_MEMORY_DEPTH = "1024" *) (* C_SELECT_XPM = "1" *) 
(* C_SINGLE_PORT_BRAM = "1" *) (* C_S_AXI_ADDR_WIDTH = "13" *) (* C_S_AXI_CTRL_ADDR_WIDTH = "32" *) 
(* C_S_AXI_CTRL_DATA_WIDTH = "32" *) (* C_S_AXI_DATA_WIDTH = "64" *) (* C_S_AXI_ID_WIDTH = "1" *) 
(* C_S_AXI_PROTOCOL = "AXI4" *) (* C_S_AXI_SUPPORTS_NARROW_BURST = "0" *) (* ORIG_REF_NAME = "axi_bram_ctrl" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module bd_design_axi_bram_ctrl_0_0_axi_bram_ctrl
   (s_axi_aclk,
    s_axi_aresetn,
    ecc_interrupt,
    ecc_ue,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    s_axi_ctrl_awvalid,
    s_axi_ctrl_awready,
    s_axi_ctrl_awaddr,
    s_axi_ctrl_wdata,
    s_axi_ctrl_wvalid,
    s_axi_ctrl_wready,
    s_axi_ctrl_bresp,
    s_axi_ctrl_bvalid,
    s_axi_ctrl_bready,
    s_axi_ctrl_araddr,
    s_axi_ctrl_arvalid,
    s_axi_ctrl_arready,
    s_axi_ctrl_rdata,
    s_axi_ctrl_rresp,
    s_axi_ctrl_rvalid,
    s_axi_ctrl_rready,
    bram_rst_a,
    bram_clk_a,
    bram_en_a,
    bram_we_a,
    bram_addr_a,
    bram_wrdata_a,
    bram_rddata_a,
    bram_rst_b,
    bram_clk_b,
    bram_en_b,
    bram_we_b,
    bram_addr_b,
    bram_wrdata_b,
    bram_rddata_b);
  input s_axi_aclk;
  input s_axi_aresetn;
  output ecc_interrupt;
  output ecc_ue;
  input [0:0]s_axi_awid;
  input [12:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input s_axi_awlock;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input s_axi_awvalid;
  output s_axi_awready;
  input [63:0]s_axi_wdata;
  input [7:0]s_axi_wstrb;
  input s_axi_wlast;
  input s_axi_wvalid;
  output s_axi_wready;
  output [0:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [0:0]s_axi_arid;
  input [12:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input s_axi_arlock;
  input [3:0]s_axi_arcache;
  input [2:0]s_axi_arprot;
  input s_axi_arvalid;
  output s_axi_arready;
  output [0:0]s_axi_rid;
  output [63:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output s_axi_rvalid;
  input s_axi_rready;
  input s_axi_ctrl_awvalid;
  output s_axi_ctrl_awready;
  input [31:0]s_axi_ctrl_awaddr;
  input [31:0]s_axi_ctrl_wdata;
  input s_axi_ctrl_wvalid;
  output s_axi_ctrl_wready;
  output [1:0]s_axi_ctrl_bresp;
  output s_axi_ctrl_bvalid;
  input s_axi_ctrl_bready;
  input [31:0]s_axi_ctrl_araddr;
  input s_axi_ctrl_arvalid;
  output s_axi_ctrl_arready;
  output [31:0]s_axi_ctrl_rdata;
  output [1:0]s_axi_ctrl_rresp;
  output s_axi_ctrl_rvalid;
  input s_axi_ctrl_rready;
  output bram_rst_a;
  output bram_clk_a;
  output bram_en_a;
  output [7:0]bram_we_a;
  output [12:0]bram_addr_a;
  output [63:0]bram_wrdata_a;
  input [63:0]bram_rddata_a;
  output bram_rst_b;
  output bram_clk_b;
  output bram_en_b;
  output [7:0]bram_we_b;
  output [12:0]bram_addr_b;
  output [63:0]bram_wrdata_b;
  input [63:0]bram_rddata_b;

  wire \<const0> ;
  wire [12:3]\^bram_addr_a ;
  wire bram_en_a;
  wire [63:0]bram_rddata_a;
  wire bram_rst_a;
  wire [7:0]bram_we_a;
  wire [63:0]bram_wrdata_a;
  wire s_axi_aclk;
  wire [12:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire s_axi_aresetn;
  wire [0:0]s_axi_arid;
  wire [7:0]s_axi_arlen;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [12:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [0:0]s_axi_awid;
  wire [7:0]s_axi_awlen;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire [0:0]s_axi_bid;
  wire s_axi_bready;
  wire s_axi_bvalid;
  wire [63:0]s_axi_rdata;
  wire [0:0]s_axi_rid;
  wire s_axi_rlast;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire [63:0]s_axi_wdata;
  wire s_axi_wlast;
  wire s_axi_wready;
  wire [7:0]s_axi_wstrb;
  wire s_axi_wvalid;

  assign bram_addr_a[12:3] = \^bram_addr_a [12:3];
  assign bram_addr_a[2] = \<const0> ;
  assign bram_addr_a[1] = \<const0> ;
  assign bram_addr_a[0] = \<const0> ;
  assign bram_addr_b[12] = \<const0> ;
  assign bram_addr_b[11] = \<const0> ;
  assign bram_addr_b[10] = \<const0> ;
  assign bram_addr_b[9] = \<const0> ;
  assign bram_addr_b[8] = \<const0> ;
  assign bram_addr_b[7] = \<const0> ;
  assign bram_addr_b[6] = \<const0> ;
  assign bram_addr_b[5] = \<const0> ;
  assign bram_addr_b[4] = \<const0> ;
  assign bram_addr_b[3] = \<const0> ;
  assign bram_addr_b[2] = \<const0> ;
  assign bram_addr_b[1] = \<const0> ;
  assign bram_addr_b[0] = \<const0> ;
  assign bram_clk_a = s_axi_aclk;
  assign bram_clk_b = \<const0> ;
  assign bram_en_b = \<const0> ;
  assign bram_rst_b = \<const0> ;
  assign bram_we_b[7] = \<const0> ;
  assign bram_we_b[6] = \<const0> ;
  assign bram_we_b[5] = \<const0> ;
  assign bram_we_b[4] = \<const0> ;
  assign bram_we_b[3] = \<const0> ;
  assign bram_we_b[2] = \<const0> ;
  assign bram_we_b[1] = \<const0> ;
  assign bram_we_b[0] = \<const0> ;
  assign bram_wrdata_b[63] = \<const0> ;
  assign bram_wrdata_b[62] = \<const0> ;
  assign bram_wrdata_b[61] = \<const0> ;
  assign bram_wrdata_b[60] = \<const0> ;
  assign bram_wrdata_b[59] = \<const0> ;
  assign bram_wrdata_b[58] = \<const0> ;
  assign bram_wrdata_b[57] = \<const0> ;
  assign bram_wrdata_b[56] = \<const0> ;
  assign bram_wrdata_b[55] = \<const0> ;
  assign bram_wrdata_b[54] = \<const0> ;
  assign bram_wrdata_b[53] = \<const0> ;
  assign bram_wrdata_b[52] = \<const0> ;
  assign bram_wrdata_b[51] = \<const0> ;
  assign bram_wrdata_b[50] = \<const0> ;
  assign bram_wrdata_b[49] = \<const0> ;
  assign bram_wrdata_b[48] = \<const0> ;
  assign bram_wrdata_b[47] = \<const0> ;
  assign bram_wrdata_b[46] = \<const0> ;
  assign bram_wrdata_b[45] = \<const0> ;
  assign bram_wrdata_b[44] = \<const0> ;
  assign bram_wrdata_b[43] = \<const0> ;
  assign bram_wrdata_b[42] = \<const0> ;
  assign bram_wrdata_b[41] = \<const0> ;
  assign bram_wrdata_b[40] = \<const0> ;
  assign bram_wrdata_b[39] = \<const0> ;
  assign bram_wrdata_b[38] = \<const0> ;
  assign bram_wrdata_b[37] = \<const0> ;
  assign bram_wrdata_b[36] = \<const0> ;
  assign bram_wrdata_b[35] = \<const0> ;
  assign bram_wrdata_b[34] = \<const0> ;
  assign bram_wrdata_b[33] = \<const0> ;
  assign bram_wrdata_b[32] = \<const0> ;
  assign bram_wrdata_b[31] = \<const0> ;
  assign bram_wrdata_b[30] = \<const0> ;
  assign bram_wrdata_b[29] = \<const0> ;
  assign bram_wrdata_b[28] = \<const0> ;
  assign bram_wrdata_b[27] = \<const0> ;
  assign bram_wrdata_b[26] = \<const0> ;
  assign bram_wrdata_b[25] = \<const0> ;
  assign bram_wrdata_b[24] = \<const0> ;
  assign bram_wrdata_b[23] = \<const0> ;
  assign bram_wrdata_b[22] = \<const0> ;
  assign bram_wrdata_b[21] = \<const0> ;
  assign bram_wrdata_b[20] = \<const0> ;
  assign bram_wrdata_b[19] = \<const0> ;
  assign bram_wrdata_b[18] = \<const0> ;
  assign bram_wrdata_b[17] = \<const0> ;
  assign bram_wrdata_b[16] = \<const0> ;
  assign bram_wrdata_b[15] = \<const0> ;
  assign bram_wrdata_b[14] = \<const0> ;
  assign bram_wrdata_b[13] = \<const0> ;
  assign bram_wrdata_b[12] = \<const0> ;
  assign bram_wrdata_b[11] = \<const0> ;
  assign bram_wrdata_b[10] = \<const0> ;
  assign bram_wrdata_b[9] = \<const0> ;
  assign bram_wrdata_b[8] = \<const0> ;
  assign bram_wrdata_b[7] = \<const0> ;
  assign bram_wrdata_b[6] = \<const0> ;
  assign bram_wrdata_b[5] = \<const0> ;
  assign bram_wrdata_b[4] = \<const0> ;
  assign bram_wrdata_b[3] = \<const0> ;
  assign bram_wrdata_b[2] = \<const0> ;
  assign bram_wrdata_b[1] = \<const0> ;
  assign bram_wrdata_b[0] = \<const0> ;
  assign ecc_interrupt = \<const0> ;
  assign ecc_ue = \<const0> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_ctrl_arready = \<const0> ;
  assign s_axi_ctrl_awready = \<const0> ;
  assign s_axi_ctrl_bresp[1] = \<const0> ;
  assign s_axi_ctrl_bresp[0] = \<const0> ;
  assign s_axi_ctrl_bvalid = \<const0> ;
  assign s_axi_ctrl_rdata[31] = \<const0> ;
  assign s_axi_ctrl_rdata[30] = \<const0> ;
  assign s_axi_ctrl_rdata[29] = \<const0> ;
  assign s_axi_ctrl_rdata[28] = \<const0> ;
  assign s_axi_ctrl_rdata[27] = \<const0> ;
  assign s_axi_ctrl_rdata[26] = \<const0> ;
  assign s_axi_ctrl_rdata[25] = \<const0> ;
  assign s_axi_ctrl_rdata[24] = \<const0> ;
  assign s_axi_ctrl_rdata[23] = \<const0> ;
  assign s_axi_ctrl_rdata[22] = \<const0> ;
  assign s_axi_ctrl_rdata[21] = \<const0> ;
  assign s_axi_ctrl_rdata[20] = \<const0> ;
  assign s_axi_ctrl_rdata[19] = \<const0> ;
  assign s_axi_ctrl_rdata[18] = \<const0> ;
  assign s_axi_ctrl_rdata[17] = \<const0> ;
  assign s_axi_ctrl_rdata[16] = \<const0> ;
  assign s_axi_ctrl_rdata[15] = \<const0> ;
  assign s_axi_ctrl_rdata[14] = \<const0> ;
  assign s_axi_ctrl_rdata[13] = \<const0> ;
  assign s_axi_ctrl_rdata[12] = \<const0> ;
  assign s_axi_ctrl_rdata[11] = \<const0> ;
  assign s_axi_ctrl_rdata[10] = \<const0> ;
  assign s_axi_ctrl_rdata[9] = \<const0> ;
  assign s_axi_ctrl_rdata[8] = \<const0> ;
  assign s_axi_ctrl_rdata[7] = \<const0> ;
  assign s_axi_ctrl_rdata[6] = \<const0> ;
  assign s_axi_ctrl_rdata[5] = \<const0> ;
  assign s_axi_ctrl_rdata[4] = \<const0> ;
  assign s_axi_ctrl_rdata[3] = \<const0> ;
  assign s_axi_ctrl_rdata[2] = \<const0> ;
  assign s_axi_ctrl_rdata[1] = \<const0> ;
  assign s_axi_ctrl_rdata[0] = \<const0> ;
  assign s_axi_ctrl_rresp[1] = \<const0> ;
  assign s_axi_ctrl_rresp[0] = \<const0> ;
  assign s_axi_ctrl_rvalid = \<const0> ;
  assign s_axi_ctrl_wready = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  bd_design_axi_bram_ctrl_0_0_axi_bram_ctrl_top \gext_inst.abcv4_0_ext_inst 
       (.SR(bram_rst_a),
        .bram_addr_a(\^bram_addr_a ),
        .bram_en_a(bram_en_a),
        .bram_rddata_a(bram_rddata_a),
        .bram_we_a(bram_we_a),
        .bram_wrdata_a(bram_wrdata_a),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr[12:3]),
        .s_axi_arburst(s_axi_arburst),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arid(s_axi_arid),
        .s_axi_arlen(s_axi_arlen),
        .s_axi_arready(s_axi_arready),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr[12:3]),
        .s_axi_awburst(s_axi_awburst),
        .s_axi_awid(s_axi_awid),
        .s_axi_awlen(s_axi_awlen[3:0]),
        .s_axi_awready(s_axi_awready),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bid(s_axi_bid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rid(s_axi_rid),
        .s_axi_rlast(s_axi_rlast),
        .s_axi_rready(s_axi_rready),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wlast(s_axi_wlast),
        .s_axi_wready(s_axi_wready),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wvalid(s_axi_wvalid));
endmodule

(* ORIG_REF_NAME = "axi_bram_ctrl_top" *) 
module bd_design_axi_bram_ctrl_0_0_axi_bram_ctrl_top
   (SR,
    s_axi_rvalid,
    s_axi_rlast,
    bram_addr_a,
    bram_wrdata_a,
    s_axi_rdata,
    s_axi_awready,
    s_axi_arready,
    s_axi_bvalid,
    bram_we_a,
    bram_en_a,
    s_axi_bid,
    s_axi_rid,
    s_axi_wready,
    s_axi_wvalid,
    s_axi_arlen,
    s_axi_awburst,
    s_axi_arburst,
    s_axi_awlen,
    s_axi_aclk,
    s_axi_awid,
    s_axi_rready,
    s_axi_wdata,
    s_axi_arid,
    bram_rddata_a,
    s_axi_wstrb,
    s_axi_aresetn,
    s_axi_araddr,
    s_axi_wlast,
    s_axi_bready,
    s_axi_awaddr,
    s_axi_arvalid,
    s_axi_awvalid);
  output [0:0]SR;
  output s_axi_rvalid;
  output s_axi_rlast;
  output [9:0]bram_addr_a;
  output [63:0]bram_wrdata_a;
  output [63:0]s_axi_rdata;
  output s_axi_awready;
  output s_axi_arready;
  output s_axi_bvalid;
  output [7:0]bram_we_a;
  output bram_en_a;
  output [0:0]s_axi_bid;
  output [0:0]s_axi_rid;
  output s_axi_wready;
  input s_axi_wvalid;
  input [7:0]s_axi_arlen;
  input [1:0]s_axi_awburst;
  input [1:0]s_axi_arburst;
  input [3:0]s_axi_awlen;
  input s_axi_aclk;
  input [0:0]s_axi_awid;
  input s_axi_rready;
  input [63:0]s_axi_wdata;
  input [0:0]s_axi_arid;
  input [63:0]bram_rddata_a;
  input [7:0]s_axi_wstrb;
  input s_axi_aresetn;
  input [9:0]s_axi_araddr;
  input s_axi_wlast;
  input s_axi_bready;
  input [9:0]s_axi_awaddr;
  input s_axi_arvalid;
  input s_axi_awvalid;

  wire [0:0]SR;
  wire [9:0]bram_addr_a;
  wire bram_en_a;
  wire [63:0]bram_rddata_a;
  wire [7:0]bram_we_a;
  wire [63:0]bram_wrdata_a;
  wire s_axi_aclk;
  wire [9:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire s_axi_aresetn;
  wire [0:0]s_axi_arid;
  wire [7:0]s_axi_arlen;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [9:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [0:0]s_axi_awid;
  wire [3:0]s_axi_awlen;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire [0:0]s_axi_bid;
  wire s_axi_bready;
  wire s_axi_bvalid;
  wire [63:0]s_axi_rdata;
  wire [0:0]s_axi_rid;
  wire s_axi_rlast;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire [63:0]s_axi_wdata;
  wire s_axi_wlast;
  wire s_axi_wready;
  wire [7:0]s_axi_wstrb;
  wire s_axi_wvalid;

  bd_design_axi_bram_ctrl_0_0_full_axi \GEN_AXI4.I_FULL_AXI 
       (.SR(SR),
        .bram_addr_a(bram_addr_a),
        .bram_en_a(bram_en_a),
        .bram_rddata_a(bram_rddata_a),
        .bram_we_a(bram_we_a),
        .bram_wrdata_a(bram_wrdata_a),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arburst(s_axi_arburst),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arid(s_axi_arid),
        .s_axi_arlen(s_axi_arlen),
        .s_axi_arready(s_axi_arready),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awburst(s_axi_awburst),
        .s_axi_awid(s_axi_awid),
        .s_axi_awlen(s_axi_awlen),
        .s_axi_awready(s_axi_awready),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bid(s_axi_bid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rid(s_axi_rid),
        .s_axi_rlast(s_axi_rlast),
        .s_axi_rready(s_axi_rready),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wlast(s_axi_wlast),
        .s_axi_wready(s_axi_wready),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wvalid(s_axi_wvalid));
endmodule

(* ORIG_REF_NAME = "full_axi" *) 
module bd_design_axi_bram_ctrl_0_0_full_axi
   (SR,
    s_axi_rvalid,
    s_axi_rlast,
    bram_addr_a,
    bram_wrdata_a,
    s_axi_rdata,
    s_axi_awready,
    s_axi_arready,
    s_axi_bvalid,
    bram_we_a,
    bram_en_a,
    s_axi_bid,
    s_axi_rid,
    s_axi_wready,
    s_axi_wvalid,
    s_axi_arlen,
    s_axi_awburst,
    s_axi_arburst,
    s_axi_awlen,
    s_axi_aclk,
    s_axi_awid,
    s_axi_rready,
    s_axi_wdata,
    s_axi_arid,
    bram_rddata_a,
    s_axi_wstrb,
    s_axi_aresetn,
    s_axi_araddr,
    s_axi_wlast,
    s_axi_bready,
    s_axi_awaddr,
    s_axi_arvalid,
    s_axi_awvalid);
  output [0:0]SR;
  output s_axi_rvalid;
  output s_axi_rlast;
  output [9:0]bram_addr_a;
  output [63:0]bram_wrdata_a;
  output [63:0]s_axi_rdata;
  output s_axi_awready;
  output s_axi_arready;
  output s_axi_bvalid;
  output [7:0]bram_we_a;
  output bram_en_a;
  output [0:0]s_axi_bid;
  output [0:0]s_axi_rid;
  output s_axi_wready;
  input s_axi_wvalid;
  input [7:0]s_axi_arlen;
  input [1:0]s_axi_awburst;
  input [1:0]s_axi_arburst;
  input [3:0]s_axi_awlen;
  input s_axi_aclk;
  input [0:0]s_axi_awid;
  input s_axi_rready;
  input [63:0]s_axi_wdata;
  input [0:0]s_axi_arid;
  input [63:0]bram_rddata_a;
  input [7:0]s_axi_wstrb;
  input s_axi_aresetn;
  input [9:0]s_axi_araddr;
  input s_axi_wlast;
  input s_axi_bready;
  input [9:0]s_axi_awaddr;
  input s_axi_arvalid;
  input s_axi_awvalid;

  wire \ADDR_SNG_PORT.bram_addr_int[10]_i_2_n_0 ;
  wire \ADDR_SNG_PORT.bram_addr_int[11]_i_6_n_0 ;
  wire \ADDR_SNG_PORT.bram_addr_int[12]_i_1_n_0 ;
  wire \ADDR_SNG_PORT.bram_addr_int[5]_i_2_n_0 ;
  wire \ADDR_SNG_PORT.bram_addr_int[6]_i_2_n_0 ;
  wire \ADDR_SNG_PORT.bram_addr_int[8]_i_2_n_0 ;
  wire \ADDR_SNG_PORT.bram_addr_int[9]_i_2_n_0 ;
  wire \GEN_ARB.I_SNG_PORT_n_4 ;
  wire \GEN_ARB.I_SNG_PORT_n_6 ;
  wire I_RD_CHNL_n_70;
  wire I_RD_CHNL_n_71;
  wire I_RD_CHNL_n_72;
  wire I_RD_CHNL_n_73;
  wire I_RD_CHNL_n_74;
  wire I_RD_CHNL_n_75;
  wire I_RD_CHNL_n_76;
  wire I_RD_CHNL_n_77;
  wire I_RD_CHNL_n_80;
  wire I_RD_CHNL_n_81;
  wire I_RD_CHNL_n_82;
  wire I_RD_CHNL_n_83;
  wire I_RD_CHNL_n_84;
  wire I_WR_CHNL_n_70;
  wire I_WR_CHNL_n_71;
  wire I_WR_CHNL_n_81;
  wire I_WR_CHNL_n_82;
  wire I_WR_CHNL_n_83;
  wire [9:9]RdChnl_BRAM_Addr_Ld;
  wire [0:0]SR;
  wire WrChnl_BRAM_Addr_Rst;
  wire ar_active_d1;
  wire ar_active_re;
  wire aw_active_d1;
  wire aw_active_re;
  wire [9:0]bram_addr_a;
  wire bram_en_a;
  wire [63:0]bram_rddata_a;
  wire [7:0]bram_we_a;
  wire [7:0]bram_we_int;
  wire [63:0]bram_wrdata_a;
  wire curr_fixed_burst_reg;
  wire p_0_out;
  wire [8:0]p_1_in;
  wire p_1_out;
  wire p_7_in;
  wire s_axi_aclk;
  wire [9:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire s_axi_aresetn;
  wire [0:0]s_axi_arid;
  wire [7:0]s_axi_arlen;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [9:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [0:0]s_axi_awid;
  wire [3:0]s_axi_awlen;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire [0:0]s_axi_bid;
  wire s_axi_bready;
  wire s_axi_bvalid;
  wire [63:0]s_axi_rdata;
  wire [0:0]s_axi_rid;
  wire s_axi_rlast;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire [63:0]s_axi_wdata;
  wire s_axi_wlast;
  wire s_axi_wready;
  wire [7:0]s_axi_wstrb;
  wire s_axi_wvalid;
  wire sng_bram_addr_ld_en;

  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \ADDR_SNG_PORT.bram_addr_int[10]_i_2 
       (.I0(bram_addr_a[6]),
        .I1(I_RD_CHNL_n_80),
        .I2(bram_addr_a[4]),
        .I3(bram_addr_a[5]),
        .O(\ADDR_SNG_PORT.bram_addr_int[10]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \ADDR_SNG_PORT.bram_addr_int[11]_i_6 
       (.I0(bram_addr_a[7]),
        .I1(bram_addr_a[5]),
        .I2(bram_addr_a[4]),
        .I3(I_RD_CHNL_n_80),
        .I4(bram_addr_a[6]),
        .O(\ADDR_SNG_PORT.bram_addr_int[11]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EEE222E2)) 
    \ADDR_SNG_PORT.bram_addr_int[12]_i_1 
       (.I0(bram_addr_a[9]),
        .I1(sng_bram_addr_ld_en),
        .I2(p_1_in[8]),
        .I3(p_0_out),
        .I4(RdChnl_BRAM_Addr_Ld),
        .I5(WrChnl_BRAM_Addr_Rst),
        .O(\ADDR_SNG_PORT.bram_addr_int[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \ADDR_SNG_PORT.bram_addr_int[5]_i_2 
       (.I0(bram_addr_a[0]),
        .I1(bram_addr_a[1]),
        .O(\ADDR_SNG_PORT.bram_addr_int[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \ADDR_SNG_PORT.bram_addr_int[6]_i_2 
       (.I0(bram_addr_a[0]),
        .I1(bram_addr_a[1]),
        .I2(bram_addr_a[2]),
        .I3(bram_addr_a[3]),
        .O(\ADDR_SNG_PORT.bram_addr_int[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \ADDR_SNG_PORT.bram_addr_int[8]_i_2 
       (.I0(bram_addr_a[3]),
        .I1(bram_addr_a[2]),
        .I2(bram_addr_a[1]),
        .I3(bram_addr_a[0]),
        .I4(bram_addr_a[4]),
        .I5(bram_addr_a[5]),
        .O(\ADDR_SNG_PORT.bram_addr_int[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \ADDR_SNG_PORT.bram_addr_int[9]_i_2 
       (.I0(bram_addr_a[5]),
        .I1(bram_addr_a[4]),
        .I2(bram_addr_a[0]),
        .I3(bram_addr_a[1]),
        .I4(bram_addr_a[2]),
        .I5(bram_addr_a[3]),
        .O(\ADDR_SNG_PORT.bram_addr_int[9]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ADDR_SNG_PORT.bram_addr_int_reg[10] 
       (.C(s_axi_aclk),
        .CE(I_RD_CHNL_n_81),
        .D(I_RD_CHNL_n_71),
        .Q(bram_addr_a[7]),
        .R(WrChnl_BRAM_Addr_Rst));
  FDRE #(
    .INIT(1'b0)) 
    \ADDR_SNG_PORT.bram_addr_int_reg[11] 
       (.C(s_axi_aclk),
        .CE(I_RD_CHNL_n_81),
        .D(I_RD_CHNL_n_70),
        .Q(bram_addr_a[8]),
        .R(WrChnl_BRAM_Addr_Rst));
  FDRE #(
    .INIT(1'b0)) 
    \ADDR_SNG_PORT.bram_addr_int_reg[12] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\ADDR_SNG_PORT.bram_addr_int[12]_i_1_n_0 ),
        .Q(bram_addr_a[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ADDR_SNG_PORT.bram_addr_int_reg[3] 
       (.C(s_axi_aclk),
        .CE(I_RD_CHNL_n_81),
        .D(\GEN_ARB.I_SNG_PORT_n_4 ),
        .Q(bram_addr_a[0]),
        .R(WrChnl_BRAM_Addr_Rst));
  FDRE #(
    .INIT(1'b0)) 
    \ADDR_SNG_PORT.bram_addr_int_reg[4] 
       (.C(s_axi_aclk),
        .CE(I_RD_CHNL_n_81),
        .D(I_RD_CHNL_n_77),
        .Q(bram_addr_a[1]),
        .R(WrChnl_BRAM_Addr_Rst));
  FDRE #(
    .INIT(1'b0)) 
    \ADDR_SNG_PORT.bram_addr_int_reg[5] 
       (.C(s_axi_aclk),
        .CE(I_RD_CHNL_n_81),
        .D(I_RD_CHNL_n_76),
        .Q(bram_addr_a[2]),
        .R(WrChnl_BRAM_Addr_Rst));
  FDRE #(
    .INIT(1'b0)) 
    \ADDR_SNG_PORT.bram_addr_int_reg[6] 
       (.C(s_axi_aclk),
        .CE(I_RD_CHNL_n_81),
        .D(I_RD_CHNL_n_75),
        .Q(bram_addr_a[3]),
        .R(WrChnl_BRAM_Addr_Rst));
  FDRE #(
    .INIT(1'b0)) 
    \ADDR_SNG_PORT.bram_addr_int_reg[7] 
       (.C(s_axi_aclk),
        .CE(I_RD_CHNL_n_81),
        .D(I_RD_CHNL_n_74),
        .Q(bram_addr_a[4]),
        .R(WrChnl_BRAM_Addr_Rst));
  FDRE #(
    .INIT(1'b0)) 
    \ADDR_SNG_PORT.bram_addr_int_reg[8] 
       (.C(s_axi_aclk),
        .CE(I_RD_CHNL_n_81),
        .D(I_RD_CHNL_n_73),
        .Q(bram_addr_a[5]),
        .R(WrChnl_BRAM_Addr_Rst));
  FDRE #(
    .INIT(1'b0)) 
    \ADDR_SNG_PORT.bram_addr_int_reg[9] 
       (.C(s_axi_aclk),
        .CE(I_RD_CHNL_n_81),
        .D(I_RD_CHNL_n_72),
        .Q(bram_addr_a[6]),
        .R(WrChnl_BRAM_Addr_Rst));
  bd_design_axi_bram_ctrl_0_0_sng_port_arb \GEN_ARB.I_SNG_PORT 
       (.BRAM_Addr_A(bram_addr_a[0]),
        .D(\GEN_ARB.I_SNG_PORT_n_4 ),
        .\FSM_sequential_rd_data_sm_cs_reg[3] (I_RD_CHNL_n_82),
        .\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[0] (I_WR_CHNL_n_82),
        .Q(bram_we_int),
        .SR(SR),
        .act_rd_burst_reg(\GEN_ARB.I_SNG_PORT_n_6 ),
        .ar_active_d1(ar_active_d1),
        .ar_active_re(ar_active_re),
        .aw_active_d1(aw_active_d1),
        .aw_active_d1_reg(I_WR_CHNL_n_81),
        .aw_active_re(aw_active_re),
        .axi_rlast_int_reg(I_RD_CHNL_n_84),
        .axi_rlast_int_reg_0(s_axi_rlast),
        .bram_we_a(bram_we_a),
        .\bvalid_cnt_reg[0] (I_WR_CHNL_n_83),
        .p_0_out(p_0_out),
        .p_1_out(p_1_out),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr[0]),
        .s_axi_arlen(s_axi_arlen[3:0]),
        .\s_axi_arlen[6] (I_RD_CHNL_n_83),
        .s_axi_arready(s_axi_arready),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr[0]),
        .s_axi_awready(s_axi_awready),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_rready(s_axi_rready),
        .sng_bram_addr_ld_en(sng_bram_addr_ld_en));
  bd_design_axi_bram_ctrl_0_0_rd_chnl I_RD_CHNL
       (.\ADDR_SNG_PORT.bram_addr_int_reg[10] (\ADDR_SNG_PORT.bram_addr_int[11]_i_6_n_0 ),
        .\ADDR_SNG_PORT.bram_addr_int_reg[3] (I_RD_CHNL_n_82),
        .\ADDR_SNG_PORT.bram_addr_int_reg[3]_0 (\ADDR_SNG_PORT.bram_addr_int[5]_i_2_n_0 ),
        .\ADDR_SNG_PORT.bram_addr_int_reg[3]_1 (\ADDR_SNG_PORT.bram_addr_int[6]_i_2_n_0 ),
        .\ADDR_SNG_PORT.bram_addr_int_reg[6] (\ADDR_SNG_PORT.bram_addr_int[8]_i_2_n_0 ),
        .\ADDR_SNG_PORT.bram_addr_int_reg[7] (I_RD_CHNL_n_80),
        .\ADDR_SNG_PORT.bram_addr_int_reg[8] (\ADDR_SNG_PORT.bram_addr_int[9]_i_2_n_0 ),
        .\ADDR_SNG_PORT.bram_addr_int_reg[9] (\ADDR_SNG_PORT.bram_addr_int[10]_i_2_n_0 ),
        .D({I_RD_CHNL_n_70,I_RD_CHNL_n_71,I_RD_CHNL_n_72,I_RD_CHNL_n_73,I_RD_CHNL_n_74,I_RD_CHNL_n_75,I_RD_CHNL_n_76,I_RD_CHNL_n_77}),
        .E(I_RD_CHNL_n_81),
        .\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[1] (I_WR_CHNL_n_70),
        .Q({bram_addr_a[8:6],bram_addr_a[4:0]}),
        .SR(SR),
        .ar_active_d1(ar_active_d1),
        .ar_active_re(ar_active_re),
        .ar_active_reg(I_RD_CHNL_n_84),
        .ar_active_reg_0(\GEN_ARB.I_SNG_PORT_n_6 ),
        .axi_rd_burst_reg_0(I_RD_CHNL_n_83),
        .bram_rddata_a(bram_rddata_a),
        .curr_fixed_burst_reg(curr_fixed_burst_reg),
        .curr_wrap_burst_reg_reg_0(I_WR_CHNL_n_71),
        .p_0_out(p_0_out),
        .p_7_in(p_7_in),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr[9:1]),
        .s_axi_arburst(s_axi_arburst),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arid(s_axi_arid),
        .s_axi_arlen(s_axi_arlen),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rid(s_axi_rid),
        .s_axi_rlast(s_axi_rlast),
        .s_axi_rready(s_axi_rready),
        .s_axi_rvalid(s_axi_rvalid),
        .\save_init_bram_addr_ld_reg[11] (p_1_in[7:0]),
        .\save_init_bram_addr_ld_reg[12] (RdChnl_BRAM_Addr_Ld),
        .sng_bram_addr_ld_en(sng_bram_addr_ld_en));
  bd_design_axi_bram_ctrl_0_0_wr_chnl I_WR_CHNL
       (.\ADDR_SNG_PORT.bram_addr_int_reg[11] (I_WR_CHNL_n_70),
        .\ADDR_SNG_PORT.bram_addr_int_reg[11]_0 (I_WR_CHNL_n_71),
        .\ADDR_SNG_PORT.bram_addr_int_reg[6] (I_RD_CHNL_n_80),
        .D(p_1_in),
        .Q(bram_addr_a[2:0]),
        .SR(SR),
        .WrChnl_BRAM_Addr_Rst(WrChnl_BRAM_Addr_Rst),
        .aw_active_d1(aw_active_d1),
        .aw_active_re(aw_active_re),
        .aw_active_reg(I_WR_CHNL_n_82),
        .aw_active_reg_0(I_WR_CHNL_n_83),
        .bram_en_a(bram_en_a),
        .\bram_we_a[7] (bram_we_int),
        .bram_wrdata_a(bram_wrdata_a),
        .curr_fixed_burst_reg(curr_fixed_burst_reg),
        .p_1_out(p_1_out),
        .p_7_in(p_7_in),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_awaddr(s_axi_awaddr[9:1]),
        .s_axi_awburst(s_axi_awburst),
        .s_axi_awid(s_axi_awid),
        .s_axi_awlen(s_axi_awlen),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bid(s_axi_bid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wlast(s_axi_wlast),
        .s_axi_wready(s_axi_wready),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wvalid(s_axi_wvalid),
        .\save_init_bram_addr_ld_reg[12] (I_WR_CHNL_n_81));
endmodule

(* ORIG_REF_NAME = "rd_chnl" *) 
module bd_design_axi_bram_ctrl_0_0_rd_chnl
   (ar_active_d1,
    SR,
    s_axi_rdata,
    s_axi_rvalid,
    s_axi_rlast,
    s_axi_rid,
    p_7_in,
    D,
    \save_init_bram_addr_ld_reg[12] ,
    sng_bram_addr_ld_en,
    \ADDR_SNG_PORT.bram_addr_int_reg[7] ,
    E,
    \ADDR_SNG_PORT.bram_addr_int_reg[3] ,
    axi_rd_burst_reg_0,
    ar_active_reg,
    p_0_out,
    s_axi_aclk,
    ar_active_re,
    s_axi_arid,
    s_axi_arlen,
    s_axi_arburst,
    s_axi_aresetn,
    Q,
    \save_init_bram_addr_ld_reg[11] ,
    s_axi_araddr,
    \ADDR_SNG_PORT.bram_addr_int_reg[3]_0 ,
    \ADDR_SNG_PORT.bram_addr_int_reg[3]_1 ,
    \ADDR_SNG_PORT.bram_addr_int_reg[6] ,
    \ADDR_SNG_PORT.bram_addr_int_reg[8] ,
    \ADDR_SNG_PORT.bram_addr_int_reg[9] ,
    \ADDR_SNG_PORT.bram_addr_int_reg[10] ,
    curr_fixed_burst_reg,
    \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[1] ,
    curr_wrap_burst_reg_reg_0,
    s_axi_rready,
    bram_rddata_a,
    ar_active_reg_0);
  output ar_active_d1;
  output [0:0]SR;
  output [63:0]s_axi_rdata;
  output s_axi_rvalid;
  output s_axi_rlast;
  output [0:0]s_axi_rid;
  output p_7_in;
  output [7:0]D;
  output [0:0]\save_init_bram_addr_ld_reg[12] ;
  output sng_bram_addr_ld_en;
  output \ADDR_SNG_PORT.bram_addr_int_reg[7] ;
  output [0:0]E;
  output \ADDR_SNG_PORT.bram_addr_int_reg[3] ;
  output axi_rd_burst_reg_0;
  output ar_active_reg;
  input p_0_out;
  input s_axi_aclk;
  input ar_active_re;
  input [0:0]s_axi_arid;
  input [7:0]s_axi_arlen;
  input [1:0]s_axi_arburst;
  input s_axi_aresetn;
  input [7:0]Q;
  input [7:0]\save_init_bram_addr_ld_reg[11] ;
  input [8:0]s_axi_araddr;
  input \ADDR_SNG_PORT.bram_addr_int_reg[3]_0 ;
  input \ADDR_SNG_PORT.bram_addr_int_reg[3]_1 ;
  input \ADDR_SNG_PORT.bram_addr_int_reg[6] ;
  input \ADDR_SNG_PORT.bram_addr_int_reg[8] ;
  input \ADDR_SNG_PORT.bram_addr_int_reg[9] ;
  input \ADDR_SNG_PORT.bram_addr_int_reg[10] ;
  input curr_fixed_burst_reg;
  input \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[1] ;
  input curr_wrap_burst_reg_reg_0;
  input s_axi_rready;
  input [63:0]bram_rddata_a;
  input ar_active_reg_0;

  wire \/FSM_sequential_rlast_sm_cs[0]_i_1_n_0 ;
  wire \/FSM_sequential_rlast_sm_cs[1]_i_1_n_0 ;
  wire \/FSM_sequential_rlast_sm_cs[1]_i_2_n_0 ;
  wire \/i__n_0 ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[10] ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[3] ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[3]_0 ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[3]_1 ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[6] ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[7] ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[8] ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[9] ;
  wire [7:0]D;
  wire [0:0]E;
  wire \FSM_sequential_rd_data_sm_cs[0]_i_1_n_0 ;
  wire \FSM_sequential_rd_data_sm_cs[0]_i_2_n_0 ;
  wire \FSM_sequential_rd_data_sm_cs[0]_i_3_n_0 ;
  wire \FSM_sequential_rd_data_sm_cs[1]_i_1_n_0 ;
  wire \FSM_sequential_rd_data_sm_cs[1]_i_2_n_0 ;
  wire \FSM_sequential_rd_data_sm_cs[1]_i_3_n_0 ;
  wire \FSM_sequential_rd_data_sm_cs[2]_i_1_n_0 ;
  wire \FSM_sequential_rd_data_sm_cs[2]_i_2_n_0 ;
  wire \FSM_sequential_rd_data_sm_cs[2]_i_3_n_0 ;
  wire \FSM_sequential_rd_data_sm_cs[3]_i_1_n_0 ;
  wire \FSM_sequential_rd_data_sm_cs[3]_i_2_n_0 ;
  wire \FSM_sequential_rd_data_sm_cs[3]_i_3_n_0 ;
  wire \FSM_sequential_rd_data_sm_cs[3]_i_4_n_0 ;
  wire \FSM_sequential_rd_data_sm_cs[3]_i_5_n_0 ;
  wire \FSM_sequential_rlast_sm_cs[2]_i_1_n_0 ;
  wire \GEN_BRST_MAX_WO_NARROW.brst_cnt_max_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[0].axi_rdata_int[0]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[10].axi_rdata_int[10]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[11].axi_rdata_int[11]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[12].axi_rdata_int[12]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[13].axi_rdata_int[13]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[14].axi_rdata_int[14]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[15].axi_rdata_int[15]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[16].axi_rdata_int[16]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[17].axi_rdata_int[17]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[18].axi_rdata_int[18]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[19].axi_rdata_int[19]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[1].axi_rdata_int[1]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[20].axi_rdata_int[20]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[21].axi_rdata_int[21]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[22].axi_rdata_int[22]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[23].axi_rdata_int[23]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[24].axi_rdata_int[24]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[25].axi_rdata_int[25]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[26].axi_rdata_int[26]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[27].axi_rdata_int[27]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[28].axi_rdata_int[28]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[29].axi_rdata_int[29]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[2].axi_rdata_int[2]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[30].axi_rdata_int[30]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[32].axi_rdata_int[32]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[33].axi_rdata_int[33]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[34].axi_rdata_int[34]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[35].axi_rdata_int[35]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[36].axi_rdata_int[36]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[37].axi_rdata_int[37]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[38].axi_rdata_int[38]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[39].axi_rdata_int[39]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[3].axi_rdata_int[3]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[40].axi_rdata_int[40]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[41].axi_rdata_int[41]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[42].axi_rdata_int[42]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[43].axi_rdata_int[43]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[44].axi_rdata_int[44]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[45].axi_rdata_int[45]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[46].axi_rdata_int[46]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[47].axi_rdata_int[47]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[48].axi_rdata_int[48]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[49].axi_rdata_int[49]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[4].axi_rdata_int[4]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[50].axi_rdata_int[50]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[51].axi_rdata_int[51]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[52].axi_rdata_int[52]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[53].axi_rdata_int[53]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[54].axi_rdata_int[54]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[55].axi_rdata_int[55]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[56].axi_rdata_int[56]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[57].axi_rdata_int[57]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[58].axi_rdata_int[58]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[59].axi_rdata_int[59]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[5].axi_rdata_int[5]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[60].axi_rdata_int[60]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[61].axi_rdata_int[61]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[62].axi_rdata_int[62]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[6].axi_rdata_int[6]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[7].axi_rdata_int[7]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[8].axi_rdata_int[8]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[9].axi_rdata_int[9]_i_1_n_0 ;
  wire \GEN_RID_SNG.axi_rid_int[0]_i_2_n_0 ;
  wire \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[1] ;
  wire I_WRAP_BRST_n_9;
  wire [7:0]Q;
  wire [0:0]SR;
  wire act_rd_burst;
  wire act_rd_burst0;
  wire act_rd_burst_i_1_n_0;
  wire act_rd_burst_set;
  wire act_rd_burst_two;
  wire act_rd_burst_two_i_3_n_0;
  wire act_rd_burst_two_i_4_n_0;
  wire ar_active_d1;
  wire ar_active_re;
  wire ar_active_reg;
  wire ar_active_reg_0;
  wire axi_rd_burst;
  wire axi_rd_burst0;
  wire axi_rd_burst_i_1_n_0;
  wire axi_rd_burst_reg_0;
  wire axi_rd_burst_two;
  wire axi_rd_burst_two_i_2_n_0;
  wire axi_rd_burst_two_reg_n_0;
  wire axi_rdata_en;
  wire axi_rid_temp;
  wire axi_rlast_int_i_1_n_0;
  wire axi_rlast_set;
  wire axi_rvalid_clr_ok;
  wire axi_rvalid_clr_ok_i_1_n_0;
  wire axi_rvalid_clr_ok_i_2_n_0;
  wire axi_rvalid_int_i_1_n_0;
  wire axi_rvalid_set;
  wire axi_rvalid_set_cmb;
  wire bram_addr_inc;
  wire bram_en_int_i_1_n_0;
  wire bram_en_int_i_2_n_0;
  wire bram_en_int_i_3_n_0;
  wire bram_en_int_i_4_n_0;
  wire bram_en_int_i_5_n_0;
  wire bram_en_int_i_6_n_0;
  wire bram_en_int_i_7_n_0;
  wire [63:0]bram_rddata_a;
  wire [7:0]brst_cnt;
  wire \brst_cnt[0]_i_1_n_0 ;
  wire \brst_cnt[1]_i_1_n_0 ;
  wire \brst_cnt[2]_i_1_n_0 ;
  wire \brst_cnt[3]_i_1_n_0 ;
  wire \brst_cnt[4]_i_1_n_0 ;
  wire \brst_cnt[5]_i_1_n_0 ;
  wire \brst_cnt[5]_i_2_n_0 ;
  wire \brst_cnt[6]_i_1_n_0 ;
  wire \brst_cnt[7]_i_1_n_0 ;
  wire \brst_cnt[7]_i_2_n_0 ;
  wire \brst_cnt[7]_i_3_n_0 ;
  wire brst_cnt_max;
  wire brst_cnt_max_d1;
  wire brst_one;
  wire brst_one_i_1_n_0;
  wire brst_one_i_2_n_0;
  wire brst_zero;
  wire brst_zero_i_1_n_0;
  wire brst_zero_i_2_n_0;
  wire curr_fixed_burst;
  wire curr_fixed_burst_reg;
  wire curr_fixed_burst_reg_0;
  wire curr_wrap_burst_reg;
  wire curr_wrap_burst_reg_i_1__0_n_0;
  wire curr_wrap_burst_reg_reg_0;
  wire disable_b2b_brst;
  wire disable_b2b_brst_cmb;
  wire disable_b2b_brst_i_2_n_0;
  wire disable_b2b_brst_i_3_n_0;
  wire end_brst_rd;
  wire end_brst_rd_clr;
  wire end_brst_rd_clr_i_1_n_0;
  wire end_brst_rd_i_1_n_0;
  wire last_bram_addr;
  wire last_bram_addr0;
  wire last_bram_addr_i_2_n_0;
  wire last_bram_addr_i_3_n_0;
  wire last_bram_addr_i_4_n_0;
  wire last_bram_addr_i_6_n_0;
  wire last_bram_addr_i_7_n_0;
  wire last_bram_addr_i_8_n_0;
  wire p_0_in4_in;
  wire p_0_out;
  wire p_3_out;
  wire p_7_in;
  wire pend_rd_op;
  wire pend_rd_op_i_1_n_0;
  wire pend_rd_op_i_2_n_0;
  wire pend_rd_op_i_3_n_0;
  wire pend_rd_op_i_4_n_0;
  wire rd_adv_buf24_out;
  (* RTL_KEEP = "yes" *) wire [3:0]rd_data_sm_cs;
  wire rd_data_sm_ns1;
  wire [63:0]rd_skid_buf;
  wire rd_skid_buf_ld;
  wire rd_skid_buf_ld_cmb;
  wire rd_skid_buf_ld_reg;
  wire rddata_mux_sel;
  wire rddata_mux_sel_i_1_n_0;
  wire rddata_mux_sel_i_2_n_0;
  wire rddata_mux_sel_i_3_n_0;
  (* RTL_KEEP = "yes" *) wire [2:0]rlast_sm_cs;
  wire s_axi_aclk;
  wire [8:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire s_axi_aresetn;
  wire [0:0]s_axi_arid;
  wire [7:0]s_axi_arlen;
  wire [63:0]s_axi_rdata;
  wire [0:0]s_axi_rid;
  wire s_axi_rlast;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire [7:0]\save_init_bram_addr_ld_reg[11] ;
  wire [0:0]\save_init_bram_addr_ld_reg[12] ;
  wire set_last_bram_addr3_out;
  wire sng_bram_addr_ld_en;

  LUT6 #(
    .INIT(64'h5555555455555050)) 
    \/FSM_sequential_rlast_sm_cs[0]_i_1 
       (.I0(\/FSM_sequential_rlast_sm_cs[1]_i_2_n_0 ),
        .I1(rd_adv_buf24_out),
        .I2(axi_rd_burst_two_reg_n_0),
        .I3(act_rd_burst_two),
        .I4(rlast_sm_cs[1]),
        .I5(axi_rd_burst),
        .O(\/FSM_sequential_rlast_sm_cs[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h5555550155505500)) 
    \/FSM_sequential_rlast_sm_cs[1]_i_1 
       (.I0(\/FSM_sequential_rlast_sm_cs[1]_i_2_n_0 ),
        .I1(act_rd_burst_two),
        .I2(axi_rd_burst_two_reg_n_0),
        .I3(rlast_sm_cs[1]),
        .I4(rd_adv_buf24_out),
        .I5(axi_rd_burst),
        .O(\/FSM_sequential_rlast_sm_cs[1]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \/FSM_sequential_rlast_sm_cs[1]_i_2 
       (.I0(rlast_sm_cs[0]),
        .I1(rlast_sm_cs[2]),
        .O(\/FSM_sequential_rlast_sm_cs[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF000F111F000E000)) 
    \/i_ 
       (.I0(rlast_sm_cs[2]),
        .I1(rlast_sm_cs[1]),
        .I2(s_axi_rready),
        .I3(s_axi_rvalid),
        .I4(rlast_sm_cs[0]),
        .I5(last_bram_addr),
        .O(\/i__n_0 ));
  LUT6 #(
    .INIT(64'h00008080000F8080)) 
    \/i___0 
       (.I0(s_axi_rvalid),
        .I1(s_axi_rready),
        .I2(rlast_sm_cs[0]),
        .I3(rlast_sm_cs[1]),
        .I4(rlast_sm_cs[2]),
        .I5(s_axi_rlast),
        .O(axi_rlast_set));
  LUT2 #(
    .INIT(4'h2)) 
    \ADDR_SNG_PORT.bram_addr_int[11]_i_5 
       (.I0(I_WRAP_BRST_n_9),
        .I1(rd_data_sm_cs[3]),
        .O(bram_addr_inc));
  LUT6 #(
    .INIT(64'h3033337730330044)) 
    \FSM_sequential_rd_data_sm_cs[0]_i_1 
       (.I0(rd_data_sm_cs[1]),
        .I1(rd_data_sm_cs[3]),
        .I2(\FSM_sequential_rd_data_sm_cs[0]_i_2_n_0 ),
        .I3(rd_data_sm_cs[0]),
        .I4(rd_data_sm_cs[2]),
        .I5(\FSM_sequential_rd_data_sm_cs[0]_i_3_n_0 ),
        .O(\FSM_sequential_rd_data_sm_cs[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE0E0E0E0303030FF)) 
    \FSM_sequential_rd_data_sm_cs[0]_i_2 
       (.I0(pend_rd_op),
        .I1(ar_active_re),
        .I2(rd_adv_buf24_out),
        .I3(act_rd_burst),
        .I4(act_rd_burst_two),
        .I5(rd_data_sm_cs[1]),
        .O(\FSM_sequential_rd_data_sm_cs[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8080808FFFFFFFFF)) 
    \FSM_sequential_rd_data_sm_cs[0]_i_3 
       (.I0(s_axi_rready),
        .I1(s_axi_rvalid),
        .I2(rd_data_sm_cs[1]),
        .I3(axi_rd_burst_two_reg_n_0),
        .I4(axi_rd_burst),
        .I5(rd_data_sm_cs[0]),
        .O(\FSM_sequential_rd_data_sm_cs[0]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \FSM_sequential_rd_data_sm_cs[1]_i_1 
       (.I0(\FSM_sequential_rd_data_sm_cs[1]_i_2_n_0 ),
        .I1(rd_data_sm_cs[2]),
        .I2(\FSM_sequential_rd_data_sm_cs[1]_i_3_n_0 ),
        .I3(rd_data_sm_cs[3]),
        .O(\FSM_sequential_rd_data_sm_cs[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0C38)) 
    \FSM_sequential_rd_data_sm_cs[1]_i_2 
       (.I0(axi_rd_burst),
        .I1(rd_data_sm_cs[0]),
        .I2(rd_data_sm_cs[1]),
        .I3(axi_rd_burst_two_reg_n_0),
        .O(\FSM_sequential_rd_data_sm_cs[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00FF00FFDFFFDF00)) 
    \FSM_sequential_rd_data_sm_cs[1]_i_3 
       (.I0(ar_active_re),
        .I1(rd_data_sm_ns1),
        .I2(rd_adv_buf24_out),
        .I3(rd_data_sm_cs[0]),
        .I4(\FSM_sequential_rd_data_sm_cs[3]_i_5_n_0 ),
        .I5(rd_data_sm_cs[1]),
        .O(\FSM_sequential_rd_data_sm_cs[1]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \FSM_sequential_rd_data_sm_cs[2]_i_1 
       (.I0(\FSM_sequential_rd_data_sm_cs[2]_i_2_n_0 ),
        .I1(rd_data_sm_cs[2]),
        .I2(\FSM_sequential_rd_data_sm_cs[2]_i_3_n_0 ),
        .I3(rd_data_sm_cs[3]),
        .O(\FSM_sequential_rd_data_sm_cs[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFC04)) 
    \FSM_sequential_rd_data_sm_cs[2]_i_2 
       (.I0(axi_rd_burst),
        .I1(rd_data_sm_cs[0]),
        .I2(axi_rd_burst_two_reg_n_0),
        .I3(rd_data_sm_cs[1]),
        .O(\FSM_sequential_rd_data_sm_cs[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00FFDF0000FFDFFF)) 
    \FSM_sequential_rd_data_sm_cs[2]_i_3 
       (.I0(ar_active_re),
        .I1(rd_data_sm_ns1),
        .I2(rd_adv_buf24_out),
        .I3(rd_data_sm_cs[0]),
        .I4(rd_data_sm_cs[1]),
        .I5(\FSM_sequential_rd_data_sm_cs[3]_i_5_n_0 ),
        .O(\FSM_sequential_rd_data_sm_cs[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0004FFFF00040000)) 
    \FSM_sequential_rd_data_sm_cs[3]_i_1 
       (.I0(rd_data_sm_cs[0]),
        .I1(rd_adv_buf24_out),
        .I2(rd_data_sm_cs[1]),
        .I3(rd_data_sm_cs[2]),
        .I4(rd_data_sm_cs[3]),
        .I5(\FSM_sequential_rd_data_sm_cs[3]_i_3_n_0 ),
        .O(\FSM_sequential_rd_data_sm_cs[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000028080000)) 
    \FSM_sequential_rd_data_sm_cs[3]_i_2 
       (.I0(rd_data_sm_cs[2]),
        .I1(rd_data_sm_cs[1]),
        .I2(rd_adv_buf24_out),
        .I3(\FSM_sequential_rd_data_sm_cs[3]_i_4_n_0 ),
        .I4(rd_data_sm_cs[0]),
        .I5(rd_data_sm_cs[3]),
        .O(\FSM_sequential_rd_data_sm_cs[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hBFF5B5F5FFF5FFA0)) 
    \FSM_sequential_rd_data_sm_cs[3]_i_3 
       (.I0(rd_data_sm_cs[2]),
        .I1(\FSM_sequential_rd_data_sm_cs[3]_i_5_n_0 ),
        .I2(rd_adv_buf24_out),
        .I3(rd_data_sm_cs[0]),
        .I4(ar_active_re),
        .I5(rd_data_sm_cs[1]),
        .O(\FSM_sequential_rd_data_sm_cs[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h4440)) 
    \FSM_sequential_rd_data_sm_cs[3]_i_4 
       (.I0(ar_active_d1),
        .I1(p_0_out),
        .I2(act_rd_burst),
        .I3(act_rd_burst_two),
        .O(\FSM_sequential_rd_data_sm_cs[3]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \FSM_sequential_rd_data_sm_cs[3]_i_5 
       (.I0(end_brst_rd),
        .I1(brst_zero),
        .O(\FSM_sequential_rd_data_sm_cs[3]_i_5_n_0 ));
  (* FSM_ENCODED_STATES = "idle:0000,sng_addr:0001,sec_addr:0010,full_pipe:0011,full_throttle:0100,last_addr:0101,last_throttle:0110,last_data:0111,last_data_ar_pend:1000" *) 
  (* KEEP = "yes" *) 
  FDRE \FSM_sequential_rd_data_sm_cs_reg[0] 
       (.C(s_axi_aclk),
        .CE(\FSM_sequential_rd_data_sm_cs[3]_i_1_n_0 ),
        .D(\FSM_sequential_rd_data_sm_cs[0]_i_1_n_0 ),
        .Q(rd_data_sm_cs[0]),
        .R(SR));
  (* FSM_ENCODED_STATES = "idle:0000,sng_addr:0001,sec_addr:0010,full_pipe:0011,full_throttle:0100,last_addr:0101,last_throttle:0110,last_data:0111,last_data_ar_pend:1000" *) 
  (* KEEP = "yes" *) 
  FDRE \FSM_sequential_rd_data_sm_cs_reg[1] 
       (.C(s_axi_aclk),
        .CE(\FSM_sequential_rd_data_sm_cs[3]_i_1_n_0 ),
        .D(\FSM_sequential_rd_data_sm_cs[1]_i_1_n_0 ),
        .Q(rd_data_sm_cs[1]),
        .R(SR));
  (* FSM_ENCODED_STATES = "idle:0000,sng_addr:0001,sec_addr:0010,full_pipe:0011,full_throttle:0100,last_addr:0101,last_throttle:0110,last_data:0111,last_data_ar_pend:1000" *) 
  (* KEEP = "yes" *) 
  FDRE \FSM_sequential_rd_data_sm_cs_reg[2] 
       (.C(s_axi_aclk),
        .CE(\FSM_sequential_rd_data_sm_cs[3]_i_1_n_0 ),
        .D(\FSM_sequential_rd_data_sm_cs[2]_i_1_n_0 ),
        .Q(rd_data_sm_cs[2]),
        .R(SR));
  (* FSM_ENCODED_STATES = "idle:0000,sng_addr:0001,sec_addr:0010,full_pipe:0011,full_throttle:0100,last_addr:0101,last_throttle:0110,last_data:0111,last_data_ar_pend:1000" *) 
  (* KEEP = "yes" *) 
  FDRE \FSM_sequential_rd_data_sm_cs_reg[3] 
       (.C(s_axi_aclk),
        .CE(\FSM_sequential_rd_data_sm_cs[3]_i_1_n_0 ),
        .D(\FSM_sequential_rd_data_sm_cs[3]_i_2_n_0 ),
        .Q(rd_data_sm_cs[3]),
        .R(SR));
  LUT5 #(
    .INIT(32'h0000AA01)) 
    \FSM_sequential_rlast_sm_cs[2]_i_1 
       (.I0(rlast_sm_cs[1]),
        .I1(axi_rd_burst),
        .I2(axi_rd_burst_two_reg_n_0),
        .I3(rlast_sm_cs[0]),
        .I4(rlast_sm_cs[2]),
        .O(\FSM_sequential_rlast_sm_cs[2]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "idle:000,w8_throttle:010,w8_2nd_last_data:011,w8_last_data:100,w8_throttle_b2:001" *) 
  (* KEEP = "yes" *) 
  FDRE \FSM_sequential_rlast_sm_cs_reg[0] 
       (.C(s_axi_aclk),
        .CE(\/i__n_0 ),
        .D(\/FSM_sequential_rlast_sm_cs[0]_i_1_n_0 ),
        .Q(rlast_sm_cs[0]),
        .R(SR));
  (* FSM_ENCODED_STATES = "idle:000,w8_throttle:010,w8_2nd_last_data:011,w8_last_data:100,w8_throttle_b2:001" *) 
  (* KEEP = "yes" *) 
  FDRE \FSM_sequential_rlast_sm_cs_reg[1] 
       (.C(s_axi_aclk),
        .CE(\/i__n_0 ),
        .D(\/FSM_sequential_rlast_sm_cs[1]_i_1_n_0 ),
        .Q(rlast_sm_cs[1]),
        .R(SR));
  (* FSM_ENCODED_STATES = "idle:000,w8_throttle:010,w8_2nd_last_data:011,w8_last_data:100,w8_throttle_b2:001" *) 
  (* KEEP = "yes" *) 
  FDRE \FSM_sequential_rlast_sm_cs_reg[2] 
       (.C(s_axi_aclk),
        .CE(\/i__n_0 ),
        .D(\FSM_sequential_rlast_sm_cs[2]_i_1_n_0 ),
        .Q(rlast_sm_cs[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AR_SNG.ar_active_d1_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_0_out),
        .Q(ar_active_d1),
        .R(p_3_out));
  LUT6 #(
    .INIT(64'hAA080000AA00AA00)) 
    \GEN_BRST_MAX_WO_NARROW.brst_cnt_max_i_1 
       (.I0(s_axi_aresetn),
        .I1(brst_zero),
        .I2(pend_rd_op),
        .I3(brst_cnt_max),
        .I4(ar_active_d1),
        .I5(p_0_out),
        .O(\GEN_BRST_MAX_WO_NARROW.brst_cnt_max_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_BRST_MAX_WO_NARROW.brst_cnt_max_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_BRST_MAX_WO_NARROW.brst_cnt_max_i_1_n_0 ),
        .Q(brst_cnt_max),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[0].axi_rdata_int[0]_i_1 
       (.I0(rd_skid_buf[0]),
        .I1(bram_rddata_a[0]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[0].axi_rdata_int[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[0].axi_rdata_int_reg[0] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[0].axi_rdata_int[0]_i_1_n_0 ),
        .Q(s_axi_rdata[0]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[10].axi_rdata_int[10]_i_1 
       (.I0(rd_skid_buf[10]),
        .I1(bram_rddata_a[10]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[10].axi_rdata_int[10]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[10].axi_rdata_int_reg[10] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[10].axi_rdata_int[10]_i_1_n_0 ),
        .Q(s_axi_rdata[10]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[11].axi_rdata_int[11]_i_1 
       (.I0(rd_skid_buf[11]),
        .I1(bram_rddata_a[11]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[11].axi_rdata_int[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[11].axi_rdata_int_reg[11] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[11].axi_rdata_int[11]_i_1_n_0 ),
        .Q(s_axi_rdata[11]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[12].axi_rdata_int[12]_i_1 
       (.I0(rd_skid_buf[12]),
        .I1(bram_rddata_a[12]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[12].axi_rdata_int[12]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[12].axi_rdata_int_reg[12] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[12].axi_rdata_int[12]_i_1_n_0 ),
        .Q(s_axi_rdata[12]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[13].axi_rdata_int[13]_i_1 
       (.I0(rd_skid_buf[13]),
        .I1(bram_rddata_a[13]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[13].axi_rdata_int[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[13].axi_rdata_int_reg[13] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[13].axi_rdata_int[13]_i_1_n_0 ),
        .Q(s_axi_rdata[13]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[14].axi_rdata_int[14]_i_1 
       (.I0(rd_skid_buf[14]),
        .I1(bram_rddata_a[14]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[14].axi_rdata_int[14]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[14].axi_rdata_int_reg[14] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[14].axi_rdata_int[14]_i_1_n_0 ),
        .Q(s_axi_rdata[14]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[15].axi_rdata_int[15]_i_1 
       (.I0(rd_skid_buf[15]),
        .I1(bram_rddata_a[15]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[15].axi_rdata_int[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[15].axi_rdata_int_reg[15] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[15].axi_rdata_int[15]_i_1_n_0 ),
        .Q(s_axi_rdata[15]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[16].axi_rdata_int[16]_i_1 
       (.I0(rd_skid_buf[16]),
        .I1(bram_rddata_a[16]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[16].axi_rdata_int[16]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[16].axi_rdata_int_reg[16] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[16].axi_rdata_int[16]_i_1_n_0 ),
        .Q(s_axi_rdata[16]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[17].axi_rdata_int[17]_i_1 
       (.I0(rd_skid_buf[17]),
        .I1(bram_rddata_a[17]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[17].axi_rdata_int[17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[17].axi_rdata_int_reg[17] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[17].axi_rdata_int[17]_i_1_n_0 ),
        .Q(s_axi_rdata[17]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[18].axi_rdata_int[18]_i_1 
       (.I0(rd_skid_buf[18]),
        .I1(bram_rddata_a[18]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[18].axi_rdata_int[18]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[18].axi_rdata_int_reg[18] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[18].axi_rdata_int[18]_i_1_n_0 ),
        .Q(s_axi_rdata[18]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[19].axi_rdata_int[19]_i_1 
       (.I0(rd_skid_buf[19]),
        .I1(bram_rddata_a[19]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[19].axi_rdata_int[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[19].axi_rdata_int_reg[19] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[19].axi_rdata_int[19]_i_1_n_0 ),
        .Q(s_axi_rdata[19]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[1].axi_rdata_int[1]_i_1 
       (.I0(rd_skid_buf[1]),
        .I1(bram_rddata_a[1]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[1].axi_rdata_int[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[1].axi_rdata_int_reg[1] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[1].axi_rdata_int[1]_i_1_n_0 ),
        .Q(s_axi_rdata[1]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[20].axi_rdata_int[20]_i_1 
       (.I0(rd_skid_buf[20]),
        .I1(bram_rddata_a[20]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[20].axi_rdata_int[20]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[20].axi_rdata_int_reg[20] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[20].axi_rdata_int[20]_i_1_n_0 ),
        .Q(s_axi_rdata[20]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[21].axi_rdata_int[21]_i_1 
       (.I0(rd_skid_buf[21]),
        .I1(bram_rddata_a[21]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[21].axi_rdata_int[21]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[21].axi_rdata_int_reg[21] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[21].axi_rdata_int[21]_i_1_n_0 ),
        .Q(s_axi_rdata[21]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[22].axi_rdata_int[22]_i_1 
       (.I0(rd_skid_buf[22]),
        .I1(bram_rddata_a[22]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[22].axi_rdata_int[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[22].axi_rdata_int_reg[22] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[22].axi_rdata_int[22]_i_1_n_0 ),
        .Q(s_axi_rdata[22]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[23].axi_rdata_int[23]_i_1 
       (.I0(rd_skid_buf[23]),
        .I1(bram_rddata_a[23]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[23].axi_rdata_int[23]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[23].axi_rdata_int_reg[23] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[23].axi_rdata_int[23]_i_1_n_0 ),
        .Q(s_axi_rdata[23]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[24].axi_rdata_int[24]_i_1 
       (.I0(rd_skid_buf[24]),
        .I1(bram_rddata_a[24]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[24].axi_rdata_int[24]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[24].axi_rdata_int_reg[24] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[24].axi_rdata_int[24]_i_1_n_0 ),
        .Q(s_axi_rdata[24]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[25].axi_rdata_int[25]_i_1 
       (.I0(rd_skid_buf[25]),
        .I1(bram_rddata_a[25]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[25].axi_rdata_int[25]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[25].axi_rdata_int_reg[25] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[25].axi_rdata_int[25]_i_1_n_0 ),
        .Q(s_axi_rdata[25]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[26].axi_rdata_int[26]_i_1 
       (.I0(rd_skid_buf[26]),
        .I1(bram_rddata_a[26]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[26].axi_rdata_int[26]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[26].axi_rdata_int_reg[26] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[26].axi_rdata_int[26]_i_1_n_0 ),
        .Q(s_axi_rdata[26]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[27].axi_rdata_int[27]_i_1 
       (.I0(rd_skid_buf[27]),
        .I1(bram_rddata_a[27]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[27].axi_rdata_int[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[27].axi_rdata_int_reg[27] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[27].axi_rdata_int[27]_i_1_n_0 ),
        .Q(s_axi_rdata[27]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[28].axi_rdata_int[28]_i_1 
       (.I0(rd_skid_buf[28]),
        .I1(bram_rddata_a[28]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[28].axi_rdata_int[28]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[28].axi_rdata_int_reg[28] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[28].axi_rdata_int[28]_i_1_n_0 ),
        .Q(s_axi_rdata[28]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[29].axi_rdata_int[29]_i_1 
       (.I0(rd_skid_buf[29]),
        .I1(bram_rddata_a[29]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[29].axi_rdata_int[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[29].axi_rdata_int_reg[29] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[29].axi_rdata_int[29]_i_1_n_0 ),
        .Q(s_axi_rdata[29]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[2].axi_rdata_int[2]_i_1 
       (.I0(rd_skid_buf[2]),
        .I1(bram_rddata_a[2]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[2].axi_rdata_int[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[2].axi_rdata_int_reg[2] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[2].axi_rdata_int[2]_i_1_n_0 ),
        .Q(s_axi_rdata[2]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[30].axi_rdata_int[30]_i_1 
       (.I0(rd_skid_buf[30]),
        .I1(bram_rddata_a[30]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[30].axi_rdata_int[30]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[30].axi_rdata_int_reg[30] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[30].axi_rdata_int[30]_i_1_n_0 ),
        .Q(s_axi_rdata[30]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1 
       (.I0(rd_skid_buf[31]),
        .I1(bram_rddata_a[31]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int_reg[31] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0 ),
        .Q(s_axi_rdata[31]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[32].axi_rdata_int[32]_i_1 
       (.I0(rd_skid_buf[32]),
        .I1(bram_rddata_a[32]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[32].axi_rdata_int[32]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[32].axi_rdata_int_reg[32] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[32].axi_rdata_int[32]_i_1_n_0 ),
        .Q(s_axi_rdata[32]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[33].axi_rdata_int[33]_i_1 
       (.I0(rd_skid_buf[33]),
        .I1(bram_rddata_a[33]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[33].axi_rdata_int[33]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[33].axi_rdata_int_reg[33] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[33].axi_rdata_int[33]_i_1_n_0 ),
        .Q(s_axi_rdata[33]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[34].axi_rdata_int[34]_i_1 
       (.I0(rd_skid_buf[34]),
        .I1(bram_rddata_a[34]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[34].axi_rdata_int[34]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[34].axi_rdata_int_reg[34] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[34].axi_rdata_int[34]_i_1_n_0 ),
        .Q(s_axi_rdata[34]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[35].axi_rdata_int[35]_i_1 
       (.I0(rd_skid_buf[35]),
        .I1(bram_rddata_a[35]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[35].axi_rdata_int[35]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[35].axi_rdata_int_reg[35] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[35].axi_rdata_int[35]_i_1_n_0 ),
        .Q(s_axi_rdata[35]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[36].axi_rdata_int[36]_i_1 
       (.I0(rd_skid_buf[36]),
        .I1(bram_rddata_a[36]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[36].axi_rdata_int[36]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[36].axi_rdata_int_reg[36] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[36].axi_rdata_int[36]_i_1_n_0 ),
        .Q(s_axi_rdata[36]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[37].axi_rdata_int[37]_i_1 
       (.I0(rd_skid_buf[37]),
        .I1(bram_rddata_a[37]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[37].axi_rdata_int[37]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[37].axi_rdata_int_reg[37] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[37].axi_rdata_int[37]_i_1_n_0 ),
        .Q(s_axi_rdata[37]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[38].axi_rdata_int[38]_i_1 
       (.I0(rd_skid_buf[38]),
        .I1(bram_rddata_a[38]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[38].axi_rdata_int[38]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[38].axi_rdata_int_reg[38] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[38].axi_rdata_int[38]_i_1_n_0 ),
        .Q(s_axi_rdata[38]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[39].axi_rdata_int[39]_i_1 
       (.I0(rd_skid_buf[39]),
        .I1(bram_rddata_a[39]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[39].axi_rdata_int[39]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[39].axi_rdata_int_reg[39] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[39].axi_rdata_int[39]_i_1_n_0 ),
        .Q(s_axi_rdata[39]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[3].axi_rdata_int[3]_i_1 
       (.I0(rd_skid_buf[3]),
        .I1(bram_rddata_a[3]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[3].axi_rdata_int[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[3].axi_rdata_int_reg[3] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[3].axi_rdata_int[3]_i_1_n_0 ),
        .Q(s_axi_rdata[3]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[40].axi_rdata_int[40]_i_1 
       (.I0(rd_skid_buf[40]),
        .I1(bram_rddata_a[40]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[40].axi_rdata_int[40]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[40].axi_rdata_int_reg[40] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[40].axi_rdata_int[40]_i_1_n_0 ),
        .Q(s_axi_rdata[40]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[41].axi_rdata_int[41]_i_1 
       (.I0(rd_skid_buf[41]),
        .I1(bram_rddata_a[41]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[41].axi_rdata_int[41]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[41].axi_rdata_int_reg[41] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[41].axi_rdata_int[41]_i_1_n_0 ),
        .Q(s_axi_rdata[41]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[42].axi_rdata_int[42]_i_1 
       (.I0(rd_skid_buf[42]),
        .I1(bram_rddata_a[42]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[42].axi_rdata_int[42]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[42].axi_rdata_int_reg[42] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[42].axi_rdata_int[42]_i_1_n_0 ),
        .Q(s_axi_rdata[42]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[43].axi_rdata_int[43]_i_1 
       (.I0(rd_skid_buf[43]),
        .I1(bram_rddata_a[43]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[43].axi_rdata_int[43]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[43].axi_rdata_int_reg[43] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[43].axi_rdata_int[43]_i_1_n_0 ),
        .Q(s_axi_rdata[43]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[44].axi_rdata_int[44]_i_1 
       (.I0(rd_skid_buf[44]),
        .I1(bram_rddata_a[44]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[44].axi_rdata_int[44]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[44].axi_rdata_int_reg[44] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[44].axi_rdata_int[44]_i_1_n_0 ),
        .Q(s_axi_rdata[44]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[45].axi_rdata_int[45]_i_1 
       (.I0(rd_skid_buf[45]),
        .I1(bram_rddata_a[45]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[45].axi_rdata_int[45]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[45].axi_rdata_int_reg[45] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[45].axi_rdata_int[45]_i_1_n_0 ),
        .Q(s_axi_rdata[45]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[46].axi_rdata_int[46]_i_1 
       (.I0(rd_skid_buf[46]),
        .I1(bram_rddata_a[46]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[46].axi_rdata_int[46]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[46].axi_rdata_int_reg[46] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[46].axi_rdata_int[46]_i_1_n_0 ),
        .Q(s_axi_rdata[46]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[47].axi_rdata_int[47]_i_1 
       (.I0(rd_skid_buf[47]),
        .I1(bram_rddata_a[47]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[47].axi_rdata_int[47]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[47].axi_rdata_int_reg[47] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[47].axi_rdata_int[47]_i_1_n_0 ),
        .Q(s_axi_rdata[47]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[48].axi_rdata_int[48]_i_1 
       (.I0(rd_skid_buf[48]),
        .I1(bram_rddata_a[48]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[48].axi_rdata_int[48]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[48].axi_rdata_int_reg[48] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[48].axi_rdata_int[48]_i_1_n_0 ),
        .Q(s_axi_rdata[48]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[49].axi_rdata_int[49]_i_1 
       (.I0(rd_skid_buf[49]),
        .I1(bram_rddata_a[49]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[49].axi_rdata_int[49]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[49].axi_rdata_int_reg[49] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[49].axi_rdata_int[49]_i_1_n_0 ),
        .Q(s_axi_rdata[49]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[4].axi_rdata_int[4]_i_1 
       (.I0(rd_skid_buf[4]),
        .I1(bram_rddata_a[4]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[4].axi_rdata_int[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[4].axi_rdata_int_reg[4] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[4].axi_rdata_int[4]_i_1_n_0 ),
        .Q(s_axi_rdata[4]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[50].axi_rdata_int[50]_i_1 
       (.I0(rd_skid_buf[50]),
        .I1(bram_rddata_a[50]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[50].axi_rdata_int[50]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[50].axi_rdata_int_reg[50] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[50].axi_rdata_int[50]_i_1_n_0 ),
        .Q(s_axi_rdata[50]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[51].axi_rdata_int[51]_i_1 
       (.I0(rd_skid_buf[51]),
        .I1(bram_rddata_a[51]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[51].axi_rdata_int[51]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[51].axi_rdata_int_reg[51] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[51].axi_rdata_int[51]_i_1_n_0 ),
        .Q(s_axi_rdata[51]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[52].axi_rdata_int[52]_i_1 
       (.I0(rd_skid_buf[52]),
        .I1(bram_rddata_a[52]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[52].axi_rdata_int[52]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[52].axi_rdata_int_reg[52] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[52].axi_rdata_int[52]_i_1_n_0 ),
        .Q(s_axi_rdata[52]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[53].axi_rdata_int[53]_i_1 
       (.I0(rd_skid_buf[53]),
        .I1(bram_rddata_a[53]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[53].axi_rdata_int[53]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[53].axi_rdata_int_reg[53] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[53].axi_rdata_int[53]_i_1_n_0 ),
        .Q(s_axi_rdata[53]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[54].axi_rdata_int[54]_i_1 
       (.I0(rd_skid_buf[54]),
        .I1(bram_rddata_a[54]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[54].axi_rdata_int[54]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[54].axi_rdata_int_reg[54] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[54].axi_rdata_int[54]_i_1_n_0 ),
        .Q(s_axi_rdata[54]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[55].axi_rdata_int[55]_i_1 
       (.I0(rd_skid_buf[55]),
        .I1(bram_rddata_a[55]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[55].axi_rdata_int[55]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[55].axi_rdata_int_reg[55] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[55].axi_rdata_int[55]_i_1_n_0 ),
        .Q(s_axi_rdata[55]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[56].axi_rdata_int[56]_i_1 
       (.I0(rd_skid_buf[56]),
        .I1(bram_rddata_a[56]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[56].axi_rdata_int[56]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[56].axi_rdata_int_reg[56] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[56].axi_rdata_int[56]_i_1_n_0 ),
        .Q(s_axi_rdata[56]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[57].axi_rdata_int[57]_i_1 
       (.I0(rd_skid_buf[57]),
        .I1(bram_rddata_a[57]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[57].axi_rdata_int[57]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[57].axi_rdata_int_reg[57] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[57].axi_rdata_int[57]_i_1_n_0 ),
        .Q(s_axi_rdata[57]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[58].axi_rdata_int[58]_i_1 
       (.I0(rd_skid_buf[58]),
        .I1(bram_rddata_a[58]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[58].axi_rdata_int[58]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[58].axi_rdata_int_reg[58] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[58].axi_rdata_int[58]_i_1_n_0 ),
        .Q(s_axi_rdata[58]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[59].axi_rdata_int[59]_i_1 
       (.I0(rd_skid_buf[59]),
        .I1(bram_rddata_a[59]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[59].axi_rdata_int[59]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[59].axi_rdata_int_reg[59] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[59].axi_rdata_int[59]_i_1_n_0 ),
        .Q(s_axi_rdata[59]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[5].axi_rdata_int[5]_i_1 
       (.I0(rd_skid_buf[5]),
        .I1(bram_rddata_a[5]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[5].axi_rdata_int[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[5].axi_rdata_int_reg[5] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[5].axi_rdata_int[5]_i_1_n_0 ),
        .Q(s_axi_rdata[5]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[60].axi_rdata_int[60]_i_1 
       (.I0(rd_skid_buf[60]),
        .I1(bram_rddata_a[60]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[60].axi_rdata_int[60]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[60].axi_rdata_int_reg[60] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[60].axi_rdata_int[60]_i_1_n_0 ),
        .Q(s_axi_rdata[60]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[61].axi_rdata_int[61]_i_1 
       (.I0(rd_skid_buf[61]),
        .I1(bram_rddata_a[61]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[61].axi_rdata_int[61]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[61].axi_rdata_int_reg[61] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[61].axi_rdata_int[61]_i_1_n_0 ),
        .Q(s_axi_rdata[61]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[62].axi_rdata_int[62]_i_1 
       (.I0(rd_skid_buf[62]),
        .I1(bram_rddata_a[62]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[62].axi_rdata_int[62]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[62].axi_rdata_int_reg[62] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[62].axi_rdata_int[62]_i_1_n_0 ),
        .Q(s_axi_rdata[62]),
        .R(p_3_out));
  LUT6 #(
    .INIT(64'h0000000074A270A2)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_1 
       (.I0(rd_data_sm_cs[1]),
        .I1(rd_data_sm_cs[0]),
        .I2(rd_adv_buf24_out),
        .I3(rd_data_sm_cs[2]),
        .I4(rd_data_sm_ns1),
        .I5(rd_data_sm_cs[3]),
        .O(axi_rdata_en));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2 
       (.I0(rd_skid_buf[63]),
        .I1(bram_rddata_a[63]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_3 
       (.I0(s_axi_rready),
        .I1(s_axi_rvalid),
        .O(rd_adv_buf24_out));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_4 
       (.I0(act_rd_burst_two),
        .I1(act_rd_burst),
        .O(rd_data_sm_ns1));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int_reg[63] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[63].axi_rdata_int[63]_i_2_n_0 ),
        .Q(s_axi_rdata[63]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[6].axi_rdata_int[6]_i_1 
       (.I0(rd_skid_buf[6]),
        .I1(bram_rddata_a[6]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[6].axi_rdata_int[6]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[6].axi_rdata_int_reg[6] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[6].axi_rdata_int[6]_i_1_n_0 ),
        .Q(s_axi_rdata[6]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[7].axi_rdata_int[7]_i_1 
       (.I0(rd_skid_buf[7]),
        .I1(bram_rddata_a[7]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[7].axi_rdata_int[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[7].axi_rdata_int_reg[7] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[7].axi_rdata_int[7]_i_1_n_0 ),
        .Q(s_axi_rdata[7]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[8].axi_rdata_int[8]_i_1 
       (.I0(rd_skid_buf[8]),
        .I1(bram_rddata_a[8]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[8].axi_rdata_int[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[8].axi_rdata_int_reg[8] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[8].axi_rdata_int[8]_i_1_n_0 ),
        .Q(s_axi_rdata[8]),
        .R(p_3_out));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[9].axi_rdata_int[9]_i_1 
       (.I0(rd_skid_buf[9]),
        .I1(bram_rddata_a[9]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[9].axi_rdata_int[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[9].axi_rdata_int_reg[9] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[9].axi_rdata_int[9]_i_1_n_0 ),
        .Q(s_axi_rdata[9]),
        .R(p_3_out));
  LUT6 #(
    .INIT(64'hAAAAABAAAAAAAAAA)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf[63]_i_1 
       (.I0(rd_skid_buf_ld_reg),
        .I1(rd_data_sm_cs[3]),
        .I2(rd_data_sm_cs[0]),
        .I3(rd_adv_buf24_out),
        .I4(rd_data_sm_cs[1]),
        .I5(rd_data_sm_cs[2]),
        .O(rd_skid_buf_ld));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[0] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[0]),
        .Q(rd_skid_buf[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[10] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[10]),
        .Q(rd_skid_buf[10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[11] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[11]),
        .Q(rd_skid_buf[11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[12] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[12]),
        .Q(rd_skid_buf[12]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[13] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[13]),
        .Q(rd_skid_buf[13]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[14] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[14]),
        .Q(rd_skid_buf[14]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[15] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[15]),
        .Q(rd_skid_buf[15]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[16] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[16]),
        .Q(rd_skid_buf[16]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[17] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[17]),
        .Q(rd_skid_buf[17]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[18] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[18]),
        .Q(rd_skid_buf[18]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[19] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[19]),
        .Q(rd_skid_buf[19]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[1] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[1]),
        .Q(rd_skid_buf[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[20] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[20]),
        .Q(rd_skid_buf[20]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[21] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[21]),
        .Q(rd_skid_buf[21]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[22] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[22]),
        .Q(rd_skid_buf[22]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[23] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[23]),
        .Q(rd_skid_buf[23]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[24] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[24]),
        .Q(rd_skid_buf[24]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[25] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[25]),
        .Q(rd_skid_buf[25]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[26] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[26]),
        .Q(rd_skid_buf[26]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[27] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[27]),
        .Q(rd_skid_buf[27]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[28] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[28]),
        .Q(rd_skid_buf[28]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[29] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[29]),
        .Q(rd_skid_buf[29]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[2] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[2]),
        .Q(rd_skid_buf[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[30] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[30]),
        .Q(rd_skid_buf[30]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[31] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[31]),
        .Q(rd_skid_buf[31]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[32] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[32]),
        .Q(rd_skid_buf[32]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[33] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[33]),
        .Q(rd_skid_buf[33]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[34] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[34]),
        .Q(rd_skid_buf[34]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[35] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[35]),
        .Q(rd_skid_buf[35]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[36] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[36]),
        .Q(rd_skid_buf[36]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[37] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[37]),
        .Q(rd_skid_buf[37]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[38] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[38]),
        .Q(rd_skid_buf[38]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[39] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[39]),
        .Q(rd_skid_buf[39]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[3] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[3]),
        .Q(rd_skid_buf[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[40] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[40]),
        .Q(rd_skid_buf[40]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[41] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[41]),
        .Q(rd_skid_buf[41]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[42] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[42]),
        .Q(rd_skid_buf[42]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[43] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[43]),
        .Q(rd_skid_buf[43]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[44] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[44]),
        .Q(rd_skid_buf[44]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[45] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[45]),
        .Q(rd_skid_buf[45]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[46] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[46]),
        .Q(rd_skid_buf[46]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[47] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[47]),
        .Q(rd_skid_buf[47]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[48] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[48]),
        .Q(rd_skid_buf[48]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[49] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[49]),
        .Q(rd_skid_buf[49]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[4] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[4]),
        .Q(rd_skid_buf[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[50] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[50]),
        .Q(rd_skid_buf[50]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[51] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[51]),
        .Q(rd_skid_buf[51]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[52] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[52]),
        .Q(rd_skid_buf[52]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[53] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[53]),
        .Q(rd_skid_buf[53]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[54] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[54]),
        .Q(rd_skid_buf[54]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[55] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[55]),
        .Q(rd_skid_buf[55]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[56] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[56]),
        .Q(rd_skid_buf[56]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[57] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[57]),
        .Q(rd_skid_buf[57]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[58] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[58]),
        .Q(rd_skid_buf[58]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[59] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[59]),
        .Q(rd_skid_buf[59]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[5] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[5]),
        .Q(rd_skid_buf[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[60] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[60]),
        .Q(rd_skid_buf[60]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[61] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[61]),
        .Q(rd_skid_buf[61]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[62] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[62]),
        .Q(rd_skid_buf[62]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[63] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[63]),
        .Q(rd_skid_buf[63]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[6] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[6]),
        .Q(rd_skid_buf[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[7] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[7]),
        .Q(rd_skid_buf[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[8] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[8]),
        .Q(rd_skid_buf[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[9] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[9]),
        .Q(rd_skid_buf[9]),
        .R(SR));
  LUT3 #(
    .INIT(8'h8F)) 
    \GEN_RID_SNG.axi_rid_int[0]_i_1 
       (.I0(s_axi_rlast),
        .I1(s_axi_rready),
        .I2(s_axi_aresetn),
        .O(p_3_out));
  LUT6 #(
    .INIT(64'hCFAACFCFC0AAC0C0)) 
    \GEN_RID_SNG.axi_rid_int[0]_i_2 
       (.I0(s_axi_arid),
        .I1(axi_rid_temp),
        .I2(axi_rvalid_set),
        .I3(ar_active_d1),
        .I4(p_0_out),
        .I5(s_axi_rid),
        .O(\GEN_RID_SNG.axi_rid_int[0]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RID_SNG.axi_rid_int_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_RID_SNG.axi_rid_int[0]_i_2_n_0 ),
        .Q(s_axi_rid),
        .R(p_3_out));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RID_SNG.axi_rid_temp_reg[0] 
       (.C(s_axi_aclk),
        .CE(ar_active_re),
        .D(s_axi_arid),
        .Q(axi_rid_temp),
        .R(SR));
  bd_design_axi_bram_ctrl_0_0_wrap_brst_0 I_WRAP_BRST
       (.\ADDR_SNG_PORT.bram_addr_int_reg[10] (\ADDR_SNG_PORT.bram_addr_int_reg[10] ),
        .\ADDR_SNG_PORT.bram_addr_int_reg[11] (sng_bram_addr_ld_en),
        .\ADDR_SNG_PORT.bram_addr_int_reg[3] (\ADDR_SNG_PORT.bram_addr_int_reg[3] ),
        .\ADDR_SNG_PORT.bram_addr_int_reg[3]_0 (\ADDR_SNG_PORT.bram_addr_int_reg[3]_0 ),
        .\ADDR_SNG_PORT.bram_addr_int_reg[3]_1 (\ADDR_SNG_PORT.bram_addr_int_reg[3]_1 ),
        .\ADDR_SNG_PORT.bram_addr_int_reg[6] (\ADDR_SNG_PORT.bram_addr_int_reg[6] ),
        .\ADDR_SNG_PORT.bram_addr_int_reg[7] (\ADDR_SNG_PORT.bram_addr_int_reg[7] ),
        .\ADDR_SNG_PORT.bram_addr_int_reg[8] (\ADDR_SNG_PORT.bram_addr_int_reg[8] ),
        .\ADDR_SNG_PORT.bram_addr_int_reg[9] (\ADDR_SNG_PORT.bram_addr_int_reg[9] ),
        .D(D),
        .E(E),
        .\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[1] (\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[1] ),
        .Q(Q),
        .SR(SR),
        .ar_active_re(ar_active_re),
        .axi_rd_burst(axi_rd_burst),
        .axi_rd_burst_two_reg(axi_rd_burst_two_reg_n_0),
        .axi_rvalid_int_reg(s_axi_rvalid),
        .bram_addr_inc(bram_addr_inc),
        .brst_zero(brst_zero),
        .curr_fixed_burst_reg(curr_fixed_burst_reg),
        .curr_fixed_burst_reg_0(curr_fixed_burst_reg_0),
        .curr_wrap_burst_reg(curr_wrap_burst_reg),
        .curr_wrap_burst_reg_reg(curr_wrap_burst_reg_reg_0),
        .end_brst_rd(end_brst_rd),
        .out(rd_data_sm_cs),
        .p_0_out(p_0_out),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arlen(s_axi_arlen[3:0]),
        .s_axi_rready(s_axi_rready),
        .\save_init_bram_addr_ld_reg[11]_0 (\save_init_bram_addr_ld_reg[11] ),
        .\save_init_bram_addr_ld_reg[12]_0 (\save_init_bram_addr_ld_reg[12] ),
        .\save_init_bram_addr_ld_reg[4]_0 (I_WRAP_BRST_n_9));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'hAA3A)) 
    act_rd_burst_i_1
       (.I0(axi_rd_burst),
        .I1(axi_rd_burst_two),
        .I2(p_0_out),
        .I3(ar_active_d1),
        .O(act_rd_burst_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    act_rd_burst_reg
       (.C(s_axi_aclk),
        .CE(act_rd_burst_set),
        .D(act_rd_burst_i_1_n_0),
        .Q(act_rd_burst),
        .R(act_rd_burst0));
  LUT6 #(
    .INIT(64'h20000008FFFFFFFF)) 
    act_rd_burst_two_i_1
       (.I0(act_rd_burst_two_i_4_n_0),
        .I1(rd_data_sm_cs[3]),
        .I2(rd_data_sm_cs[0]),
        .I3(rd_data_sm_cs[1]),
        .I4(rd_data_sm_cs[2]),
        .I5(s_axi_aresetn),
        .O(act_rd_burst0));
  LUT6 #(
    .INIT(64'h0000000000001510)) 
    act_rd_burst_two_i_2
       (.I0(rd_data_sm_cs[2]),
        .I1(p_0_in4_in),
        .I2(rd_data_sm_cs[0]),
        .I3(ar_active_reg_0),
        .I4(rd_data_sm_cs[1]),
        .I5(rd_data_sm_cs[3]),
        .O(act_rd_burst_set));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    act_rd_burst_two_i_3
       (.I0(axi_rd_burst_two),
        .I1(p_0_out),
        .I2(ar_active_d1),
        .I3(axi_rd_burst_two_reg_n_0),
        .O(act_rd_burst_two_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h8880)) 
    act_rd_burst_two_i_4
       (.I0(s_axi_rvalid),
        .I1(s_axi_rready),
        .I2(act_rd_burst),
        .I3(act_rd_burst_two),
        .O(act_rd_burst_two_i_4_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    act_rd_burst_two_i_5
       (.I0(axi_rd_burst),
        .I1(axi_rd_burst_two_reg_n_0),
        .O(p_0_in4_in));
  FDRE #(
    .INIT(1'b0)) 
    act_rd_burst_two_reg
       (.C(s_axi_aclk),
        .CE(act_rd_burst_set),
        .D(act_rd_burst_two_i_3_n_0),
        .Q(act_rd_burst_two),
        .R(act_rd_burst0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h8)) 
    axi_awready_int_i_2
       (.I0(s_axi_rready),
        .I1(s_axi_rlast),
        .O(ar_active_reg));
  LUT4 #(
    .INIT(16'hD0FF)) 
    axi_rd_burst_i_1
       (.I0(p_0_out),
        .I1(ar_active_d1),
        .I2(brst_zero),
        .I3(s_axi_aresetn),
        .O(axi_rd_burst_i_1_n_0));
  LUT4 #(
    .INIT(16'hFFFD)) 
    axi_rd_burst_i_2
       (.I0(axi_rd_burst_reg_0),
        .I1(s_axi_arlen[1]),
        .I2(s_axi_arlen[3]),
        .I3(s_axi_arlen[2]),
        .O(axi_rd_burst0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    axi_rd_burst_i_3
       (.I0(s_axi_arlen[5]),
        .I1(s_axi_arlen[4]),
        .I2(s_axi_arlen[7]),
        .I3(s_axi_arlen[6]),
        .O(axi_rd_burst_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    axi_rd_burst_reg
       (.C(s_axi_aclk),
        .CE(ar_active_re),
        .D(axi_rd_burst0),
        .Q(axi_rd_burst),
        .R(axi_rd_burst_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    axi_rd_burst_two_i_1
       (.I0(s_axi_arlen[6]),
        .I1(s_axi_arlen[7]),
        .I2(s_axi_arlen[4]),
        .I3(s_axi_arlen[5]),
        .I4(axi_rd_burst_two_i_2_n_0),
        .O(axi_rd_burst_two));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hFFFD)) 
    axi_rd_burst_two_i_2
       (.I0(s_axi_arlen[0]),
        .I1(s_axi_arlen[1]),
        .I2(s_axi_arlen[3]),
        .I3(s_axi_arlen[2]),
        .O(axi_rd_burst_two_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    axi_rd_burst_two_reg
       (.C(s_axi_aclk),
        .CE(ar_active_re),
        .D(axi_rd_burst_two),
        .Q(axi_rd_burst_two_reg_n_0),
        .R(axi_rd_burst_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'hAA20)) 
    axi_rlast_int_i_1
       (.I0(s_axi_aresetn),
        .I1(s_axi_rready),
        .I2(s_axi_rlast),
        .I3(axi_rlast_set),
        .O(axi_rlast_int_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    axi_rlast_int_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_rlast_int_i_1_n_0),
        .Q(s_axi_rlast),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hFFFFFFA8)) 
    axi_rvalid_clr_ok_i_1
       (.I0(last_bram_addr),
        .I1(disable_b2b_brst),
        .I2(disable_b2b_brst_cmb),
        .I3(axi_rvalid_clr_ok_i_2_n_0),
        .I4(axi_rvalid_clr_ok),
        .O(axi_rvalid_clr_ok_i_1_n_0));
  LUT6 #(
    .INIT(64'h1000FFFF10001000)) 
    axi_rvalid_clr_ok_i_2
       (.I0(rd_data_sm_cs[3]),
        .I1(rd_data_sm_cs[1]),
        .I2(rd_data_sm_cs[0]),
        .I3(rd_data_sm_cs[2]),
        .I4(ar_active_d1),
        .I5(p_0_out),
        .O(axi_rvalid_clr_ok_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    axi_rvalid_clr_ok_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_rvalid_clr_ok_i_1_n_0),
        .Q(axi_rvalid_clr_ok),
        .R(SR));
  LUT6 #(
    .INIT(64'h00A8A8A8A8A8A8A8)) 
    axi_rvalid_int_i_1
       (.I0(s_axi_aresetn),
        .I1(axi_rvalid_set),
        .I2(s_axi_rvalid),
        .I3(s_axi_rready),
        .I4(s_axi_rlast),
        .I5(axi_rvalid_clr_ok),
        .O(axi_rvalid_int_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    axi_rvalid_int_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_rvalid_int_i_1_n_0),
        .Q(s_axi_rvalid),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0004)) 
    axi_rvalid_set_i_1
       (.I0(rd_data_sm_cs[2]),
        .I1(rd_data_sm_cs[0]),
        .I2(rd_data_sm_cs[1]),
        .I3(rd_data_sm_cs[3]),
        .O(axi_rvalid_set_cmb));
  FDRE #(
    .INIT(1'b0)) 
    axi_rvalid_set_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_rvalid_set_cmb),
        .Q(axi_rvalid_set),
        .R(SR));
  LUT6 #(
    .INIT(64'hFFFFE2FF0000E200)) 
    bram_en_int_i_1
       (.I0(bram_en_int_i_2_n_0),
        .I1(rd_data_sm_cs[2]),
        .I2(bram_en_int_i_3_n_0),
        .I3(bram_en_int_i_4_n_0),
        .I4(rd_data_sm_cs[3]),
        .I5(p_7_in),
        .O(bram_en_int_i_1_n_0));
  LUT6 #(
    .INIT(64'hA0AFA0AFFFCFF0C0)) 
    bram_en_int_i_2
       (.I0(\FSM_sequential_rd_data_sm_cs[3]_i_5_n_0 ),
        .I1(axi_rd_burst),
        .I2(rd_data_sm_cs[0]),
        .I3(axi_rd_burst_two_reg_n_0),
        .I4(ar_active_re),
        .I5(rd_data_sm_cs[1]),
        .O(bram_en_int_i_2_n_0));
  LUT6 #(
    .INIT(64'hFFEED500EEEEC000)) 
    bram_en_int_i_3
       (.I0(rd_data_sm_cs[0]),
        .I1(rd_data_sm_cs[1]),
        .I2(pend_rd_op),
        .I3(rd_adv_buf24_out),
        .I4(ar_active_re),
        .I5(\FSM_sequential_rd_data_sm_cs[3]_i_5_n_0 ),
        .O(bram_en_int_i_3_n_0));
  LUT6 #(
    .INIT(64'hBF80FFFFBF800000)) 
    bram_en_int_i_4
       (.I0(bram_en_int_i_5_n_0),
        .I1(act_rd_burst_two_i_4_n_0),
        .I2(ar_active_re),
        .I3(bram_en_int_i_6_n_0),
        .I4(rd_data_sm_cs[2]),
        .I5(bram_en_int_i_7_n_0),
        .O(bram_en_int_i_4_n_0));
  LUT6 #(
    .INIT(64'hE0E0A0A0FFFFF0FF)) 
    bram_en_int_i_5
       (.I0(ar_active_re),
        .I1(pend_rd_op),
        .I2(rd_data_sm_cs[0]),
        .I3(\FSM_sequential_rd_data_sm_cs[3]_i_5_n_0 ),
        .I4(rd_adv_buf24_out),
        .I5(rd_data_sm_cs[1]),
        .O(bram_en_int_i_5_n_0));
  LUT6 #(
    .INIT(64'hE0E0A0A00F0F000F)) 
    bram_en_int_i_6
       (.I0(ar_active_re),
        .I1(pend_rd_op),
        .I2(rd_data_sm_cs[0]),
        .I3(\FSM_sequential_rd_data_sm_cs[3]_i_5_n_0 ),
        .I4(rd_adv_buf24_out),
        .I5(rd_data_sm_cs[1]),
        .O(bram_en_int_i_6_n_0));
  LUT6 #(
    .INIT(64'hDFFFDFFFFFFFFF00)) 
    bram_en_int_i_7
       (.I0(brst_one),
        .I1(rd_adv_buf24_out),
        .I2(\FSM_sequential_rd_data_sm_cs[3]_i_5_n_0 ),
        .I3(rd_data_sm_cs[0]),
        .I4(ar_active_re),
        .I5(rd_data_sm_cs[1]),
        .O(bram_en_int_i_7_n_0));
  FDRE #(
    .INIT(1'b0)) 
    bram_en_int_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(bram_en_int_i_1_n_0),
        .Q(p_7_in),
        .R(SR));
  LUT4 #(
    .INIT(16'h08FB)) 
    \brst_cnt[0]_i_1 
       (.I0(s_axi_arlen[0]),
        .I1(p_0_out),
        .I2(ar_active_d1),
        .I3(brst_cnt[0]),
        .O(\brst_cnt[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h9999F099)) 
    \brst_cnt[1]_i_1 
       (.I0(brst_cnt[0]),
        .I1(brst_cnt[1]),
        .I2(s_axi_arlen[1]),
        .I3(p_0_out),
        .I4(ar_active_d1),
        .O(\brst_cnt[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFB08FB08FB0808FB)) 
    \brst_cnt[2]_i_1 
       (.I0(s_axi_arlen[2]),
        .I1(p_0_out),
        .I2(ar_active_d1),
        .I3(brst_cnt[2]),
        .I4(brst_cnt[1]),
        .I5(brst_cnt[0]),
        .O(\brst_cnt[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFE010000FE01)) 
    \brst_cnt[3]_i_1 
       (.I0(brst_cnt[0]),
        .I1(brst_cnt[1]),
        .I2(brst_cnt[2]),
        .I3(brst_cnt[3]),
        .I4(ar_active_re),
        .I5(s_axi_arlen[3]),
        .O(\brst_cnt[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h99F99909)) 
    \brst_cnt[4]_i_1 
       (.I0(brst_cnt[4]),
        .I1(\brst_cnt[5]_i_2_n_0 ),
        .I2(p_0_out),
        .I3(ar_active_d1),
        .I4(s_axi_arlen[4]),
        .O(\brst_cnt[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE1E1FFE1E1E100E1)) 
    \brst_cnt[5]_i_1 
       (.I0(brst_cnt[4]),
        .I1(\brst_cnt[5]_i_2_n_0 ),
        .I2(brst_cnt[5]),
        .I3(p_0_out),
        .I4(ar_active_d1),
        .I5(s_axi_arlen[5]),
        .O(\brst_cnt[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \brst_cnt[5]_i_2 
       (.I0(brst_cnt[3]),
        .I1(brst_cnt[2]),
        .I2(brst_cnt[1]),
        .I3(brst_cnt[0]),
        .O(\brst_cnt[5]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h66F66606)) 
    \brst_cnt[6]_i_1 
       (.I0(brst_cnt[6]),
        .I1(\brst_cnt[7]_i_3_n_0 ),
        .I2(p_0_out),
        .I3(ar_active_d1),
        .I4(s_axi_arlen[6]),
        .O(\brst_cnt[6]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hBA)) 
    \brst_cnt[7]_i_1 
       (.I0(bram_addr_inc),
        .I1(ar_active_d1),
        .I2(p_0_out),
        .O(\brst_cnt[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h9A9AFF9A9A9A009A)) 
    \brst_cnt[7]_i_2 
       (.I0(brst_cnt[7]),
        .I1(brst_cnt[6]),
        .I2(\brst_cnt[7]_i_3_n_0 ),
        .I3(p_0_out),
        .I4(ar_active_d1),
        .I5(s_axi_arlen[7]),
        .O(\brst_cnt[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \brst_cnt[7]_i_3 
       (.I0(brst_cnt[5]),
        .I1(brst_cnt[3]),
        .I2(brst_cnt[2]),
        .I3(brst_cnt[1]),
        .I4(brst_cnt[0]),
        .I5(brst_cnt[4]),
        .O(\brst_cnt[7]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    brst_cnt_max_d1_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(brst_cnt_max),
        .Q(brst_cnt_max_d1),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \brst_cnt_reg[0] 
       (.C(s_axi_aclk),
        .CE(\brst_cnt[7]_i_1_n_0 ),
        .D(\brst_cnt[0]_i_1_n_0 ),
        .Q(brst_cnt[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \brst_cnt_reg[1] 
       (.C(s_axi_aclk),
        .CE(\brst_cnt[7]_i_1_n_0 ),
        .D(\brst_cnt[1]_i_1_n_0 ),
        .Q(brst_cnt[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \brst_cnt_reg[2] 
       (.C(s_axi_aclk),
        .CE(\brst_cnt[7]_i_1_n_0 ),
        .D(\brst_cnt[2]_i_1_n_0 ),
        .Q(brst_cnt[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \brst_cnt_reg[3] 
       (.C(s_axi_aclk),
        .CE(\brst_cnt[7]_i_1_n_0 ),
        .D(\brst_cnt[3]_i_1_n_0 ),
        .Q(brst_cnt[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \brst_cnt_reg[4] 
       (.C(s_axi_aclk),
        .CE(\brst_cnt[7]_i_1_n_0 ),
        .D(\brst_cnt[4]_i_1_n_0 ),
        .Q(brst_cnt[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \brst_cnt_reg[5] 
       (.C(s_axi_aclk),
        .CE(\brst_cnt[7]_i_1_n_0 ),
        .D(\brst_cnt[5]_i_1_n_0 ),
        .Q(brst_cnt[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \brst_cnt_reg[6] 
       (.C(s_axi_aclk),
        .CE(\brst_cnt[7]_i_1_n_0 ),
        .D(\brst_cnt[6]_i_1_n_0 ),
        .Q(brst_cnt[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \brst_cnt_reg[7] 
       (.C(s_axi_aclk),
        .CE(\brst_cnt[7]_i_1_n_0 ),
        .D(\brst_cnt[7]_i_2_n_0 ),
        .Q(brst_cnt[7]),
        .R(SR));
  LUT6 #(
    .INIT(64'h00000000DDD80000)) 
    brst_one_i_1
       (.I0(ar_active_re),
        .I1(axi_rd_burst_two),
        .I2(brst_one),
        .I3(brst_one_i_2_n_0),
        .I4(s_axi_aresetn),
        .I5(last_bram_addr_i_4_n_0),
        .O(brst_one_i_1_n_0));
  LUT6 #(
    .INIT(64'h0040000000000000)) 
    brst_one_i_2
       (.I0(brst_cnt[0]),
        .I1(brst_cnt[1]),
        .I2(last_bram_addr_i_6_n_0),
        .I3(rd_data_sm_cs[3]),
        .I4(I_WRAP_BRST_n_9),
        .I5(last_bram_addr_i_7_n_0),
        .O(brst_one_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    brst_one_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(brst_one_i_1_n_0),
        .Q(brst_one),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hA8A8A8A8A800A8A8)) 
    brst_zero_i_1
       (.I0(s_axi_aresetn),
        .I1(last_bram_addr_i_4_n_0),
        .I2(brst_zero),
        .I3(brst_zero_i_2_n_0),
        .I4(p_0_out),
        .I5(ar_active_d1),
        .O(brst_zero_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h00010000)) 
    brst_zero_i_2
       (.I0(s_axi_arlen[2]),
        .I1(s_axi_arlen[3]),
        .I2(s_axi_arlen[0]),
        .I3(s_axi_arlen[1]),
        .I4(axi_rd_burst_reg_0),
        .O(brst_zero_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    brst_zero_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(brst_zero_i_1_n_0),
        .Q(brst_zero),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT2 #(
    .INIT(4'h1)) 
    curr_fixed_burst_reg_i_1__0
       (.I0(s_axi_arburst[0]),
        .I1(s_axi_arburst[1]),
        .O(curr_fixed_burst));
  FDRE #(
    .INIT(1'b0)) 
    curr_fixed_burst_reg_reg
       (.C(s_axi_aclk),
        .CE(ar_active_re),
        .D(curr_fixed_burst),
        .Q(curr_fixed_burst_reg_0),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT2 #(
    .INIT(4'h2)) 
    curr_wrap_burst_reg_i_1__0
       (.I0(s_axi_arburst[1]),
        .I1(s_axi_arburst[0]),
        .O(curr_wrap_burst_reg_i_1__0_n_0));
  FDRE #(
    .INIT(1'b0)) 
    curr_wrap_burst_reg_reg
       (.C(s_axi_aclk),
        .CE(ar_active_re),
        .D(curr_wrap_burst_reg_i_1__0_n_0),
        .Q(curr_wrap_burst_reg),
        .R(SR));
  LUT6 #(
    .INIT(64'h0000000022E2E2E2)) 
    disable_b2b_brst_i_1
       (.I0(disable_b2b_brst_i_2_n_0),
        .I1(rd_data_sm_cs[2]),
        .I2(disable_b2b_brst),
        .I3(rd_data_sm_cs[0]),
        .I4(rd_data_sm_cs[1]),
        .I5(rd_data_sm_cs[3]),
        .O(disable_b2b_brst_cmb));
  LUT6 #(
    .INIT(64'hB8BBFFFFB8BB0000)) 
    disable_b2b_brst_i_2
       (.I0(disable_b2b_brst_i_3_n_0),
        .I1(rd_data_sm_cs[1]),
        .I2(axi_rd_burst_two_reg_n_0),
        .I3(axi_rd_burst),
        .I4(rd_data_sm_cs[0]),
        .I5(disable_b2b_brst),
        .O(disable_b2b_brst_i_2_n_0));
  LUT6 #(
    .INIT(64'hAAAAFFFEFFFEFFFE)) 
    disable_b2b_brst_i_3
       (.I0(disable_b2b_brst),
        .I1(brst_one),
        .I2(end_brst_rd),
        .I3(brst_zero),
        .I4(s_axi_rready),
        .I5(s_axi_rvalid),
        .O(disable_b2b_brst_i_3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    disable_b2b_brst_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(disable_b2b_brst_cmb),
        .Q(disable_b2b_brst),
        .R(SR));
  LUT6 #(
    .INIT(64'hFFFFFFAB00005000)) 
    end_brst_rd_clr_i_1
       (.I0(rd_data_sm_cs[1]),
        .I1(ar_active_re),
        .I2(rd_data_sm_cs[0]),
        .I3(rd_data_sm_cs[2]),
        .I4(rd_data_sm_cs[3]),
        .I5(end_brst_rd_clr),
        .O(end_brst_rd_clr_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    end_brst_rd_clr_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(end_brst_rd_clr_i_1_n_0),
        .Q(end_brst_rd_clr),
        .R(SR));
  LUT5 #(
    .INIT(32'h00AA2020)) 
    end_brst_rd_i_1
       (.I0(s_axi_aresetn),
        .I1(brst_cnt_max_d1),
        .I2(brst_cnt_max),
        .I3(end_brst_rd_clr),
        .I4(end_brst_rd),
        .O(end_brst_rd_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    end_brst_rd_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(end_brst_rd_i_1_n_0),
        .Q(end_brst_rd),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFFFFFE2222222)) 
    last_bram_addr_i_1
       (.I0(last_bram_addr_i_2_n_0),
        .I1(rd_data_sm_cs[3]),
        .I2(p_0_in4_in),
        .I3(rd_adv_buf24_out),
        .I4(last_bram_addr_i_3_n_0),
        .I5(last_bram_addr_i_4_n_0),
        .O(last_bram_addr0));
  LUT6 #(
    .INIT(64'h8003800080008000)) 
    last_bram_addr_i_2
       (.I0(set_last_bram_addr3_out),
        .I1(rd_data_sm_cs[2]),
        .I2(rd_data_sm_cs[0]),
        .I3(rd_data_sm_cs[1]),
        .I4(ar_active_re),
        .I5(brst_zero_i_2_n_0),
        .O(last_bram_addr_i_2_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    last_bram_addr_i_3
       (.I0(rd_data_sm_cs[0]),
        .I1(rd_data_sm_cs[1]),
        .I2(rd_data_sm_cs[2]),
        .O(last_bram_addr_i_3_n_0));
  LUT6 #(
    .INIT(64'h0040000000000000)) 
    last_bram_addr_i_4
       (.I0(brst_cnt[1]),
        .I1(brst_cnt[0]),
        .I2(last_bram_addr_i_6_n_0),
        .I3(rd_data_sm_cs[3]),
        .I4(I_WRAP_BRST_n_9),
        .I5(last_bram_addr_i_7_n_0),
        .O(last_bram_addr_i_4_n_0));
  LUT6 #(
    .INIT(64'h80F0800080008000)) 
    last_bram_addr_i_5
       (.I0(axi_rd_burst_reg_0),
        .I1(last_bram_addr_i_8_n_0),
        .I2(rd_adv_buf24_out),
        .I3(ar_active_re),
        .I4(pend_rd_op),
        .I5(p_0_in4_in),
        .O(set_last_bram_addr3_out));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h1)) 
    last_bram_addr_i_6
       (.I0(brst_cnt[2]),
        .I1(brst_cnt[3]),
        .O(last_bram_addr_i_6_n_0));
  LUT4 #(
    .INIT(16'h0001)) 
    last_bram_addr_i_7
       (.I0(brst_cnt[7]),
        .I1(brst_cnt[6]),
        .I2(brst_cnt[5]),
        .I3(brst_cnt[4]),
        .O(last_bram_addr_i_7_n_0));
  LUT4 #(
    .INIT(16'h0001)) 
    last_bram_addr_i_8
       (.I0(s_axi_arlen[1]),
        .I1(s_axi_arlen[0]),
        .I2(s_axi_arlen[3]),
        .I3(s_axi_arlen[2]),
        .O(last_bram_addr_i_8_n_0));
  FDRE #(
    .INIT(1'b0)) 
    last_bram_addr_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(last_bram_addr0),
        .Q(last_bram_addr),
        .R(SR));
  LUT6 #(
    .INIT(64'hFFFFABFB0000A808)) 
    pend_rd_op_i_1
       (.I0(pend_rd_op_i_2_n_0),
        .I1(pend_rd_op_i_3_n_0),
        .I2(rd_data_sm_cs[2]),
        .I3(pend_rd_op_i_4_n_0),
        .I4(rd_data_sm_cs[3]),
        .I5(pend_rd_op),
        .O(pend_rd_op_i_1_n_0));
  LUT6 #(
    .INIT(64'h000000000808080C)) 
    pend_rd_op_i_2
       (.I0(rd_data_sm_cs[2]),
        .I1(p_0_out),
        .I2(ar_active_d1),
        .I3(axi_rd_burst),
        .I4(axi_rd_burst_two_reg_n_0),
        .I5(rd_data_sm_cs[1]),
        .O(pend_rd_op_i_2_n_0));
  LUT6 #(
    .INIT(64'h5555000400000000)) 
    pend_rd_op_i_3
       (.I0(rd_data_sm_cs[1]),
        .I1(ar_active_re),
        .I2(axi_rd_burst),
        .I3(axi_rd_burst_two_reg_n_0),
        .I4(pend_rd_op),
        .I5(rd_data_sm_cs[0]),
        .O(pend_rd_op_i_3_n_0));
  LUT6 #(
    .INIT(64'h8800880033303030)) 
    pend_rd_op_i_4
       (.I0(rd_adv_buf24_out),
        .I1(rd_data_sm_cs[0]),
        .I2(ar_active_re),
        .I3(pend_rd_op),
        .I4(s_axi_rlast),
        .I5(rd_data_sm_cs[1]),
        .O(pend_rd_op_i_4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    pend_rd_op_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(pend_rd_op_i_1_n_0),
        .Q(pend_rd_op),
        .R(SR));
  LUT6 #(
    .INIT(64'h0000000040555500)) 
    rd_skid_buf_ld_reg_i_1
       (.I0(rd_data_sm_cs[2]),
        .I1(s_axi_rready),
        .I2(s_axi_rvalid),
        .I3(rd_data_sm_cs[0]),
        .I4(rd_data_sm_cs[1]),
        .I5(rd_data_sm_cs[3]),
        .O(rd_skid_buf_ld_cmb));
  FDRE #(
    .INIT(1'b0)) 
    rd_skid_buf_ld_reg_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(rd_skid_buf_ld_cmb),
        .Q(rd_skid_buf_ld_reg),
        .R(SR));
  LUT4 #(
    .INIT(16'hFB08)) 
    rddata_mux_sel_i_1
       (.I0(rddata_mux_sel_i_2_n_0),
        .I1(rddata_mux_sel_i_3_n_0),
        .I2(rd_data_sm_cs[3]),
        .I3(rddata_mux_sel),
        .O(rddata_mux_sel_i_1_n_0));
  LUT6 #(
    .INIT(64'h10FF10F0F000F000)) 
    rddata_mux_sel_i_2
       (.I0(act_rd_burst_two),
        .I1(act_rd_burst),
        .I2(rd_data_sm_cs[2]),
        .I3(rd_adv_buf24_out),
        .I4(rd_data_sm_cs[1]),
        .I5(rd_data_sm_cs[0]),
        .O(rddata_mux_sel_i_2_n_0));
  LUT6 #(
    .INIT(64'h0FFF0FFF8F808080)) 
    rddata_mux_sel_i_3
       (.I0(s_axi_rready),
        .I1(s_axi_rvalid),
        .I2(rd_data_sm_cs[2]),
        .I3(rd_data_sm_cs[1]),
        .I4(axi_rd_burst_two_reg_n_0),
        .I5(rd_data_sm_cs[0]),
        .O(rddata_mux_sel_i_3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    rddata_mux_sel_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(rddata_mux_sel_i_1_n_0),
        .Q(rddata_mux_sel),
        .R(SR));
endmodule

(* ORIG_REF_NAME = "sng_port_arb" *) 
module bd_design_axi_bram_ctrl_0_0_sng_port_arb
   (s_axi_awready,
    s_axi_arready,
    p_0_out,
    p_1_out,
    D,
    aw_active_re,
    act_rd_burst_reg,
    ar_active_re,
    bram_we_a,
    SR,
    s_axi_aclk,
    BRAM_Addr_A,
    s_axi_araddr,
    \FSM_sequential_rd_data_sm_cs_reg[3] ,
    sng_bram_addr_ld_en,
    s_axi_awaddr,
    aw_active_d1_reg,
    aw_active_d1,
    \s_axi_arlen[6] ,
    s_axi_arlen,
    ar_active_d1,
    \bvalid_cnt_reg[0] ,
    \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[0] ,
    axi_rlast_int_reg,
    s_axi_arvalid,
    s_axi_awvalid,
    axi_rlast_int_reg_0,
    s_axi_rready,
    Q);
  output s_axi_awready;
  output s_axi_arready;
  output p_0_out;
  output p_1_out;
  output [0:0]D;
  output aw_active_re;
  output act_rd_burst_reg;
  output ar_active_re;
  output [7:0]bram_we_a;
  input [0:0]SR;
  input s_axi_aclk;
  input [0:0]BRAM_Addr_A;
  input [0:0]s_axi_araddr;
  input \FSM_sequential_rd_data_sm_cs_reg[3] ;
  input sng_bram_addr_ld_en;
  input [0:0]s_axi_awaddr;
  input aw_active_d1_reg;
  input aw_active_d1;
  input \s_axi_arlen[6] ;
  input [3:0]s_axi_arlen;
  input ar_active_d1;
  input \bvalid_cnt_reg[0] ;
  input \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[0] ;
  input axi_rlast_int_reg;
  input s_axi_arvalid;
  input s_axi_awvalid;
  input axi_rlast_int_reg_0;
  input s_axi_rready;
  input [7:0]Q;

  wire \ADDR_SNG_PORT.bram_addr_int[3]_i_3_n_0 ;
  wire [0:0]BRAM_Addr_A;
  wire [0:0]D;
  wire \FSM_sequential_rd_data_sm_cs_reg[3] ;
  wire \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[0] ;
  wire [7:0]Q;
  wire [0:0]SR;
  wire act_rd_burst_reg;
  wire ar_active_cmb;
  wire ar_active_d1;
  wire ar_active_i_1_n_0;
  wire ar_active_re;
  wire [1:0]arb_sm_cs;
  wire \arb_sm_cs[1]_i_1_n_0 ;
  wire \arb_sm_cs[1]_i_4_n_0 ;
  wire [1:0]arb_sm_ns;
  wire aw_active_d1;
  wire aw_active_d1_reg;
  wire aw_active_i_1_n_0;
  wire aw_active_re;
  wire axi_arready_cmb;
  wire axi_arready_int_i_2_n_0;
  wire axi_awready_cmb;
  wire axi_rlast_int_reg;
  wire axi_rlast_int_reg_0;
  wire [7:0]bram_we_a;
  wire \bvalid_cnt_reg[0] ;
  wire last_arb_won;
  wire last_arb_won_i_1_n_0;
  wire last_arb_won_i_2_n_0;
  wire p_0_out;
  wire p_1_out;
  wire s_axi_aclk;
  wire [0:0]s_axi_araddr;
  wire [3:0]s_axi_arlen;
  wire \s_axi_arlen[6] ;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [0:0]s_axi_awaddr;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire s_axi_rready;
  wire sng_bram_addr_ld_en;

  LUT6 #(
    .INIT(64'hFFFF00C055555555)) 
    \ADDR_SNG_PORT.bram_addr_int[3]_i_1 
       (.I0(BRAM_Addr_A),
        .I1(s_axi_araddr),
        .I2(p_0_out),
        .I3(\FSM_sequential_rd_data_sm_cs_reg[3] ),
        .I4(\ADDR_SNG_PORT.bram_addr_int[3]_i_3_n_0 ),
        .I5(sng_bram_addr_ld_en),
        .O(D));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \ADDR_SNG_PORT.bram_addr_int[3]_i_3 
       (.I0(p_0_out),
        .I1(s_axi_awaddr),
        .I2(aw_active_d1_reg),
        .O(\ADDR_SNG_PORT.bram_addr_int[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA2)) 
    act_rd_burst_two_i_6
       (.I0(ar_active_re),
        .I1(\s_axi_arlen[6] ),
        .I2(s_axi_arlen[1]),
        .I3(s_axi_arlen[0]),
        .I4(s_axi_arlen[3]),
        .I5(s_axi_arlen[2]),
        .O(act_rd_burst_reg));
  LUT6 #(
    .INIT(64'hBBABBBBB88A88888)) 
    ar_active_i_1
       (.I0(ar_active_cmb),
        .I1(axi_arready_int_i_2_n_0),
        .I2(axi_rlast_int_reg),
        .I3(arb_sm_cs[1]),
        .I4(arb_sm_cs[0]),
        .I5(p_0_out),
        .O(ar_active_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hBB00BF00)) 
    ar_active_i_2
       (.I0(arb_sm_cs[1]),
        .I1(s_axi_awvalid),
        .I2(arb_sm_cs[0]),
        .I3(s_axi_arvalid),
        .I4(last_arb_won),
        .O(ar_active_cmb));
  FDRE #(
    .INIT(1'b0)) 
    ar_active_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(ar_active_i_1_n_0),
        .Q(p_0_out),
        .R(SR));
  LUT5 #(
    .INIT(32'h1B001F00)) 
    \arb_sm_cs[0]_i_1 
       (.I0(arb_sm_cs[1]),
        .I1(s_axi_awvalid),
        .I2(arb_sm_cs[0]),
        .I3(s_axi_arvalid),
        .I4(last_arb_won),
        .O(arb_sm_ns[0]));
  LUT6 #(
    .INIT(64'hFFFFFFF0FCFCF5F5)) 
    \arb_sm_cs[1]_i_1 
       (.I0(\bvalid_cnt_reg[0] ),
        .I1(\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[0] ),
        .I2(\arb_sm_cs[1]_i_4_n_0 ),
        .I3(axi_rlast_int_reg),
        .I4(arb_sm_cs[1]),
        .I5(arb_sm_cs[0]),
        .O(\arb_sm_cs[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h1111505511110055)) 
    \arb_sm_cs[1]_i_2 
       (.I0(arb_sm_cs[1]),
        .I1(\bvalid_cnt_reg[0] ),
        .I2(last_arb_won),
        .I3(s_axi_arvalid),
        .I4(arb_sm_cs[0]),
        .I5(s_axi_awvalid),
        .O(arb_sm_ns[1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h0000040C)) 
    \arb_sm_cs[1]_i_4 
       (.I0(last_arb_won),
        .I1(s_axi_arvalid),
        .I2(arb_sm_cs[0]),
        .I3(s_axi_awvalid),
        .I4(arb_sm_cs[1]),
        .O(\arb_sm_cs[1]_i_4_n_0 ));
  FDRE \arb_sm_cs_reg[0] 
       (.C(s_axi_aclk),
        .CE(\arb_sm_cs[1]_i_1_n_0 ),
        .D(arb_sm_ns[0]),
        .Q(arb_sm_cs[0]),
        .R(SR));
  FDRE \arb_sm_cs_reg[1] 
       (.C(s_axi_aclk),
        .CE(\arb_sm_cs[1]_i_1_n_0 ),
        .D(arb_sm_ns[1]),
        .Q(arb_sm_cs[1]),
        .R(SR));
  LUT6 #(
    .INIT(64'h0505FF3F05050000)) 
    aw_active_i_1
       (.I0(\bvalid_cnt_reg[0] ),
        .I1(\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[0] ),
        .I2(arb_sm_cs[1]),
        .I3(arb_sm_cs[0]),
        .I4(axi_awready_cmb),
        .I5(p_1_out),
        .O(aw_active_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    aw_active_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(aw_active_i_1_n_0),
        .Q(p_1_out),
        .R(SR));
  LUT6 #(
    .INIT(64'hAAAAAEAAAAAAAAAA)) 
    axi_arready_int_i_1
       (.I0(axi_arready_int_i_2_n_0),
        .I1(arb_sm_cs[0]),
        .I2(arb_sm_cs[1]),
        .I3(s_axi_arvalid),
        .I4(s_axi_awvalid),
        .I5(axi_rlast_int_reg),
        .O(axi_arready_cmb));
  LUT6 #(
    .INIT(64'h0F00070700000000)) 
    axi_arready_int_i_2
       (.I0(s_axi_awvalid),
        .I1(last_arb_won),
        .I2(arb_sm_cs[0]),
        .I3(\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[0] ),
        .I4(arb_sm_cs[1]),
        .I5(s_axi_arvalid),
        .O(axi_arready_int_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    axi_arready_int_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_arready_cmb),
        .Q(s_axi_arready),
        .R(SR));
  LUT6 #(
    .INIT(64'h0000000000F000DD)) 
    axi_awready_int_i_1
       (.I0(s_axi_arvalid),
        .I1(last_arb_won),
        .I2(axi_rlast_int_reg),
        .I3(\bvalid_cnt_reg[0] ),
        .I4(arb_sm_cs[0]),
        .I5(arb_sm_cs[1]),
        .O(axi_awready_cmb));
  FDRE #(
    .INIT(1'b0)) 
    axi_awready_int_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_awready_cmb),
        .Q(s_axi_awready),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \bram_we_a[0]_INST_0 
       (.I0(p_1_out),
        .I1(Q[0]),
        .O(bram_we_a[0]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \bram_we_a[1]_INST_0 
       (.I0(p_1_out),
        .I1(Q[1]),
        .O(bram_we_a[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \bram_we_a[2]_INST_0 
       (.I0(p_1_out),
        .I1(Q[2]),
        .O(bram_we_a[2]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \bram_we_a[3]_INST_0 
       (.I0(p_1_out),
        .I1(Q[3]),
        .O(bram_we_a[3]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \bram_we_a[4]_INST_0 
       (.I0(p_1_out),
        .I1(Q[4]),
        .O(bram_we_a[4]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \bram_we_a[5]_INST_0 
       (.I0(p_1_out),
        .I1(Q[5]),
        .O(bram_we_a[5]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \bram_we_a[6]_INST_0 
       (.I0(p_1_out),
        .I1(Q[6]),
        .O(bram_we_a[6]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \bram_we_a[7]_INST_0 
       (.I0(p_1_out),
        .I1(Q[7]),
        .O(bram_we_a[7]));
  LUT4 #(
    .INIT(16'hABA8)) 
    last_arb_won_i_1
       (.I0(ar_active_cmb),
        .I1(axi_arready_cmb),
        .I2(last_arb_won_i_2_n_0),
        .I3(last_arb_won),
        .O(last_arb_won_i_1_n_0));
  LUT5 #(
    .INIT(32'h0000080F)) 
    last_arb_won_i_2
       (.I0(axi_rlast_int_reg_0),
        .I1(s_axi_rready),
        .I2(\bvalid_cnt_reg[0] ),
        .I3(arb_sm_cs[0]),
        .I4(arb_sm_cs[1]),
        .O(last_arb_won_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    last_arb_won_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(last_arb_won_i_1_n_0),
        .Q(last_arb_won),
        .R(SR));
  LUT2 #(
    .INIT(4'h2)) 
    \save_init_bram_addr_ld[12]_i_1 
       (.I0(p_1_out),
        .I1(aw_active_d1),
        .O(aw_active_re));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \save_init_bram_addr_ld[12]_i_1__0 
       (.I0(p_0_out),
        .I1(ar_active_d1),
        .O(ar_active_re));
endmodule

(* ORIG_REF_NAME = "wr_chnl" *) 
module bd_design_axi_bram_ctrl_0_0_wr_chnl
   (aw_active_d1,
    WrChnl_BRAM_Addr_Rst,
    curr_fixed_burst_reg,
    bram_wrdata_a,
    s_axi_wready,
    s_axi_bvalid,
    s_axi_bid,
    \ADDR_SNG_PORT.bram_addr_int_reg[11] ,
    \ADDR_SNG_PORT.bram_addr_int_reg[11]_0 ,
    D,
    \save_init_bram_addr_ld_reg[12] ,
    aw_active_reg,
    aw_active_reg_0,
    bram_en_a,
    \bram_we_a[7] ,
    SR,
    s_axi_aclk,
    s_axi_awid,
    p_1_out,
    aw_active_re,
    s_axi_wdata,
    s_axi_wvalid,
    s_axi_awburst,
    \ADDR_SNG_PORT.bram_addr_int_reg[6] ,
    s_axi_wlast,
    s_axi_bready,
    s_axi_aresetn,
    s_axi_awaddr,
    Q,
    s_axi_awvalid,
    p_7_in,
    s_axi_wstrb,
    s_axi_awlen);
  output aw_active_d1;
  output WrChnl_BRAM_Addr_Rst;
  output curr_fixed_burst_reg;
  output [63:0]bram_wrdata_a;
  output s_axi_wready;
  output s_axi_bvalid;
  output [0:0]s_axi_bid;
  output \ADDR_SNG_PORT.bram_addr_int_reg[11] ;
  output \ADDR_SNG_PORT.bram_addr_int_reg[11]_0 ;
  output [8:0]D;
  output \save_init_bram_addr_ld_reg[12] ;
  output aw_active_reg;
  output aw_active_reg_0;
  output bram_en_a;
  output [7:0]\bram_we_a[7] ;
  input [0:0]SR;
  input s_axi_aclk;
  input [0:0]s_axi_awid;
  input p_1_out;
  input aw_active_re;
  input [63:0]s_axi_wdata;
  input s_axi_wvalid;
  input [1:0]s_axi_awburst;
  input \ADDR_SNG_PORT.bram_addr_int_reg[6] ;
  input s_axi_wlast;
  input s_axi_bready;
  input s_axi_aresetn;
  input [8:0]s_axi_awaddr;
  input [2:0]Q;
  input s_axi_awvalid;
  input p_7_in;
  input [7:0]s_axi_wstrb;
  input [3:0]s_axi_awlen;

  wire \ADDR_SNG_PORT.bram_addr_int_reg[11] ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[11]_0 ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[6] ;
  wire [2:0]AW2Arb_BVALID_Cnt;
  wire BID_FIFO_n_2;
  wire [8:0]D;
  wire \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs[1]_i_1_n_0 ;
  wire [2:0]Q;
  wire [0:0]SR;
  wire WrChnl_BRAM_Addr_Rst;
  wire aw_active_d1;
  wire aw_active_re;
  wire aw_active_reg;
  wire aw_active_reg_0;
  wire axi_bvalid_int_i_1_n_0;
  wire axi_bvalid_int_i_2_n_0;
  wire axi_wdata_full_cmb;
  wire axi_wdata_full_reg;
  wire axi_wr_burst;
  wire axi_wr_burst_i_1_n_0;
  wire axi_wr_burst_i_2_n_0;
  wire axi_wready_int_mod_i_1_n_0;
  wire bid_gets_fifo_load;
  wire bid_gets_fifo_load_d1;
  wire bram_en_a;
  wire bram_en_cmb;
  wire [7:0]\bram_we_a[7] ;
  wire [63:0]bram_wrdata_a;
  wire \bvalid_cnt[0]_i_1_n_0 ;
  wire \bvalid_cnt[1]_i_1_n_0 ;
  wire \bvalid_cnt[2]_i_1_n_0 ;
  wire \bvalid_cnt[2]_i_2_n_0 ;
  wire bvalid_cnt_inc;
  wire clr_bram_we;
  wire curr_fixed_burst;
  wire curr_fixed_burst_reg;
  wire curr_wrap_burst_reg;
  wire curr_wrap_burst_reg_i_1_n_0;
  wire p_1_out;
  wire p_2_out;
  wire p_7_in;
  wire p_8_in;
  wire s_axi_aclk;
  wire s_axi_aresetn;
  wire [8:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [0:0]s_axi_awid;
  wire [3:0]s_axi_awlen;
  wire s_axi_awvalid;
  wire [0:0]s_axi_bid;
  wire s_axi_bready;
  wire s_axi_bvalid;
  wire [63:0]s_axi_wdata;
  wire s_axi_wlast;
  wire s_axi_wready;
  wire [7:0]s_axi_wstrb;
  wire s_axi_wvalid;
  wire \save_init_bram_addr_ld_reg[12] ;
  wire [1:0]wr_data_sng_sm_cs;
  wire [1:0]wr_data_sng_sm_ns;
  wire wrdata_reg_ld;

  LUT4 #(
    .INIT(16'h02FF)) 
    \ADDR_SNG_PORT.bram_addr_int[11]_i_1 
       (.I0(wr_data_sng_sm_cs[0]),
        .I1(wr_data_sng_sm_cs[1]),
        .I2(aw_active_re),
        .I3(s_axi_aresetn),
        .O(WrChnl_BRAM_Addr_Rst));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \ADDR_SNG_PORT.bram_addr_int[11]_i_4 
       (.I0(wr_data_sng_sm_cs[1]),
        .I1(s_axi_wvalid),
        .I2(wr_data_sng_sm_cs[0]),
        .O(\ADDR_SNG_PORT.bram_addr_int_reg[11] ));
  bd_design_axi_bram_ctrl_0_0_SRL_FIFO BID_FIFO
       (.Q(wr_data_sng_sm_cs),
        .SR(SR),
        .aw_active_d1_reg(aw_active_d1),
        .aw_active_re(aw_active_re),
        .\axi_bid_int_reg[0] (BID_FIFO_n_2),
        .axi_bvalid_int_reg(s_axi_bvalid),
        .axi_wdata_full_reg(axi_wdata_full_reg),
        .axi_wr_burst(axi_wr_burst),
        .bid_gets_fifo_load(bid_gets_fifo_load),
        .bid_gets_fifo_load_d1(bid_gets_fifo_load_d1),
        .bvalid_cnt_inc(bvalid_cnt_inc),
        .\bvalid_cnt_reg[2] (AW2Arb_BVALID_Cnt),
        .p_1_out(p_1_out),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_awid(s_axi_awid),
        .s_axi_bid(s_axi_bid),
        .s_axi_bready(s_axi_bready),
        .s_axi_wlast(s_axi_wlast),
        .s_axi_wvalid(s_axi_wvalid));
  LUT5 #(
    .INIT(32'hE4A0F5B0)) 
    \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.axi_wdata_full_reg_i_1 
       (.I0(wr_data_sng_sm_cs[1]),
        .I1(wr_data_sng_sm_cs[0]),
        .I2(axi_wdata_full_reg),
        .I3(s_axi_wvalid),
        .I4(p_1_out),
        .O(axi_wdata_full_cmb));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.axi_wdata_full_reg_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_wdata_full_cmb),
        .Q(axi_wdata_full_reg),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT5 #(
    .INIT(32'h0F000A08)) 
    \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.bram_en_int_i_1 
       (.I0(p_1_out),
        .I1(axi_wdata_full_reg),
        .I2(wr_data_sng_sm_cs[0]),
        .I3(s_axi_wvalid),
        .I4(wr_data_sng_sm_cs[1]),
        .O(bram_en_cmb));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.bram_en_int_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(bram_en_cmb),
        .Q(p_8_in),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.clr_bram_we_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(bvalid_cnt_inc),
        .Q(clr_bram_we),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT5 #(
    .INIT(32'h00FF0074)) 
    \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs[0]_i_1 
       (.I0(axi_wr_burst),
        .I1(axi_wdata_full_reg),
        .I2(s_axi_wlast),
        .I3(wr_data_sng_sm_cs[0]),
        .I4(wr_data_sng_sm_cs[1]),
        .O(wr_data_sng_sm_ns[0]));
  LUT6 #(
    .INIT(64'hECECECECFFFCCCCC)) 
    \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs[1]_i_1 
       (.I0(s_axi_wlast),
        .I1(wr_data_sng_sm_cs[0]),
        .I2(s_axi_wvalid),
        .I3(axi_wdata_full_reg),
        .I4(p_1_out),
        .I5(wr_data_sng_sm_cs[1]),
        .O(\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h000000D1)) 
    \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs[1]_i_2 
       (.I0(s_axi_wlast),
        .I1(axi_wdata_full_reg),
        .I2(axi_wr_burst),
        .I3(wr_data_sng_sm_cs[0]),
        .I4(wr_data_sng_sm_cs[1]),
        .O(wr_data_sng_sm_ns[1]));
  FDRE \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[0] 
       (.C(s_axi_aclk),
        .CE(\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs[1]_i_1_n_0 ),
        .D(wr_data_sng_sm_ns[0]),
        .Q(wr_data_sng_sm_cs[0]),
        .R(SR));
  FDRE \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[1] 
       (.C(s_axi_aclk),
        .CE(\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs[1]_i_1_n_0 ),
        .D(wr_data_sng_sm_ns[1]),
        .Q(wr_data_sng_sm_cs[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[0].bram_wrdata_int_reg[0] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[0]),
        .Q(bram_wrdata_a[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[10].bram_wrdata_int_reg[10] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[10]),
        .Q(bram_wrdata_a[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[11].bram_wrdata_int_reg[11] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[11]),
        .Q(bram_wrdata_a[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[12].bram_wrdata_int_reg[12] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[12]),
        .Q(bram_wrdata_a[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[13].bram_wrdata_int_reg[13] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[13]),
        .Q(bram_wrdata_a[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[14].bram_wrdata_int_reg[14] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[14]),
        .Q(bram_wrdata_a[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[15].bram_wrdata_int_reg[15] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[15]),
        .Q(bram_wrdata_a[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[16].bram_wrdata_int_reg[16] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[16]),
        .Q(bram_wrdata_a[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[17].bram_wrdata_int_reg[17] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[17]),
        .Q(bram_wrdata_a[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[18].bram_wrdata_int_reg[18] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[18]),
        .Q(bram_wrdata_a[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[19].bram_wrdata_int_reg[19] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[19]),
        .Q(bram_wrdata_a[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[1].bram_wrdata_int_reg[1] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[1]),
        .Q(bram_wrdata_a[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[20].bram_wrdata_int_reg[20] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[20]),
        .Q(bram_wrdata_a[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[21].bram_wrdata_int_reg[21] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[21]),
        .Q(bram_wrdata_a[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[22].bram_wrdata_int_reg[22] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[22]),
        .Q(bram_wrdata_a[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[23].bram_wrdata_int_reg[23] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[23]),
        .Q(bram_wrdata_a[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[24].bram_wrdata_int_reg[24] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[24]),
        .Q(bram_wrdata_a[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[25].bram_wrdata_int_reg[25] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[25]),
        .Q(bram_wrdata_a[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[26].bram_wrdata_int_reg[26] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[26]),
        .Q(bram_wrdata_a[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[27].bram_wrdata_int_reg[27] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[27]),
        .Q(bram_wrdata_a[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[28].bram_wrdata_int_reg[28] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[28]),
        .Q(bram_wrdata_a[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[29].bram_wrdata_int_reg[29] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[29]),
        .Q(bram_wrdata_a[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[2].bram_wrdata_int_reg[2] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[2]),
        .Q(bram_wrdata_a[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[30].bram_wrdata_int_reg[30] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[30]),
        .Q(bram_wrdata_a[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[31].bram_wrdata_int_reg[31] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[31]),
        .Q(bram_wrdata_a[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[32].bram_wrdata_int_reg[32] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[32]),
        .Q(bram_wrdata_a[32]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[33].bram_wrdata_int_reg[33] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[33]),
        .Q(bram_wrdata_a[33]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[34].bram_wrdata_int_reg[34] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[34]),
        .Q(bram_wrdata_a[34]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[35].bram_wrdata_int_reg[35] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[35]),
        .Q(bram_wrdata_a[35]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[36].bram_wrdata_int_reg[36] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[36]),
        .Q(bram_wrdata_a[36]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[37].bram_wrdata_int_reg[37] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[37]),
        .Q(bram_wrdata_a[37]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[38].bram_wrdata_int_reg[38] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[38]),
        .Q(bram_wrdata_a[38]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[39].bram_wrdata_int_reg[39] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[39]),
        .Q(bram_wrdata_a[39]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[3].bram_wrdata_int_reg[3] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[3]),
        .Q(bram_wrdata_a[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[40].bram_wrdata_int_reg[40] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[40]),
        .Q(bram_wrdata_a[40]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[41].bram_wrdata_int_reg[41] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[41]),
        .Q(bram_wrdata_a[41]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[42].bram_wrdata_int_reg[42] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[42]),
        .Q(bram_wrdata_a[42]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[43].bram_wrdata_int_reg[43] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[43]),
        .Q(bram_wrdata_a[43]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[44].bram_wrdata_int_reg[44] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[44]),
        .Q(bram_wrdata_a[44]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[45].bram_wrdata_int_reg[45] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[45]),
        .Q(bram_wrdata_a[45]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[46].bram_wrdata_int_reg[46] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[46]),
        .Q(bram_wrdata_a[46]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[47].bram_wrdata_int_reg[47] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[47]),
        .Q(bram_wrdata_a[47]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[48].bram_wrdata_int_reg[48] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[48]),
        .Q(bram_wrdata_a[48]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[49].bram_wrdata_int_reg[49] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[49]),
        .Q(bram_wrdata_a[49]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[4].bram_wrdata_int_reg[4] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[4]),
        .Q(bram_wrdata_a[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[50].bram_wrdata_int_reg[50] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[50]),
        .Q(bram_wrdata_a[50]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[51].bram_wrdata_int_reg[51] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[51]),
        .Q(bram_wrdata_a[51]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[52].bram_wrdata_int_reg[52] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[52]),
        .Q(bram_wrdata_a[52]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[53].bram_wrdata_int_reg[53] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[53]),
        .Q(bram_wrdata_a[53]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[54].bram_wrdata_int_reg[54] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[54]),
        .Q(bram_wrdata_a[54]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[55].bram_wrdata_int_reg[55] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[55]),
        .Q(bram_wrdata_a[55]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[56].bram_wrdata_int_reg[56] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[56]),
        .Q(bram_wrdata_a[56]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[57].bram_wrdata_int_reg[57] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[57]),
        .Q(bram_wrdata_a[57]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[58].bram_wrdata_int_reg[58] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[58]),
        .Q(bram_wrdata_a[58]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[59].bram_wrdata_int_reg[59] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[59]),
        .Q(bram_wrdata_a[59]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[5].bram_wrdata_int_reg[5] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[5]),
        .Q(bram_wrdata_a[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[60].bram_wrdata_int_reg[60] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[60]),
        .Q(bram_wrdata_a[60]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[61].bram_wrdata_int_reg[61] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[61]),
        .Q(bram_wrdata_a[61]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[62].bram_wrdata_int_reg[62] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[62]),
        .Q(bram_wrdata_a[62]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h3D00)) 
    \GEN_WRDATA[63].bram_wrdata_int[63]_i_1 
       (.I0(axi_wdata_full_reg),
        .I1(wr_data_sng_sm_cs[0]),
        .I2(wr_data_sng_sm_cs[1]),
        .I3(s_axi_wvalid),
        .O(wrdata_reg_ld));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[63].bram_wrdata_int_reg[63] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[63]),
        .Q(bram_wrdata_a[63]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[6].bram_wrdata_int_reg[6] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[6]),
        .Q(bram_wrdata_a[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[7].bram_wrdata_int_reg[7] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[7]),
        .Q(bram_wrdata_a[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[8].bram_wrdata_int_reg[8] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[8]),
        .Q(bram_wrdata_a[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[9].bram_wrdata_int_reg[9] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[9]),
        .Q(bram_wrdata_a[9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hC2FF0000FFFFFFFF)) 
    \GEN_WR_NO_ECC.bram_we_int[7]_i_1 
       (.I0(axi_wdata_full_reg),
        .I1(wr_data_sng_sm_cs[0]),
        .I2(wr_data_sng_sm_cs[1]),
        .I3(s_axi_wvalid),
        .I4(clr_bram_we),
        .I5(s_axi_aresetn),
        .O(p_2_out));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WR_NO_ECC.bram_we_int_reg[0] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wstrb[0]),
        .Q(\bram_we_a[7] [0]),
        .R(p_2_out));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WR_NO_ECC.bram_we_int_reg[1] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wstrb[1]),
        .Q(\bram_we_a[7] [1]),
        .R(p_2_out));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WR_NO_ECC.bram_we_int_reg[2] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wstrb[2]),
        .Q(\bram_we_a[7] [2]),
        .R(p_2_out));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WR_NO_ECC.bram_we_int_reg[3] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wstrb[3]),
        .Q(\bram_we_a[7] [3]),
        .R(p_2_out));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WR_NO_ECC.bram_we_int_reg[4] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wstrb[4]),
        .Q(\bram_we_a[7] [4]),
        .R(p_2_out));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WR_NO_ECC.bram_we_int_reg[5] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wstrb[5]),
        .Q(\bram_we_a[7] [5]),
        .R(p_2_out));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WR_NO_ECC.bram_we_int_reg[6] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wstrb[6]),
        .Q(\bram_we_a[7] [6]),
        .R(p_2_out));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WR_NO_ECC.bram_we_int_reg[7] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wstrb[7]),
        .Q(\bram_we_a[7] [7]),
        .R(p_2_out));
  bd_design_axi_bram_ctrl_0_0_wrap_brst I_WRAP_BRST
       (.\ADDR_SNG_PORT.bram_addr_int_reg[11] (\ADDR_SNG_PORT.bram_addr_int_reg[11]_0 ),
        .\ADDR_SNG_PORT.bram_addr_int_reg[6] (\ADDR_SNG_PORT.bram_addr_int_reg[6] ),
        .D(D),
        .\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[1] (\ADDR_SNG_PORT.bram_addr_int_reg[11] ),
        .Q(Q),
        .SR(SR),
        .aw_active_d1(aw_active_d1),
        .aw_active_re(aw_active_re),
        .curr_wrap_burst_reg(curr_wrap_burst_reg),
        .p_1_out(p_1_out),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awlen(s_axi_awlen),
        .\save_init_bram_addr_ld_reg[12]_0 (\save_init_bram_addr_ld_reg[12] ));
  LUT2 #(
    .INIT(4'h2)) 
    \arb_sm_cs[1]_i_3 
       (.I0(wr_data_sng_sm_cs[0]),
        .I1(wr_data_sng_sm_cs[1]),
        .O(aw_active_reg));
  FDRE #(
    .INIT(1'b0)) 
    aw_active_d1_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_1_out),
        .Q(aw_active_d1),
        .R(SR));
  LUT4 #(
    .INIT(16'h80FF)) 
    axi_awready_int_i_3
       (.I0(AW2Arb_BVALID_Cnt[0]),
        .I1(AW2Arb_BVALID_Cnt[1]),
        .I2(AW2Arb_BVALID_Cnt[2]),
        .I3(s_axi_awvalid),
        .O(aw_active_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_bid_int_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(BID_FIFO_n_2),
        .Q(s_axi_bid),
        .R(SR));
  LUT6 #(
    .INIT(64'hAAAAA8A8AAAAAAA8)) 
    axi_bvalid_int_i_1
       (.I0(s_axi_aresetn),
        .I1(bvalid_cnt_inc),
        .I2(AW2Arb_BVALID_Cnt[1]),
        .I3(AW2Arb_BVALID_Cnt[0]),
        .I4(AW2Arb_BVALID_Cnt[2]),
        .I5(axi_bvalid_int_i_2_n_0),
        .O(axi_bvalid_int_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT5 #(
    .INIT(32'h88888880)) 
    axi_bvalid_int_i_2
       (.I0(s_axi_bready),
        .I1(s_axi_bvalid),
        .I2(AW2Arb_BVALID_Cnt[1]),
        .I3(AW2Arb_BVALID_Cnt[0]),
        .I4(AW2Arb_BVALID_Cnt[2]),
        .O(axi_bvalid_int_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    axi_bvalid_int_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_bvalid_int_i_1_n_0),
        .Q(s_axi_bvalid),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFF757F00004540)) 
    axi_wr_burst_i_1
       (.I0(s_axi_wlast),
        .I1(s_axi_wvalid),
        .I2(axi_wr_burst_i_2_n_0),
        .I3(p_1_out),
        .I4(wr_data_sng_sm_cs[1]),
        .I5(axi_wr_burst),
        .O(axi_wr_burst_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT2 #(
    .INIT(4'hB)) 
    axi_wr_burst_i_2
       (.I0(wr_data_sng_sm_cs[0]),
        .I1(axi_wdata_full_reg),
        .O(axi_wr_burst_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    axi_wr_burst_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_wr_burst_i_1_n_0),
        .Q(axi_wr_burst),
        .R(SR));
  LUT6 #(
    .INIT(64'h00AA00AA0A0A888A)) 
    axi_wready_int_mod_i_1
       (.I0(s_axi_aresetn),
        .I1(p_1_out),
        .I2(s_axi_wvalid),
        .I3(axi_wdata_full_reg),
        .I4(wr_data_sng_sm_cs[0]),
        .I5(wr_data_sng_sm_cs[1]),
        .O(axi_wready_int_mod_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    axi_wready_int_mod_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_wready_int_mod_i_1_n_0),
        .Q(s_axi_wready),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    bid_gets_fifo_load_d1_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(bid_gets_fifo_load),
        .Q(bid_gets_fifo_load_d1),
        .R(SR));
  LUT2 #(
    .INIT(4'hE)) 
    bram_en_a_INST_0
       (.I0(p_8_in),
        .I1(p_7_in),
        .O(bram_en_a));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \bvalid_cnt[0]_i_1 
       (.I0(AW2Arb_BVALID_Cnt[0]),
        .O(\bvalid_cnt[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF05A5A5A0DA5A5A5)) 
    \bvalid_cnt[1]_i_1 
       (.I0(bvalid_cnt_inc),
        .I1(AW2Arb_BVALID_Cnt[2]),
        .I2(AW2Arb_BVALID_Cnt[1]),
        .I3(s_axi_bvalid),
        .I4(s_axi_bready),
        .I5(AW2Arb_BVALID_Cnt[0]),
        .O(\bvalid_cnt[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h5556AAAAAAAAAAAA)) 
    \bvalid_cnt[2]_i_1 
       (.I0(bvalid_cnt_inc),
        .I1(AW2Arb_BVALID_Cnt[2]),
        .I2(AW2Arb_BVALID_Cnt[0]),
        .I3(AW2Arb_BVALID_Cnt[1]),
        .I4(s_axi_bvalid),
        .I5(s_axi_bready),
        .O(\bvalid_cnt[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8FF77000FFF0000F)) 
    \bvalid_cnt[2]_i_2 
       (.I0(s_axi_bready),
        .I1(s_axi_bvalid),
        .I2(AW2Arb_BVALID_Cnt[1]),
        .I3(AW2Arb_BVALID_Cnt[0]),
        .I4(AW2Arb_BVALID_Cnt[2]),
        .I5(bvalid_cnt_inc),
        .O(\bvalid_cnt[2]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bvalid_cnt_reg[0] 
       (.C(s_axi_aclk),
        .CE(\bvalid_cnt[2]_i_1_n_0 ),
        .D(\bvalid_cnt[0]_i_1_n_0 ),
        .Q(AW2Arb_BVALID_Cnt[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \bvalid_cnt_reg[1] 
       (.C(s_axi_aclk),
        .CE(\bvalid_cnt[2]_i_1_n_0 ),
        .D(\bvalid_cnt[1]_i_1_n_0 ),
        .Q(AW2Arb_BVALID_Cnt[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \bvalid_cnt_reg[2] 
       (.C(s_axi_aclk),
        .CE(\bvalid_cnt[2]_i_1_n_0 ),
        .D(\bvalid_cnt[2]_i_2_n_0 ),
        .Q(AW2Arb_BVALID_Cnt[2]),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT2 #(
    .INIT(4'h1)) 
    curr_fixed_burst_reg_i_1
       (.I0(s_axi_awburst[0]),
        .I1(s_axi_awburst[1]),
        .O(curr_fixed_burst));
  FDRE #(
    .INIT(1'b0)) 
    curr_fixed_burst_reg_reg
       (.C(s_axi_aclk),
        .CE(aw_active_re),
        .D(curr_fixed_burst),
        .Q(curr_fixed_burst_reg),
        .R(WrChnl_BRAM_Addr_Rst));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT2 #(
    .INIT(4'h2)) 
    curr_wrap_burst_reg_i_1
       (.I0(s_axi_awburst[1]),
        .I1(s_axi_awburst[0]),
        .O(curr_wrap_burst_reg_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    curr_wrap_burst_reg_reg
       (.C(s_axi_aclk),
        .CE(aw_active_re),
        .D(curr_wrap_burst_reg_i_1_n_0),
        .Q(curr_wrap_burst_reg),
        .R(WrChnl_BRAM_Addr_Rst));
endmodule

(* ORIG_REF_NAME = "wrap_brst" *) 
module bd_design_axi_bram_ctrl_0_0_wrap_brst
   (\ADDR_SNG_PORT.bram_addr_int_reg[11] ,
    D,
    \save_init_bram_addr_ld_reg[12]_0 ,
    \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[1] ,
    aw_active_re,
    curr_wrap_burst_reg,
    \ADDR_SNG_PORT.bram_addr_int_reg[6] ,
    s_axi_awaddr,
    aw_active_d1,
    p_1_out,
    Q,
    SR,
    s_axi_aclk,
    s_axi_awlen);
  output \ADDR_SNG_PORT.bram_addr_int_reg[11] ;
  output [8:0]D;
  output \save_init_bram_addr_ld_reg[12]_0 ;
  input \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[1] ;
  input aw_active_re;
  input curr_wrap_burst_reg;
  input \ADDR_SNG_PORT.bram_addr_int_reg[6] ;
  input [8:0]s_axi_awaddr;
  input aw_active_d1;
  input p_1_out;
  input [2:0]Q;
  input [0:0]SR;
  input s_axi_aclk;
  input [3:0]s_axi_awlen;

  wire \ADDR_SNG_PORT.bram_addr_int_reg[11] ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[6] ;
  wire [8:0]D;
  wire \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[1] ;
  wire [2:0]Q;
  wire [0:0]SR;
  wire aw_active_d1;
  wire aw_active_re;
  wire curr_wrap_burst_reg;
  wire p_1_out;
  wire s_axi_aclk;
  wire [8:0]s_axi_awaddr;
  wire [3:0]s_axi_awlen;
  wire [12:4]save_init_bram_addr_ld;
  wire \save_init_bram_addr_ld[12]_i_4__0_n_0 ;
  wire \save_init_bram_addr_ld[12]_i_5__0_n_0 ;
  wire \save_init_bram_addr_ld_reg[12]_0 ;
  wire [2:0]wrap_burst_total;
  wire \wrap_burst_total[0]_i_1_n_0 ;
  wire \wrap_burst_total[1]_i_1_n_0 ;
  wire \wrap_burst_total[2]_i_1_n_0 ;

  LUT6 #(
    .INIT(64'h3313333313131313)) 
    \ADDR_SNG_PORT.bram_addr_int[12]_i_3 
       (.I0(\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[1] ),
        .I1(aw_active_re),
        .I2(curr_wrap_burst_reg),
        .I3(\save_init_bram_addr_ld[12]_i_5__0_n_0 ),
        .I4(\ADDR_SNG_PORT.bram_addr_int_reg[6] ),
        .I5(\save_init_bram_addr_ld[12]_i_4__0_n_0 ),
        .O(\ADDR_SNG_PORT.bram_addr_int_reg[11] ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \save_init_bram_addr_ld[10]_i_1__0 
       (.I0(s_axi_awaddr[6]),
        .I1(\save_init_bram_addr_ld_reg[12]_0 ),
        .I2(save_init_bram_addr_ld[10]),
        .O(D[6]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \save_init_bram_addr_ld[11]_i_1__0 
       (.I0(s_axi_awaddr[7]),
        .I1(\save_init_bram_addr_ld_reg[12]_0 ),
        .I2(save_init_bram_addr_ld[11]),
        .O(D[7]));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \save_init_bram_addr_ld[12]_i_2__0 
       (.I0(s_axi_awaddr[8]),
        .I1(\save_init_bram_addr_ld_reg[12]_0 ),
        .I2(save_init_bram_addr_ld[12]),
        .O(D[8]));
  LUT6 #(
    .INIT(64'hF4F444F4FFFFFFFF)) 
    \save_init_bram_addr_ld[12]_i_3__0 
       (.I0(aw_active_d1),
        .I1(p_1_out),
        .I2(\save_init_bram_addr_ld[12]_i_4__0_n_0 ),
        .I3(\ADDR_SNG_PORT.bram_addr_int_reg[6] ),
        .I4(\save_init_bram_addr_ld[12]_i_5__0_n_0 ),
        .I5(curr_wrap_burst_reg),
        .O(\save_init_bram_addr_ld_reg[12]_0 ));
  LUT6 #(
    .INIT(64'hF4FFF3FFFFFFF3FF)) 
    \save_init_bram_addr_ld[12]_i_4__0 
       (.I0(Q[2]),
        .I1(wrap_burst_total[0]),
        .I2(wrap_burst_total[2]),
        .I3(Q[0]),
        .I4(wrap_burst_total[1]),
        .I5(Q[1]),
        .O(\save_init_bram_addr_ld[12]_i_4__0_n_0 ));
  LUT3 #(
    .INIT(8'hFD)) 
    \save_init_bram_addr_ld[12]_i_5__0 
       (.I0(wrap_burst_total[2]),
        .I1(wrap_burst_total[1]),
        .I2(wrap_burst_total[0]),
        .O(\save_init_bram_addr_ld[12]_i_5__0_n_0 ));
  LUT6 #(
    .INIT(64'hBB88B8888888BB88)) 
    \save_init_bram_addr_ld[4]_i_1__0 
       (.I0(s_axi_awaddr[0]),
        .I1(\save_init_bram_addr_ld_reg[12]_0 ),
        .I2(wrap_burst_total[0]),
        .I3(save_init_bram_addr_ld[4]),
        .I4(wrap_burst_total[1]),
        .I5(wrap_burst_total[2]),
        .O(D[0]));
  LUT6 #(
    .INIT(64'hB888B8B8B8B888B8)) 
    \save_init_bram_addr_ld[5]_i_1__0 
       (.I0(s_axi_awaddr[1]),
        .I1(\save_init_bram_addr_ld_reg[12]_0 ),
        .I2(save_init_bram_addr_ld[5]),
        .I3(wrap_burst_total[2]),
        .I4(wrap_burst_total[1]),
        .I5(wrap_burst_total[0]),
        .O(D[1]));
  LUT6 #(
    .INIT(64'hBBB8BBBB88888888)) 
    \save_init_bram_addr_ld[6]_i_1__0 
       (.I0(s_axi_awaddr[2]),
        .I1(\save_init_bram_addr_ld_reg[12]_0 ),
        .I2(wrap_burst_total[0]),
        .I3(wrap_burst_total[1]),
        .I4(wrap_burst_total[2]),
        .I5(save_init_bram_addr_ld[6]),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \save_init_bram_addr_ld[7]_i_1__0 
       (.I0(s_axi_awaddr[3]),
        .I1(\save_init_bram_addr_ld_reg[12]_0 ),
        .I2(save_init_bram_addr_ld[7]),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \save_init_bram_addr_ld[8]_i_1__0 
       (.I0(s_axi_awaddr[4]),
        .I1(\save_init_bram_addr_ld_reg[12]_0 ),
        .I2(save_init_bram_addr_ld[8]),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \save_init_bram_addr_ld[9]_i_1__0 
       (.I0(s_axi_awaddr[5]),
        .I1(\save_init_bram_addr_ld_reg[12]_0 ),
        .I2(save_init_bram_addr_ld[9]),
        .O(D[5]));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[10] 
       (.C(s_axi_aclk),
        .CE(aw_active_re),
        .D(D[6]),
        .Q(save_init_bram_addr_ld[10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[11] 
       (.C(s_axi_aclk),
        .CE(aw_active_re),
        .D(D[7]),
        .Q(save_init_bram_addr_ld[11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[12] 
       (.C(s_axi_aclk),
        .CE(aw_active_re),
        .D(D[8]),
        .Q(save_init_bram_addr_ld[12]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[4] 
       (.C(s_axi_aclk),
        .CE(aw_active_re),
        .D(D[0]),
        .Q(save_init_bram_addr_ld[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[5] 
       (.C(s_axi_aclk),
        .CE(aw_active_re),
        .D(D[1]),
        .Q(save_init_bram_addr_ld[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[6] 
       (.C(s_axi_aclk),
        .CE(aw_active_re),
        .D(D[2]),
        .Q(save_init_bram_addr_ld[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[7] 
       (.C(s_axi_aclk),
        .CE(aw_active_re),
        .D(D[3]),
        .Q(save_init_bram_addr_ld[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[8] 
       (.C(s_axi_aclk),
        .CE(aw_active_re),
        .D(D[4]),
        .Q(save_init_bram_addr_ld[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[9] 
       (.C(s_axi_aclk),
        .CE(aw_active_re),
        .D(D[5]),
        .Q(save_init_bram_addr_ld[9]),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT4 #(
    .INIT(16'h4004)) 
    \wrap_burst_total[0]_i_1 
       (.I0(s_axi_awlen[3]),
        .I1(s_axi_awlen[0]),
        .I2(s_axi_awlen[1]),
        .I3(s_axi_awlen[2]),
        .O(\wrap_burst_total[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h40)) 
    \wrap_burst_total[1]_i_1 
       (.I0(s_axi_awlen[3]),
        .I1(s_axi_awlen[0]),
        .I2(s_axi_awlen[1]),
        .O(\wrap_burst_total[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \wrap_burst_total[2]_i_1 
       (.I0(s_axi_awlen[3]),
        .I1(s_axi_awlen[2]),
        .I2(s_axi_awlen[0]),
        .I3(s_axi_awlen[1]),
        .O(\wrap_burst_total[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wrap_burst_total_reg[0] 
       (.C(s_axi_aclk),
        .CE(aw_active_re),
        .D(\wrap_burst_total[0]_i_1_n_0 ),
        .Q(wrap_burst_total[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \wrap_burst_total_reg[1] 
       (.C(s_axi_aclk),
        .CE(aw_active_re),
        .D(\wrap_burst_total[1]_i_1_n_0 ),
        .Q(wrap_burst_total[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \wrap_burst_total_reg[2] 
       (.C(s_axi_aclk),
        .CE(aw_active_re),
        .D(\wrap_burst_total[2]_i_1_n_0 ),
        .Q(wrap_burst_total[2]),
        .R(SR));
endmodule

(* ORIG_REF_NAME = "wrap_brst" *) 
module bd_design_axi_bram_ctrl_0_0_wrap_brst_0
   (D,
    \ADDR_SNG_PORT.bram_addr_int_reg[11] ,
    \save_init_bram_addr_ld_reg[4]_0 ,
    \ADDR_SNG_PORT.bram_addr_int_reg[7] ,
    \save_init_bram_addr_ld_reg[12]_0 ,
    E,
    \ADDR_SNG_PORT.bram_addr_int_reg[3] ,
    SR,
    Q,
    p_0_out,
    \save_init_bram_addr_ld_reg[11]_0 ,
    out,
    curr_wrap_burst_reg,
    s_axi_araddr,
    \ADDR_SNG_PORT.bram_addr_int_reg[3]_0 ,
    \ADDR_SNG_PORT.bram_addr_int_reg[3]_1 ,
    \ADDR_SNG_PORT.bram_addr_int_reg[6] ,
    \ADDR_SNG_PORT.bram_addr_int_reg[8] ,
    \ADDR_SNG_PORT.bram_addr_int_reg[9] ,
    \ADDR_SNG_PORT.bram_addr_int_reg[10] ,
    curr_fixed_burst_reg,
    \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[1] ,
    bram_addr_inc,
    curr_fixed_burst_reg_0,
    ar_active_re,
    curr_wrap_burst_reg_reg,
    s_axi_arlen,
    axi_rvalid_int_reg,
    s_axi_rready,
    brst_zero,
    end_brst_rd,
    s_axi_aresetn,
    axi_rd_burst,
    axi_rd_burst_two_reg,
    s_axi_aclk);
  output [7:0]D;
  output \ADDR_SNG_PORT.bram_addr_int_reg[11] ;
  output \save_init_bram_addr_ld_reg[4]_0 ;
  output \ADDR_SNG_PORT.bram_addr_int_reg[7] ;
  output [0:0]\save_init_bram_addr_ld_reg[12]_0 ;
  output [0:0]E;
  output \ADDR_SNG_PORT.bram_addr_int_reg[3] ;
  output [0:0]SR;
  input [7:0]Q;
  input p_0_out;
  input [7:0]\save_init_bram_addr_ld_reg[11]_0 ;
  input [3:0]out;
  input curr_wrap_burst_reg;
  input [8:0]s_axi_araddr;
  input \ADDR_SNG_PORT.bram_addr_int_reg[3]_0 ;
  input \ADDR_SNG_PORT.bram_addr_int_reg[3]_1 ;
  input \ADDR_SNG_PORT.bram_addr_int_reg[6] ;
  input \ADDR_SNG_PORT.bram_addr_int_reg[8] ;
  input \ADDR_SNG_PORT.bram_addr_int_reg[9] ;
  input \ADDR_SNG_PORT.bram_addr_int_reg[10] ;
  input curr_fixed_burst_reg;
  input \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[1] ;
  input bram_addr_inc;
  input curr_fixed_burst_reg_0;
  input ar_active_re;
  input curr_wrap_burst_reg_reg;
  input [3:0]s_axi_arlen;
  input axi_rvalid_int_reg;
  input s_axi_rready;
  input brst_zero;
  input end_brst_rd;
  input s_axi_aresetn;
  input axi_rd_burst;
  input axi_rd_burst_two_reg;
  input s_axi_aclk;

  wire \ADDR_SNG_PORT.bram_addr_int[3]_i_4_n_0 ;
  wire \ADDR_SNG_PORT.bram_addr_int[3]_i_5_n_0 ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[10] ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[11] ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[3] ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[3]_0 ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[3]_1 ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[6] ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[7] ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[8] ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[9] ;
  wire [7:0]D;
  wire [0:0]E;
  wire \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[1] ;
  wire [7:0]Q;
  wire [8:1]RdChnl_BRAM_Addr_Ld;
  wire [0:0]SR;
  wire ar_active_re;
  wire axi_rd_burst;
  wire axi_rd_burst_two_reg;
  wire axi_rvalid_int_reg;
  wire bram_addr_inc;
  wire bram_addr_inc9_out;
  wire brst_zero;
  wire curr_fixed_burst_reg;
  wire curr_fixed_burst_reg_0;
  wire curr_wrap_burst_reg;
  wire curr_wrap_burst_reg_reg;
  wire end_brst_rd;
  wire [3:0]out;
  wire p_0_out;
  wire s_axi_aclk;
  wire [8:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire [3:0]s_axi_arlen;
  wire s_axi_rready;
  wire \save_init_bram_addr_ld[12]_i_4_n_0 ;
  wire \save_init_bram_addr_ld[4]_i_2_n_0 ;
  wire \save_init_bram_addr_ld[5]_i_2_n_0 ;
  wire \save_init_bram_addr_ld[6]_i_2_n_0 ;
  wire [7:0]\save_init_bram_addr_ld_reg[11]_0 ;
  wire [0:0]\save_init_bram_addr_ld_reg[12]_0 ;
  wire \save_init_bram_addr_ld_reg[4]_0 ;
  wire \save_init_bram_addr_ld_reg_n_0_[10] ;
  wire \save_init_bram_addr_ld_reg_n_0_[11] ;
  wire \save_init_bram_addr_ld_reg_n_0_[12] ;
  wire \save_init_bram_addr_ld_reg_n_0_[4] ;
  wire \save_init_bram_addr_ld_reg_n_0_[5] ;
  wire \save_init_bram_addr_ld_reg_n_0_[6] ;
  wire \save_init_bram_addr_ld_reg_n_0_[7] ;
  wire \save_init_bram_addr_ld_reg_n_0_[8] ;
  wire \save_init_bram_addr_ld_reg_n_0_[9] ;
  wire \wrap_burst_total[0]_i_1__0_n_0 ;
  wire \wrap_burst_total[1]_i_1__0_n_0 ;
  wire \wrap_burst_total[2]_i_1_n_0 ;
  wire \wrap_burst_total_reg_n_0_[0] ;
  wire \wrap_burst_total_reg_n_0_[1] ;
  wire \wrap_burst_total_reg_n_0_[2] ;

  LUT6 #(
    .INIT(64'hE4E4E4E400FFFF00)) 
    \ADDR_SNG_PORT.bram_addr_int[10]_i_1 
       (.I0(p_0_out),
        .I1(\save_init_bram_addr_ld_reg[11]_0 [6]),
        .I2(RdChnl_BRAM_Addr_Ld[7]),
        .I3(\ADDR_SNG_PORT.bram_addr_int_reg[9] ),
        .I4(Q[6]),
        .I5(\ADDR_SNG_PORT.bram_addr_int_reg[11] ),
        .O(D[6]));
  LUT6 #(
    .INIT(64'hAABAAABAFFBAAABA)) 
    \ADDR_SNG_PORT.bram_addr_int[11]_i_2 
       (.I0(\ADDR_SNG_PORT.bram_addr_int_reg[11] ),
        .I1(curr_fixed_burst_reg),
        .I2(\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[1] ),
        .I3(p_0_out),
        .I4(bram_addr_inc),
        .I5(curr_fixed_burst_reg_0),
        .O(E));
  LUT6 #(
    .INIT(64'hE4E4E4E400FFFF00)) 
    \ADDR_SNG_PORT.bram_addr_int[11]_i_3 
       (.I0(p_0_out),
        .I1(\save_init_bram_addr_ld_reg[11]_0 [7]),
        .I2(RdChnl_BRAM_Addr_Ld[8]),
        .I3(\ADDR_SNG_PORT.bram_addr_int_reg[10] ),
        .I4(Q[7]),
        .I5(\ADDR_SNG_PORT.bram_addr_int_reg[11] ),
        .O(D[7]));
  LUT6 #(
    .INIT(64'hFFFF2000FFFFFFFF)) 
    \ADDR_SNG_PORT.bram_addr_int[12]_i_2 
       (.I0(\save_init_bram_addr_ld_reg[4]_0 ),
        .I1(out[3]),
        .I2(curr_wrap_burst_reg),
        .I3(\save_init_bram_addr_ld[12]_i_4_n_0 ),
        .I4(ar_active_re),
        .I5(curr_wrap_burst_reg_reg),
        .O(\ADDR_SNG_PORT.bram_addr_int_reg[11] ));
  LUT6 #(
    .INIT(64'h2020202000002000)) 
    \ADDR_SNG_PORT.bram_addr_int[3]_i_2 
       (.I0(\save_init_bram_addr_ld_reg[4]_0 ),
        .I1(out[3]),
        .I2(curr_wrap_burst_reg),
        .I3(\ADDR_SNG_PORT.bram_addr_int_reg[7] ),
        .I4(\ADDR_SNG_PORT.bram_addr_int[3]_i_4_n_0 ),
        .I5(\ADDR_SNG_PORT.bram_addr_int[3]_i_5_n_0 ),
        .O(\ADDR_SNG_PORT.bram_addr_int_reg[3] ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hFD)) 
    \ADDR_SNG_PORT.bram_addr_int[3]_i_4 
       (.I0(\wrap_burst_total_reg_n_0_[2] ),
        .I1(\wrap_burst_total_reg_n_0_[1] ),
        .I2(\wrap_burst_total_reg_n_0_[0] ),
        .O(\ADDR_SNG_PORT.bram_addr_int[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h4040004050005000)) 
    \ADDR_SNG_PORT.bram_addr_int[3]_i_5 
       (.I0(\wrap_burst_total_reg_n_0_[2] ),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(\wrap_burst_total_reg_n_0_[0] ),
        .I4(Q[2]),
        .I5(\wrap_burst_total_reg_n_0_[1] ),
        .O(\ADDR_SNG_PORT.bram_addr_int[3]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hA3ACF3FCA3AC030C)) 
    \ADDR_SNG_PORT.bram_addr_int[4]_i_1 
       (.I0(RdChnl_BRAM_Addr_Ld[1]),
        .I1(Q[0]),
        .I2(\ADDR_SNG_PORT.bram_addr_int_reg[11] ),
        .I3(Q[1]),
        .I4(p_0_out),
        .I5(\save_init_bram_addr_ld_reg[11]_0 [0]),
        .O(D[0]));
  LUT6 #(
    .INIT(64'hE4E4E4E400FFFF00)) 
    \ADDR_SNG_PORT.bram_addr_int[5]_i_1 
       (.I0(p_0_out),
        .I1(\save_init_bram_addr_ld_reg[11]_0 [1]),
        .I2(RdChnl_BRAM_Addr_Ld[2]),
        .I3(\ADDR_SNG_PORT.bram_addr_int_reg[3]_0 ),
        .I4(Q[2]),
        .I5(\ADDR_SNG_PORT.bram_addr_int_reg[11] ),
        .O(D[1]));
  LUT5 #(
    .INIT(32'hF0AACCAA)) 
    \ADDR_SNG_PORT.bram_addr_int[6]_i_1 
       (.I0(\ADDR_SNG_PORT.bram_addr_int_reg[3]_1 ),
        .I1(\save_init_bram_addr_ld_reg[11]_0 [2]),
        .I2(RdChnl_BRAM_Addr_Ld[3]),
        .I3(\ADDR_SNG_PORT.bram_addr_int_reg[11] ),
        .I4(p_0_out),
        .O(D[2]));
  LUT6 #(
    .INIT(64'hE4E4E4E400FFFF00)) 
    \ADDR_SNG_PORT.bram_addr_int[7]_i_1 
       (.I0(p_0_out),
        .I1(\save_init_bram_addr_ld_reg[11]_0 [3]),
        .I2(RdChnl_BRAM_Addr_Ld[4]),
        .I3(\ADDR_SNG_PORT.bram_addr_int_reg[7] ),
        .I4(Q[4]),
        .I5(\ADDR_SNG_PORT.bram_addr_int_reg[11] ),
        .O(D[3]));
  LUT4 #(
    .INIT(16'h8000)) 
    \ADDR_SNG_PORT.bram_addr_int[7]_i_2 
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(Q[0]),
        .O(\ADDR_SNG_PORT.bram_addr_int_reg[7] ));
  LUT5 #(
    .INIT(32'hF0AACCAA)) 
    \ADDR_SNG_PORT.bram_addr_int[8]_i_1 
       (.I0(\ADDR_SNG_PORT.bram_addr_int_reg[6] ),
        .I1(\save_init_bram_addr_ld_reg[11]_0 [4]),
        .I2(RdChnl_BRAM_Addr_Ld[5]),
        .I3(\ADDR_SNG_PORT.bram_addr_int_reg[11] ),
        .I4(p_0_out),
        .O(D[4]));
  LUT6 #(
    .INIT(64'hE4E4E4E400FFFF00)) 
    \ADDR_SNG_PORT.bram_addr_int[9]_i_1 
       (.I0(p_0_out),
        .I1(\save_init_bram_addr_ld_reg[11]_0 [5]),
        .I2(RdChnl_BRAM_Addr_Ld[6]),
        .I3(\ADDR_SNG_PORT.bram_addr_int_reg[8] ),
        .I4(Q[5]),
        .I5(\ADDR_SNG_PORT.bram_addr_int_reg[11] ),
        .O(D[5]));
  LUT1 #(
    .INIT(2'h1)) 
    bram_rst_a_INST_0
       (.I0(s_axi_aresetn),
        .O(SR));
  LUT6 #(
    .INIT(64'hFBFFFFFF08000000)) 
    \save_init_bram_addr_ld[10]_i_1 
       (.I0(\save_init_bram_addr_ld_reg_n_0_[10] ),
        .I1(\save_init_bram_addr_ld_reg[4]_0 ),
        .I2(out[3]),
        .I3(curr_wrap_burst_reg),
        .I4(\save_init_bram_addr_ld[12]_i_4_n_0 ),
        .I5(s_axi_araddr[6]),
        .O(RdChnl_BRAM_Addr_Ld[7]));
  LUT6 #(
    .INIT(64'hFBFFFFFF08000000)) 
    \save_init_bram_addr_ld[11]_i_1 
       (.I0(\save_init_bram_addr_ld_reg_n_0_[11] ),
        .I1(\save_init_bram_addr_ld_reg[4]_0 ),
        .I2(out[3]),
        .I3(curr_wrap_burst_reg),
        .I4(\save_init_bram_addr_ld[12]_i_4_n_0 ),
        .I5(s_axi_araddr[7]),
        .O(RdChnl_BRAM_Addr_Ld[8]));
  LUT6 #(
    .INIT(64'hFBFFFFFF08000000)) 
    \save_init_bram_addr_ld[12]_i_2 
       (.I0(\save_init_bram_addr_ld_reg_n_0_[12] ),
        .I1(\save_init_bram_addr_ld_reg[4]_0 ),
        .I2(out[3]),
        .I3(curr_wrap_burst_reg),
        .I4(\save_init_bram_addr_ld[12]_i_4_n_0 ),
        .I5(s_axi_araddr[8]),
        .O(\save_init_bram_addr_ld_reg[12]_0 ));
  LUT6 #(
    .INIT(64'h4400558844555088)) 
    \save_init_bram_addr_ld[12]_i_3 
       (.I0(out[2]),
        .I1(bram_addr_inc9_out),
        .I2(axi_rd_burst),
        .I3(out[0]),
        .I4(out[1]),
        .I5(axi_rd_burst_two_reg),
        .O(\save_init_bram_addr_ld_reg[4]_0 ));
  LUT5 #(
    .INIT(32'hAAAEAAAA)) 
    \save_init_bram_addr_ld[12]_i_4 
       (.I0(\ADDR_SNG_PORT.bram_addr_int[3]_i_5_n_0 ),
        .I1(\wrap_burst_total_reg_n_0_[2] ),
        .I2(\wrap_burst_total_reg_n_0_[1] ),
        .I3(\wrap_burst_total_reg_n_0_[0] ),
        .I4(\ADDR_SNG_PORT.bram_addr_int_reg[7] ),
        .O(\save_init_bram_addr_ld[12]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0008)) 
    \save_init_bram_addr_ld[12]_i_5 
       (.I0(axi_rvalid_int_reg),
        .I1(s_axi_rready),
        .I2(brst_zero),
        .I3(end_brst_rd),
        .O(bram_addr_inc9_out));
  LUT6 #(
    .INIT(64'hFBFFFFFF08000000)) 
    \save_init_bram_addr_ld[4]_i_1 
       (.I0(\save_init_bram_addr_ld[4]_i_2_n_0 ),
        .I1(\save_init_bram_addr_ld_reg[4]_0 ),
        .I2(out[3]),
        .I3(curr_wrap_burst_reg),
        .I4(\save_init_bram_addr_ld[12]_i_4_n_0 ),
        .I5(s_axi_araddr[0]),
        .O(RdChnl_BRAM_Addr_Ld[1]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hC80C)) 
    \save_init_bram_addr_ld[4]_i_2 
       (.I0(\wrap_burst_total_reg_n_0_[0] ),
        .I1(\save_init_bram_addr_ld_reg_n_0_[4] ),
        .I2(\wrap_burst_total_reg_n_0_[1] ),
        .I3(\wrap_burst_total_reg_n_0_[2] ),
        .O(\save_init_bram_addr_ld[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFBFFFFFF08000000)) 
    \save_init_bram_addr_ld[5]_i_1 
       (.I0(\save_init_bram_addr_ld[5]_i_2_n_0 ),
        .I1(\save_init_bram_addr_ld_reg[4]_0 ),
        .I2(out[3]),
        .I3(curr_wrap_burst_reg),
        .I4(\save_init_bram_addr_ld[12]_i_4_n_0 ),
        .I5(s_axi_araddr[1]),
        .O(RdChnl_BRAM_Addr_Ld[2]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h8AA2)) 
    \save_init_bram_addr_ld[5]_i_2 
       (.I0(\save_init_bram_addr_ld_reg_n_0_[5] ),
        .I1(\wrap_burst_total_reg_n_0_[2] ),
        .I2(\wrap_burst_total_reg_n_0_[1] ),
        .I3(\wrap_burst_total_reg_n_0_[0] ),
        .O(\save_init_bram_addr_ld[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFBFFFFFF08000000)) 
    \save_init_bram_addr_ld[6]_i_1 
       (.I0(\save_init_bram_addr_ld[6]_i_2_n_0 ),
        .I1(\save_init_bram_addr_ld_reg[4]_0 ),
        .I2(out[3]),
        .I3(curr_wrap_burst_reg),
        .I4(\save_init_bram_addr_ld[12]_i_4_n_0 ),
        .I5(s_axi_araddr[2]),
        .O(RdChnl_BRAM_Addr_Ld[3]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hEF00)) 
    \save_init_bram_addr_ld[6]_i_2 
       (.I0(\wrap_burst_total_reg_n_0_[0] ),
        .I1(\wrap_burst_total_reg_n_0_[1] ),
        .I2(\wrap_burst_total_reg_n_0_[2] ),
        .I3(\save_init_bram_addr_ld_reg_n_0_[6] ),
        .O(\save_init_bram_addr_ld[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFBFFFFFF08000000)) 
    \save_init_bram_addr_ld[7]_i_1 
       (.I0(\save_init_bram_addr_ld_reg_n_0_[7] ),
        .I1(\save_init_bram_addr_ld_reg[4]_0 ),
        .I2(out[3]),
        .I3(curr_wrap_burst_reg),
        .I4(\save_init_bram_addr_ld[12]_i_4_n_0 ),
        .I5(s_axi_araddr[3]),
        .O(RdChnl_BRAM_Addr_Ld[4]));
  LUT6 #(
    .INIT(64'hFBFFFFFF08000000)) 
    \save_init_bram_addr_ld[8]_i_1 
       (.I0(\save_init_bram_addr_ld_reg_n_0_[8] ),
        .I1(\save_init_bram_addr_ld_reg[4]_0 ),
        .I2(out[3]),
        .I3(curr_wrap_burst_reg),
        .I4(\save_init_bram_addr_ld[12]_i_4_n_0 ),
        .I5(s_axi_araddr[4]),
        .O(RdChnl_BRAM_Addr_Ld[5]));
  LUT6 #(
    .INIT(64'hFBFFFFFF08000000)) 
    \save_init_bram_addr_ld[9]_i_1 
       (.I0(\save_init_bram_addr_ld_reg_n_0_[9] ),
        .I1(\save_init_bram_addr_ld_reg[4]_0 ),
        .I2(out[3]),
        .I3(curr_wrap_burst_reg),
        .I4(\save_init_bram_addr_ld[12]_i_4_n_0 ),
        .I5(s_axi_araddr[5]),
        .O(RdChnl_BRAM_Addr_Ld[6]));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[10] 
       (.C(s_axi_aclk),
        .CE(ar_active_re),
        .D(RdChnl_BRAM_Addr_Ld[7]),
        .Q(\save_init_bram_addr_ld_reg_n_0_[10] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[11] 
       (.C(s_axi_aclk),
        .CE(ar_active_re),
        .D(RdChnl_BRAM_Addr_Ld[8]),
        .Q(\save_init_bram_addr_ld_reg_n_0_[11] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[12] 
       (.C(s_axi_aclk),
        .CE(ar_active_re),
        .D(\save_init_bram_addr_ld_reg[12]_0 ),
        .Q(\save_init_bram_addr_ld_reg_n_0_[12] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[4] 
       (.C(s_axi_aclk),
        .CE(ar_active_re),
        .D(RdChnl_BRAM_Addr_Ld[1]),
        .Q(\save_init_bram_addr_ld_reg_n_0_[4] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[5] 
       (.C(s_axi_aclk),
        .CE(ar_active_re),
        .D(RdChnl_BRAM_Addr_Ld[2]),
        .Q(\save_init_bram_addr_ld_reg_n_0_[5] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[6] 
       (.C(s_axi_aclk),
        .CE(ar_active_re),
        .D(RdChnl_BRAM_Addr_Ld[3]),
        .Q(\save_init_bram_addr_ld_reg_n_0_[6] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[7] 
       (.C(s_axi_aclk),
        .CE(ar_active_re),
        .D(RdChnl_BRAM_Addr_Ld[4]),
        .Q(\save_init_bram_addr_ld_reg_n_0_[7] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[8] 
       (.C(s_axi_aclk),
        .CE(ar_active_re),
        .D(RdChnl_BRAM_Addr_Ld[5]),
        .Q(\save_init_bram_addr_ld_reg_n_0_[8] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[9] 
       (.C(s_axi_aclk),
        .CE(ar_active_re),
        .D(RdChnl_BRAM_Addr_Ld[6]),
        .Q(\save_init_bram_addr_ld_reg_n_0_[9] ),
        .R(SR));
  LUT4 #(
    .INIT(16'h2100)) 
    \wrap_burst_total[0]_i_1__0 
       (.I0(s_axi_arlen[2]),
        .I1(s_axi_arlen[3]),
        .I2(s_axi_arlen[1]),
        .I3(s_axi_arlen[0]),
        .O(\wrap_burst_total[0]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'h40)) 
    \wrap_burst_total[1]_i_1__0 
       (.I0(s_axi_arlen[3]),
        .I1(s_axi_arlen[1]),
        .I2(s_axi_arlen[0]),
        .O(\wrap_burst_total[1]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \wrap_burst_total[2]_i_1 
       (.I0(s_axi_arlen[1]),
        .I1(s_axi_arlen[0]),
        .I2(s_axi_arlen[3]),
        .I3(s_axi_arlen[2]),
        .O(\wrap_burst_total[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wrap_burst_total_reg[0] 
       (.C(s_axi_aclk),
        .CE(ar_active_re),
        .D(\wrap_burst_total[0]_i_1__0_n_0 ),
        .Q(\wrap_burst_total_reg_n_0_[0] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \wrap_burst_total_reg[1] 
       (.C(s_axi_aclk),
        .CE(ar_active_re),
        .D(\wrap_burst_total[1]_i_1__0_n_0 ),
        .Q(\wrap_burst_total_reg_n_0_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \wrap_burst_total_reg[2] 
       (.C(s_axi_aclk),
        .CE(ar_active_re),
        .D(\wrap_burst_total[2]_i_1_n_0 ),
        .Q(\wrap_burst_total_reg_n_0_[2] ),
        .R(SR));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
