----------------------------------------------------------------------------
-- Title      : FIFO BRAM
-- Project    : Ten Gigabit Ethernet MAC core
----------------------------------------------------------------------------
-- File       : fifo_ram.vhd
-- Author     : Xilinx, Inc.
----------------------------------------------------------------------------
-- Description: BRAM used by tx and rx FIFOs
-------------------------------------------------------------------------------
-- (c) Copyright 2004-2014 Xilinx, Inc. All rights reserved.
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

entity ten_gig_eth_mac_0_fifo_ram is
   generic (
      ADDR_WIDTH : integer := 9);
   port (
      wr_clk    : in  std_logic;
      wr_addr   : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
      data_in   : in  std_logic_vector(63 downto 0);
      ctrl_in   : in  std_logic_vector(3 downto 0);
      wr_allow  : in  std_logic;
      rd_clk    : in  std_logic;
      rd_sreset : in  std_logic;
      rd_addr   : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
      data_out  : out std_logic_vector(63 downto 0);
      ctrl_out  : out std_logic_vector(3 downto 0);
      rd_allow  : in  std_logic);
end ten_gig_eth_mac_0_fifo_ram;

library ieee;
use ieee.numeric_std.all;

architecture rtl of ten_gig_eth_mac_0_fifo_ram is
   constant RAM_DEPTH : integer := 2 ** ADDR_WIDTH;
   type ram_typ is array (RAM_DEPTH-1 downto 0) 
        of std_logic_vector(67 downto 0);
   signal ram : ram_typ := (others => (others => '0'));
   signal wr_data : std_logic_vector(67 downto 0);
   signal rd_data : std_logic_vector(67 downto 0);
   signal rd_addr_int, wr_addr_int : unsigned(ADDR_WIDTH-1 downto 0);
   signal rd_allow_int : std_logic;
   
  attribute ram_style                  : string;
  attribute ram_style of ram           : signal is "block";
begin
   wr_data(63 downto 0)  <= data_in;
   wr_data(67 downto 64) <= ctrl_in;

   data_out <= rd_data(63 downto 0);
   ctrl_out <= rd_data(67 downto 64);

   -- Type conversion to allow RAM indexing to work
   rd_addr_int <= unsigned(rd_addr);
   wr_addr_int <= unsigned(wr_addr);

   --Block RAM must be enabled for synchronous reset to work.
   rd_allow_int <= rd_allow or rd_sreset;

   ------------------------------------------------------------------------
   -- Infer BRAMs and connect them
   -- appropriately.
   ------------------------------------------------------------------------   

   p_write_ram : process (wr_clk)
   begin
     if rising_edge(wr_clk) then
       if wr_allow = '1' then
         ram(TO_INTEGER(wr_addr_int)) <= wr_data;
       end if;
     end if;
   end process p_write_ram;

   p_read_ram  : process (rd_clk)
   begin
     if rising_edge(rd_clk) then
       if rd_allow_int = '1' then
         if rd_sreset = '1' then
           rd_data <= (others => '0');
         else
           rd_data <= ram(TO_INTEGER(rd_addr_int));
         end if;
       end if;
     end if;
   end process p_read_ram;

end rtl;
