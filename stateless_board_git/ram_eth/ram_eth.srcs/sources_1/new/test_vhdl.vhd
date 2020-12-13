library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


entity test_vhdl is
port(
clk : in std_logic;
--a   : in std_logic;
rst : in std_logic;
b   : inout std_logic;
c   : inout std_logic
);
end entity test_vhdl;


architecture aaa of test_vhdl is
signal a	: std_logic;
signal frame_cnt : std_logic_vector(7 downto 0) := (others=>'0');
begin

    process(rst, clk,a,b)
        begin
           if(rst = '1') then
           a <= '0';
            b <= '0' ;
            c <= '0';
            frame_cnt <= "00000000";
           elsif(rising_edge(clk)) then
           frame_cnt <= frame_cnt + 1;
            b<= a;
            c<=b;   
            if(frame_cnt = "01100100") then
            a <= '1';
           end if;
           end if;
        end process;
        
end aaa;