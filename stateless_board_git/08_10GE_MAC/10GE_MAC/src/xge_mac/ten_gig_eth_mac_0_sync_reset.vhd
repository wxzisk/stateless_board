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
-- Title      : CDC Sync Reset 
-- Project    : Ten-Gigabit  Ethernet MAC
-------------------------------------------------------------------------------
-- Filename:  : ten_gig_eth_mac_0_sync_reset.vhd
-- Author     : Xilinx Inc.
--------------------------------------------------------------------------------
-- Description: Used to ensure the reset is fully synchronous to the clock domain in which it is used
-- this comprises of a async portion followed by a sync portion
-- Sync specific to an active high reset
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity ten_gig_eth_mac_0_sync_reset is
  
  port (
    reset_in   : in  std_logic;          -- Active high asynchronous reset
    clk        : in  std_logic;          -- clock to be sync'ed to
    reset_out  : out std_logic);         -- "Synchronised" reset signal

end ten_gig_eth_mac_0_sync_reset;

-------------------------------------------------------------------------------

architecture rtl of ten_gig_eth_mac_0_sync_reset is
   signal reset_async0                 : std_logic := '1';
   signal reset_async1                 : std_logic := '1';
   signal reset_async2                 : std_logic := '1';
   signal reset_async3                 : std_logic := '1';
   signal reset_async4                 : std_logic := '1';
   signal reset_sync0                  : std_logic := '1';
   attribute async_reg : string;
   attribute async_reg of reset_async0 : signal is "true";
   attribute async_reg of reset_async1 : signal is "true";
   attribute async_reg of reset_async2 : signal is "true";
   attribute async_reg of reset_async3 : signal is "true";
   attribute async_reg of reset_async4 : signal is "true";
   attribute async_reg of reset_sync0  : signal is "true";
begin  -- rtl

   -- Synchroniser process.
   -- first five flops are asynchronously reset
   p_reset : process (clk, reset_in)
   begin
      if reset_in = '1' then
         reset_async0                  <= '1';
         reset_async1                  <= '1';
         reset_async2                  <= '1';
         reset_async3                  <= '1';
         reset_async4                  <= '1';
      elsif clk'event and clk = '1' then
         reset_async0                  <= '0';
         reset_async1                  <= reset_async0;
         reset_async2                  <= reset_async1;
         reset_async3                  <= reset_async2;
         reset_async4                  <= reset_async3;
      end if;
   end process p_reset;

   -- second two flops are synchronously reset - this is used for all later flops
   -- and should ensure the reset is fully synchronous
   p_sreset : process (clk)
   begin
      if clk'event and clk = '1' then
         if reset_async4 = '1' then
            reset_sync0                <= '1';
            reset_out                  <= '1';
         else
            reset_sync0                <= '0';
            reset_out                  <= reset_sync0;
         end if;
      end if;
   end process p_sreset;
   
end rtl;
