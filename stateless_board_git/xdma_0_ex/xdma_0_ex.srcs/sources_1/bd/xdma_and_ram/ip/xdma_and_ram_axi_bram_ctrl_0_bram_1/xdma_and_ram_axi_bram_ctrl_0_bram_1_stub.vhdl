-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4_AR70877 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
-- Date        : Mon May 11 11:39:17 2020
-- Host        : DESKTOP-P29M76J running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/yinxj/Desktop/with_bram/xdma_0_ex/xdma_0_ex.srcs/sources_1/bd/xdma_and_ram/ip/xdma_and_ram_axi_bram_ctrl_0_bram_1/xdma_and_ram_axi_bram_ctrl_0_bram_1_stub.vhdl
-- Design      : xdma_and_ram_axi_bram_ctrl_0_bram_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku040-ffva1156-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xdma_and_ram_axi_bram_ctrl_0_bram_1 is
  Port ( 
    clka : in STD_LOGIC;
    rsta : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 7 downto 0 );
    addra : in STD_LOGIC_VECTOR ( 31 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 63 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 63 downto 0 );
    clkb : in STD_LOGIC;
    rstb : in STD_LOGIC;
    enb : in STD_LOGIC;
    web : in STD_LOGIC_VECTOR ( 7 downto 0 );
    addrb : in STD_LOGIC_VECTOR ( 31 downto 0 );
    dinb : in STD_LOGIC_VECTOR ( 63 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 63 downto 0 );
    rsta_busy : out STD_LOGIC;
    rstb_busy : out STD_LOGIC
  );

end xdma_and_ram_axi_bram_ctrl_0_bram_1;

architecture stub of xdma_and_ram_axi_bram_ctrl_0_bram_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clka,rsta,ena,wea[7:0],addra[31:0],dina[63:0],douta[63:0],clkb,rstb,enb,web[7:0],addrb[31:0],dinb[63:0],doutb[63:0],rsta_busy,rstb_busy";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "blk_mem_gen_v8_4_1,Vivado 2017.4_AR70877";
begin
end;
