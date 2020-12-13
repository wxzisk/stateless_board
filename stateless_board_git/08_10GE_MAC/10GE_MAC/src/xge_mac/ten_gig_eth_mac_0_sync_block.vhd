-- ------------------------------------------------------------------------------
-- (c) Copyright 2014 Xilinx, Inc. All rights reserved.
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
-- ------------------------------------------------------------------------------
------------------------------------------------------------------------
-- Title      : CDC Sync Block (Synchroniser flip-flop pair)
-- Project    : Ten-Gigabit  Ethernet MAC
-------------------------------------------------------------------------------
-- File       : ten_gig_eth_mac_0_sync_block.vhd
-- Author     : Xilinx Inc.
--------------------------------------------------------------------------------
-- Description: Used on signals crossing from one clock domain to
--              another, this is a 5-stage flip-flop synchronizer.
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity ten_gig_eth_mac_0_sync_block is
   port(
      clk                              : in std_logic;         -- Clock
      data_in                          : in std_logic;         -- Asynchronous data input
      data_out                         : out std_logic         -- Synchronized data out
   );
end ten_gig_eth_mac_0_sync_block;

architecture rtl of ten_gig_eth_mac_0_sync_block is
   -- Internal Signals
   signal data_sync0                   : std_logic;
   signal data_sync1                   : std_logic;
   signal data_sync2                   : std_logic;
   signal data_sync3                   : std_logic;
   signal data_sync4                   : std_logic;

   -- These attributes will stop timing errors being reported in back annotated SDF simulation.
   attribute ASYNC_REG                 : string;
   attribute ASYNC_REG of data_sync0   : signal is "TRUE";
   attribute ASYNC_REG of data_sync1   : signal is "TRUE";
   attribute ASYNC_REG of data_sync2   : signal is "TRUE";
   attribute ASYNC_REG of data_sync3   : signal is "TRUE";
   attribute ASYNC_REG of data_sync4   : signal is "TRUE";
  
   attribute SHREG_EXTRACT               : string;
   attribute SHREG_EXTRACT of data_sync0 : signal is "NO";
   attribute SHREG_EXTRACT of data_sync1 : signal is "NO";
   attribute SHREG_EXTRACT of data_sync2 : signal is "NO";
   attribute SHREG_EXTRACT of data_sync3 : signal is "NO";
   attribute SHREG_EXTRACT of data_sync4 : signal is "NO";
begin

   -- Synchronize into this clock domain in a safe way
   p_sync: process (clk)
   begin  -- process p_sync
      if clk'event and clk = '1' then  -- rising clock edge
         data_sync0                    <= data_in;
         data_sync1                    <= data_sync0;
         data_sync2                    <= data_sync1;
         data_sync3                    <= data_sync2;
         data_sync4                    <= data_sync3;
      end if;
   end process p_sync;
   
   data_out                            <= data_sync4;

end rtl;
