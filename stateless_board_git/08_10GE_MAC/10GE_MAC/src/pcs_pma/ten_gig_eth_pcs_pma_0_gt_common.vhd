-------------------------------------------------------------------------------
-- Title      : GT Common wrapper                                             
-- Project    : 10GBASE-R                                                      
-------------------------------------------------------------------------------
-- File       : ten_gig_eth_pcs_pma_0_gt_common.vhd                                          
-------------------------------------------------------------------------------
-- Description: This file contains the 
-- 10GBASE-R Transceiver GT Common block.                
-------------------------------------------------------------------------------
-- (c) Copyright 2009 - 2014 Xilinx, Inc. All rights reserved.
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

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

library gtwizard_ultrascale_v1_6_5;
use gtwizard_ultrascale_v1_6_5.all;

entity  ten_gig_eth_pcs_pma_0_gt_common is
  generic
  (
    WRAPPER_SIM_GTRESET_SPEEDUP : string := "false"  --Does not affect hardware
  );
  port
  (
    refclk         : in  std_logic;
    qpllreset      : in  std_logic;
    qpll0lock       : out std_logic;
    qpll0outclk     : out std_logic;
    qpll0outrefclk  : out std_logic
    );
end entity ten_gig_eth_pcs_pma_0_gt_common;

architecture wrapper of ten_gig_eth_pcs_pma_0_gt_common is

  component ten_gig_eth_pcs_pma_0_gt_common_wrapper
  port(
    GTHE3_COMMON_BGBYPASSB : in std_logic_vector(0 downto 0);
    GTHE3_COMMON_BGMONITORENB : in std_logic_vector(0 downto 0);
    GTHE3_COMMON_BGPDB : in std_logic_vector(0 downto 0);
    GTHE3_COMMON_BGRCALOVRD : in std_logic_vector(4 downto 0);
    GTHE3_COMMON_BGRCALOVRDENB : in std_logic_vector(0 downto 0);
    GTHE3_COMMON_DRPADDR : in std_logic_vector(8 downto 0);
    GTHE3_COMMON_DRPCLK : in std_logic_vector(0 downto 0);
    GTHE3_COMMON_DRPDI : in std_logic_vector(15 downto 0);
    GTHE3_COMMON_DRPDO : out std_logic_vector(15 downto 0);
    GTHE3_COMMON_DRPEN : in std_logic_vector(0 downto 0);
    GTHE3_COMMON_DRPRDY : out std_logic_vector(0 downto 0);
    GTHE3_COMMON_DRPWE : in std_logic_vector(0 downto 0);
    GTHE3_COMMON_GTGREFCLK0 : in std_logic_vector(0 downto 0);
    GTHE3_COMMON_GTGREFCLK1 : in std_logic_vector(0 downto 0);
    GTHE3_COMMON_GTNORTHREFCLK00 : in std_logic_vector(0 downto 0);
    GTHE3_COMMON_GTNORTHREFCLK01 : in std_logic_vector(0 downto 0);
    GTHE3_COMMON_GTNORTHREFCLK10 : in std_logic_vector(0 downto 0);
    GTHE3_COMMON_GTNORTHREFCLK11 : in std_logic_vector(0 downto 0);
    GTHE3_COMMON_GTREFCLK00 : in std_logic_vector(0 downto 0);
    GTHE3_COMMON_GTREFCLK01 : in std_logic_vector(0 downto 0);
    GTHE3_COMMON_GTREFCLK10 : in std_logic_vector(0 downto 0);
    GTHE3_COMMON_GTREFCLK11 : in std_logic_vector(0 downto 0);
    GTHE3_COMMON_GTSOUTHREFCLK00 : in std_logic_vector(0 downto 0);
    GTHE3_COMMON_GTSOUTHREFCLK01 : in std_logic_vector(0 downto 0);
    GTHE3_COMMON_GTSOUTHREFCLK10 : in std_logic_vector(0 downto 0);
    GTHE3_COMMON_GTSOUTHREFCLK11 : in std_logic_vector(0 downto 0);
    GTHE3_COMMON_PMARSVD0 : in std_logic_vector(7 downto 0);
    GTHE3_COMMON_PMARSVD1 : in std_logic_vector(7 downto 0);
    GTHE3_COMMON_PMARSVDOUT0 : out std_logic_vector(7 downto 0);
    GTHE3_COMMON_PMARSVDOUT1 : out std_logic_vector(7 downto 0);
    GTHE3_COMMON_QPLL0CLKRSVD0 : in std_logic_vector(0 downto 0);
    GTHE3_COMMON_QPLL0CLKRSVD1 : in std_logic_vector(0 downto 0);
    GTHE3_COMMON_QPLL0FBCLKLOST : out std_logic_vector(0 downto 0);
    GTHE3_COMMON_QPLL0LOCK : out std_logic_vector(0 downto 0);
    GTHE3_COMMON_QPLL0LOCKDETCLK : in std_logic_vector(0 downto 0);
    GTHE3_COMMON_QPLL0LOCKEN : in std_logic_vector(0 downto 0);
    GTHE3_COMMON_QPLL0OUTCLK : out std_logic_vector(0 downto 0);
    GTHE3_COMMON_QPLL0OUTREFCLK : out std_logic_vector(0 downto 0);
    GTHE3_COMMON_QPLL0PD : in std_logic_vector(0 downto 0);
    GTHE3_COMMON_QPLL0REFCLKLOST : out std_logic_vector(0 downto 0);
    GTHE3_COMMON_QPLL0REFCLKSEL : in std_logic_vector(2 downto 0);
    GTHE3_COMMON_QPLL0RESET : in std_logic_vector(0 downto 0);
    GTHE3_COMMON_QPLL1CLKRSVD0 : in std_logic_vector(0 downto 0);
    GTHE3_COMMON_QPLL1CLKRSVD1 : in std_logic_vector(0 downto 0);
    GTHE3_COMMON_QPLL1FBCLKLOST : out std_logic_vector(0 downto 0);
    GTHE3_COMMON_QPLL1LOCK : out std_logic_vector(0 downto 0);
    GTHE3_COMMON_QPLL1LOCKDETCLK : in std_logic_vector(0 downto 0);
    GTHE3_COMMON_QPLL1LOCKEN : in std_logic_vector(0 downto 0);
    GTHE3_COMMON_QPLL1OUTCLK : out std_logic_vector(0 downto 0);
    GTHE3_COMMON_QPLL1OUTREFCLK : out std_logic_vector(0 downto 0);
    GTHE3_COMMON_QPLL1PD : in std_logic_vector(0 downto 0);
    GTHE3_COMMON_QPLL1REFCLKLOST : out std_logic_vector(0 downto 0);
    GTHE3_COMMON_QPLL1REFCLKSEL : in std_logic_vector(2 downto 0);
    GTHE3_COMMON_QPLL1RESET : in std_logic_vector(0 downto 0);
    GTHE3_COMMON_QPLLDMONITOR0 : out std_logic_vector(7 downto 0);
    GTHE3_COMMON_QPLLDMONITOR1 : out std_logic_vector(7 downto 0);
    GTHE3_COMMON_QPLLRSVD1 : in std_logic_vector(7 downto 0);
    GTHE3_COMMON_QPLLRSVD2 : in std_logic_vector(4 downto 0);
    GTHE3_COMMON_QPLLRSVD3 : in std_logic_vector(4 downto 0);
    GTHE3_COMMON_QPLLRSVD4 : in std_logic_vector(7 downto 0);
    GTHE3_COMMON_RCALENB : in std_logic_vector(0 downto 0);
    GTHE3_COMMON_REFCLKOUTMONITOR0 : out std_logic_vector(0 downto 0);
    GTHE3_COMMON_REFCLKOUTMONITOR1 : out std_logic_vector(0 downto 0);
    GTHE3_COMMON_RXRECCLK0_SEL : out std_logic_vector(1 downto 0);
    GTHE3_COMMON_RXRECCLK1_SEL : out std_logic_vector(1 downto 0)
  );  end component;


    -- ground and tied_to_vcc_i signals
    signal  tied_to_ground_i                :   std_logic;
    signal  tied_to_ground_vec_i            :   std_logic_vector(63 downto 0);
    signal  tied_to_vcc_i                   :   std_logic;

    signal  gt_qpll0pd                      :   std_logic := '0';
    signal  gt_qpll1pd                      :   std_logic := '1';

  -- List of signals to connect to GT Common block
  -- Instantiate the 10GBASER/KR GT Common block
  signal GTHE3_COMMON_GTREFCLK00 : std_logic;
  signal GTHE3_COMMON_GTREFCLK00_int : std_logic_vector(0 downto 0);
  signal GTHE3_COMMON_QPLL0LOCK : std_logic;
  signal GTHE3_COMMON_QPLL0LOCK_int : std_logic_vector(0 downto 0);
  signal GTHE3_COMMON_QPLL0OUTCLK : std_logic;
  signal GTHE3_COMMON_QPLL0OUTCLK_int : std_logic_vector(0 downto 0);
  signal GTHE3_COMMON_QPLL0OUTREFCLK : std_logic;
  signal GTHE3_COMMON_QPLL0OUTREFCLK_int : std_logic_vector(0 downto 0);
  signal GTHE3_COMMON_QPLL0PD : std_logic;
  signal GTHE3_COMMON_QPLL0PD_int : std_logic_vector(0 downto 0);
  signal GTHE3_COMMON_QPLL0REFCLKSEL : std_logic_vector(2 downto 0);
  signal GTHE3_COMMON_QPLL0RESET : std_logic;
  signal GTHE3_COMMON_QPLL0RESET_int : std_logic_vector(0 downto 0);
  signal GTHE3_COMMON_QPLL1PD : std_logic;
  signal GTHE3_COMMON_QPLL1PD_int : std_logic_vector(0 downto 0);



    
--*************************Logic to set Attribute QPLL_FB_DIV*****************************
    impure function conv_qpll_fbdiv_top (qpllfbdiv_top : in integer) return bit_vector is
    begin
       if (qpllfbdiv_top = 16) then
         return "0000100000";
       elsif (qpllfbdiv_top = 20) then
         return "0000110000" ;
       elsif (qpllfbdiv_top = 32) then
         return "0001100000" ;
       elsif (qpllfbdiv_top = 40) then
         return "0010000000" ;
       elsif (qpllfbdiv_top = 64) then
         return "0011100000" ;
       elsif (qpllfbdiv_top = 66) then
         return "0101000000" ;
       elsif (qpllfbdiv_top = 80) then
         return "0100100000" ;
       elsif (qpllfbdiv_top = 100) then
         return "0101110000" ;
       else 
         return "0000000000" ;
       end if;
    end function;

    impure function conv_qpll_fbdiv_ratio (qpllfbdiv_top : in integer) return bit is
    begin
       if (qpllfbdiv_top = 16) then
         return '1';
       elsif (qpllfbdiv_top = 20) then
         return '1' ;
       elsif (qpllfbdiv_top = 32) then
         return '1' ;
       elsif (qpllfbdiv_top = 40) then
         return '1' ;
       elsif (qpllfbdiv_top = 64) then
         return '1' ;
       elsif (qpllfbdiv_top = 66) then
         return '0' ;
       elsif (qpllfbdiv_top = 80) then
         return '1' ;
       elsif (qpllfbdiv_top = 100) then
         return '1' ;
       else 
         return '1' ;
       end if;
    end function;

    constant QPLL_FBDIV_TOP                 : integer  := 66;
    constant   QPLL_FBDIV_IN    :   bit_vector(9 downto 0) := conv_qpll_fbdiv_top(QPLL_FBDIV_TOP);
    constant   QPLL_FBDIV_RATIO :   bit := conv_qpll_fbdiv_ratio(QPLL_FBDIV_TOP);

begin

    tied_to_ground_i                    <= '0';
    tied_to_ground_vec_i(63 downto 0)   <= (others => '0');
    tied_to_vcc_i                       <= '1';
    

  GTHE3_COMMON_GTREFCLK00 <= refclk;
  GTHE3_COMMON_QPLL0REFCLKSEL <= "001";
  GTHE3_COMMON_QPLL0RESET <= qpllreset;
  GTHE3_COMMON_QPLL0PD <= gt_qpll0pd;
  GTHE3_COMMON_QPLL1PD <= gt_qpll1pd;
  qpll0lock <= GTHE3_COMMON_QPLL0LOCK;
  qpll0outclk <= GTHE3_COMMON_QPLL0OUTCLK;
  qpll0outrefclk <= GTHE3_COMMON_QPLL0OUTREFCLK;
  
    
  -- Instantiate the 10GBASER/KR GT Common block
  -- Map single bits to unit-length vectors...
  GTHE3_COMMON_GTREFCLK00_int(0) <= GTHE3_COMMON_GTREFCLK00;
  GTHE3_COMMON_QPLL0LOCK <= GTHE3_COMMON_QPLL0LOCK_int(0);
  GTHE3_COMMON_QPLL0OUTCLK <= GTHE3_COMMON_QPLL0OUTCLK_int(0);
  GTHE3_COMMON_QPLL0OUTREFCLK <= GTHE3_COMMON_QPLL0OUTREFCLK_int(0);
  GTHE3_COMMON_QPLL0PD_int(0) <= GTHE3_COMMON_QPLL0PD;
  GTHE3_COMMON_QPLL0RESET_int(0) <= GTHE3_COMMON_QPLL0RESET;
  GTHE3_COMMON_QPLL1PD_int(0) <= GTHE3_COMMON_QPLL1PD;


  -- Instance of GT
  ten_gig_eth_pcs_pma_0_gt_common_wrapper_i : ten_gig_eth_pcs_pma_0_gt_common_wrapper
  port map(
    GTHE3_COMMON_BGBYPASSB => "1",
    GTHE3_COMMON_BGMONITORENB => "1",
    GTHE3_COMMON_BGPDB => "1",
    GTHE3_COMMON_BGRCALOVRD => "11111",
    GTHE3_COMMON_BGRCALOVRDENB => "1",
    GTHE3_COMMON_DRPADDR => "000000000",
    GTHE3_COMMON_DRPCLK => "0",
    GTHE3_COMMON_DRPDI => "0000000000000000",
    GTHE3_COMMON_DRPDO => open,
    GTHE3_COMMON_DRPEN => "0",
    GTHE3_COMMON_DRPRDY => open,
    GTHE3_COMMON_DRPWE => "0",
    GTHE3_COMMON_GTGREFCLK0 => "0",
    GTHE3_COMMON_GTGREFCLK1 => "0",
    GTHE3_COMMON_GTNORTHREFCLK00 => "0",
    GTHE3_COMMON_GTNORTHREFCLK01 => "0",
    GTHE3_COMMON_GTNORTHREFCLK10 => "0",
    GTHE3_COMMON_GTNORTHREFCLK11 => "0",
    GTHE3_COMMON_GTREFCLK00 => GTHE3_COMMON_GTREFCLK00_int,
    GTHE3_COMMON_GTREFCLK01 => "0",
    GTHE3_COMMON_GTREFCLK10 => "0",
    GTHE3_COMMON_GTREFCLK11 => "0",
    GTHE3_COMMON_GTSOUTHREFCLK00 => "0",
    GTHE3_COMMON_GTSOUTHREFCLK01 => "0",
    GTHE3_COMMON_GTSOUTHREFCLK10 => "0",
    GTHE3_COMMON_GTSOUTHREFCLK11 => "0",
    GTHE3_COMMON_PMARSVD0 => "00000000",
    GTHE3_COMMON_PMARSVD1 => "00000000",
    GTHE3_COMMON_PMARSVDOUT0 => open,
    GTHE3_COMMON_PMARSVDOUT1 => open,
    GTHE3_COMMON_QPLL0CLKRSVD0 => "0",
    GTHE3_COMMON_QPLL0CLKRSVD1 => "0",
    GTHE3_COMMON_QPLL0FBCLKLOST => open,
    GTHE3_COMMON_QPLL0LOCK => GTHE3_COMMON_QPLL0LOCK_int,
    GTHE3_COMMON_QPLL0LOCKDETCLK => "0",
    GTHE3_COMMON_QPLL0LOCKEN => "1",
    GTHE3_COMMON_QPLL0OUTCLK => GTHE3_COMMON_QPLL0OUTCLK_int,
    GTHE3_COMMON_QPLL0OUTREFCLK => GTHE3_COMMON_QPLL0OUTREFCLK_int,
    GTHE3_COMMON_QPLL0PD => GTHE3_COMMON_QPLL0PD_int,
    GTHE3_COMMON_QPLL0REFCLKLOST => open,
    GTHE3_COMMON_QPLL0REFCLKSEL => GTHE3_COMMON_QPLL0REFCLKSEL,
    GTHE3_COMMON_QPLL0RESET => GTHE3_COMMON_QPLL0RESET_int,
    GTHE3_COMMON_QPLL1CLKRSVD0 => "0",
    GTHE3_COMMON_QPLL1CLKRSVD1 => "0",
    GTHE3_COMMON_QPLL1FBCLKLOST => open,
    GTHE3_COMMON_QPLL1LOCK => open,
    GTHE3_COMMON_QPLL1LOCKDETCLK => "0",
    GTHE3_COMMON_QPLL1LOCKEN => "0",
    GTHE3_COMMON_QPLL1OUTCLK => open,
    GTHE3_COMMON_QPLL1OUTREFCLK => open,
    GTHE3_COMMON_QPLL1PD => GTHE3_COMMON_QPLL1PD_int,
    GTHE3_COMMON_QPLL1REFCLKLOST => open,
    GTHE3_COMMON_QPLL1REFCLKSEL => "001",
    GTHE3_COMMON_QPLL1RESET => "1",
    GTHE3_COMMON_QPLLDMONITOR0 => open,
    GTHE3_COMMON_QPLLDMONITOR1 => open,
    GTHE3_COMMON_QPLLRSVD1 => "00000000",
    GTHE3_COMMON_QPLLRSVD2 => "00000",
    GTHE3_COMMON_QPLLRSVD3 => "00000",
    GTHE3_COMMON_QPLLRSVD4 => "00000000",
    GTHE3_COMMON_RCALENB => "1",
    GTHE3_COMMON_REFCLKOUTMONITOR0 => open,
    GTHE3_COMMON_REFCLKOUTMONITOR1 => open,
    GTHE3_COMMON_RXRECCLK0_SEL => open,
    GTHE3_COMMON_RXRECCLK1_SEL => open
  );





end wrapper;



