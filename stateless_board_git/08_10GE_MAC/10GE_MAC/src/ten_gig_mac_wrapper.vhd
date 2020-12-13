------------------------------------------------------------------------------
--      _______      _______                                                --
--     / ____\ \    / /_   _|                                               --
--    | |  __ \ \  / /  | |                                                 --
--    | | |_ | \ \/ /   | |                                                 --
--    | |__| |  \  /   _| |_                                                --
--     \_____|   \/   |_____|                                               --
--                                                                          --
-- Copyright (c) 2012-2018 Hangzhou Yanman Co. Ltd.  All rights reserved.   --
--                                                                          --
-- THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY   --
-- KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE      --
-- IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A               --
-- PARTICULAR PURPOSE.                                                      --
--                                                                          --
-- Website: www.gvi-tech.com                                                --
-- Email: support@gvi-tech.com                                              --
--                                                                          --
------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library ten_gig_eth_pcs_pma_v4_1;
use ten_gig_eth_pcs_pma_v4_1.all;

entity ten_gig_mac_wrapper is
port (
	reset						: in  std_logic;

	rx_axis_tdata				: out std_logic_vector(63 downto 0);
	rx_axis_tkeep				: out std_logic_vector(7 downto 0);
	rx_axis_tvalid				: out std_logic;
	rx_axis_tlast				: out std_logic;
	rx_axis_tready				: in  std_logic;
	tx_axis_tdata				: in  std_logic_vector(63 downto 0);
	tx_axis_tkeep				: in  std_logic_vector(7 downto 0);
	tx_axis_tvalid				: in  std_logic;
	tx_axis_tlast				: in  std_logic;
	tx_axis_tready				: out std_logic;
	
	pcspma_clk156				: in  std_logic;
	pcspma_dclk					: in  std_logic;
	pcspma_txclk322				: out std_logic;
	pcspma_mmcm_locked_clk156	: in  std_logic;
	pcspma_qplllock				: in  std_logic;
	pcspma_areset_clk156		: in  std_logic;
	pcspma_qplloutclk			: in  std_logic;
	pcspma_qplloutrefclk		: in  std_logic;
	pcspma_gttxreset			: in  std_logic;
	pcspma_gtrxreset			: in  std_logic;
	pcspma_txuserrdy			: in  std_logic;
	pcspma_txusrclk				: in  std_logic;
	pcspma_txusrclk2			: in  std_logic;
	pcspma_reset_counter_done	: in  std_logic;
	pcspma_qpllreset			: out std_logic;
	pcspma_reset_tx_bufg_gt		: out std_logic;

	phy0_txp					: out std_logic;
	phy0_txn					: out std_logic;
	phy0_rxp					: in  std_logic;
	phy0_rxn					: in  std_logic
);
end entity ten_gig_mac_wrapper;



architecture wrapper of ten_gig_mac_wrapper is

    attribute DowngradeIPIdentifiedWarnings: string;

    attribute DowngradeIPIdentifiedWarnings of wrapper : architecture is "yes";
	
	constant PAUSE_ADDR_VECTOR 	  :  std_logic_vector(47 downto 0):=(others=>'0');
	constant TX_CONFIGURATION_VECTOR:  std_logic_vector(31 downto 0):= X"00000016";
	constant RX_CONFIGURATION_VECTOR:  std_logic_vector(31 downto 0):= X"00000416";
	constant PMA_PMD_TYPE : std_logic_vector(2 downto 0):="111";  -- "111" =10Gbase SR, "110"= 10Gbase LR, "101"= 10Gbase ER

	constant PMA_LOOPBACK :std_logic:='0';-- '1' indicates that a loop back is enabled for PMA
	constant PMA_RESET :std_logic:='0'; -- '1' indicates that PMA will be in reset state always  
	constant GLOBAL_TX_DISABLE :std_logic:='0'; -- '1' indicates to disable the transmit path
	constant PCS_LOOPBACK :std_logic:='0';-- '1' indicates loop back is enabled for PCS
	constant PCS_RESET :std_logic:='0';-- '1' indicates PCS block is reset
	constant DATA_PATT_SEL :std_logic:='0';  -- '1'= Zeroes pattern,'0'= LF pattern
	constant TEST_PATT_SEL :std_logic:='0';  -- '1'= square wave , '0'= pseudo random
	constant RX_TEST_PATT_EN :std_logic:='0';  -- '1'enables test and data pattern as set by above two bits for RX 
	constant TX_TEST_PATT_EN :std_logic:='0';  --'1'enables test and data pattern as set by above two bits for TX
	constant PRBS31_TX_EN :std_logic:='0';  --'1'enables PRBS TX tests
	constant PRBS31_RX_EN : std_logic:='0'; -- '1'enables PRBS RX tests
	constant SET_PMA_LINK_STATUS :std_logic:='0'; -- '1' indicates receive link up
	constant SET_PCS_LINK_STATUS :std_logic:='0';  -- '1' indicates receive link up
	constant CLEAR_PCS_STATUS2 :std_logic:='0';  -- '1' clears any fault detected
	constant CLEAR_TEST_PATT_ERR_COUNT :std_logic:='0';-- only significant when test pattern enabled

	signal SIGNAL_DETECT : std_logic:='1';
	signal TX_FAULT : std_logic:='0';  
  


	------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
	-- Ultrascale
	COMPONENT ten_gig_eth_pcs_pma_0
	PORT (
		rxrecclk_out : OUT STD_LOGIC;
		coreclk : IN STD_LOGIC;
		dclk : IN STD_LOGIC;
		txusrclk : IN STD_LOGIC;
		txusrclk2 : IN STD_LOGIC;
		areset : IN STD_LOGIC;
		txoutclk : OUT STD_LOGIC;
		areset_coreclk : IN STD_LOGIC;
		gttxreset : IN STD_LOGIC;
		gtrxreset : IN STD_LOGIC;
		txuserrdy : IN STD_LOGIC;
		qpll0lock : IN STD_LOGIC;
		qpll0outclk : IN STD_LOGIC;
		qpll0outrefclk : IN STD_LOGIC;
		reset_counter_done : IN STD_LOGIC;
		txp : OUT STD_LOGIC;
		txn : OUT STD_LOGIC;
		rxp : IN STD_LOGIC;
		rxn : IN STD_LOGIC;
		sim_speedup_control : IN STD_LOGIC;
		reset_tx_bufg_gt : OUT STD_LOGIC;
		qpll0reset : OUT STD_LOGIC;
		xgmii_txd : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
		xgmii_txc : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		xgmii_rxd : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
		xgmii_rxc : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		configuration_vector : IN STD_LOGIC_VECTOR(535 DOWNTO 0);
		status_vector : OUT STD_LOGIC_VECTOR(447 DOWNTO 0);
		core_status : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		tx_resetdone : OUT STD_LOGIC;
		rx_resetdone : OUT STD_LOGIC;
		signal_detect : IN STD_LOGIC;
		tx_fault : IN STD_LOGIC;
		drp_req : OUT STD_LOGIC;
		drp_gnt : IN STD_LOGIC;
		core_to_gt_drpen : OUT STD_LOGIC;
		core_to_gt_drpwe : OUT STD_LOGIC;
		core_to_gt_drpaddr : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		core_to_gt_drpdi : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		gt_drprdy : OUT STD_LOGIC;
		gt_drpdo : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		gt_drpen : IN STD_LOGIC;
		gt_drpwe : IN STD_LOGIC;
		gt_drpaddr : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		gt_drpdi : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		core_to_gt_drprdy : IN STD_LOGIC;
		core_to_gt_drpdo : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		tx_disable : OUT STD_LOGIC;
		pma_pmd_type : IN STD_LOGIC_VECTOR(2 DOWNTO 0)
		);
	END COMPONENT;
	
	component ten_gig_eth_mac_0_fifo_block
	generic (
		FIFO_SIZE                        : integer := 512);
	port (
		tx_clk0                          : in  std_logic;
		reset                            : in  std_logic;

		rx_axis_fifo_aresetn             : in  std_logic;
		rx_axis_mac_aresetn              : in  std_logic;
		rx_axis_fifo_tdata               : out std_logic_vector(63 downto 0);
		rx_axis_fifo_tkeep               : out std_logic_vector(7 downto 0);
		rx_axis_fifo_tvalid              : out std_logic;
		rx_axis_fifo_tlast               : out std_logic;
		rx_axis_fifo_tready              : in  std_logic;
		tx_axis_fifo_aresetn             : in  std_logic;
		tx_axis_mac_aresetn              : in std_logic;
		tx_axis_fifo_tdata               : in  std_logic_vector(63 downto 0);
		tx_axis_fifo_tkeep               : in  std_logic_vector(7 downto 0);
		tx_axis_fifo_tvalid              : in  std_logic;
		tx_axis_fifo_tlast               : in  std_logic;
		tx_axis_fifo_tready              : out std_logic;
		tx_ifg_delay                     : in   std_logic_vector(7 downto 0);
		tx_statistics_vector             : out std_logic_vector(25 downto 0);
		tx_statistics_valid              : out std_logic;
		pause_val                        : in  std_logic_vector(15 downto 0);
		pause_req                        : in  std_logic;
		rx_statistics_vector             : out std_logic_vector(29 downto 0);
		rx_statistics_valid              : out std_logic;
		tx_configuration_vector          : in std_logic_vector(79 downto 0);
		rx_configuration_vector          : in std_logic_vector(79 downto 0);
		status_vector                    : out std_logic_vector(2 downto 0);
		tx_dcm_locked                    : in std_logic;
		xgmii_txd                        : out std_logic_vector(63 downto 0); -- Transmitted data
		xgmii_txc                        : out std_logic_vector(7 downto 0);  -- Transmitted control
		rx_clk0                          : in std_logic;
		rx_dcm_locked                    : in std_logic;
		xgmii_rxd                        : in  std_logic_vector(63 downto 0); -- Received data
		xgmii_rxc                        : in  std_logic_vector(7 downto 0)   -- received control
	);
	end component;
  
	signal status_vector_mac :std_logic_vector(2 downto 0);
	signal tx_configuration_vector_core  : std_logic_vector(79 downto 0);
	signal rx_configuration_vector_core  : std_logic_vector(79 downto 0);
	signal mac_core_reset : std_logic;
	signal mac_core_resetn : std_logic;

	signal xgmii_txd_core                : std_logic_vector(63 downto 0);
	signal xgmii_txc_core                : std_logic_vector(7 downto 0);
	signal xgmii_rxd_core                : std_logic_vector(63 downto 0);
	signal xgmii_rxc_core                : std_logic_vector(7 downto 0);

	-- Following are the signals fro Dynamic reconfiguration port
	
	signal drp_req 			  : std_logic;
	signal drp_gnt 			  : std_logic;
	signal core_to_gt_drpen   : std_logic;
	signal core_to_gt_drpwe   : std_logic;
	signal core_to_gt_drpaddr : std_logic_vector(15 downto 0);
	signal core_to_gt_drpdi   : std_logic_vector(15 downto 0);
	signal core_to_gt_drprdy  : std_logic;
	signal core_to_gt_drpdo   : std_logic_vector(15 downto 0);
	signal gt_drpen           : std_logic;
	signal gt_drpwe           : std_logic;
	signal gt_drpaddr         : std_logic_vector(15 downto 0);
	signal gt_drpdi           : std_logic_vector(15 downto 0);
	signal gt_drprdy          : std_logic;
	signal gt_drpdo           : std_logic_vector(15 downto 0);
	

	signal refclk : std_logic;
	signal qpllreset : std_logic;

	signal tx_resetdone_int : std_logic;
	signal rx_resetdone_int : std_logic;

	signal configuration_vector : std_logic_vector(535 downto 0):=(others=>'0');

	-- following are the temporary signals to avoid output ports
	signal resetdone : std_logic;
	signal status_vector : std_logic_vector(447 downto 0);
	signal tx_disable : std_logic;
	signal pma_link_status : std_logic;
	signal rx_sig_det : std_logic;
	signal pcs_rx_link_status : std_logic;
	signal pcs_rx_locked : std_logic;
	signal pcs_hiber : std_logic;
	signal teng_pcs_rx_link_status : std_logic;
	signal pcs_err_block_count : std_logic_vector(7 downto 0);
	signal pcs_ber_count : std_logic_vector(5 downto 0);
	signal pcs_rx_hiber_lh : std_logic;
	signal pcs_rx_locked_ll : std_logic;
	signal pcs_test_patt_err_count : std_logic_vector(15 downto 0);

	signal rst_till_mmcm_locked: std_logic;  
    
    attribute mark_debug   : string; 
    attribute mark_debug of xgmii_rxd_core    : signal is "true";
    attribute mark_debug of xgmii_rxc_core    : signal is "true";
begin

	resetdone <= tx_resetdone_int and rx_resetdone_int;
	
	-- If no arbitration is required on the GT DRP ports then connect REQ to GNT
	-- and connect other signals i <= o;
  
	rst_till_mmcm_locked <= not (pcspma_mmcm_locked_clk156); -- generate active high reset this output will be at logic one , until mmcm is locked
													-- and will reset other units till mmcm is locked or clock is stable at 156.25 MHz, once
													-- mmcm is locked it will release the reset by de_assrting to logic low
  
	configuration_vector(0)   <= PMA_LOOPBACK;
	configuration_vector(15)  <= PMA_RESET;
	configuration_vector(16)  <= GLOBAL_TX_DISABLE;
	configuration_vector(110) <= PCS_LOOPBACK;
	configuration_vector(111) <= PCS_RESET;
	configuration_vector(240) <= DATA_PATT_SEL;
	configuration_vector(241) <= TEST_PATT_SEL;
	configuration_vector(242) <= RX_TEST_PATT_EN;
	configuration_vector(243) <= TX_TEST_PATT_EN;
	configuration_vector(244) <= PRBS31_TX_EN;
	configuration_vector(245) <= PRBS31_RX_EN;
	configuration_vector(399 downto 384) <= x"4C4B";
	configuration_vector(512) <= SET_PMA_LINK_STATUS;
	configuration_vector(516) <= SET_PCS_LINK_STATUS;
	configuration_vector(518) <= CLEAR_PCS_STATUS2;
	configuration_vector(519) <= CLEAR_TEST_PATT_ERR_COUNT;


	pma_link_status			<= status_vector(18);
	rx_sig_det				<= status_vector(48);
	pcs_rx_link_status		<= status_vector(226);
	pcs_rx_locked			<= status_vector(256);
	pcs_hiber				<= status_vector(257);
	teng_pcs_rx_link_status	<= status_vector(268);
	pcs_err_block_count		<= status_vector(279 downto 272);
	pcs_ber_count			<= status_vector(285 downto 280);
	pcs_rx_hiber_lh			<= status_vector(286);
	pcs_rx_locked_ll		<= status_vector(287);
	pcs_test_patt_err_count	<= status_vector(303 downto 288);

	
	-- If no arbitration is required on the GT DRP ports then connect REQ to GNT
	-- and connect other signals core_to_gt_drp* <=> gt_drp*;
	drp_gnt <= drp_req;
	gt_drpen <= core_to_gt_drpen;
	gt_drpwe <= core_to_gt_drpwe;
	gt_drpaddr <= core_to_gt_drpaddr;
	gt_drpdi <= core_to_gt_drpdi;
	core_to_gt_drprdy <= gt_drprdy;
	core_to_gt_drpdo <= gt_drpdo;

	-- #################################################################################################
	--  Instantiate the 10GBASER/KR Block Level
	-- Following is the IP for 10GBASER also known as PCS-PMA. It creates Physical layer interface with 
	-- 10G SFP+. It is often interfaced with the 10G MAC IP.
	-- #################################################################################################

	ten_gig_eth_pcs_pma_i : ten_gig_eth_pcs_pma_0
	PORT MAP (
		----------------------------------
		rxrecclk_out => open,
		reset_tx_bufg_gt => pcspma_reset_tx_bufg_gt,
		qpll0reset => pcspma_qpllreset,
		----------------------------------
		coreclk             => pcspma_clk156,
		dclk                => pcspma_dclk,
		txusrclk            => pcspma_txusrclk,
		txusrclk2           => pcspma_txusrclk2,
		areset              => reset,
		txoutclk            => pcspma_txclk322,
		areset_coreclk      => pcspma_areset_clk156,
		gttxreset           => pcspma_gttxreset,
		gtrxreset           => pcspma_gtrxreset,
		txuserrdy           => pcspma_txuserrdy,
		sim_speedup_control => '0',
		
		qpll0lock            => pcspma_qplllock,
		qpll0outclk          => pcspma_qplloutclk,
		qpll0outrefclk       => pcspma_qplloutrefclk,		
		reset_counter_done  => pcspma_reset_counter_done,
		txp                 => phy0_txp,
		txn                 => phy0_txn,
		rxp                 => phy0_rxp,
		rxn                 => phy0_rxn,
		
		xgmii_txd           => xgmii_txd_core,
		xgmii_txc           => xgmii_txc_core,
		xgmii_rxd           => xgmii_rxd_core,
		xgmii_rxc           => xgmii_rxc_core,	
		
		configuration_vector => configuration_vector,
		status_vector       => status_vector,
		core_status         => open,
		tx_resetdone        => tx_resetdone_int,
		rx_resetdone        => rx_resetdone_int,
		signal_detect       => SIGNAL_DETECT,
		tx_fault            => TX_FAULT,
		drp_req             => drp_req,
		drp_gnt             => drp_gnt,

		core_to_gt_drpen 	=> core_to_gt_drpen,
		core_to_gt_drpwe 	=> core_to_gt_drpwe,
		core_to_gt_drpaddr 	=> core_to_gt_drpaddr,
		core_to_gt_drpdi 	=> core_to_gt_drpdi,
		gt_drprdy 			=> gt_drprdy,
		gt_drpdo 			=> gt_drpdo,
		gt_drpen 			=> gt_drpen,
		gt_drpwe 			=> gt_drpwe,
		gt_drpaddr 			=> gt_drpaddr,
		gt_drpdi 			=> gt_drpdi,
		core_to_gt_drprdy 	=> core_to_gt_drprdy,
		core_to_gt_drpdo 	=> core_to_gt_drpdo,
		tx_disable          => tx_disable,
		pma_pmd_type        => PMA_PMD_TYPE
	);

	tx_configuration_vector_core <= PAUSE_ADDR_VECTOR & TX_CONFIGURATION_VECTOR;
	rx_configuration_vector_core <= PAUSE_ADDR_VECTOR & RX_CONFIGURATION_VECTOR;
	mac_core_reset<= (not resetdone) or rst_till_mmcm_locked or TX_FAULT or (not SIGNAL_DETECT);
	mac_core_resetn<= not mac_core_reset;
	
	
	-- #################################################################################################
	-- FIFO block contains 10 g Ethernet mac support wrapper. This FIFO will 
	-- be helpful when receiving data from PC. a TX FIFO and RX FIFO then can be separated.
	-- #################################################################################################
	
	fifo_block_i : ten_gig_eth_mac_0_fifo_block
	generic map (
		FIFO_SIZE                          => 1024)
	port map (
		tx_clk0                            => pcspma_clk156,
		reset                              => rst_till_mmcm_locked,-- generated from unstable mmcm clk
		rx_axis_mac_aresetn                => mac_core_resetn,-- this reset is OR output of  TRANSCEIVER_RESETDONE(from PCSPMA) with RST_TILL_MMCM_LOCKED
		rx_axis_fifo_aresetn               => mac_core_resetn,
		rx_axis_fifo_tdata                 => rx_axis_tdata,
		rx_axis_fifo_tkeep                 => rx_axis_tkeep,
		rx_axis_fifo_tvalid                => rx_axis_tvalid,
		rx_axis_fifo_tlast                 => rx_axis_tlast,
		rx_axis_fifo_tready                => rx_axis_tready,
		tx_axis_mac_aresetn                => mac_core_resetn,
		tx_axis_fifo_aresetn               => mac_core_resetn,
		tx_axis_fifo_tdata                 => tx_axis_tdata,
		tx_axis_fifo_tkeep                 => tx_axis_tkeep,
		tx_axis_fifo_tvalid                => tx_axis_tvalid,
		tx_axis_fifo_tlast                 => tx_axis_tlast,
		tx_axis_fifo_tready                => tx_axis_tready,
		pause_val                          => X"0000",
		pause_req                          => '0',
		tx_ifg_delay                       => X"00",
		tx_statistics_vector               => open,
		tx_statistics_valid                => open,
		rx_statistics_vector               => open,
		rx_statistics_valid                => open,
		tx_configuration_vector            => tx_configuration_vector_core,
		rx_configuration_vector            => rx_configuration_vector_core,
		status_vector                      => status_vector_mac,
		tx_dcm_locked                      => pcspma_mmcm_locked_clk156,  --'1',
		xgmii_txd                          => xgmii_txd_core,
		xgmii_txc                          => xgmii_txc_core,
		rx_clk0                            => pcspma_clk156,
		rx_dcm_locked                      => pcspma_mmcm_locked_clk156,--'1',
		xgmii_rxd                          => xgmii_rxd_core,
		xgmii_rxc                          => xgmii_rxc_core
	);


end wrapper;
