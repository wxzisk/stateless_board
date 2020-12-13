-------------------------------------------------------------------------------
-- File       : ten_gig_eth_mac_0_fifo_block.vhd
-- Author     : Xilinx Inc.
-------------------------------------------------------------------------------
-- Description: This is the FIFO block level VHDL code for the
-- Ten Gigabit Ethernet MAC. It contains the block level instance and
-- AXI FIFOs
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

library unisim;
use unisim.vcomponents.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ten_gig_eth_mac_0_fifo_block is
  generic (
    FIFO_SIZE                          : integer := 512);
  port(
    tx_clk0                            : in  std_logic;
    reset                              : in std_logic;
    ---------------------------------------------------------------------------
    -- Interface to the host.
    ---------------------------------------------------------------------------
    tx_axis_mac_aresetn                : in  std_logic;                     -- Resets the MAC.
    tx_dcm_locked                      : in  std_logic;

    tx_ifg_delay                       : in   std_logic_vector(7 downto 0); -- Temporary. IFG delay.
    tx_statistics_vector               : out std_logic_vector(25 downto 0); -- Statistics information on the last frame.
    tx_statistics_valid                : out std_logic;                     -- High when stats are valid.

    pause_val                          : in  std_logic_vector(15 downto 0); -- Indicates the length of the pause that should be transmitted.
    pause_req                          : in  std_logic;                     -- A '1' indicates that a pause frame should  be sent.
    rx_axis_fifo_aresetn               : in  std_logic;
    rx_axis_fifo_tdata                 : out std_logic_vector(63 downto 0);
    rx_axis_fifo_tkeep                 : out std_logic_vector(7 downto 0);
    rx_axis_fifo_tvalid                : out std_logic;
    rx_axis_fifo_tlast                 : out std_logic;
    rx_axis_fifo_tready                : in  std_logic;
    tx_axis_fifo_aresetn               : in  std_logic;
    tx_axis_fifo_tdata                 : in  std_logic_vector(63 downto 0);
    tx_axis_fifo_tkeep                 : in  std_logic_vector(7 downto 0);
    tx_axis_fifo_tvalid                : in  std_logic;
    tx_axis_fifo_tlast                 : in  std_logic;
    tx_axis_fifo_tready                : out std_logic;

    rx_axis_mac_aresetn                : in  std_logic;
    rx_clk0                            : in  std_logic;
    rx_dcm_locked                      : in  std_logic;
    rx_statistics_vector               : out std_logic_vector(29 downto 0); -- Statistics info on the last received frame.
    rx_statistics_valid                : out std_logic;                     -- High when above stats are valid.
    tx_configuration_vector            : in std_logic_vector(79 downto 0);
    rx_configuration_vector            : in std_logic_vector(79 downto 0);
    status_vector                      : out std_logic_vector(2 downto 0);
    xgmii_txd                          : out std_logic_vector(63 downto 0); -- Transmitted data
    xgmii_txc                          : out std_logic_vector(7 downto 0);  -- Transmitted control
    xgmii_rxd                          : in  std_logic_vector(63 downto 0); -- Received data
    xgmii_rxc                          : in  std_logic_vector(7 downto 0)  -- received control
);
end ten_gig_eth_mac_0_fifo_block;


architecture wrapper of ten_gig_eth_mac_0_fifo_block is

  -----------------------------------------------------------------------------
  -- Component Declaration for XGMAC (the 10Gb/E MAC core).
  -----------------------------------------------------------------------------
  component ten_gig_eth_mac_0_support
  port (
    tx_clk0                            : in std_logic;
    reset                              : in std_logic;
    tx_axis_aresetn                    : in std_logic;
    tx_axis_tdata                      : in std_logic_vector(63 downto 0);
    tx_axis_tvalid                     : in std_logic;
    tx_axis_tlast                      : in std_logic;

    tx_axis_tuser                      : in std_logic_vector(0 downto 0);
    tx_ifg_delay                            : in std_logic_vector(7 downto 0);
    tx_axis_tkeep                      : in std_logic_vector(7 downto 0);
    tx_axis_tready                     : out std_logic;
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
    xgmii_txc                          : out std_logic_vector(7 downto 0);  -- Transmitted control
    rx_clk0                            : in  std_logic;
    rx_dcm_locked                      : in  std_logic;
    xgmii_rxd                          : in  std_logic_vector(63 downto 0); -- Received data
    xgmii_rxc                          : in  std_logic_vector(7 downto 0)   -- received control
  );
  end component;

  -----------------------------------------------------------------------------
  -- Component declaration for the client loopback design.
  -----------------------------------------------------------------------------
  component ten_gig_eth_mac_0_xgmac_fifo
  generic (
    TX_FIFO_SIZE                       : integer := 512;
    RX_FIFO_SIZE                       : integer := 512
  );
  port (
    ----------------------------------------------------------------
    -- client interface                                           --
    ----------------------------------------------------------------
    -- tx_wr_clk domain
    tx_axis_fifo_aresetn               : in  std_logic;
    tx_axis_fifo_aclk                  : in  std_logic;
    tx_axis_fifo_tdata                 : in  std_logic_vector(63 downto 0);
    tx_axis_fifo_tkeep                 : in  std_logic_vector(7 downto 0);
    tx_axis_fifo_tvalid                : in  std_logic;
    tx_axis_fifo_tlast                 : in  std_logic;
    tx_axis_fifo_tready                : out std_logic;
    tx_fifo_full                       : out std_logic;
    tx_fifo_status                     : out std_logic_vector(3 downto 0);
    --rx_rd_clk domain
    rx_axis_fifo_aresetn               : in  std_logic;
    rx_axis_fifo_aclk                  : in  std_logic;
    rx_axis_fifo_tdata                 : out std_logic_vector(63 downto 0);
    rx_axis_fifo_tkeep                 : out std_logic_vector(7 downto 0);
    rx_axis_fifo_tvalid                : out std_logic;
    rx_axis_fifo_tlast                 : out std_logic;
    rx_axis_fifo_tready                : in  std_logic;
    rx_fifo_status                     : out std_logic_vector(3 downto 0);
    ---------------------------------------------------------------------------
    -- mac transmitter interface                                             --
    ---------------------------------------------------------------------------
    tx_axis_mac_aresetn                : in  std_logic;
    tx_axis_mac_aclk                   : in  std_logic;
    tx_axis_mac_tdata                  : out std_logic_vector(63 downto 0);
    tx_axis_mac_tkeep                  : out std_logic_vector(7 downto 0);
    tx_axis_mac_tvalid                 : out std_logic;
    tx_axis_mac_tlast                  : out std_logic;
    tx_axis_mac_tready                 : in  std_logic;
    ---------------------------------------------------------------------------
    -- mac receiver interface                                                --
    ---------------------------------------------------------------------------
    rx_axis_mac_aresetn                : in  std_logic;
    rx_axis_mac_aclk                   : in  std_logic;
    rx_axis_mac_tdata                  : in  std_logic_vector(63 downto 0);
    rx_axis_mac_tkeep                  : in  std_logic_vector(7 downto 0);
    rx_axis_mac_tvalid                 : in  std_logic;
    rx_axis_mac_tlast                  : in  std_logic;
    rx_axis_mac_tuser                  : in  std_logic;
    rx_fifo_full                       : out std_logic
  );
  end component;



  signal tx_axis_mac_tdata             : std_logic_vector(63 downto 0);
  signal tx_axis_mac_tkeep             : std_logic_vector(7 downto 0);
  signal tx_axis_mac_tvalid            : std_logic;
  signal tx_axis_mac_tlast             : std_logic;
  signal tx_axis_mac_tready            : std_logic;
  signal tx_axis_mac_aresetn_i         : std_logic;
  signal tx_axis_fifo_aresetn_i        : std_logic;
  signal rx_axis_mac_tdata             : std_logic_vector(63 downto 0);
  signal rx_axis_mac_tkeep             : std_logic_vector(7 downto 0);
  signal rx_axis_mac_tvalid            : std_logic;
  signal rx_axis_mac_tuser             : std_logic;
  signal rx_axis_mac_tlast             : std_logic;
  signal rx_axis_mac_aresetn_i         : std_logic;
  signal rx_axis_fifo_aresetn_i        : std_logic;
  signal rx_configuration_vector_int   : std_logic_vector(79 downto 0);
  signal tx_configuration_vector_int   : std_logic_vector(79 downto 0);



  attribute keep : string;
  attribute keep of tx_axis_mac_tdata  : signal is "true";
  attribute keep of tx_axis_mac_tkeep  : signal is "true";
  attribute keep of tx_axis_mac_tvalid : signal is "true";
  attribute keep of tx_axis_mac_tlast  : signal is "true";
  attribute keep of tx_axis_mac_tready : signal is "true";
  attribute keep of rx_axis_mac_tdata  : signal is "true";
  attribute keep of rx_axis_mac_tkeep  : signal is "true";
  attribute keep of rx_axis_mac_tvalid : signal is "true";
  attribute keep of rx_axis_mac_tuser  : signal is "true";
  attribute keep of rx_axis_mac_tlast  : signal is "true";

begin
  ------------------------------
  -- Instantiate the XGMAC core
  ------------------------------
  rx_axis_mac_aresetn_i       <= not reset or rx_axis_mac_aresetn;
  tx_axis_mac_aresetn_i       <= not reset or tx_axis_mac_aresetn;
  rx_axis_fifo_aresetn_i      <= not reset or rx_axis_fifo_aresetn;
  tx_axis_fifo_aresetn_i      <= not reset or tx_axis_fifo_aresetn;
  rx_configuration_vector_int <= rx_configuration_vector;
  tx_configuration_vector_int <= tx_configuration_vector;

  xgmac_support_i : ten_gig_eth_mac_0_support
  port map (
    tx_clk0                            => tx_clk0,
    reset                              => reset,
    tx_axis_aresetn                    => tx_axis_mac_aresetn,
    tx_axis_tdata                      => tx_axis_mac_tdata,
    tx_axis_tvalid                     => tx_axis_mac_tvalid,
    tx_axis_tlast                      => tx_axis_mac_tlast,
    tx_axis_tuser                      => (others => '0'),
    tx_ifg_delay                       => tx_ifg_delay,
    tx_axis_tkeep                      => tx_axis_mac_tkeep,
    tx_axis_tready                     => tx_axis_mac_tready,
    tx_statistics_vector               => tx_statistics_vector,
    tx_statistics_valid                => tx_statistics_valid,
    pause_val                          => pause_val,
    pause_req                          => pause_req,
    rx_axis_aresetn                    => rx_axis_mac_aresetn,
    rx_axis_tdata                      => rx_axis_mac_tdata,
    rx_axis_tkeep                      => rx_axis_mac_tkeep,
    rx_axis_tvalid                     => rx_axis_mac_tvalid,
    rx_axis_tuser                      => rx_axis_mac_tuser,
    rx_axis_tlast                      => rx_axis_mac_tlast,
    rx_statistics_vector               => rx_statistics_vector,
    rx_statistics_valid                => rx_statistics_valid,
    tx_configuration_vector            => tx_configuration_vector_int,
    rx_configuration_vector            => rx_configuration_vector_int,
    status_vector                      => status_vector,
    tx_dcm_locked                      => tx_dcm_locked,
    xgmii_txd                          => xgmii_txd,
    xgmii_txc                          => xgmii_txc,
    rx_clk0                            => rx_clk0,
    rx_dcm_locked                      => rx_dcm_locked,
    xgmii_rxd                          => xgmii_rxd,
    xgmii_rxc                          => xgmii_rxc
  );

  -------------------------------------------
  -- Instantiate the example client loopback.
  -------------------------------------------
  ten_gig_ethernet_mac_fifo : ten_gig_eth_mac_0_xgmac_fifo
  generic map (
    TX_FIFO_SIZE                       => FIFO_SIZE,
    RX_FIFO_SIZE                       => FIFO_SIZE
  )
  port map (
    tx_axis_fifo_aresetn               => tx_axis_fifo_aresetn_i,
    tx_axis_fifo_aclk                  => rx_clk0,
    tx_axis_fifo_tdata                 => tx_axis_fifo_tdata,
    tx_axis_fifo_tkeep                 => tx_axis_fifo_tkeep,
    tx_axis_fifo_tvalid                => tx_axis_fifo_tvalid,
    tx_axis_fifo_tlast                 => tx_axis_fifo_tlast,
    tx_axis_fifo_tready                => tx_axis_fifo_tready,
    tx_fifo_full                       => open,
    tx_fifo_status                     => open,
    rx_axis_fifo_aresetn               => rx_axis_fifo_aresetn_i,
    rx_axis_fifo_aclk                  => rx_clk0,
    rx_axis_fifo_tdata                 => rx_axis_fifo_tdata,
    rx_axis_fifo_tkeep                 => rx_axis_fifo_tkeep,
    rx_axis_fifo_tvalid                => rx_axis_fifo_tvalid,
    rx_axis_fifo_tlast                 => rx_axis_fifo_tlast,
    rx_axis_fifo_tready                => rx_axis_fifo_tready,
    rx_fifo_status                     => open,
    --MAC Tx Client Interface
    tx_axis_mac_aresetn                => tx_axis_mac_aresetn_i,
    tx_axis_mac_aclk                   => tx_clk0,
    tx_axis_mac_tdata                  => tx_axis_mac_tdata,
    tx_axis_mac_tkeep                  => tx_axis_mac_tkeep,
    tx_axis_mac_tvalid                 => tx_axis_mac_tvalid,
    tx_axis_mac_tlast                  => tx_axis_mac_tlast,
    tx_axis_mac_tready                 => tx_axis_mac_tready,
    --MAC Rx Client Interface
    rx_axis_mac_aresetn                => rx_axis_mac_aresetn_i,
    rx_axis_mac_aclk                   => rx_clk0,
    rx_axis_mac_tdata                  => rx_axis_mac_tdata,
    rx_axis_mac_tkeep                  => rx_axis_mac_tkeep,
    rx_axis_mac_tvalid                 => rx_axis_mac_tvalid,
    rx_axis_mac_tlast                  => rx_axis_mac_tlast,
    rx_axis_mac_tuser                  => rx_axis_mac_tuser,
    rx_fifo_full                       => open
  );


end wrapper;


