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
	tx_axis_tdata		: out std_logic_vector(63 downto 0);
	tx_axis_tkeep		: out std_logic_vector(7 downto 0);
	tx_axis_tlast		: out std_logic;
	tx_axis_tvalid		: out std_logic;
	tx_axis_tready		: in  std_logic;
	tx_start			: in  std_logic;
	busy				: out std_logic;
	packet_length_sel	: in  std_logic_vector(1 downto 0);
	packet_frame_index	: in  std_logic_vector(47 downto 0)
	-- "00" : 64 bytes
	-- "01" : 256 bytes
	-- "10" : 1024 bytes
	-- "11" : 4096 bytes
);
end ten_gig_eth_mac_0_pat_gen;


architecture rtl of ten_gig_eth_mac_0_pat_gen is
	
	type SM_T is (SM_IDLE_ST, SM_WAIT_ST, SM_BEAT1_ST, SM_BEAT2_ST, SM_BEAT3_ST, SM_BEAT4_ST, SM_BEAT5_ST, SM_BEAT6_ST, SM_DATA_ST);
	signal SM		: SM_T := SM_IDLE_ST;
	signal SM_nxt	: SM_T := SM_IDLE_ST;
	signal beat_cnt				: integer range 0 to 4095 := 0;
	signal beat_cnt_nxt			: integer range 0 to 4095 := 0;
	signal data_cnt				: std_logic_vector(4 downto 0);
	signal data_cnt_nxt			: std_logic_vector(4 downto 0);  
  
begin

	busy <= '0' when SM=SM_IDLE_ST else '1';
	
	process(reset, clk)
	begin
		if( reset='1') then
			SM <= SM_IDLE_ST;
			beat_cnt <= 0;
		elsif( rising_edge(clk) ) then
			SM <= SM_nxt;
			beat_cnt <= beat_cnt_nxt;
			data_cnt <= data_cnt_nxt;
		end if;
	end process;
	
	process( SM, beat_cnt, tx_axis_tready, packet_length_sel, packet_frame_index, data_cnt )
	begin
		SM_nxt <= SM;
		beat_cnt_nxt <= beat_cnt;
		data_cnt_nxt <= data_cnt;
		
		tx_axis_tvalid <= '0';
		tx_axis_tlast <= '0';
		tx_axis_tdata <= (others=>'0');
		tx_axis_tkeep <= (others=>'1');
		
		case SM is
			when SM_IDLE_ST =>
				if( tx_start='1' ) then
					if( tx_axis_tready='1' ) then
						SM_nxt <= SM_BEAT1_ST;
					else
						SM_nxt <= SM_WAIT_ST;
					end if;
				end if;
			when SM_WAIT_ST =>
				if( tx_axis_tready='1' ) then
					SM_nxt <= SM_BEAT1_ST;
				end if;
			when SM_BEAT1_ST =>
				if( tx_axis_tready='1' ) then
					SM_nxt <= SM_BEAT2_ST;
				end if;
				tx_axis_tdata <=X"EDFEFFFFFFFFFFFF"; -- destination mac address: 0xFF_FF_FF_FF_FF_FF
				tx_axis_tvalid <= '1';
			when SM_BEAT2_ST =>
				if( tx_axis_tready='1' ) then
					SM_nxt <= SM_BEAT3_ST;
				end if;
				tx_axis_tdata <=X"004500080605EFBE"; -- source mac address: 0x01_02_03_04_05_06, Type: IP
				tx_axis_tvalid <= '1';
			when SM_BEAT3_ST =>
				if( tx_axis_tready='1' ) then
					SM_nxt <= SM_BEAT4_ST;
				end if;
				case packet_length_sel is
					when "00" =>-- 64 BYTE
						tx_axis_tdata(15 downto 0) <= X"3200";
					when "01" =>-- 256 BYTE
						tx_axis_tdata(15 downto 0) <= X"F200";
					when "10" =>-- 1024 BYTE
						tx_axis_tdata(15 downto 0) <= X"F203";
					when others =>-- 4096 BYTE
						tx_axis_tdata(15 downto 0) <= X"";
				end case;
				tx_axis_tdata(31 downto 16) <= X"0000"; -- IP header: identification
				tx_axis_tdata(47 downto 32) <= X"0000"; -- IP header: flags
				tx_axis_tdata(55 downto 48) <= X"80"; -- IP header: time to live
				tx_axis_tdata(63 downto 56) <= X"11"; -- IP header: protocol: UDP
				tx_axis_tvalid <= '1';
			when SM_BEAT4_ST =>
				if( tx_axis_tready='1' ) then
					SM_nxt <= SM_BEAT5_ST;
				end if;
				case packet_length_sel is -- header check sum
					when "00" =>-- 64 BYTE
						tx_axis_tdata(15 downto 0) <= X"AF78";
					when "01" =>-- 256 BYTE
						tx_axis_tdata(15 downto 0) <= X"EF77";
					when "10" =>-- 1024 BYTE
						tx_axis_tdata(15 downto 0) <= X"EF74";
					when others =>-- 4096 BYTE
						tx_axis_tdata(15 downto 0) <= X"E178";
				end case;
				tx_axis_tdata(47 downto 16) <= X"6401A8C0"; -- soruce IP address: 192.168.1.100
				tx_axis_tdata(63 downto 48) <= X"FFFF"; -- destination IP address: 255.255.255.255
				tx_axis_tvalid <= '1';
			when SM_BEAT5_ST =>
				if( tx_axis_tready='1' ) then
					SM_nxt <= SM_BEAT6_ST;
				end if;
				case packet_length_sel is -- UDP Length
					when "00" =>-- 64 BYTE
						tx_axis_tdata(63 downto 48) <= X"1E00";
					when "01" =>-- 256 BYTE
						tx_axis_tdata(63 downto 48) <= X"DE00";
					when "10" =>-- 1024 BYTE
						tx_axis_tdata(63 downto 48) <= X"DE03";
					when others =>-- 4096 BYTE
						tx_axis_tdata(63 downto 48) <= X"DE0F";
				end case;
				tx_axis_tdata(15 downto 0) <= X"FFFF"; -- destination IP address: 255.255.255.255
				tx_axis_tdata(47 downto 16) <= X"12345678"; -- UDP port
				tx_axis_tvalid <= '1';
			when SM_BEAT6_ST =>
				if( tx_axis_tready='1' ) then
					SM_nxt <= SM_DATA_ST;
				end if;
				tx_axis_tdata(15 downto 0) <= X"0000";  -- UDP check sum
				tx_axis_tdata(63 downto 56) <= packet_frame_index(7 downto 0);
				tx_axis_tdata(55 downto 48) <= packet_frame_index(15 downto 8);
				tx_axis_tdata(47 downto 40) <= packet_frame_index(23 downto 16);
				tx_axis_tdata(39 downto 32) <= packet_frame_index(31 downto 24);
				tx_axis_tdata(31 downto 24) <= packet_frame_index(39 downto 32);
				tx_axis_tdata(23 downto 16) <= packet_frame_index(47 downto 40);
				tx_axis_tvalid <= '1';
				beat_cnt_nxt <= 48;
				data_cnt_nxt <= (others=>'0');
			when SM_DATA_ST =>
				if( tx_axis_tready='1' ) then
					case packet_length_sel is
						when "00" =>-- 64 BYTE
							if( beat_cnt = (64-8) ) then
								SM_nxt <= SM_IDLE_ST;
								tx_axis_tlast <= '1';
							end if;
						when "01" =>-- 256 BYTE
							if( beat_cnt = (256-8) ) then
								SM_nxt <= SM_IDLE_ST;
								tx_axis_tlast <= '1';
							end if;
						when "10" =>-- 1024 BYTE
							if( beat_cnt = (1024-8) ) then
								SM_nxt <= SM_IDLE_ST;
								tx_axis_tlast <= '1';
							end if;
						when others =>-- 4096 BYTE
							if( beat_cnt = (4096-8) ) then
								SM_nxt <= SM_IDLE_ST;
								tx_axis_tlast <= '1';
							end if;
					end case;
					beat_cnt_nxt <= beat_cnt + 8;
					data_cnt_nxt <= data_cnt + '1';
				end if;
				tx_axis_tdata <=  data_cnt & "111"
								& data_cnt & "110"
								& data_cnt & "101"
								& data_cnt & "100"
								& data_cnt & "011"
								& data_cnt & "010"
								& data_cnt & "001"
								& data_cnt & "000";
				tx_axis_tvalid <= '1';
		end case;
	end process;

end rtl;
