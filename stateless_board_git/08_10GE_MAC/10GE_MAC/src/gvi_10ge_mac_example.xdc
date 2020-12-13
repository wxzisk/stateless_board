##############################################################################
##      _______      _______                                                ##
##     / ____\ \    / /_   _|                                               ##
##    | |  __ \ \  / /  | |                                                 ##
##    | | |_ | \ \/ /   | |                                                 ##
##    | |__| |  \  /   _| |_                                                ##
##     \_____|   \/   |_____|                                               ##
##                                                                          ##
## Copyright (c) 2012-2018 Hangzhou Yanman Co. Ltd.  All rights reserved.   ##
##                                                                          ##
## THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY   ##
## KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE      ##
## IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A               ##
## PARTICULAR PURPOSE.                                                      ##
##                                                                          ##
## Website: www.gvi-tech.com                                                ##
## Email: support@gvi-tech.com                                              ##
##                                                                          ##
##############################################################################


#######################################################
# Clock/period constraints                            #
#######################################################

set_property CONFIG_VOLTAGE 1.8 [current_design]
set_property CFGBVS GND [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]

# Main transmit clock/period constraints
set_property PACKAGE_PIN P6 [get_ports refclk_p]
create_clock -period 6.400 -name gtx_refclk -waveform {0.000 3.200} [get_ports refclk_p]

set_property PACKAGE_PIN T27 [get_ports reset]
set_property IOSTANDARD LVCMOS18 [get_ports reset]

set_property PACKAGE_PIN R26 [get_ports start]
set_property IOSTANDARD LVCMOS18 [get_ports start]

set_property PACKAGE_PIN M2 [get_ports phy3_rxp]

set_property PACKAGE_PIN AM9 [get_ports phy3_tx_disable]
set_property IOSTANDARD LVCMOS33 [get_ports phy3_tx_disable]

set_property PACKAGE_PIN N22 [get_ports {dip_switches[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {dip_switches[0]}]
set_property PACKAGE_PIN M22 [get_ports {dip_switches[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {dip_switches[1]}]


set_property IOSTANDARD DIFF_SSTL15 [get_ports SYS_CLK_P]
set_property IOSTANDARD DIFF_SSTL15 [get_ports SYS_CLK_N]
set_property PACKAGE_PIN AK16 [get_ports SYS_CLK_N]
set_property PACKAGE_PIN AK17 [get_ports SYS_CLK_P]



connect_debug_port u_ila_0/clk [get_nets [list ten_gig_eth_base_shared_clock_reset_block/clk156]]

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list ten_gig_eth_base_shared_clock_reset_block/CLK]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 64 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {rx_axis_tdata[0]} {rx_axis_tdata[1]} {rx_axis_tdata[2]} {rx_axis_tdata[3]} {rx_axis_tdata[4]} {rx_axis_tdata[5]} {rx_axis_tdata[6]} {rx_axis_tdata[7]} {rx_axis_tdata[8]} {rx_axis_tdata[9]} {rx_axis_tdata[10]} {rx_axis_tdata[11]} {rx_axis_tdata[12]} {rx_axis_tdata[13]} {rx_axis_tdata[14]} {rx_axis_tdata[15]} {rx_axis_tdata[16]} {rx_axis_tdata[17]} {rx_axis_tdata[18]} {rx_axis_tdata[19]} {rx_axis_tdata[20]} {rx_axis_tdata[21]} {rx_axis_tdata[22]} {rx_axis_tdata[23]} {rx_axis_tdata[24]} {rx_axis_tdata[25]} {rx_axis_tdata[26]} {rx_axis_tdata[27]} {rx_axis_tdata[28]} {rx_axis_tdata[29]} {rx_axis_tdata[30]} {rx_axis_tdata[31]} {rx_axis_tdata[32]} {rx_axis_tdata[33]} {rx_axis_tdata[34]} {rx_axis_tdata[35]} {rx_axis_tdata[36]} {rx_axis_tdata[37]} {rx_axis_tdata[38]} {rx_axis_tdata[39]} {rx_axis_tdata[40]} {rx_axis_tdata[41]} {rx_axis_tdata[42]} {rx_axis_tdata[43]} {rx_axis_tdata[44]} {rx_axis_tdata[45]} {rx_axis_tdata[46]} {rx_axis_tdata[47]} {rx_axis_tdata[48]} {rx_axis_tdata[49]} {rx_axis_tdata[50]} {rx_axis_tdata[51]} {rx_axis_tdata[52]} {rx_axis_tdata[53]} {rx_axis_tdata[54]} {rx_axis_tdata[55]} {rx_axis_tdata[56]} {rx_axis_tdata[57]} {rx_axis_tdata[58]} {rx_axis_tdata[59]} {rx_axis_tdata[60]} {rx_axis_tdata[61]} {rx_axis_tdata[62]} {rx_axis_tdata[63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 8 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {rx_axis_tkeep[0]} {rx_axis_tkeep[1]} {rx_axis_tkeep[2]} {rx_axis_tkeep[3]} {rx_axis_tkeep[4]} {rx_axis_tkeep[5]} {rx_axis_tkeep[6]} {rx_axis_tkeep[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 1 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list rx_axis_tlast]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 1 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list rx_axis_tready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 1 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list rx_axis_tvalid]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk156]
