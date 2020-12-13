-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
-- Date        : Fri Oct 25 13:33:48 2019
-- Host        : DESKTOP-P8TPC4Q running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/vivado/ram_eth/ram_eth.srcs/sources_1/bd/eth_clk/ip/eth_clk_clk_wiz_0_3/eth_clk_clk_wiz_0_3_stub.vhdl
-- Design      : eth_clk_clk_wiz_0_3
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tfgg484-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity eth_clk_clk_wiz_0_3 is
  Port ( 
    clk_out1 : out STD_LOGIC;
    clk_out2 : out STD_LOGIC;
    resetn : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1_p : in STD_LOGIC;
    clk_in1_n : in STD_LOGIC
  );

end eth_clk_clk_wiz_0_3;

architecture stub of eth_clk_clk_wiz_0_3 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_out1,clk_out2,resetn,locked,clk_in1_p,clk_in1_n";
begin
end;
