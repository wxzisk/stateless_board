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
use IEEE.NUMERIC_STD.ALL;

------------------------------------------------------------------------
-- The entity declaration for the client side loopback design example.
------------------------------------------------------------------------

entity ten_gig_eth_mac_0_pat_gen is
port (
	clk					: in  std_logic;
	reset				: in  std_logic;
	tx_axis_tvalid_in		: in std_logic;
	tx_axis_tdata		: out std_logic_vector(63 downto 0);
	tx_axis_tkeep		: in std_logic_vector(7 downto 0);
	tx_axis_tlast_in	: in std_logic;
	tx_axis_tlast		: out std_logic;
	tx_axis_tvalid		: out std_logic;
	tx_axis_tready		: in  std_logic;
	--tx_start			: in  std_logic;
	--busy				: out std_logic;
	data_in      : in  std_logic_vector(63 downto 0)
);
end ten_gig_eth_mac_0_pat_gen;


architecture rtl of ten_gig_eth_mac_0_pat_gen is
	
	signal beat_cnt				: integer range 0 to 4095 := 0;
	signal beat_cnt_nxt			: integer range 0 to 4095 := 0;
  
begin
	--busy <= '0' when SM=SM_IDLE_ST else '1';
	
	process(reset, clk)
	begin
		if( reset='1') then
			beat_cnt <= 0;
		elsif( rising_edge(clk) ) then
			beat_cnt <= beat_cnt_nxt;
		end if;
	end process;
	
	process( data_in, beat_cnt, tx_axis_tready, tx_axis_tvalid_in, tx_axis_tlast_in )
	begin
		beat_cnt_nxt <= beat_cnt;
		
		tx_axis_tvalid <= tx_axis_tvalid_in;
		tx_axis_tlast <= tx_axis_tlast_in;
--		tx_axis_tkeep <= (others=>'1');
		if( tx_axis_tready='1' ) then
--		  tx_axis_tdata <= data_in;
		case tx_axis_tkeep is
		    when X"ff" =>
            tx_axis_tdata(63 downto 56) <= data_in(7 downto 0);
            tx_axis_tdata(55 downto 48) <= data_in(15 downto 8);
            tx_axis_tdata(47 downto 40) <= data_in(23 downto 16);
            tx_axis_tdata(39 downto 32) <= data_in(31 downto 24);
            tx_axis_tdata(31 downto 24) <= data_in(39 downto 32);
            tx_axis_tdata(23 downto 16) <= data_in(47 downto 40);
            tx_axis_tdata(15 downto 8) <= data_in(55 downto 48);
            tx_axis_tdata(7 downto 0) <= data_in(63 downto 56);
            when X"7f" =>
            tx_axis_tdata(63 downto 56) <= X"00";
            tx_axis_tdata(55 downto 48) <= data_in(7 downto 0);
            tx_axis_tdata(47 downto 40) <= data_in(15 downto 8);
            tx_axis_tdata(39 downto 32) <= data_in(23 downto 16);
            tx_axis_tdata(31 downto 24) <= data_in(31 downto 24);
            tx_axis_tdata(23 downto 16) <= data_in(39 downto 32);
            tx_axis_tdata(15 downto 8) <= data_in(47 downto 40);
            tx_axis_tdata(7 downto 0) <= data_in(55 downto 48);
            when X"3f" =>
            tx_axis_tdata(63 downto 56) <= X"00";
            tx_axis_tdata(55 downto 48) <= X"00";
            tx_axis_tdata(47 downto 40) <= data_in(7 downto 0);
            tx_axis_tdata(39 downto 32) <= data_in(15 downto 8);
            tx_axis_tdata(31 downto 24) <= data_in(23 downto 16);
            tx_axis_tdata(23 downto 16) <= data_in(31 downto 24);
            tx_axis_tdata(15 downto 8) <= data_in(39 downto 32);
            tx_axis_tdata(7 downto 0) <= data_in(47 downto 40);
            when X"1f" =>
            tx_axis_tdata(63 downto 56) <= X"00";
            tx_axis_tdata(55 downto 48) <= X"00";
            tx_axis_tdata(47 downto 40) <= X"00";
            tx_axis_tdata(39 downto 32) <= data_in(7 downto 0);
            tx_axis_tdata(31 downto 24) <= data_in(15 downto 8);
            tx_axis_tdata(23 downto 16) <=data_in(23 downto 16);
            tx_axis_tdata(15 downto 8) <= data_in(31 downto 24);
            tx_axis_tdata(7 downto 0) <= data_in(39 downto 32);
            when X"0f" =>
            tx_axis_tdata(63 downto 56) <= X"00";
            tx_axis_tdata(55 downto 48) <= X"00";
            tx_axis_tdata(47 downto 40) <= X"00";
            tx_axis_tdata(39 downto 32) <= X"00";
            tx_axis_tdata(31 downto 24) <= data_in(7 downto 0);
            tx_axis_tdata(23 downto 16) <=data_in(15 downto 8);
            tx_axis_tdata(15 downto 8) <= data_in(23 downto 16);
            tx_axis_tdata(7 downto 0) <= data_in(31 downto 24);
            when X"07" =>
            tx_axis_tdata(63 downto 56) <= X"00";
            tx_axis_tdata(55 downto 48) <= X"00";
            tx_axis_tdata(47 downto 40) <= X"00";
            tx_axis_tdata(39 downto 32) <= X"00";
            tx_axis_tdata(31 downto 24) <= X"00";
            tx_axis_tdata(23 downto 16) <=data_in(7 downto 0);
            tx_axis_tdata(15 downto 8) <= data_in(15 downto 8);
            tx_axis_tdata(7 downto 0) <= data_in(23 downto 16);
            when X"03" =>
            tx_axis_tdata(63 downto 56) <= X"00";
            tx_axis_tdata(55 downto 48) <= X"00";
            tx_axis_tdata(47 downto 40) <= X"00";
            tx_axis_tdata(39 downto 32) <= X"00";
            tx_axis_tdata(31 downto 24) <= X"00";
            tx_axis_tdata(23 downto 16) <=X"00";
            tx_axis_tdata(15 downto 8) <= data_in(7 downto 0);
            tx_axis_tdata(7 downto 0) <= data_in(15 downto 8);
            when X"01" =>
            tx_axis_tdata(63 downto 56) <= X"00";
            tx_axis_tdata(55 downto 48) <= X"00";
            tx_axis_tdata(47 downto 40) <= X"00";
            tx_axis_tdata(39 downto 32) <= X"00";
            tx_axis_tdata(31 downto 24) <= X"00";
            tx_axis_tdata(23 downto 16) <=X"00";
            tx_axis_tdata(15 downto 8) <= X"00";
            tx_axis_tdata(7 downto 0) <= data_in(7 downto 0);
            when others =>
             tx_axis_tdata <= (others=>'0');
            end case;
		end if;
	end process;

end rtl;
