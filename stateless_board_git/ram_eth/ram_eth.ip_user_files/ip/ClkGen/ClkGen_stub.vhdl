-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4_AR70877 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
-- Date        : Thu Aug 13 13:58:20 2020
-- Host        : WIN-5I8J21IIVL5 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               E:/test/pcie_eth_10g_8.11/ram_eth/ram_eth.srcs/sources_1/ip/ClkGen/ClkGen_stub.vhdl
-- Design      : ClkGen
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku040-ffva1156-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ClkGen is
  Port ( 
    clkout_200M : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1_p : in STD_LOGIC;
    clk_in1_n : in STD_LOGIC
  );

end ClkGen;

architecture stub of ClkGen is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clkout_200M,reset,locked,clk_in1_p,clk_in1_n";
begin
end;
