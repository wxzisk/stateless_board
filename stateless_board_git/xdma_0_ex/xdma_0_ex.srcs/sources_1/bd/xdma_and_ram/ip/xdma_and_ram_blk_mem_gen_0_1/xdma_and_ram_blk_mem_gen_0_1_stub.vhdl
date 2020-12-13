-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4_AR70877 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
-- Date        : Sun May  3 16:38:29 2020
-- Host        : WIN-6LRTIFRL70S running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/fpga/yxj/with_bram/xdma_0_ex/xdma_0_ex.srcs/sources_1/bd/xdma_and_ram/ip/xdma_and_ram_blk_mem_gen_0_1/xdma_and_ram_blk_mem_gen_0_1_stub.vhdl
-- Design      : xdma_and_ram_blk_mem_gen_0_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku040-ffva1156-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xdma_and_ram_blk_mem_gen_0_1 is
  Port ( 
    clka : in STD_LOGIC;
    rsta : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 31 downto 0 );
    addra : in STD_LOGIC_VECTOR ( 31 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 255 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 255 downto 0 );
    rsta_busy : out STD_LOGIC
  );

end xdma_and_ram_blk_mem_gen_0_1;

architecture stub of xdma_and_ram_blk_mem_gen_0_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clka,rsta,ena,wea[31:0],addra[31:0],dina[255:0],douta[255:0],rsta_busy";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "blk_mem_gen_v8_4_1,Vivado 2017.4_AR70877";
begin
end;
