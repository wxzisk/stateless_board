// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Thu Jun 07 08:32:38 2018
// Host        : 6XAL727YF7AGLLZ running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               K:/workspace/MC02/10GE_MAC/design/XGE_MAC.srcs/sources_1/ip/ten_gig_eth_mac_0/ten_gig_eth_mac_0_stub.v
// Design      : ten_gig_eth_mac_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku040-ffva1156-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "ten_gig_eth_mac_v15_1_2,Vivado 2016.4" *)
module ten_gig_eth_mac_0(tx_clk0, reset, tx_axis_aresetn, tx_axis_tdata, 
  tx_axis_tkeep, tx_axis_tready, tx_axis_tvalid, tx_axis_tlast, tx_axis_tuser, tx_ifg_delay, 
  tx_statistics_vector, tx_statistics_valid, pause_val, pause_req, rx_axis_aresetn, 
  rx_axis_tdata, rx_axis_tkeep, rx_axis_tvalid, rx_axis_tuser, rx_axis_tlast, 
  rx_statistics_vector, rx_statistics_valid, tx_configuration_vector, 
  rx_configuration_vector, status_vector, tx_dcm_locked, xgmii_txd, xgmii_txc, rx_clk0, 
  rx_dcm_locked, xgmii_rxd, xgmii_rxc)
/* synthesis syn_black_box black_box_pad_pin="tx_clk0,reset,tx_axis_aresetn,tx_axis_tdata[63:0],tx_axis_tkeep[7:0],tx_axis_tready,tx_axis_tvalid,tx_axis_tlast,tx_axis_tuser[0:0],tx_ifg_delay[7:0],tx_statistics_vector[25:0],tx_statistics_valid,pause_val[15:0],pause_req,rx_axis_aresetn,rx_axis_tdata[63:0],rx_axis_tkeep[7:0],rx_axis_tvalid,rx_axis_tuser,rx_axis_tlast,rx_statistics_vector[29:0],rx_statistics_valid,tx_configuration_vector[79:0],rx_configuration_vector[79:0],status_vector[2:0],tx_dcm_locked,xgmii_txd[63:0],xgmii_txc[7:0],rx_clk0,rx_dcm_locked,xgmii_rxd[63:0],xgmii_rxc[7:0]" */;
  input tx_clk0;
  input reset;
  input tx_axis_aresetn;
  input [63:0]tx_axis_tdata;
  input [7:0]tx_axis_tkeep;
  output tx_axis_tready;
  input tx_axis_tvalid;
  input tx_axis_tlast;
  input [0:0]tx_axis_tuser;
  input [7:0]tx_ifg_delay;
  output [25:0]tx_statistics_vector;
  output tx_statistics_valid;
  input [15:0]pause_val;
  input pause_req;
  input rx_axis_aresetn;
  output [63:0]rx_axis_tdata;
  output [7:0]rx_axis_tkeep;
  output rx_axis_tvalid;
  output rx_axis_tuser;
  output rx_axis_tlast;
  output [29:0]rx_statistics_vector;
  output rx_statistics_valid;
  input [79:0]tx_configuration_vector;
  input [79:0]rx_configuration_vector;
  output [2:0]status_vector;
  input tx_dcm_locked;
  output [63:0]xgmii_txd;
  output [7:0]xgmii_txc;
  input rx_clk0;
  input rx_dcm_locked;
  input [63:0]xgmii_rxd;
  input [7:0]xgmii_rxc;
endmodule
