-------------------------------------------------------------------------------
-- File       : ten_gig_eth_mac_0_support
-- Author     : Xilinx Inc.
-------------------------------------------------------------------------------
-- Description: This is the Support level of the 10 Gigabit Ethernet MAC.
--              If XGMII is selected, it includes the transmit clocking
--              resources. If Internal interface is selected, it is an empty
--              layer of hierarchy.
-------------------------------------------------------------------------------
-- (c) Copyright 2001-2014 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity ten_gig_eth_mac_0_support is
  port(
    tx_clk0                            : in std_logic;
    reset                              : in std_logic;
    tx_axis_aresetn                    : in std_logic;
    tx_axis_tdata                      : in std_logic_vector(63 downto 0);
    tx_axis_tkeep                      : in std_logic_vector(7 downto 0);
    tx_axis_tready                     : out std_logic;
    tx_axis_tvalid                     : in std_logic;
    tx_axis_tlast                      : in std_logic;
    tx_axis_tuser                      : in std_logic_vector(0 downto 0);
    tx_ifg_delay                       : in std_logic_vector(7 downto 0);
    tx_statistics_vector               : out std_logic_vector(25 downto 0);
    tx_statistics_valid                : out std_logic;
    pause_val                          : in  std_logic_vector(15 downto 0);
    pause_req                          : in  std_logic;
    rx_axis_aresetn                    : in std_logic;
    rx_axis_tdata                      : out std_logic_vector(63 downto 0);
    rx_axis_tkeep                      : out std_logic_vector(7 downto 0);
    rx_axis_tvalid                     : out std_logic;
    rx_axis_tuser                      : out std_logic;
    rx_axis_tlast                      : out std_logic;
    rx_statistics_vector               : out std_logic_vector(29 downto 0);
    rx_statistics_valid                : out std_logic;
    tx_configuration_vector            : in std_logic_vector(79 downto 0);
    rx_configuration_vector            : in std_logic_vector(79 downto 0);
    status_vector                      : out std_logic_vector(2 downto 0);

    tx_dcm_locked                      : in std_logic;

    xgmii_txd                          : out std_logic_vector(63 downto 0); -- Transmitted data
    xgmii_txc                          : out std_logic_vector(7 downto 0); -- Transmitted control
    rx_clk0                            : in std_logic;
    rx_dcm_locked                      : in std_logic;
    xgmii_rxd                          : in  std_logic_vector(63 downto 0); -- Received data
    xgmii_rxc                          : in  std_logic_vector(7 downto 0));  -- received control
end ten_gig_eth_mac_0_support;


architecture rtl of ten_gig_eth_mac_0_support is
component ten_gig_eth_mac_0
  port(
    reset                              : in std_logic;
    tx_axis_aresetn                    : in std_logic;
    tx_axis_tdata                      : in std_logic_vector(63 downto 0);
    tx_axis_tkeep                      : in std_logic_vector(7 downto 0);
    tx_axis_tready                     : out std_logic;
    tx_axis_tvalid                     : in std_logic;
    tx_axis_tlast                      : in std_logic;
    tx_axis_tuser                      : in std_logic_vector(0 downto 0);
    tx_ifg_delay                       : in std_logic_vector(7 downto 0);
    tx_statistics_vector               : out std_logic_vector(25 downto 0);
    tx_statistics_valid                : out std_logic;
    pause_val                          : in  std_logic_vector(15 downto 0);
    pause_req                          : in  std_logic;
    rx_axis_aresetn                    : in std_logic;
    rx_axis_tdata                      : out std_logic_vector(63 downto 0);
    rx_axis_tkeep                      : out std_logic_vector(7 downto 0);
    rx_axis_tvalid                     : out std_logic;
    rx_axis_tuser                      : out std_logic;
    rx_axis_tlast                      : out std_logic;
    rx_statistics_vector               : out std_logic_vector(29 downto 0);
    rx_statistics_valid                : out std_logic;
    tx_configuration_vector            : in std_logic_vector(79 downto 0);
    rx_configuration_vector            : in std_logic_vector(79 downto 0);
    status_vector                      : out std_logic_vector(2 downto 0);

    tx_clk0                            : in  std_logic;
    tx_dcm_locked                      : in  std_logic;
    xgmii_txd                          : out std_logic_vector(63 downto 0); -- Transmitted data
    xgmii_txc                          : out std_logic_vector(7 downto 0); -- Transmitted control
    rx_clk0                            : in std_logic;
    rx_dcm_locked                      : in std_logic;
    xgmii_rxd                          : in  std_logic_vector(63 downto 0); -- Received data
    xgmii_rxc                          : in  std_logic_vector(7 downto 0));  -- received control
end component;


begin

  xgmac_i : ten_gig_eth_mac_0
  port map (
    reset                              => reset,
    tx_axis_aresetn                    => tx_axis_aresetn,
    tx_axis_tdata                      => tx_axis_tdata,
    tx_axis_tvalid                     => tx_axis_tvalid,
    tx_axis_tlast                      => tx_axis_tlast,
    tx_axis_tuser                      => tx_axis_tuser,
    tx_ifg_delay                       => tx_ifg_delay,
    tx_axis_tkeep                      => tx_axis_tkeep,
    tx_axis_tready                     => tx_axis_tready,
    tx_statistics_vector               => tx_statistics_vector,
    tx_statistics_valid                => tx_statistics_valid,
    pause_val                          => pause_val,
    pause_req                          => pause_req,
    rx_axis_aresetn                    => rx_axis_aresetn,
    rx_axis_tdata                      => rx_axis_tdata,
    rx_axis_tvalid                     => rx_axis_tvalid,
    rx_axis_tuser                      => rx_axis_tuser,
    rx_axis_tlast                      => rx_axis_tlast,
    rx_axis_tkeep                      => rx_axis_tkeep,
    rx_statistics_vector               => rx_statistics_vector,
    rx_statistics_valid                => rx_statistics_valid,
    tx_configuration_vector            => tx_configuration_vector,
    rx_configuration_vector            => rx_configuration_vector,
    status_vector                      => status_vector,

    tx_clk0                            => tx_clk0,
    tx_dcm_locked                      => tx_dcm_locked,
    xgmii_txd                          => xgmii_txd,
    xgmii_txc                          => xgmii_txc,
    rx_clk0                            => rx_clk0,
    rx_dcm_locked                      => rx_dcm_locked,
    xgmii_rxd                          => xgmii_rxd,
    xgmii_rxc                          => xgmii_rxc);



end rtl;


