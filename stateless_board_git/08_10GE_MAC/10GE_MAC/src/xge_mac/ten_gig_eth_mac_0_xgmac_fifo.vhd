-------------------------------------------------------------------------------
-- Title      : XGMAC Tx/Rx FIFO Wrapper
-- Project    : 10 Gig Ethernet MAC Core
-------------------------------------------------------------------------------
-- File       : ten_gig_eth_mac_0_xgmac_fifo.vhd
-- Author     : Xilinx Inc.
-------------------------------------------------------------------------------
-- Description:
-- This module is the top level entity for the 10 Gig Ethernet MAC FIFO
-- This top level connects together the lower hierarchial
-- entities which create this design. This is illustrated below.
-------------------------------------------------------------------------------
--
--           .---------------------------------------------.
--           |                                             |
--           |       .----------------------------.        |
--           |       |       TRANSMIT_FIFO        |        |
--  ---------|------>|                            |--------|-------> MAC Tx
--           |       |                            |        |         Interface
--           |       '----------------------------'        |
--           |                                             |
--           |                                             |
--           |                                             |
-- External  |                                             |
-- AXI-S     |                                             |
-- Interface |                                             |
--           |                                             |
--           |       .----------------------------.        |
--           |       |       RECEIVE_FIFO         |        |
--  <--------|-------|                            |<-------|--------   MAC Rx Interface
--           |       |                            |        |
--           |       '----------------------------'        |
--           |                                             |
--           |                                             |
--           |                                             |
--           |                                             |
--           |                                             |
--           '---------------------------------------------'
--
-------------------------------------------------------------------------------
-- Functionality:
--
-- 1. TRANSMIT_FIFO accepts 64-bit data from the client and writes
--    this into the Transmitter FIFO. The logic will then extract this from
--    the FIFO and write this data to the MAC Transmitter in 64-bit words.
--
-- 2. RECEIVE_FIFO accepts 64-bit data from the MAC Receiver and
--    writes this into the Receiver FIFO.  The client inferface can then
--    read 64-bit words from this FIFO.
--
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

entity ten_gig_eth_mac_0_xgmac_fifo is
   generic (
      TX_FIFO_SIZE : integer := 512;   -- valid fifo sizes: 512, 1024, 2048, 4096, 8192, 16384 words.
      RX_FIFO_SIZE : integer := 512);  -- valid fifo sizes: 512, 1024, 2048, 4096, 8192, 16384 words.
   port (
      ----------------------------------------------------------------
      -- client interface                                           --
      ----------------------------------------------------------------
      -- tx_wr_clk domain
      tx_axis_fifo_aresetn : in  std_logic;
      tx_axis_fifo_aclk    : in  std_logic;
      tx_axis_fifo_tdata   : in  std_logic_vector(63 downto 0);
      tx_axis_fifo_tkeep   : in  std_logic_vector(7 downto 0);
      tx_axis_fifo_tvalid  : in  std_logic;
      tx_axis_fifo_tlast   : in  std_logic;
      tx_axis_fifo_tready  : out std_logic;
      tx_fifo_full         : out std_logic;
      tx_fifo_status       : out std_logic_vector(3 downto 0);
      --rx_rd_clk domain
      rx_axis_fifo_aresetn : in  std_logic;
      rx_axis_fifo_aclk    : in  std_logic;
      rx_axis_fifo_tdata   : out std_logic_vector(63 downto 0);
      rx_axis_fifo_tkeep   : out std_logic_vector(7 downto 0);
      rx_axis_fifo_tvalid  : out std_logic;
      rx_axis_fifo_tlast   : out std_logic;
      rx_axis_fifo_tready  : in  std_logic;
      rx_fifo_status  : out std_logic_vector(3 downto 0);
      ---------------------------------------------------------------------------
      -- mac transmitter interface                                             --
      ---------------------------------------------------------------------------
      tx_axis_mac_aresetn  : in  std_logic;
      tx_axis_mac_aclk     : in  std_logic;
      tx_axis_mac_tdata    : out std_logic_vector(63 downto 0);
      tx_axis_mac_tkeep    : out std_logic_vector(7 downto 0);
      tx_axis_mac_tvalid   : out std_logic;
      tx_axis_mac_tlast    : out std_logic;
      tx_axis_mac_tready   : in  std_logic;
      ---------------------------------------------------------------------------
      -- mac receiver interface                                                --
      ---------------------------------------------------------------------------
      rx_axis_mac_aresetn  : in  std_logic;
      rx_axis_mac_aclk     : in  std_logic;
      rx_axis_mac_tdata    : in  std_logic_vector(63 downto 0);
      rx_axis_mac_tkeep    : in  std_logic_vector(7 downto 0);
      rx_axis_mac_tvalid   : in  std_logic;
      rx_axis_mac_tlast    : in  std_logic;
      rx_axis_mac_tuser    : in  std_logic;
      rx_fifo_full    : out std_logic
      );
end ten_gig_eth_mac_0_xgmac_fifo;


architecture rtl of ten_gig_eth_mac_0_xgmac_fifo is

component ten_gig_eth_mac_0_axi_fifo is
   generic (
      FIFO_SIZE : integer := 512;
      IS_TX     : boolean := false);
   port (
   -- FIFO write domain
   wr_axis_aresetn : in  std_logic;
   wr_axis_aclk    : in  std_logic;
   wr_axis_tdata   : in  std_logic_vector(63 downto 0);
   wr_axis_tkeep   : in  std_logic_vector(7 downto 0);
   wr_axis_tvalid  : in  std_logic;
   wr_axis_tlast   : in  std_logic;
   wr_axis_tready  : out std_logic;
   wr_axis_tuser   : in  std_logic;

   -- FIFO read domain
   rd_axis_aresetn : in  std_logic;
   rd_axis_aclk    : in  std_logic;
   rd_axis_tdata   : out std_logic_vector(63 downto 0);
   rd_axis_tkeep   : out std_logic_vector(7 downto 0);
   rd_axis_tvalid  : out std_logic;
   rd_axis_tlast   : out std_logic;
   rd_axis_tready  : in  std_logic;

   -- FIFO Status Signals
   fifo_status    : out std_logic_vector(3 downto 0);
   fifo_full      : out std_logic );

end component;


begin

   --Instance the transmit fifo.
  i_tx_fifo : ten_gig_eth_mac_0_axi_fifo
    generic map(
      FIFO_SIZE    => TX_FIFO_SIZE,
      IS_TX        => true)
    port map (
      wr_axis_aresetn => tx_axis_fifo_aresetn,
      wr_axis_aclk    => tx_axis_fifo_aclk,
      wr_axis_tdata   => tx_axis_fifo_tdata,
      wr_axis_tkeep   => tx_axis_fifo_tkeep,
      wr_axis_tvalid  => tx_axis_fifo_tvalid,
      wr_axis_tlast   => tx_axis_fifo_tlast,
      wr_axis_tready  => tx_axis_fifo_tready,
      wr_axis_tuser   => tx_axis_fifo_tlast,
      rd_axis_aresetn => tx_axis_mac_aresetn,
      rd_axis_aclk    => tx_axis_mac_aclk,
      rd_axis_tdata   => tx_axis_mac_tdata,
      rd_axis_tkeep   => tx_axis_mac_tkeep,
      rd_axis_tvalid  => tx_axis_mac_tvalid,
      rd_axis_tlast   => tx_axis_mac_tlast,
      rd_axis_tready  => tx_axis_mac_tready,
      fifo_status     => tx_fifo_status,
      fifo_full       => tx_fifo_full);



   --Instance the receive fifo
   rx_fifo_inst : ten_gig_eth_mac_0_axi_fifo
      generic map (
         FIFO_SIZE      => RX_FIFO_SIZE,
         IS_TX          => false)
      port map (
      wr_axis_aresetn => rx_axis_mac_aresetn,
      wr_axis_aclk    => rx_axis_mac_aclk,
      wr_axis_tdata   => rx_axis_mac_tdata,
      wr_axis_tkeep   => rx_axis_mac_tkeep,
      wr_axis_tvalid  => rx_axis_mac_tvalid,
      wr_axis_tlast   => rx_axis_mac_tlast,
      wr_axis_tready  => open,
      wr_axis_tuser   => rx_axis_mac_tuser,
      rd_axis_aresetn => rx_axis_fifo_aresetn,
      rd_axis_aclk    => rx_axis_fifo_aclk,
      rd_axis_tdata   => rx_axis_fifo_tdata,
      rd_axis_tkeep   => rx_axis_fifo_tkeep,
      rd_axis_tvalid  => rx_axis_fifo_tvalid,
      rd_axis_tlast   => rx_axis_fifo_tlast,
      rd_axis_tready  => rx_axis_fifo_tready,
      fifo_status     => rx_fifo_status,
      fifo_full       => rx_fifo_full);



end rtl;
