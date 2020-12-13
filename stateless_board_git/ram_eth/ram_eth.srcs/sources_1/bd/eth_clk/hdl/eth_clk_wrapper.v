//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
//Date        : Fri Oct 25 13:33:04 2019
//Host        : DESKTOP-P8TPC4Q running 64-bit major release  (build 9200)
//Command     : generate_target eth_clk_wrapper.bd
//Design      : eth_clk_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module eth_clk_wrapper
   (sys_eth_clk,
    sys_eth_clk_n,
    sys_eth_clk_p);
  output sys_eth_clk;
  input sys_eth_clk_n;
  input sys_eth_clk_p;

  wire sys_eth_clk;
  wire sys_eth_clk_n;
  wire sys_eth_clk_p;

  eth_clk eth_clk_i
       (.sys_eth_clk(sys_eth_clk),
        .sys_eth_clk_n(sys_eth_clk_n),
        .sys_eth_clk_p(sys_eth_clk_p));
endmodule
