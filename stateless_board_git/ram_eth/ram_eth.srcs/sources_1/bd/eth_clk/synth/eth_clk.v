//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
//Date        : Fri Oct 25 13:33:04 2019
//Host        : DESKTOP-P8TPC4Q running 64-bit major release  (build 9200)
//Command     : generate_target eth_clk.bd
//Design      : eth_clk
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "eth_clk,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=eth_clk,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "eth_clk.hwdef" *) 
module eth_clk
   (sys_eth_clk,
    sys_eth_clk_n,
    sys_eth_clk_p);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.SYS_ETH_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.SYS_ETH_CLK, CLK_DOMAIN eth_clk_clk_wiz_0_3_clk_out1, FREQ_HZ 200000000, PHASE 0.0" *) output sys_eth_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.SYS_ETH_CLK_N CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.SYS_ETH_CLK_N, CLK_DOMAIN eth_clk_sys_eth_clk_n, FREQ_HZ 200000000, PHASE 0.000" *) input sys_eth_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.SYS_ETH_CLK_P CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.SYS_ETH_CLK_P, CLK_DOMAIN eth_clk_sys_eth_clk_p, FREQ_HZ 200000000, PHASE 0.000" *) input sys_eth_clk_p;

  wire clk_wiz_0_clk_out1;
  wire sys_eth_clk_n_1;
  wire sys_eth_clk_p_1;

  assign sys_eth_clk = clk_wiz_0_clk_out1;
  assign sys_eth_clk_n_1 = sys_eth_clk_n;
  assign sys_eth_clk_p_1 = sys_eth_clk_p;
  eth_clk_clk_wiz_0_3 clk_wiz_0
       (.clk_in1_n(sys_eth_clk_n_1),
        .clk_in1_p(sys_eth_clk_p_1),
        .clk_out1(clk_wiz_0_clk_out1),
        .resetn(1'b0));
endmodule
