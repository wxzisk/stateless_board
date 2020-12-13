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

entity send_data_test is
port (
	clk					: in  std_logic;
	reset				: in  std_logic;
	tx_axis_tdata		: out std_logic_vector(63 downto 0);
	tx_axis_sending		: out std_logic
);
end send_data_test;


architecture rtl of send_data_test is
	
	type SM_T is (SM_IDLE_ST,SM_WAIT_ST, SM_BEAT1_ST, SM_BEAT2_ST, SM_BEAT3_ST, SM_BEAT4_ST, SM_BEAT5_ST, SM_BEAT6_ST, SM_DATA_ST);
	signal SM		: SM_T := SM_IDLE_ST;
	signal SM_nxt	: SM_T := SM_IDLE_ST;
	signal beat_cnt				: integer range 0 to 4095 := 0;
	signal beat_cnt_nxt			: integer range 0 to 4095 := 0;
    signal wait_cnt			: integer range 0 to 4095 := 0;
    signal wait_cnt_nxt			: integer range 0 to 4095 := 0;
    
begin
	
	process(reset, clk )
	begin
		if( reset='1') then
			SM <= SM_IDLE_ST;
			beat_cnt <= 0;
			wait_cnt <= 0 ;			
		elsif( rising_edge(clk) ) then
			SM <= SM_nxt;
			beat_cnt <= beat_cnt_nxt;
			wait_cnt<= wait_cnt_nxt ;
		end if;
	end process;
	
	process( SM, beat_cnt ,wait_cnt)
	begin
		SM_nxt <= SM;
		beat_cnt_nxt <= beat_cnt;
		tx_axis_tdata <= (others=>'0');
		case SM is
			when SM_IDLE_ST =>
			         if (wait_cnt = 30) then
                        SM_nxt <= SM_WAIT_ST;
                        beat_cnt_nxt <= 0;
                        tx_axis_sending	<= '0';
                        wait_cnt_nxt <= 0;
                     else
                        SM_nxt <= SM_IDLE_ST;
                        beat_cnt_nxt <= 0;
                        tx_axis_sending    <= '0';
                        wait_cnt_nxt <=  wait_cnt + 1;
                     end if;
            when SM_WAIT_ST =>
                        SM_nxt <= SM_BEAT1_ST;    
                        tx_axis_sending	<= '0';        
			when SM_BEAT1_ST =>
					SM_nxt <= SM_BEAT2_ST;
				tx_axis_tdata <=X"EDFE226A05C90200"; -- destination mac address: 0xFF_FF_FF_FF_FF_FF
				tx_axis_sending	 <= '1';
			when SM_BEAT2_ST =>
					SM_nxt <= SM_BEAT3_ST;
				tx_axis_tdata <=X"004500080605EFBE"; -- source mac address: 0x01_02_03_04_05_06, Type: IP
				tx_axis_sending	 <= '1';
			when SM_BEAT3_ST =>
					SM_nxt <= SM_BEAT4_ST;
				tx_axis_tdata(15 downto 0) <= X"8A00";
				tx_axis_tdata(31 downto 16) <= X"0000"; -- IP header: identification
				tx_axis_tdata(47 downto 32) <= X"0000"; -- IP header: flags
				tx_axis_tdata(55 downto 48) <= X"80"; -- IP header: time to live
				tx_axis_tdata(63 downto 56) <= X"11"; -- IP header: protocol: UDP
				tx_axis_sending	 <= '1';
			when SM_BEAT4_ST =>
			    SM_nxt <= SM_BEAT5_ST;
				tx_axis_tdata(15 downto 0) <= X"8A00";
				tx_axis_tdata(47 downto 16) <= X"6402A8C0"; -- soruce IP address: 192.168.2.100
				tx_axis_tdata(63 downto 48) <= X"A8C0"; -- destination IP address: 192.168
				tx_axis_sending	 <= '1';
--			when SM_BEAT4_1_ST =>
--                    SM_nxt <= SM_BEAT5_ST;
--                tx_axis_tdata(15 downto 0) <= X"E178";
--                tx_axis_tdata(47 downto 16) <= X"6402A8C0"; -- soruce IP address: 192.168.2.100
--                tx_axis_tdata(63 downto 48) <= X"AAAA"; -- destination IP address: 255.255.255.255
--                tx_axis_tdata(67 downto 64) <= "0000";
--                tx_axis_sending	 <= '0';
			when SM_BEAT5_ST =>
					SM_nxt <= SM_BEAT6_ST;
				tx_axis_tdata(63 downto 48) <= X"7600";
				tx_axis_tdata(15 downto 0) <= X"051F"; -- destination IP address: 31.5
				tx_axis_tdata(47 downto 16) <= X"12345678"; -- UDP port
				tx_axis_sending	 <= '1';
			when SM_BEAT6_ST =>
					SM_nxt <= SM_DATA_ST;
				tx_axis_tdata(15 downto 0) <= X"0000";  -- UDP check sum
				tx_axis_tdata(63 downto 48) <= X"0000";
				tx_axis_tdata(47 downto 32) <= X"0000";
				tx_axis_tdata(31 downto 16) <= X"0000";
				tx_axis_sending	 <= '1';
				beat_cnt_nxt <= 48;
			when SM_DATA_ST =>
					if( beat_cnt = 144 ) then
                        SM_nxt <= SM_IDLE_ST;
                        tx_axis_tdata <=  X"1111" & X"1111" & X"1111" & X"1111";
                    else
                        tx_axis_tdata <=  X"1111" & X"1111" & X"1111" & X"1111";
                    end if;
					beat_cnt_nxt <= beat_cnt + 8;
				tx_axis_sending	 <= '1';
		end case;
	end process;

end rtl;
