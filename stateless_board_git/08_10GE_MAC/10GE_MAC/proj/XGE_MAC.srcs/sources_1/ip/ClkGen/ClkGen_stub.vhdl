-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
-- Date        : Thu Jun 07 15:28:45 2018
-- Host        : GVI-QD02 running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode synth_stub
--               e:/workspace/MC02/10GE_MAC/design/XGE_MAC.srcs/sources_1/ip/ClkGen/ClkGen_stub.vhdl
-- Design      : ClkGen
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku040-ffva1156-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ClkGen is
  Port ( 
    clkout_100M : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clkin_p : in STD_LOGIC;
    clkin_n : in STD_LOGIC
  );

end ClkGen;

architecture stub of ClkGen is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clkout_100M,reset,locked,clkin_p,clkin_n";
begin
end;
