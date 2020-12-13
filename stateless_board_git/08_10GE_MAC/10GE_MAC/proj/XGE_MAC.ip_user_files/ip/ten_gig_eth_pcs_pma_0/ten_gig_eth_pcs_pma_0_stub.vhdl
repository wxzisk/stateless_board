-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
-- Date        : Thu Jun 07 08:32:55 2018
-- Host        : 6XAL727YF7AGLLZ running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode synth_stub
--               K:/workspace/MC02/10GE_MAC/design/XGE_MAC.srcs/sources_1/ip/ten_gig_eth_pcs_pma_0/ten_gig_eth_pcs_pma_0_stub.vhdl
-- Design      : ten_gig_eth_pcs_pma_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku040-ffva1156-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ten_gig_eth_pcs_pma_0 is
  Port ( 
    dclk : in STD_LOGIC;
    rxrecclk_out : out STD_LOGIC;
    coreclk : in STD_LOGIC;
    txusrclk : in STD_LOGIC;
    txusrclk2 : in STD_LOGIC;
    txoutclk : out STD_LOGIC;
    areset : in STD_LOGIC;
    areset_coreclk : in STD_LOGIC;
    gttxreset : in STD_LOGIC;
    gtrxreset : in STD_LOGIC;
    sim_speedup_control : in STD_LOGIC;
    txuserrdy : in STD_LOGIC;
    qpll0lock : in STD_LOGIC;
    qpll0outclk : in STD_LOGIC;
    qpll0outrefclk : in STD_LOGIC;
    qpll0reset : out STD_LOGIC;
    reset_tx_bufg_gt : out STD_LOGIC;
    reset_counter_done : in STD_LOGIC;
    xgmii_txd : in STD_LOGIC_VECTOR ( 63 downto 0 );
    xgmii_txc : in STD_LOGIC_VECTOR ( 7 downto 0 );
    xgmii_rxd : out STD_LOGIC_VECTOR ( 63 downto 0 );
    xgmii_rxc : out STD_LOGIC_VECTOR ( 7 downto 0 );
    txp : out STD_LOGIC;
    txn : out STD_LOGIC;
    rxp : in STD_LOGIC;
    rxn : in STD_LOGIC;
    configuration_vector : in STD_LOGIC_VECTOR ( 535 downto 0 );
    status_vector : out STD_LOGIC_VECTOR ( 447 downto 0 );
    core_status : out STD_LOGIC_VECTOR ( 7 downto 0 );
    tx_resetdone : out STD_LOGIC;
    rx_resetdone : out STD_LOGIC;
    signal_detect : in STD_LOGIC;
    tx_fault : in STD_LOGIC;
    drp_req : out STD_LOGIC;
    drp_gnt : in STD_LOGIC;
    core_to_gt_drpen : out STD_LOGIC;
    core_to_gt_drpwe : out STD_LOGIC;
    core_to_gt_drpaddr : out STD_LOGIC_VECTOR ( 15 downto 0 );
    core_to_gt_drpdi : out STD_LOGIC_VECTOR ( 15 downto 0 );
    core_to_gt_drprdy : in STD_LOGIC;
    core_to_gt_drpdo : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt_drpen : in STD_LOGIC;
    gt_drpwe : in STD_LOGIC;
    gt_drpaddr : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt_drpdi : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt_drprdy : out STD_LOGIC;
    gt_drpdo : out STD_LOGIC_VECTOR ( 15 downto 0 );
    pma_pmd_type : in STD_LOGIC_VECTOR ( 2 downto 0 );
    tx_disable : out STD_LOGIC
  );

end ten_gig_eth_pcs_pma_0;

architecture stub of ten_gig_eth_pcs_pma_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "dclk,rxrecclk_out,coreclk,txusrclk,txusrclk2,txoutclk,areset,areset_coreclk,gttxreset,gtrxreset,sim_speedup_control,txuserrdy,qpll0lock,qpll0outclk,qpll0outrefclk,qpll0reset,reset_tx_bufg_gt,reset_counter_done,xgmii_txd[63:0],xgmii_txc[7:0],xgmii_rxd[63:0],xgmii_rxc[7:0],txp,txn,rxp,rxn,configuration_vector[535:0],status_vector[447:0],core_status[7:0],tx_resetdone,rx_resetdone,signal_detect,tx_fault,drp_req,drp_gnt,core_to_gt_drpen,core_to_gt_drpwe,core_to_gt_drpaddr[15:0],core_to_gt_drpdi[15:0],core_to_gt_drprdy,core_to_gt_drpdo[15:0],gt_drpen,gt_drpwe,gt_drpaddr[15:0],gt_drpdi[15:0],gt_drprdy,gt_drpdo[15:0],pma_pmd_type[2:0],tx_disable";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "ten_gig_eth_pcs_pma_wrapper,Vivado 2016.4";
begin
end;
