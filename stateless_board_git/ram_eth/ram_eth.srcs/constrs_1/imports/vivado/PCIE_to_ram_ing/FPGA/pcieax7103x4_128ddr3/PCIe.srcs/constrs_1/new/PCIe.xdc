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
## set the  program download bitwidth is 8 bits
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 8 [current_design]
#
set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN div-2 [current_design]
## set VCC 1.8V
set_property CONFIG_VOLTAGE 1.8 [current_design]
# if the VCC is 1.5V or 1.8V then make CFGBVS connect to GND
# if the VCC is 2.5V or 3.3V then make CFGBVS connect to VCCO0
set_property CFGBVS GND [current_design]

set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR YES [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design]

# Main transmit clock/period constraints
set_property PACKAGE_PIN P6 [get_ports refclk_p]
create_clock -period 6.400 -name gtx_refclk -waveform {0.000 3.200} [get_ports refclk_p]

set_property IOSTANDARD DIFF_SSTL15 [get_ports SYS_CLK_P]
set_property IOSTANDARD DIFF_SSTL15 [get_ports SYS_CLK_N]
set_property PACKAGE_PIN AK16 [get_ports SYS_CLK_N]
set_property PACKAGE_PIN AK17 [get_ports SYS_CLK_P]

set_property PACKAGE_PIN AB6 [get_ports refclk_clk_p]

set_property PACKAGE_PIN T27 [get_ports sys_rst]
set_property IOSTANDARD LVCMOS18 [get_ports sys_rst]

#set_property PACKAGE_PIN R26 [get_ports start]
#set_property IOSTANDARD LVCMOS18 [get_ports start]



#set_property PACKAGE_PIN AM9 [get_ports phy3_tx_disable]
#set_property IOSTANDARD LVCMOS33 [get_ports phy3_tx_disable]

set_property IOSTANDARD LVCMOS18 [get_ports PCIE_RESET_N]
set_property LOC PCIE_3_1_X0Y0 [get_cells PCIe_TOP/xdma_and_ram_i/xdma_0/inst/pcie3_ip_i/inst/pcie3_uscale_top_inst/pcie3_uscale_wrapper_inst/PCIE_3_1_inst]
set_property PACKAGE_PIN K22 [get_ports PCIE_RESET_N]
set_property PULLUP true [get_ports PCIE_RESET_N]

#set_property PACKAGE_PIN M5 [get_ports SYS_CLK_P]
#create_clock -period 10.000 -name sys_clk [get_ports SYS_CLK_P]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets sys_rst_IBUF_inst/O]
# set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets ten_gig_eth_example_top/ten_gig_eth_pcs_pma_gt_common_block/ten_gig_eth_pcs_pma_0_gt_common_wrapper_i/common_inst/pcspma_qplloutclk]



#set_property IOSTANDARD DIFF_SSTL15 [get_ports refclk_p]
#set_property IOSTANDARD DIFF_SSTL15 [get_ports refclk_n]
#set_property PACKAGE_PIN AH16 [get_ports refclk_p]
#set_property PACKAGE_PIN AH17 [get_ports refclk_n]



set_property ODT RTT_NONE [get_ports SYS_CLK_P]
set_property PACKAGE_PIN M2 [get_ports phy3_rxp]








set_property MARK_DEBUG false [get_nets PCIe_TOP/xdma_and_ram_i/xdma_0/inst/pcie3_ip_i/inst/store_ltssm]
set_property MARK_DEBUG false [get_nets {PCIe_TOP/xdma_and_ram_i/xdma_0/inst/pcie3_ip_i/inst/cfg_ltssm_state_reg0[0]}]
set_property MARK_DEBUG false [get_nets {PCIe_TOP/xdma_and_ram_i/xdma_0/inst/pcie3_ip_i/inst/cfg_ltssm_state_reg0[1]}]
set_property MARK_DEBUG false [get_nets {PCIe_TOP/xdma_and_ram_i/xdma_0/inst/pcie3_ip_i/inst/cfg_ltssm_state_reg0[2]}]
set_property MARK_DEBUG false [get_nets {PCIe_TOP/xdma_and_ram_i/xdma_0/inst/pcie3_ip_i/inst/cfg_ltssm_state_reg0[3]}]
set_property MARK_DEBUG false [get_nets {PCIe_TOP/xdma_and_ram_i/xdma_0/inst/pcie3_ip_i/inst/cfg_ltssm_state_reg0[4]}]
set_property MARK_DEBUG false [get_nets {PCIe_TOP/xdma_and_ram_i/xdma_0/inst/pcie3_ip_i/inst/cfg_ltssm_state_reg0[5]}]
set_property MARK_DEBUG true [get_nets {eth_test/u1/mac_test0/mac_top0/mac_rx0/ip0/state[2]}]
set_property MARK_DEBUG true [get_nets {eth_test/u1/mac_test0/mac_top0/mac_rx0/ip0/state[3]}]
set_property MARK_DEBUG true [get_nets {eth_test/u1/mac_test0/mac_top0/mac_rx0/ip0/state[0]}]
set_property MARK_DEBUG true [get_nets {eth_test/u1/mac_test0/mac_top0/mac_rx0/ip0/state[1]}]
set_property MARK_DEBUG true [get_nets {eth_test/u1/mac_test0/mac_top0/mac_rx0/ip0/state[4]}]
set_property MARK_DEBUG true [get_nets {eth_test/u1/mac_test0/mac_top0/mac_rx0/mac0/rec_state[6]}]
set_property MARK_DEBUG true [get_nets {eth_test/u1/mac_test0/mac_top0/mac_rx0/mac0/rec_state[8]}]
set_property MARK_DEBUG true [get_nets {eth_test/u1/mac_test0/mac_top0/mac_rx0/mac0/rec_state[7]}]
set_property MARK_DEBUG true [get_nets {eth_test/u1/mac_test0/mac_top0/mac_rx0/mac0/rec_state[2]}]
set_property MARK_DEBUG true [get_nets {eth_test/u1/mac_test0/mac_top0/mac_rx0/mac0/rec_state[1]}]
set_property MARK_DEBUG true [get_nets {eth_test/u1/mac_test0/mac_top0/mac_rx0/mac0/rec_state[3]}]
set_property MARK_DEBUG true [get_nets {eth_test/u1/mac_test0/mac_top0/mac_rx0/mac0/rec_state[4]}]
set_property MARK_DEBUG true [get_nets {eth_test/u1/mac_test0/mac_top0/mac_rx0/mac0/rec_state[0]}]
set_property MARK_DEBUG true [get_nets {eth_test/u1/mac_test0/mac_top0/mac_rx0/mac0/rec_state[5]}]
set_property MARK_DEBUG true [get_nets {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/state[1]}]
set_property MARK_DEBUG true [get_nets {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/state[0]}]
set_property MARK_DEBUG true [get_nets {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/state[5]}]
set_property MARK_DEBUG true [get_nets {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/state[2]}]
set_property MARK_DEBUG true [get_nets {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/state[3]}]
set_property MARK_DEBUG true [get_nets {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/state[6]}]
set_property MARK_DEBUG true [get_nets {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/state[7]}]
set_property MARK_DEBUG true [get_nets {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/state[4]}]








connect_debug_port u_ila_0/probe3 [get_nets [list {ten_gig_eth_example_top/tx_axis_tdata_dly[0]} {ten_gig_eth_example_top/tx_axis_tdata_dly[1]} {ten_gig_eth_example_top/tx_axis_tdata_dly[2]} {ten_gig_eth_example_top/tx_axis_tdata_dly[3]} {ten_gig_eth_example_top/tx_axis_tdata_dly[4]} {ten_gig_eth_example_top/tx_axis_tdata_dly[5]} {ten_gig_eth_example_top/tx_axis_tdata_dly[6]} {ten_gig_eth_example_top/tx_axis_tdata_dly[7]} {ten_gig_eth_example_top/tx_axis_tdata_dly[8]} {ten_gig_eth_example_top/tx_axis_tdata_dly[9]} {ten_gig_eth_example_top/tx_axis_tdata_dly[10]} {ten_gig_eth_example_top/tx_axis_tdata_dly[11]} {ten_gig_eth_example_top/tx_axis_tdata_dly[12]} {ten_gig_eth_example_top/tx_axis_tdata_dly[13]} {ten_gig_eth_example_top/tx_axis_tdata_dly[14]} {ten_gig_eth_example_top/tx_axis_tdata_dly[15]} {ten_gig_eth_example_top/tx_axis_tdata_dly[16]} {ten_gig_eth_example_top/tx_axis_tdata_dly[17]} {ten_gig_eth_example_top/tx_axis_tdata_dly[18]} {ten_gig_eth_example_top/tx_axis_tdata_dly[19]} {ten_gig_eth_example_top/tx_axis_tdata_dly[20]} {ten_gig_eth_example_top/tx_axis_tdata_dly[21]} {ten_gig_eth_example_top/tx_axis_tdata_dly[22]} {ten_gig_eth_example_top/tx_axis_tdata_dly[23]} {ten_gig_eth_example_top/tx_axis_tdata_dly[24]} {ten_gig_eth_example_top/tx_axis_tdata_dly[25]} {ten_gig_eth_example_top/tx_axis_tdata_dly[26]} {ten_gig_eth_example_top/tx_axis_tdata_dly[27]} {ten_gig_eth_example_top/tx_axis_tdata_dly[28]} {ten_gig_eth_example_top/tx_axis_tdata_dly[29]} {ten_gig_eth_example_top/tx_axis_tdata_dly[30]} {ten_gig_eth_example_top/tx_axis_tdata_dly[31]} {ten_gig_eth_example_top/tx_axis_tdata_dly[32]} {ten_gig_eth_example_top/tx_axis_tdata_dly[33]} {ten_gig_eth_example_top/tx_axis_tdata_dly[34]} {ten_gig_eth_example_top/tx_axis_tdata_dly[35]} {ten_gig_eth_example_top/tx_axis_tdata_dly[36]} {ten_gig_eth_example_top/tx_axis_tdata_dly[37]} {ten_gig_eth_example_top/tx_axis_tdata_dly[38]} {ten_gig_eth_example_top/tx_axis_tdata_dly[39]} {ten_gig_eth_example_top/tx_axis_tdata_dly[40]} {ten_gig_eth_example_top/tx_axis_tdata_dly[41]} {ten_gig_eth_example_top/tx_axis_tdata_dly[42]} {ten_gig_eth_example_top/tx_axis_tdata_dly[43]} {ten_gig_eth_example_top/tx_axis_tdata_dly[44]} {ten_gig_eth_example_top/tx_axis_tdata_dly[45]} {ten_gig_eth_example_top/tx_axis_tdata_dly[46]} {ten_gig_eth_example_top/tx_axis_tdata_dly[47]} {ten_gig_eth_example_top/tx_axis_tdata_dly[48]} {ten_gig_eth_example_top/tx_axis_tdata_dly[49]} {ten_gig_eth_example_top/tx_axis_tdata_dly[50]} {ten_gig_eth_example_top/tx_axis_tdata_dly[51]} {ten_gig_eth_example_top/tx_axis_tdata_dly[52]} {ten_gig_eth_example_top/tx_axis_tdata_dly[53]} {ten_gig_eth_example_top/tx_axis_tdata_dly[54]} {ten_gig_eth_example_top/tx_axis_tdata_dly[55]} {ten_gig_eth_example_top/tx_axis_tdata_dly[56]} {ten_gig_eth_example_top/tx_axis_tdata_dly[57]} {ten_gig_eth_example_top/tx_axis_tdata_dly[58]} {ten_gig_eth_example_top/tx_axis_tdata_dly[59]} {ten_gig_eth_example_top/tx_axis_tdata_dly[60]} {ten_gig_eth_example_top/tx_axis_tdata_dly[61]} {ten_gig_eth_example_top/tx_axis_tdata_dly[62]} {ten_gig_eth_example_top/tx_axis_tdata_dly[63]}]]




set_property MARK_DEBUG true [get_nets rec_fifo_full]


set_property MARK_DEBUG true [get_nets {pcie_out[44]}]
set_property MARK_DEBUG true [get_nets {pcie_out[38]}]
set_property MARK_DEBUG true [get_nets {pcie_out[24]}]
set_property MARK_DEBUG true [get_nets {pcie_out[16]}]
set_property MARK_DEBUG true [get_nets {pcie_out[43]}]
set_property MARK_DEBUG true [get_nets {pcie_out[11]}]
set_property MARK_DEBUG true [get_nets {pcie_out[19]}]
set_property MARK_DEBUG true [get_nets {pcie_out[49]}]
set_property MARK_DEBUG true [get_nets {pcie_out[17]}]
set_property MARK_DEBUG true [get_nets {pcie_out[61]}]
set_property MARK_DEBUG true [get_nets {pcie_out[59]}]
set_property MARK_DEBUG true [get_nets {pcie_out[45]}]
set_property MARK_DEBUG true [get_nets {pcie_out[37]}]
set_property MARK_DEBUG true [get_nets {pcie_out[20]}]
set_property MARK_DEBUG true [get_nets {pcie_out[30]}]
set_property MARK_DEBUG true [get_nets {pcie_out[32]}]
set_property MARK_DEBUG true [get_nets {pcie_out[62]}]
set_property MARK_DEBUG true [get_nets {pcie_out[15]}]
set_property MARK_DEBUG true [get_nets {pcie_out[48]}]
set_property MARK_DEBUG true [get_nets {pcie_out[42]}]
set_property MARK_DEBUG true [get_nets {pcie_out[26]}]
set_property MARK_DEBUG true [get_nets {pcie_out[55]}]
set_property MARK_DEBUG true [get_nets {pcie_out[58]}]
set_property MARK_DEBUG true [get_nets {pcie_out[57]}]
set_property MARK_DEBUG true [get_nets {pcie_out[5]}]
set_property MARK_DEBUG true [get_nets {pcie_out[63]}]
set_property MARK_DEBUG true [get_nets {pcie_out[6]}]
set_property MARK_DEBUG true [get_nets {pcie_out[56]}]
set_property MARK_DEBUG true [get_nets {pcie_out[12]}]
set_property MARK_DEBUG true [get_nets {pcie_out[40]}]
set_property MARK_DEBUG true [get_nets {pcie_out[51]}]
set_property MARK_DEBUG true [get_nets {pcie_out[33]}]
set_property MARK_DEBUG true [get_nets {pcie_out[18]}]
set_property MARK_DEBUG true [get_nets {pcie_out[29]}]
set_property MARK_DEBUG true [get_nets {pcie_out[47]}]
set_property MARK_DEBUG true [get_nets {pcie_out[22]}]
set_property MARK_DEBUG true [get_nets {pcie_out[34]}]
set_property MARK_DEBUG true [get_nets {pcie_out[14]}]
set_property MARK_DEBUG true [get_nets {pcie_out[0]}]
set_property MARK_DEBUG true [get_nets {pcie_out[35]}]
set_property MARK_DEBUG true [get_nets {pcie_out[1]}]
set_property MARK_DEBUG true [get_nets {pcie_out[8]}]
set_property MARK_DEBUG true [get_nets {pcie_out[23]}]
set_property MARK_DEBUG true [get_nets {pcie_out[28]}]
set_property MARK_DEBUG true [get_nets {pcie_out[31]}]
set_property MARK_DEBUG true [get_nets {pcie_out[50]}]
set_property MARK_DEBUG true [get_nets {pcie_out[21]}]
set_property MARK_DEBUG true [get_nets {pcie_out[2]}]
set_property MARK_DEBUG true [get_nets {pcie_out[3]}]
set_property MARK_DEBUG true [get_nets {pcie_out[7]}]
set_property MARK_DEBUG true [get_nets {pcie_out[25]}]
set_property MARK_DEBUG true [get_nets {pcie_out[36]}]
set_property MARK_DEBUG true [get_nets {pcie_out[52]}]
set_property MARK_DEBUG true [get_nets {pcie_out[53]}]
set_property MARK_DEBUG true [get_nets {pcie_out[60]}]
set_property MARK_DEBUG true [get_nets {pcie_out[10]}]
set_property MARK_DEBUG true [get_nets {pcie_out[46]}]
set_property MARK_DEBUG true [get_nets {pcie_out[41]}]
set_property MARK_DEBUG true [get_nets {pcie_out[4]}]
set_property MARK_DEBUG true [get_nets {pcie_out[9]}]
set_property MARK_DEBUG true [get_nets {pcie_out[13]}]
set_property MARK_DEBUG true [get_nets {pcie_out[39]}]
set_property MARK_DEBUG true [get_nets {pcie_out[27]}]
set_property MARK_DEBUG true [get_nets {pcie_out[54]}]
set_property MARK_DEBUG true [get_nets FIFO_wr_en_p2e]



connect_debug_port dbg_hub/clk [get_nets u_ila_2_pcspma_txusrclk2]

connect_debug_port u_ila_0/probe24 [get_nets [list ten_gig_eth_example_top/rx_axis_tvalid_out_last]]

connect_debug_port u_ila_0/clk [get_nets [list ten_gig_eth_example_top/ten_gig_eth_base_shared_clock_reset_block/CLK]]

connect_debug_port u_ila_0/clk [get_nets [list ten_gig_eth_example_top/ten_gig_eth_base_shared_clock_reset_block/data_out_reg]]





connect_debug_port u_ila_1/probe3 [get_nets [list {ten_gig_eth_example_top/packet_length_cnt[0]} {ten_gig_eth_example_top/packet_length_cnt[1]} {ten_gig_eth_example_top/packet_length_cnt[2]} {ten_gig_eth_example_top/packet_length_cnt[3]} {ten_gig_eth_example_top/packet_length_cnt[4]} {ten_gig_eth_example_top/packet_length_cnt[5]} {ten_gig_eth_example_top/packet_length_cnt[6]} {ten_gig_eth_example_top/packet_length_cnt[7]} {ten_gig_eth_example_top/packet_length_cnt[8]} {ten_gig_eth_example_top/packet_length_cnt[9]} {ten_gig_eth_example_top/packet_length_cnt[10]} {ten_gig_eth_example_top/packet_length_cnt[11]} {ten_gig_eth_example_top/packet_length_cnt[12]} {ten_gig_eth_example_top/packet_length_cnt[13]} {ten_gig_eth_example_top/packet_length_cnt[14]} {ten_gig_eth_example_top/packet_length_cnt[15]}]]
connect_debug_port u_ila_1/probe4 [get_nets [list {ten_gig_eth_example_top/first_header[0]} {ten_gig_eth_example_top/first_header[1]} {ten_gig_eth_example_top/first_header[2]} {ten_gig_eth_example_top/first_header[3]} {ten_gig_eth_example_top/first_header[4]} {ten_gig_eth_example_top/first_header[5]} {ten_gig_eth_example_top/first_header[6]} {ten_gig_eth_example_top/first_header[7]} {ten_gig_eth_example_top/first_header[8]} {ten_gig_eth_example_top/first_header[9]} {ten_gig_eth_example_top/first_header[10]} {ten_gig_eth_example_top/first_header[11]} {ten_gig_eth_example_top/first_header[12]} {ten_gig_eth_example_top/first_header[13]} {ten_gig_eth_example_top/first_header[14]} {ten_gig_eth_example_top/first_header[15]} {ten_gig_eth_example_top/first_header[16]} {ten_gig_eth_example_top/first_header[17]} {ten_gig_eth_example_top/first_header[18]} {ten_gig_eth_example_top/first_header[19]} {ten_gig_eth_example_top/first_header[20]} {ten_gig_eth_example_top/first_header[21]} {ten_gig_eth_example_top/first_header[22]} {ten_gig_eth_example_top/first_header[23]} {ten_gig_eth_example_top/first_header[24]} {ten_gig_eth_example_top/first_header[25]} {ten_gig_eth_example_top/first_header[26]} {ten_gig_eth_example_top/first_header[27]} {ten_gig_eth_example_top/first_header[28]} {ten_gig_eth_example_top/first_header[29]} {ten_gig_eth_example_top/first_header[30]} {ten_gig_eth_example_top/first_header[31]} {ten_gig_eth_example_top/first_header[32]} {ten_gig_eth_example_top/first_header[33]} {ten_gig_eth_example_top/first_header[34]} {ten_gig_eth_example_top/first_header[35]} {ten_gig_eth_example_top/first_header[36]} {ten_gig_eth_example_top/first_header[37]} {ten_gig_eth_example_top/first_header[38]} {ten_gig_eth_example_top/first_header[39]} {ten_gig_eth_example_top/first_header[40]} {ten_gig_eth_example_top/first_header[41]} {ten_gig_eth_example_top/first_header[42]} {ten_gig_eth_example_top/first_header[43]} {ten_gig_eth_example_top/first_header[44]} {ten_gig_eth_example_top/first_header[45]} {ten_gig_eth_example_top/first_header[46]} {ten_gig_eth_example_top/first_header[47]} {ten_gig_eth_example_top/first_header[48]} {ten_gig_eth_example_top/first_header[49]} {ten_gig_eth_example_top/first_header[50]} {ten_gig_eth_example_top/first_header[51]} {ten_gig_eth_example_top/first_header[52]} {ten_gig_eth_example_top/first_header[53]} {ten_gig_eth_example_top/first_header[54]} {ten_gig_eth_example_top/first_header[55]} {ten_gig_eth_example_top/first_header[56]} {ten_gig_eth_example_top/first_header[57]} {ten_gig_eth_example_top/first_header[58]} {ten_gig_eth_example_top/first_header[59]} {ten_gig_eth_example_top/first_header[60]} {ten_gig_eth_example_top/first_header[61]} {ten_gig_eth_example_top/first_header[62]} {ten_gig_eth_example_top/first_header[63]}]]
connect_debug_port u_ila_1/probe6 [get_nets [list ten_gig_eth_example_top/first_header_transfered]]

connect_debug_port u_ila_1/probe5 [get_nets [list ten_gig_eth_example_top/rx_axis_tlast]]


connect_debug_port u_ila_0/probe6 [get_nets [list {eth_test/too_long_state2_check[0]} {eth_test/too_long_state2_check[1]} {eth_test/too_long_state2_check[2]} {eth_test/too_long_state2_check[3]} {eth_test/too_long_state2_check[4]} {eth_test/too_long_state2_check[5]}]]
connect_debug_port u_ila_0/probe7 [get_nets [list {eth_test/too_long_state2_check_d0[0]} {eth_test/too_long_state2_check_d0[1]} {eth_test/too_long_state2_check_d0[2]} {eth_test/too_long_state2_check_d0[3]} {eth_test/too_long_state2_check_d0[4]} {eth_test/too_long_state2_check_d0[5]}]]




set_property MARK_DEBUG true [get_nets PCIe_TOP/c_c2h_success]
set_property MARK_DEBUG true [get_nets PCIe_TOP/h_c2h_success]
set_property MARK_DEBUG true [get_nets PCIe_TOP/h_h2c_success]
set_property MARK_DEBUG true [get_nets PCIe_TOP/c_h2c_success]


connect_debug_port u_ila_0/probe12 [get_nets [list {eth_test/mac[0]} {eth_test/mac[1]} {eth_test/mac[2]} {eth_test/mac[3]} {eth_test/mac[4]} {eth_test/mac[5]} {eth_test/mac[6]} {eth_test/mac[7]} {eth_test/mac[8]} {eth_test/mac[9]} {eth_test/mac[10]} {eth_test/mac[11]} {eth_test/mac[12]} {eth_test/mac[13]} {eth_test/mac[14]} {eth_test/mac[15]} {eth_test/mac[16]} {eth_test/mac[17]} {eth_test/mac[18]} {eth_test/mac[19]} {eth_test/mac[20]} {eth_test/mac[21]} {eth_test/mac[22]} {eth_test/mac[23]} {eth_test/mac[24]} {eth_test/mac[25]} {eth_test/mac[26]} {eth_test/mac[27]} {eth_test/mac[28]} {eth_test/mac[29]} {eth_test/mac[30]} {eth_test/mac[31]} {eth_test/mac[32]} {eth_test/mac[33]} {eth_test/mac[34]} {eth_test/mac[35]} {eth_test/mac[36]} {eth_test/mac[37]} {eth_test/mac[38]} {eth_test/mac[39]} {eth_test/mac[40]} {eth_test/mac[41]} {eth_test/mac[42]} {eth_test/mac[43]} {eth_test/mac[44]} {eth_test/mac[45]} {eth_test/mac[46]} {eth_test/mac[47]}]]
connect_debug_port u_ila_0/probe16 [get_nets [list {eth_test/packet_type[0]} {eth_test/packet_type[1]} {eth_test/packet_type[2]} {eth_test/packet_type[3]} {eth_test/packet_type[4]} {eth_test/packet_type[5]} {eth_test/packet_type[6]} {eth_test/packet_type[7]} {eth_test/packet_type[8]} {eth_test/packet_type[9]} {eth_test/packet_type[10]} {eth_test/packet_type[11]} {eth_test/packet_type[12]} {eth_test/packet_type[13]} {eth_test/packet_type[14]} {eth_test/packet_type[15]}]]
connect_debug_port u_ila_0/probe33 [get_nets [list eth_test/tail]]
connect_debug_port u_ila_1/probe7 [get_nets [list {pcie_out[0]} {pcie_out[1]} {pcie_out[2]} {pcie_out[3]} {pcie_out[4]} {pcie_out[5]} {pcie_out[6]} {pcie_out[7]} {pcie_out[8]} {pcie_out[9]} {pcie_out[10]} {pcie_out[11]} {pcie_out[12]} {pcie_out[13]} {pcie_out[14]} {pcie_out[15]} {pcie_out[16]} {pcie_out[17]} {pcie_out[18]} {pcie_out[19]} {pcie_out[20]} {pcie_out[21]} {pcie_out[22]} {pcie_out[23]} {pcie_out[24]} {pcie_out[25]} {pcie_out[26]} {pcie_out[27]} {pcie_out[28]} {pcie_out[29]} {pcie_out[30]} {pcie_out[31]} {pcie_out[32]} {pcie_out[33]} {pcie_out[34]} {pcie_out[35]} {pcie_out[36]} {pcie_out[37]} {pcie_out[38]} {pcie_out[39]} {pcie_out[40]} {pcie_out[41]} {pcie_out[42]} {pcie_out[43]} {pcie_out[44]} {pcie_out[45]} {pcie_out[46]} {pcie_out[47]} {pcie_out[48]} {pcie_out[49]} {pcie_out[50]} {pcie_out[51]} {pcie_out[52]} {pcie_out[53]} {pcie_out[54]} {pcie_out[55]} {pcie_out[56]} {pcie_out[57]} {pcie_out[58]} {pcie_out[59]} {pcie_out[60]} {pcie_out[61]} {pcie_out[62]} {pcie_out[63]}]]
connect_debug_port u_ila_1/probe10 [get_nets [list FIFO_wr_en_p2e]]





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
connect_debug_port u_ila_0/clk [get_nets [list PCIe_TOP/xdma_and_ram_i/xdma_0/inst/pcie3_ip_i/inst/gt_top_i/phy_clk_i/CLK_USERCLK]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 64 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {PCIe_TOP/despatch_i/data_from_eth[0]} {PCIe_TOP/despatch_i/data_from_eth[1]} {PCIe_TOP/despatch_i/data_from_eth[2]} {PCIe_TOP/despatch_i/data_from_eth[3]} {PCIe_TOP/despatch_i/data_from_eth[4]} {PCIe_TOP/despatch_i/data_from_eth[5]} {PCIe_TOP/despatch_i/data_from_eth[6]} {PCIe_TOP/despatch_i/data_from_eth[7]} {PCIe_TOP/despatch_i/data_from_eth[8]} {PCIe_TOP/despatch_i/data_from_eth[9]} {PCIe_TOP/despatch_i/data_from_eth[10]} {PCIe_TOP/despatch_i/data_from_eth[11]} {PCIe_TOP/despatch_i/data_from_eth[12]} {PCIe_TOP/despatch_i/data_from_eth[13]} {PCIe_TOP/despatch_i/data_from_eth[14]} {PCIe_TOP/despatch_i/data_from_eth[15]} {PCIe_TOP/despatch_i/data_from_eth[16]} {PCIe_TOP/despatch_i/data_from_eth[17]} {PCIe_TOP/despatch_i/data_from_eth[18]} {PCIe_TOP/despatch_i/data_from_eth[19]} {PCIe_TOP/despatch_i/data_from_eth[20]} {PCIe_TOP/despatch_i/data_from_eth[21]} {PCIe_TOP/despatch_i/data_from_eth[22]} {PCIe_TOP/despatch_i/data_from_eth[23]} {PCIe_TOP/despatch_i/data_from_eth[24]} {PCIe_TOP/despatch_i/data_from_eth[25]} {PCIe_TOP/despatch_i/data_from_eth[26]} {PCIe_TOP/despatch_i/data_from_eth[27]} {PCIe_TOP/despatch_i/data_from_eth[28]} {PCIe_TOP/despatch_i/data_from_eth[29]} {PCIe_TOP/despatch_i/data_from_eth[30]} {PCIe_TOP/despatch_i/data_from_eth[31]} {PCIe_TOP/despatch_i/data_from_eth[32]} {PCIe_TOP/despatch_i/data_from_eth[33]} {PCIe_TOP/despatch_i/data_from_eth[34]} {PCIe_TOP/despatch_i/data_from_eth[35]} {PCIe_TOP/despatch_i/data_from_eth[36]} {PCIe_TOP/despatch_i/data_from_eth[37]} {PCIe_TOP/despatch_i/data_from_eth[38]} {PCIe_TOP/despatch_i/data_from_eth[39]} {PCIe_TOP/despatch_i/data_from_eth[40]} {PCIe_TOP/despatch_i/data_from_eth[41]} {PCIe_TOP/despatch_i/data_from_eth[42]} {PCIe_TOP/despatch_i/data_from_eth[43]} {PCIe_TOP/despatch_i/data_from_eth[44]} {PCIe_TOP/despatch_i/data_from_eth[45]} {PCIe_TOP/despatch_i/data_from_eth[46]} {PCIe_TOP/despatch_i/data_from_eth[47]} {PCIe_TOP/despatch_i/data_from_eth[48]} {PCIe_TOP/despatch_i/data_from_eth[49]} {PCIe_TOP/despatch_i/data_from_eth[50]} {PCIe_TOP/despatch_i/data_from_eth[51]} {PCIe_TOP/despatch_i/data_from_eth[52]} {PCIe_TOP/despatch_i/data_from_eth[53]} {PCIe_TOP/despatch_i/data_from_eth[54]} {PCIe_TOP/despatch_i/data_from_eth[55]} {PCIe_TOP/despatch_i/data_from_eth[56]} {PCIe_TOP/despatch_i/data_from_eth[57]} {PCIe_TOP/despatch_i/data_from_eth[58]} {PCIe_TOP/despatch_i/data_from_eth[59]} {PCIe_TOP/despatch_i/data_from_eth[60]} {PCIe_TOP/despatch_i/data_from_eth[61]} {PCIe_TOP/despatch_i/data_from_eth[62]} {PCIe_TOP/despatch_i/data_from_eth[63]}]]
create_debug_core u_ila_1 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_1]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_1]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_1]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_1]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_1]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_1]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_1]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_1]
set_property port_width 1 [get_debug_ports u_ila_1/clk]
connect_debug_port u_ila_1/clk [get_nets [list ClkGen/inst/clkout_200M]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe0]
set_property port_width 9 [get_debug_ports u_ila_1/probe0]
connect_debug_port u_ila_1/probe0 [get_nets [list {eth_test/u1/mac_test0/mac_top0/mac_rx0/mac0/rec_state[0]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/mac0/rec_state[1]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/mac0/rec_state[2]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/mac0/rec_state[3]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/mac0/rec_state[4]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/mac0/rec_state[5]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/mac0/rec_state[6]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/mac0/rec_state[7]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/mac0/rec_state[8]}]]
create_debug_core u_ila_2 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_2]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_2]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_2]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_2]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_2]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_2]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_2]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_2]
set_property port_width 1 [get_debug_ports u_ila_2/clk]
connect_debug_port u_ila_2/clk [get_nets [list ten_gig_eth_example_top/ten_gig_eth_base_shared_clock_reset_block/CLK]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe0]
set_property port_width 64 [get_debug_ports u_ila_2/probe0]
connect_debug_port u_ila_2/probe0 [get_nets [list {ten_gig_eth_example_top/packet_number_10G_out[0]} {ten_gig_eth_example_top/packet_number_10G_out[1]} {ten_gig_eth_example_top/packet_number_10G_out[2]} {ten_gig_eth_example_top/packet_number_10G_out[3]} {ten_gig_eth_example_top/packet_number_10G_out[4]} {ten_gig_eth_example_top/packet_number_10G_out[5]} {ten_gig_eth_example_top/packet_number_10G_out[6]} {ten_gig_eth_example_top/packet_number_10G_out[7]} {ten_gig_eth_example_top/packet_number_10G_out[8]} {ten_gig_eth_example_top/packet_number_10G_out[9]} {ten_gig_eth_example_top/packet_number_10G_out[10]} {ten_gig_eth_example_top/packet_number_10G_out[11]} {ten_gig_eth_example_top/packet_number_10G_out[12]} {ten_gig_eth_example_top/packet_number_10G_out[13]} {ten_gig_eth_example_top/packet_number_10G_out[14]} {ten_gig_eth_example_top/packet_number_10G_out[15]} {ten_gig_eth_example_top/packet_number_10G_out[16]} {ten_gig_eth_example_top/packet_number_10G_out[17]} {ten_gig_eth_example_top/packet_number_10G_out[18]} {ten_gig_eth_example_top/packet_number_10G_out[19]} {ten_gig_eth_example_top/packet_number_10G_out[20]} {ten_gig_eth_example_top/packet_number_10G_out[21]} {ten_gig_eth_example_top/packet_number_10G_out[22]} {ten_gig_eth_example_top/packet_number_10G_out[23]} {ten_gig_eth_example_top/packet_number_10G_out[24]} {ten_gig_eth_example_top/packet_number_10G_out[25]} {ten_gig_eth_example_top/packet_number_10G_out[26]} {ten_gig_eth_example_top/packet_number_10G_out[27]} {ten_gig_eth_example_top/packet_number_10G_out[28]} {ten_gig_eth_example_top/packet_number_10G_out[29]} {ten_gig_eth_example_top/packet_number_10G_out[30]} {ten_gig_eth_example_top/packet_number_10G_out[31]} {ten_gig_eth_example_top/packet_number_10G_out[32]} {ten_gig_eth_example_top/packet_number_10G_out[33]} {ten_gig_eth_example_top/packet_number_10G_out[34]} {ten_gig_eth_example_top/packet_number_10G_out[35]} {ten_gig_eth_example_top/packet_number_10G_out[36]} {ten_gig_eth_example_top/packet_number_10G_out[37]} {ten_gig_eth_example_top/packet_number_10G_out[38]} {ten_gig_eth_example_top/packet_number_10G_out[39]} {ten_gig_eth_example_top/packet_number_10G_out[40]} {ten_gig_eth_example_top/packet_number_10G_out[41]} {ten_gig_eth_example_top/packet_number_10G_out[42]} {ten_gig_eth_example_top/packet_number_10G_out[43]} {ten_gig_eth_example_top/packet_number_10G_out[44]} {ten_gig_eth_example_top/packet_number_10G_out[45]} {ten_gig_eth_example_top/packet_number_10G_out[46]} {ten_gig_eth_example_top/packet_number_10G_out[47]} {ten_gig_eth_example_top/packet_number_10G_out[48]} {ten_gig_eth_example_top/packet_number_10G_out[49]} {ten_gig_eth_example_top/packet_number_10G_out[50]} {ten_gig_eth_example_top/packet_number_10G_out[51]} {ten_gig_eth_example_top/packet_number_10G_out[52]} {ten_gig_eth_example_top/packet_number_10G_out[53]} {ten_gig_eth_example_top/packet_number_10G_out[54]} {ten_gig_eth_example_top/packet_number_10G_out[55]} {ten_gig_eth_example_top/packet_number_10G_out[56]} {ten_gig_eth_example_top/packet_number_10G_out[57]} {ten_gig_eth_example_top/packet_number_10G_out[58]} {ten_gig_eth_example_top/packet_number_10G_out[59]} {ten_gig_eth_example_top/packet_number_10G_out[60]} {ten_gig_eth_example_top/packet_number_10G_out[61]} {ten_gig_eth_example_top/packet_number_10G_out[62]} {ten_gig_eth_example_top/packet_number_10G_out[63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 156 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {PCIe_TOP/despatch_i/din_h2c[0]} {PCIe_TOP/despatch_i/din_h2c[1]} {PCIe_TOP/despatch_i/din_h2c[2]} {PCIe_TOP/despatch_i/din_h2c[3]} {PCIe_TOP/despatch_i/din_h2c[4]} {PCIe_TOP/despatch_i/din_h2c[5]} {PCIe_TOP/despatch_i/din_h2c[6]} {PCIe_TOP/despatch_i/din_h2c[7]} {PCIe_TOP/despatch_i/din_h2c[8]} {PCIe_TOP/despatch_i/din_h2c[9]} {PCIe_TOP/despatch_i/din_h2c[10]} {PCIe_TOP/despatch_i/din_h2c[11]} {PCIe_TOP/despatch_i/din_h2c[12]} {PCIe_TOP/despatch_i/din_h2c[13]} {PCIe_TOP/despatch_i/din_h2c[14]} {PCIe_TOP/despatch_i/din_h2c[15]} {PCIe_TOP/despatch_i/din_h2c[16]} {PCIe_TOP/despatch_i/din_h2c[17]} {PCIe_TOP/despatch_i/din_h2c[18]} {PCIe_TOP/despatch_i/din_h2c[19]} {PCIe_TOP/despatch_i/din_h2c[20]} {PCIe_TOP/despatch_i/din_h2c[21]} {PCIe_TOP/despatch_i/din_h2c[22]} {PCIe_TOP/despatch_i/din_h2c[23]} {PCIe_TOP/despatch_i/din_h2c[24]} {PCIe_TOP/despatch_i/din_h2c[25]} {PCIe_TOP/despatch_i/din_h2c[26]} {PCIe_TOP/despatch_i/din_h2c[27]} {PCIe_TOP/despatch_i/din_h2c[28]} {PCIe_TOP/despatch_i/din_h2c[29]} {PCIe_TOP/despatch_i/din_h2c[30]} {PCIe_TOP/despatch_i/din_h2c[31]} {PCIe_TOP/despatch_i/din_h2c[32]} {PCIe_TOP/despatch_i/din_h2c[33]} {PCIe_TOP/despatch_i/din_h2c[34]} {PCIe_TOP/despatch_i/din_h2c[35]} {PCIe_TOP/despatch_i/din_h2c[36]} {PCIe_TOP/despatch_i/din_h2c[37]} {PCIe_TOP/despatch_i/din_h2c[38]} {PCIe_TOP/despatch_i/din_h2c[39]} {PCIe_TOP/despatch_i/din_h2c[40]} {PCIe_TOP/despatch_i/din_h2c[41]} {PCIe_TOP/despatch_i/din_h2c[42]} {PCIe_TOP/despatch_i/din_h2c[43]} {PCIe_TOP/despatch_i/din_h2c[44]} {PCIe_TOP/despatch_i/din_h2c[45]} {PCIe_TOP/despatch_i/din_h2c[46]} {PCIe_TOP/despatch_i/din_h2c[47]} {PCIe_TOP/despatch_i/din_h2c[48]} {PCIe_TOP/despatch_i/din_h2c[49]} {PCIe_TOP/despatch_i/din_h2c[50]} {PCIe_TOP/despatch_i/din_h2c[51]} {PCIe_TOP/despatch_i/din_h2c[52]} {PCIe_TOP/despatch_i/din_h2c[53]} {PCIe_TOP/despatch_i/din_h2c[54]} {PCIe_TOP/despatch_i/din_h2c[55]} {PCIe_TOP/despatch_i/din_h2c[56]} {PCIe_TOP/despatch_i/din_h2c[57]} {PCIe_TOP/despatch_i/din_h2c[58]} {PCIe_TOP/despatch_i/din_h2c[59]} {PCIe_TOP/despatch_i/din_h2c[60]} {PCIe_TOP/despatch_i/din_h2c[61]} {PCIe_TOP/despatch_i/din_h2c[62]} {PCIe_TOP/despatch_i/din_h2c[63]} {PCIe_TOP/despatch_i/din_h2c[64]} {PCIe_TOP/despatch_i/din_h2c[65]} {PCIe_TOP/despatch_i/din_h2c[66]} {PCIe_TOP/despatch_i/din_h2c[67]} {PCIe_TOP/despatch_i/din_h2c[68]} {PCIe_TOP/despatch_i/din_h2c[69]} {PCIe_TOP/despatch_i/din_h2c[70]} {PCIe_TOP/despatch_i/din_h2c[71]} {PCIe_TOP/despatch_i/din_h2c[72]} {PCIe_TOP/despatch_i/din_h2c[73]} {PCIe_TOP/despatch_i/din_h2c[74]} {PCIe_TOP/despatch_i/din_h2c[75]} {PCIe_TOP/despatch_i/din_h2c[76]} {PCIe_TOP/despatch_i/din_h2c[77]} {PCIe_TOP/despatch_i/din_h2c[78]} {PCIe_TOP/despatch_i/din_h2c[79]} {PCIe_TOP/despatch_i/din_h2c[80]} {PCIe_TOP/despatch_i/din_h2c[81]} {PCIe_TOP/despatch_i/din_h2c[82]} {PCIe_TOP/despatch_i/din_h2c[83]} {PCIe_TOP/despatch_i/din_h2c[84]} {PCIe_TOP/despatch_i/din_h2c[85]} {PCIe_TOP/despatch_i/din_h2c[86]} {PCIe_TOP/despatch_i/din_h2c[87]} {PCIe_TOP/despatch_i/din_h2c[88]} {PCIe_TOP/despatch_i/din_h2c[89]} {PCIe_TOP/despatch_i/din_h2c[90]} {PCIe_TOP/despatch_i/din_h2c[91]} {PCIe_TOP/despatch_i/din_h2c[92]} {PCIe_TOP/despatch_i/din_h2c[93]} {PCIe_TOP/despatch_i/din_h2c[94]} {PCIe_TOP/despatch_i/din_h2c[95]} {PCIe_TOP/despatch_i/din_h2c[96]} {PCIe_TOP/despatch_i/din_h2c[97]} {PCIe_TOP/despatch_i/din_h2c[98]} {PCIe_TOP/despatch_i/din_h2c[99]} {PCIe_TOP/despatch_i/din_h2c[100]} {PCIe_TOP/despatch_i/din_h2c[101]} {PCIe_TOP/despatch_i/din_h2c[102]} {PCIe_TOP/despatch_i/din_h2c[103]} {PCIe_TOP/despatch_i/din_h2c[104]} {PCIe_TOP/despatch_i/din_h2c[105]} {PCIe_TOP/despatch_i/din_h2c[106]} {PCIe_TOP/despatch_i/din_h2c[107]} {PCIe_TOP/despatch_i/din_h2c[108]} {PCIe_TOP/despatch_i/din_h2c[109]} {PCIe_TOP/despatch_i/din_h2c[110]} {PCIe_TOP/despatch_i/din_h2c[111]} {PCIe_TOP/despatch_i/din_h2c[112]} {PCIe_TOP/despatch_i/din_h2c[113]} {PCIe_TOP/despatch_i/din_h2c[114]} {PCIe_TOP/despatch_i/din_h2c[115]} {PCIe_TOP/despatch_i/din_h2c[116]} {PCIe_TOP/despatch_i/din_h2c[117]} {PCIe_TOP/despatch_i/din_h2c[118]} {PCIe_TOP/despatch_i/din_h2c[119]} {PCIe_TOP/despatch_i/din_h2c[120]} {PCIe_TOP/despatch_i/din_h2c[121]} {PCIe_TOP/despatch_i/din_h2c[122]} {PCIe_TOP/despatch_i/din_h2c[123]} {PCIe_TOP/despatch_i/din_h2c[124]} {PCIe_TOP/despatch_i/din_h2c[125]} {PCIe_TOP/despatch_i/din_h2c[126]} {PCIe_TOP/despatch_i/din_h2c[127]} {PCIe_TOP/despatch_i/din_h2c[128]} {PCIe_TOP/despatch_i/din_h2c[129]} {PCIe_TOP/despatch_i/din_h2c[130]} {PCIe_TOP/despatch_i/din_h2c[131]} {PCIe_TOP/despatch_i/din_h2c[132]} {PCIe_TOP/despatch_i/din_h2c[133]} {PCIe_TOP/despatch_i/din_h2c[134]} {PCIe_TOP/despatch_i/din_h2c[135]} {PCIe_TOP/despatch_i/din_h2c[136]} {PCIe_TOP/despatch_i/din_h2c[137]} {PCIe_TOP/despatch_i/din_h2c[138]} {PCIe_TOP/despatch_i/din_h2c[139]} {PCIe_TOP/despatch_i/din_h2c[140]} {PCIe_TOP/despatch_i/din_h2c[141]} {PCIe_TOP/despatch_i/din_h2c[142]} {PCIe_TOP/despatch_i/din_h2c[143]} {PCIe_TOP/despatch_i/din_h2c[144]} {PCIe_TOP/despatch_i/din_h2c[145]} {PCIe_TOP/despatch_i/din_h2c[146]} {PCIe_TOP/despatch_i/din_h2c[147]} {PCIe_TOP/despatch_i/din_h2c[148]} {PCIe_TOP/despatch_i/din_h2c[149]} {PCIe_TOP/despatch_i/din_h2c[150]} {PCIe_TOP/despatch_i/din_h2c[151]} {PCIe_TOP/despatch_i/din_h2c[152]} {PCIe_TOP/despatch_i/din_h2c[153]} {PCIe_TOP/despatch_i/din_h2c[154]} {PCIe_TOP/despatch_i/din_h2c[155]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 64 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {PCIe_TOP/despatch_i/dinb[0]} {PCIe_TOP/despatch_i/dinb[1]} {PCIe_TOP/despatch_i/dinb[2]} {PCIe_TOP/despatch_i/dinb[3]} {PCIe_TOP/despatch_i/dinb[4]} {PCIe_TOP/despatch_i/dinb[5]} {PCIe_TOP/despatch_i/dinb[6]} {PCIe_TOP/despatch_i/dinb[7]} {PCIe_TOP/despatch_i/dinb[8]} {PCIe_TOP/despatch_i/dinb[9]} {PCIe_TOP/despatch_i/dinb[10]} {PCIe_TOP/despatch_i/dinb[11]} {PCIe_TOP/despatch_i/dinb[12]} {PCIe_TOP/despatch_i/dinb[13]} {PCIe_TOP/despatch_i/dinb[14]} {PCIe_TOP/despatch_i/dinb[15]} {PCIe_TOP/despatch_i/dinb[16]} {PCIe_TOP/despatch_i/dinb[17]} {PCIe_TOP/despatch_i/dinb[18]} {PCIe_TOP/despatch_i/dinb[19]} {PCIe_TOP/despatch_i/dinb[20]} {PCIe_TOP/despatch_i/dinb[21]} {PCIe_TOP/despatch_i/dinb[22]} {PCIe_TOP/despatch_i/dinb[23]} {PCIe_TOP/despatch_i/dinb[24]} {PCIe_TOP/despatch_i/dinb[25]} {PCIe_TOP/despatch_i/dinb[26]} {PCIe_TOP/despatch_i/dinb[27]} {PCIe_TOP/despatch_i/dinb[28]} {PCIe_TOP/despatch_i/dinb[29]} {PCIe_TOP/despatch_i/dinb[30]} {PCIe_TOP/despatch_i/dinb[31]} {PCIe_TOP/despatch_i/dinb[32]} {PCIe_TOP/despatch_i/dinb[33]} {PCIe_TOP/despatch_i/dinb[34]} {PCIe_TOP/despatch_i/dinb[35]} {PCIe_TOP/despatch_i/dinb[36]} {PCIe_TOP/despatch_i/dinb[37]} {PCIe_TOP/despatch_i/dinb[38]} {PCIe_TOP/despatch_i/dinb[39]} {PCIe_TOP/despatch_i/dinb[40]} {PCIe_TOP/despatch_i/dinb[41]} {PCIe_TOP/despatch_i/dinb[42]} {PCIe_TOP/despatch_i/dinb[43]} {PCIe_TOP/despatch_i/dinb[44]} {PCIe_TOP/despatch_i/dinb[45]} {PCIe_TOP/despatch_i/dinb[46]} {PCIe_TOP/despatch_i/dinb[47]} {PCIe_TOP/despatch_i/dinb[48]} {PCIe_TOP/despatch_i/dinb[49]} {PCIe_TOP/despatch_i/dinb[50]} {PCIe_TOP/despatch_i/dinb[51]} {PCIe_TOP/despatch_i/dinb[52]} {PCIe_TOP/despatch_i/dinb[53]} {PCIe_TOP/despatch_i/dinb[54]} {PCIe_TOP/despatch_i/dinb[55]} {PCIe_TOP/despatch_i/dinb[56]} {PCIe_TOP/despatch_i/dinb[57]} {PCIe_TOP/despatch_i/dinb[58]} {PCIe_TOP/despatch_i/dinb[59]} {PCIe_TOP/despatch_i/dinb[60]} {PCIe_TOP/despatch_i/dinb[61]} {PCIe_TOP/despatch_i/dinb[62]} {PCIe_TOP/despatch_i/dinb[63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 29 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {PCIe_TOP/despatch_i/dma_len[0]} {PCIe_TOP/despatch_i/dma_len[1]} {PCIe_TOP/despatch_i/dma_len[2]} {PCIe_TOP/despatch_i/dma_len[3]} {PCIe_TOP/despatch_i/dma_len[4]} {PCIe_TOP/despatch_i/dma_len[5]} {PCIe_TOP/despatch_i/dma_len[6]} {PCIe_TOP/despatch_i/dma_len[7]} {PCIe_TOP/despatch_i/dma_len[8]} {PCIe_TOP/despatch_i/dma_len[9]} {PCIe_TOP/despatch_i/dma_len[10]} {PCIe_TOP/despatch_i/dma_len[11]} {PCIe_TOP/despatch_i/dma_len[12]} {PCIe_TOP/despatch_i/dma_len[13]} {PCIe_TOP/despatch_i/dma_len[14]} {PCIe_TOP/despatch_i/dma_len[15]} {PCIe_TOP/despatch_i/dma_len[16]} {PCIe_TOP/despatch_i/dma_len[17]} {PCIe_TOP/despatch_i/dma_len[18]} {PCIe_TOP/despatch_i/dma_len[19]} {PCIe_TOP/despatch_i/dma_len[20]} {PCIe_TOP/despatch_i/dma_len[21]} {PCIe_TOP/despatch_i/dma_len[22]} {PCIe_TOP/despatch_i/dma_len[23]} {PCIe_TOP/despatch_i/dma_len[24]} {PCIe_TOP/despatch_i/dma_len[25]} {PCIe_TOP/despatch_i/dma_len[26]} {PCIe_TOP/despatch_i/dma_len[27]} {PCIe_TOP/despatch_i/dma_len[28]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 156 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {PCIe_TOP/despatch_i/din_c2h[0]} {PCIe_TOP/despatch_i/din_c2h[1]} {PCIe_TOP/despatch_i/din_c2h[2]} {PCIe_TOP/despatch_i/din_c2h[3]} {PCIe_TOP/despatch_i/din_c2h[4]} {PCIe_TOP/despatch_i/din_c2h[5]} {PCIe_TOP/despatch_i/din_c2h[6]} {PCIe_TOP/despatch_i/din_c2h[7]} {PCIe_TOP/despatch_i/din_c2h[8]} {PCIe_TOP/despatch_i/din_c2h[9]} {PCIe_TOP/despatch_i/din_c2h[10]} {PCIe_TOP/despatch_i/din_c2h[11]} {PCIe_TOP/despatch_i/din_c2h[12]} {PCIe_TOP/despatch_i/din_c2h[13]} {PCIe_TOP/despatch_i/din_c2h[14]} {PCIe_TOP/despatch_i/din_c2h[15]} {PCIe_TOP/despatch_i/din_c2h[16]} {PCIe_TOP/despatch_i/din_c2h[17]} {PCIe_TOP/despatch_i/din_c2h[18]} {PCIe_TOP/despatch_i/din_c2h[19]} {PCIe_TOP/despatch_i/din_c2h[20]} {PCIe_TOP/despatch_i/din_c2h[21]} {PCIe_TOP/despatch_i/din_c2h[22]} {PCIe_TOP/despatch_i/din_c2h[23]} {PCIe_TOP/despatch_i/din_c2h[24]} {PCIe_TOP/despatch_i/din_c2h[25]} {PCIe_TOP/despatch_i/din_c2h[26]} {PCIe_TOP/despatch_i/din_c2h[27]} {PCIe_TOP/despatch_i/din_c2h[28]} {PCIe_TOP/despatch_i/din_c2h[29]} {PCIe_TOP/despatch_i/din_c2h[30]} {PCIe_TOP/despatch_i/din_c2h[31]} {PCIe_TOP/despatch_i/din_c2h[32]} {PCIe_TOP/despatch_i/din_c2h[33]} {PCIe_TOP/despatch_i/din_c2h[34]} {PCIe_TOP/despatch_i/din_c2h[35]} {PCIe_TOP/despatch_i/din_c2h[36]} {PCIe_TOP/despatch_i/din_c2h[37]} {PCIe_TOP/despatch_i/din_c2h[38]} {PCIe_TOP/despatch_i/din_c2h[39]} {PCIe_TOP/despatch_i/din_c2h[40]} {PCIe_TOP/despatch_i/din_c2h[41]} {PCIe_TOP/despatch_i/din_c2h[42]} {PCIe_TOP/despatch_i/din_c2h[43]} {PCIe_TOP/despatch_i/din_c2h[44]} {PCIe_TOP/despatch_i/din_c2h[45]} {PCIe_TOP/despatch_i/din_c2h[46]} {PCIe_TOP/despatch_i/din_c2h[47]} {PCIe_TOP/despatch_i/din_c2h[48]} {PCIe_TOP/despatch_i/din_c2h[49]} {PCIe_TOP/despatch_i/din_c2h[50]} {PCIe_TOP/despatch_i/din_c2h[51]} {PCIe_TOP/despatch_i/din_c2h[52]} {PCIe_TOP/despatch_i/din_c2h[53]} {PCIe_TOP/despatch_i/din_c2h[54]} {PCIe_TOP/despatch_i/din_c2h[55]} {PCIe_TOP/despatch_i/din_c2h[56]} {PCIe_TOP/despatch_i/din_c2h[57]} {PCIe_TOP/despatch_i/din_c2h[58]} {PCIe_TOP/despatch_i/din_c2h[59]} {PCIe_TOP/despatch_i/din_c2h[60]} {PCIe_TOP/despatch_i/din_c2h[61]} {PCIe_TOP/despatch_i/din_c2h[62]} {PCIe_TOP/despatch_i/din_c2h[63]} {PCIe_TOP/despatch_i/din_c2h[64]} {PCIe_TOP/despatch_i/din_c2h[65]} {PCIe_TOP/despatch_i/din_c2h[66]} {PCIe_TOP/despatch_i/din_c2h[67]} {PCIe_TOP/despatch_i/din_c2h[68]} {PCIe_TOP/despatch_i/din_c2h[69]} {PCIe_TOP/despatch_i/din_c2h[70]} {PCIe_TOP/despatch_i/din_c2h[71]} {PCIe_TOP/despatch_i/din_c2h[72]} {PCIe_TOP/despatch_i/din_c2h[73]} {PCIe_TOP/despatch_i/din_c2h[74]} {PCIe_TOP/despatch_i/din_c2h[75]} {PCIe_TOP/despatch_i/din_c2h[76]} {PCIe_TOP/despatch_i/din_c2h[77]} {PCIe_TOP/despatch_i/din_c2h[78]} {PCIe_TOP/despatch_i/din_c2h[79]} {PCIe_TOP/despatch_i/din_c2h[80]} {PCIe_TOP/despatch_i/din_c2h[81]} {PCIe_TOP/despatch_i/din_c2h[82]} {PCIe_TOP/despatch_i/din_c2h[83]} {PCIe_TOP/despatch_i/din_c2h[84]} {PCIe_TOP/despatch_i/din_c2h[85]} {PCIe_TOP/despatch_i/din_c2h[86]} {PCIe_TOP/despatch_i/din_c2h[87]} {PCIe_TOP/despatch_i/din_c2h[88]} {PCIe_TOP/despatch_i/din_c2h[89]} {PCIe_TOP/despatch_i/din_c2h[90]} {PCIe_TOP/despatch_i/din_c2h[91]} {PCIe_TOP/despatch_i/din_c2h[92]} {PCIe_TOP/despatch_i/din_c2h[93]} {PCIe_TOP/despatch_i/din_c2h[94]} {PCIe_TOP/despatch_i/din_c2h[95]} {PCIe_TOP/despatch_i/din_c2h[96]} {PCIe_TOP/despatch_i/din_c2h[97]} {PCIe_TOP/despatch_i/din_c2h[98]} {PCIe_TOP/despatch_i/din_c2h[99]} {PCIe_TOP/despatch_i/din_c2h[100]} {PCIe_TOP/despatch_i/din_c2h[101]} {PCIe_TOP/despatch_i/din_c2h[102]} {PCIe_TOP/despatch_i/din_c2h[103]} {PCIe_TOP/despatch_i/din_c2h[104]} {PCIe_TOP/despatch_i/din_c2h[105]} {PCIe_TOP/despatch_i/din_c2h[106]} {PCIe_TOP/despatch_i/din_c2h[107]} {PCIe_TOP/despatch_i/din_c2h[108]} {PCIe_TOP/despatch_i/din_c2h[109]} {PCIe_TOP/despatch_i/din_c2h[110]} {PCIe_TOP/despatch_i/din_c2h[111]} {PCIe_TOP/despatch_i/din_c2h[112]} {PCIe_TOP/despatch_i/din_c2h[113]} {PCIe_TOP/despatch_i/din_c2h[114]} {PCIe_TOP/despatch_i/din_c2h[115]} {PCIe_TOP/despatch_i/din_c2h[116]} {PCIe_TOP/despatch_i/din_c2h[117]} {PCIe_TOP/despatch_i/din_c2h[118]} {PCIe_TOP/despatch_i/din_c2h[119]} {PCIe_TOP/despatch_i/din_c2h[120]} {PCIe_TOP/despatch_i/din_c2h[121]} {PCIe_TOP/despatch_i/din_c2h[122]} {PCIe_TOP/despatch_i/din_c2h[123]} {PCIe_TOP/despatch_i/din_c2h[124]} {PCIe_TOP/despatch_i/din_c2h[125]} {PCIe_TOP/despatch_i/din_c2h[126]} {PCIe_TOP/despatch_i/din_c2h[127]} {PCIe_TOP/despatch_i/din_c2h[128]} {PCIe_TOP/despatch_i/din_c2h[129]} {PCIe_TOP/despatch_i/din_c2h[130]} {PCIe_TOP/despatch_i/din_c2h[131]} {PCIe_TOP/despatch_i/din_c2h[132]} {PCIe_TOP/despatch_i/din_c2h[133]} {PCIe_TOP/despatch_i/din_c2h[134]} {PCIe_TOP/despatch_i/din_c2h[135]} {PCIe_TOP/despatch_i/din_c2h[136]} {PCIe_TOP/despatch_i/din_c2h[137]} {PCIe_TOP/despatch_i/din_c2h[138]} {PCIe_TOP/despatch_i/din_c2h[139]} {PCIe_TOP/despatch_i/din_c2h[140]} {PCIe_TOP/despatch_i/din_c2h[141]} {PCIe_TOP/despatch_i/din_c2h[142]} {PCIe_TOP/despatch_i/din_c2h[143]} {PCIe_TOP/despatch_i/din_c2h[144]} {PCIe_TOP/despatch_i/din_c2h[145]} {PCIe_TOP/despatch_i/din_c2h[146]} {PCIe_TOP/despatch_i/din_c2h[147]} {PCIe_TOP/despatch_i/din_c2h[148]} {PCIe_TOP/despatch_i/din_c2h[149]} {PCIe_TOP/despatch_i/din_c2h[150]} {PCIe_TOP/despatch_i/din_c2h[151]} {PCIe_TOP/despatch_i/din_c2h[152]} {PCIe_TOP/despatch_i/din_c2h[153]} {PCIe_TOP/despatch_i/din_c2h[154]} {PCIe_TOP/despatch_i/din_c2h[155]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 16 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {PCIe_TOP/despatch_i/push_data_cnt[0]} {PCIe_TOP/despatch_i/push_data_cnt[1]} {PCIe_TOP/despatch_i/push_data_cnt[2]} {PCIe_TOP/despatch_i/push_data_cnt[3]} {PCIe_TOP/despatch_i/push_data_cnt[4]} {PCIe_TOP/despatch_i/push_data_cnt[5]} {PCIe_TOP/despatch_i/push_data_cnt[6]} {PCIe_TOP/despatch_i/push_data_cnt[7]} {PCIe_TOP/despatch_i/push_data_cnt[8]} {PCIe_TOP/despatch_i/push_data_cnt[9]} {PCIe_TOP/despatch_i/push_data_cnt[10]} {PCIe_TOP/despatch_i/push_data_cnt[11]} {PCIe_TOP/despatch_i/push_data_cnt[12]} {PCIe_TOP/despatch_i/push_data_cnt[13]} {PCIe_TOP/despatch_i/push_data_cnt[14]} {PCIe_TOP/despatch_i/push_data_cnt[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 8 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {PCIe_TOP/despatch_i/web[0]} {PCIe_TOP/despatch_i/web[1]} {PCIe_TOP/despatch_i/web[2]} {PCIe_TOP/despatch_i/web[3]} {PCIe_TOP/despatch_i/web[4]} {PCIe_TOP/despatch_i/web[5]} {PCIe_TOP/despatch_i/web[6]} {PCIe_TOP/despatch_i/web[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 64 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {PCIe_TOP/data_to_eth[0]} {PCIe_TOP/data_to_eth[1]} {PCIe_TOP/data_to_eth[2]} {PCIe_TOP/data_to_eth[3]} {PCIe_TOP/data_to_eth[4]} {PCIe_TOP/data_to_eth[5]} {PCIe_TOP/data_to_eth[6]} {PCIe_TOP/data_to_eth[7]} {PCIe_TOP/data_to_eth[8]} {PCIe_TOP/data_to_eth[9]} {PCIe_TOP/data_to_eth[10]} {PCIe_TOP/data_to_eth[11]} {PCIe_TOP/data_to_eth[12]} {PCIe_TOP/data_to_eth[13]} {PCIe_TOP/data_to_eth[14]} {PCIe_TOP/data_to_eth[15]} {PCIe_TOP/data_to_eth[16]} {PCIe_TOP/data_to_eth[17]} {PCIe_TOP/data_to_eth[18]} {PCIe_TOP/data_to_eth[19]} {PCIe_TOP/data_to_eth[20]} {PCIe_TOP/data_to_eth[21]} {PCIe_TOP/data_to_eth[22]} {PCIe_TOP/data_to_eth[23]} {PCIe_TOP/data_to_eth[24]} {PCIe_TOP/data_to_eth[25]} {PCIe_TOP/data_to_eth[26]} {PCIe_TOP/data_to_eth[27]} {PCIe_TOP/data_to_eth[28]} {PCIe_TOP/data_to_eth[29]} {PCIe_TOP/data_to_eth[30]} {PCIe_TOP/data_to_eth[31]} {PCIe_TOP/data_to_eth[32]} {PCIe_TOP/data_to_eth[33]} {PCIe_TOP/data_to_eth[34]} {PCIe_TOP/data_to_eth[35]} {PCIe_TOP/data_to_eth[36]} {PCIe_TOP/data_to_eth[37]} {PCIe_TOP/data_to_eth[38]} {PCIe_TOP/data_to_eth[39]} {PCIe_TOP/data_to_eth[40]} {PCIe_TOP/data_to_eth[41]} {PCIe_TOP/data_to_eth[42]} {PCIe_TOP/data_to_eth[43]} {PCIe_TOP/data_to_eth[44]} {PCIe_TOP/data_to_eth[45]} {PCIe_TOP/data_to_eth[46]} {PCIe_TOP/data_to_eth[47]} {PCIe_TOP/data_to_eth[48]} {PCIe_TOP/data_to_eth[49]} {PCIe_TOP/data_to_eth[50]} {PCIe_TOP/data_to_eth[51]} {PCIe_TOP/data_to_eth[52]} {PCIe_TOP/data_to_eth[53]} {PCIe_TOP/data_to_eth[54]} {PCIe_TOP/data_to_eth[55]} {PCIe_TOP/data_to_eth[56]} {PCIe_TOP/data_to_eth[57]} {PCIe_TOP/data_to_eth[58]} {PCIe_TOP/data_to_eth[59]} {PCIe_TOP/data_to_eth[60]} {PCIe_TOP/data_to_eth[61]} {PCIe_TOP/data_to_eth[62]} {PCIe_TOP/data_to_eth[63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 64 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {pcie_out[0]} {pcie_out[1]} {pcie_out[2]} {pcie_out[3]} {pcie_out[4]} {pcie_out[5]} {pcie_out[6]} {pcie_out[7]} {pcie_out[8]} {pcie_out[9]} {pcie_out[10]} {pcie_out[11]} {pcie_out[12]} {pcie_out[13]} {pcie_out[14]} {pcie_out[15]} {pcie_out[16]} {pcie_out[17]} {pcie_out[18]} {pcie_out[19]} {pcie_out[20]} {pcie_out[21]} {pcie_out[22]} {pcie_out[23]} {pcie_out[24]} {pcie_out[25]} {pcie_out[26]} {pcie_out[27]} {pcie_out[28]} {pcie_out[29]} {pcie_out[30]} {pcie_out[31]} {pcie_out[32]} {pcie_out[33]} {pcie_out[34]} {pcie_out[35]} {pcie_out[36]} {pcie_out[37]} {pcie_out[38]} {pcie_out[39]} {pcie_out[40]} {pcie_out[41]} {pcie_out[42]} {pcie_out[43]} {pcie_out[44]} {pcie_out[45]} {pcie_out[46]} {pcie_out[47]} {pcie_out[48]} {pcie_out[49]} {pcie_out[50]} {pcie_out[51]} {pcie_out[52]} {pcie_out[53]} {pcie_out[54]} {pcie_out[55]} {pcie_out[56]} {pcie_out[57]} {pcie_out[58]} {pcie_out[59]} {pcie_out[60]} {pcie_out[61]} {pcie_out[62]} {pcie_out[63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list PCIe_TOP/c_c2h_success]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list PCIe_TOP/c_h2c_success]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list eth_to_pcie_empty]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list FIFO_rd_en_e2p]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 1 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list FIFO_wr_en_p2e]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 1 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list PCIe_TOP/h_c2h_success]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 1 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list PCIe_TOP/h_h2c_success]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 1 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list PCIe_TOP/despatch_i/IB_len_tail]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 1 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list PCIe_TOP/pcie_to_eth_full]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 1 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list PCIe_TOP/to_eth_en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 1 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list PCIe_TOP/despatch_i/wr_en_c2h]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 1 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list PCIe_TOP/despatch_i/wr_en_h2c]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe1]
set_property port_width 64 [get_debug_ports u_ila_1/probe1]
connect_debug_port u_ila_1/probe1 [get_nets [list {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[0]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[1]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[2]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[3]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[4]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[5]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[6]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[7]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[8]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[9]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[10]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[11]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[12]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[13]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[14]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[15]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[16]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[17]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[18]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[19]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[20]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[21]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[22]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[23]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[24]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[25]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[26]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[27]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[28]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[29]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[30]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[31]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[32]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[33]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[34]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[35]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[36]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[37]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[38]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[39]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[40]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[41]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[42]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[43]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[44]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[45]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[46]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[47]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[48]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[49]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[50]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[51]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[52]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[53]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[54]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[55]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[56]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[57]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[58]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[59]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[60]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[61]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[62]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_tx_data[63]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe2]
set_property port_width 64 [get_debug_ports u_ila_1/probe2]
connect_debug_port u_ila_1/probe2 [get_nets [list {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[0]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[1]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[2]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[3]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[4]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[5]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[6]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[7]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[8]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[9]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[10]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[11]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[12]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[13]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[14]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[15]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[16]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[17]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[18]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[19]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[20]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[21]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[22]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[23]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[24]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[25]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[26]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[27]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[28]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[29]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[30]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[31]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[32]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[33]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[34]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[35]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[36]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[37]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[38]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[39]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[40]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[41]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[42]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[43]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[44]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[45]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[46]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[47]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[48]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[49]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[50]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[51]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[52]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[53]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[54]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[55]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[56]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[57]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[58]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[59]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[60]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[61]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[62]} {eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/packet_number_eth_out[63]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe3]
set_property port_width 64 [get_debug_ports u_ila_1/probe3]
connect_debug_port u_ila_1/probe3 [get_nets [list {eth_test/gmii_rxd_real[0]} {eth_test/gmii_rxd_real[1]} {eth_test/gmii_rxd_real[2]} {eth_test/gmii_rxd_real[3]} {eth_test/gmii_rxd_real[4]} {eth_test/gmii_rxd_real[5]} {eth_test/gmii_rxd_real[6]} {eth_test/gmii_rxd_real[7]} {eth_test/gmii_rxd_real[8]} {eth_test/gmii_rxd_real[9]} {eth_test/gmii_rxd_real[10]} {eth_test/gmii_rxd_real[11]} {eth_test/gmii_rxd_real[12]} {eth_test/gmii_rxd_real[13]} {eth_test/gmii_rxd_real[14]} {eth_test/gmii_rxd_real[15]} {eth_test/gmii_rxd_real[16]} {eth_test/gmii_rxd_real[17]} {eth_test/gmii_rxd_real[18]} {eth_test/gmii_rxd_real[19]} {eth_test/gmii_rxd_real[20]} {eth_test/gmii_rxd_real[21]} {eth_test/gmii_rxd_real[22]} {eth_test/gmii_rxd_real[23]} {eth_test/gmii_rxd_real[24]} {eth_test/gmii_rxd_real[25]} {eth_test/gmii_rxd_real[26]} {eth_test/gmii_rxd_real[27]} {eth_test/gmii_rxd_real[28]} {eth_test/gmii_rxd_real[29]} {eth_test/gmii_rxd_real[30]} {eth_test/gmii_rxd_real[31]} {eth_test/gmii_rxd_real[32]} {eth_test/gmii_rxd_real[33]} {eth_test/gmii_rxd_real[34]} {eth_test/gmii_rxd_real[35]} {eth_test/gmii_rxd_real[36]} {eth_test/gmii_rxd_real[37]} {eth_test/gmii_rxd_real[38]} {eth_test/gmii_rxd_real[39]} {eth_test/gmii_rxd_real[40]} {eth_test/gmii_rxd_real[41]} {eth_test/gmii_rxd_real[42]} {eth_test/gmii_rxd_real[43]} {eth_test/gmii_rxd_real[44]} {eth_test/gmii_rxd_real[45]} {eth_test/gmii_rxd_real[46]} {eth_test/gmii_rxd_real[47]} {eth_test/gmii_rxd_real[48]} {eth_test/gmii_rxd_real[49]} {eth_test/gmii_rxd_real[50]} {eth_test/gmii_rxd_real[51]} {eth_test/gmii_rxd_real[52]} {eth_test/gmii_rxd_real[53]} {eth_test/gmii_rxd_real[54]} {eth_test/gmii_rxd_real[55]} {eth_test/gmii_rxd_real[56]} {eth_test/gmii_rxd_real[57]} {eth_test/gmii_rxd_real[58]} {eth_test/gmii_rxd_real[59]} {eth_test/gmii_rxd_real[60]} {eth_test/gmii_rxd_real[61]} {eth_test/gmii_rxd_real[62]} {eth_test/gmii_rxd_real[63]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe4]
set_property port_width 64 [get_debug_ports u_ila_1/probe4]
connect_debug_port u_ila_1/probe4 [get_nets [list {eth_test/packet_number_eth_in[0]} {eth_test/packet_number_eth_in[1]} {eth_test/packet_number_eth_in[2]} {eth_test/packet_number_eth_in[3]} {eth_test/packet_number_eth_in[4]} {eth_test/packet_number_eth_in[5]} {eth_test/packet_number_eth_in[6]} {eth_test/packet_number_eth_in[7]} {eth_test/packet_number_eth_in[8]} {eth_test/packet_number_eth_in[9]} {eth_test/packet_number_eth_in[10]} {eth_test/packet_number_eth_in[11]} {eth_test/packet_number_eth_in[12]} {eth_test/packet_number_eth_in[13]} {eth_test/packet_number_eth_in[14]} {eth_test/packet_number_eth_in[15]} {eth_test/packet_number_eth_in[16]} {eth_test/packet_number_eth_in[17]} {eth_test/packet_number_eth_in[18]} {eth_test/packet_number_eth_in[19]} {eth_test/packet_number_eth_in[20]} {eth_test/packet_number_eth_in[21]} {eth_test/packet_number_eth_in[22]} {eth_test/packet_number_eth_in[23]} {eth_test/packet_number_eth_in[24]} {eth_test/packet_number_eth_in[25]} {eth_test/packet_number_eth_in[26]} {eth_test/packet_number_eth_in[27]} {eth_test/packet_number_eth_in[28]} {eth_test/packet_number_eth_in[29]} {eth_test/packet_number_eth_in[30]} {eth_test/packet_number_eth_in[31]} {eth_test/packet_number_eth_in[32]} {eth_test/packet_number_eth_in[33]} {eth_test/packet_number_eth_in[34]} {eth_test/packet_number_eth_in[35]} {eth_test/packet_number_eth_in[36]} {eth_test/packet_number_eth_in[37]} {eth_test/packet_number_eth_in[38]} {eth_test/packet_number_eth_in[39]} {eth_test/packet_number_eth_in[40]} {eth_test/packet_number_eth_in[41]} {eth_test/packet_number_eth_in[42]} {eth_test/packet_number_eth_in[43]} {eth_test/packet_number_eth_in[44]} {eth_test/packet_number_eth_in[45]} {eth_test/packet_number_eth_in[46]} {eth_test/packet_number_eth_in[47]} {eth_test/packet_number_eth_in[48]} {eth_test/packet_number_eth_in[49]} {eth_test/packet_number_eth_in[50]} {eth_test/packet_number_eth_in[51]} {eth_test/packet_number_eth_in[52]} {eth_test/packet_number_eth_in[53]} {eth_test/packet_number_eth_in[54]} {eth_test/packet_number_eth_in[55]} {eth_test/packet_number_eth_in[56]} {eth_test/packet_number_eth_in[57]} {eth_test/packet_number_eth_in[58]} {eth_test/packet_number_eth_in[59]} {eth_test/packet_number_eth_in[60]} {eth_test/packet_number_eth_in[61]} {eth_test/packet_number_eth_in[62]} {eth_test/packet_number_eth_in[63]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe5]
set_property port_width 8 [get_debug_ports u_ila_1/probe5]
connect_debug_port u_ila_1/probe5 [get_nets [list {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/state[0]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/state[1]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/state[2]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/state[3]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/state[4]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/state[5]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/state[6]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/state[7]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe6]
set_property port_width 64 [get_debug_ports u_ila_1/probe6]
connect_debug_port u_ila_1/probe6 [get_nets [list {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[0]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[1]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[2]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[3]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[4]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[5]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[6]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[7]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[8]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[9]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[10]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[11]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[12]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[13]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[14]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[15]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[16]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[17]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[18]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[19]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[20]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[21]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[22]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[23]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[24]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[25]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[26]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[27]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[28]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[29]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[30]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[31]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[32]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[33]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[34]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[35]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[36]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[37]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[38]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[39]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[40]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[41]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[42]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[43]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[44]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[45]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[46]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[47]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[48]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[49]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[50]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[51]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[52]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[53]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[54]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[55]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[56]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[57]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[58]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[59]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[60]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[61]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[62]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/udp_rx_data[63]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe7]
set_property port_width 5 [get_debug_ports u_ila_1/probe7]
connect_debug_port u_ila_1/probe7 [get_nets [list {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/write_event_cnt[0]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/write_event_cnt[1]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/write_event_cnt[2]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/write_event_cnt[3]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/write_event_cnt[4]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe8]
set_property port_width 64 [get_debug_ports u_ila_1/probe8]
connect_debug_port u_ila_1/probe8 [get_nets [list {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[0]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[1]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[2]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[3]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[4]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[5]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[6]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[7]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[8]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[9]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[10]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[11]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[12]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[13]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[14]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[15]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[16]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[17]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[18]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[19]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[20]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[21]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[22]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[23]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[24]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[25]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[26]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[27]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[28]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[29]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[30]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[31]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[32]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[33]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[34]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[35]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[36]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[37]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[38]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[39]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[40]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[41]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[42]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[43]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[44]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[45]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[46]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[47]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[48]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[49]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[50]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[51]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[52]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[53]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[54]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[55]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[56]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[57]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[58]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[59]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[60]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[61]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[62]} {eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in[63]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe9]
set_property port_width 64 [get_debug_ports u_ila_1/probe9]
connect_debug_port u_ila_1/probe9 [get_nets [list {eth_test/u1/mac_test0/queue2_info_in[0]} {eth_test/u1/mac_test0/queue2_info_in[1]} {eth_test/u1/mac_test0/queue2_info_in[2]} {eth_test/u1/mac_test0/queue2_info_in[3]} {eth_test/u1/mac_test0/queue2_info_in[4]} {eth_test/u1/mac_test0/queue2_info_in[5]} {eth_test/u1/mac_test0/queue2_info_in[6]} {eth_test/u1/mac_test0/queue2_info_in[7]} {eth_test/u1/mac_test0/queue2_info_in[8]} {eth_test/u1/mac_test0/queue2_info_in[9]} {eth_test/u1/mac_test0/queue2_info_in[10]} {eth_test/u1/mac_test0/queue2_info_in[11]} {eth_test/u1/mac_test0/queue2_info_in[12]} {eth_test/u1/mac_test0/queue2_info_in[13]} {eth_test/u1/mac_test0/queue2_info_in[14]} {eth_test/u1/mac_test0/queue2_info_in[15]} {eth_test/u1/mac_test0/queue2_info_in[16]} {eth_test/u1/mac_test0/queue2_info_in[17]} {eth_test/u1/mac_test0/queue2_info_in[18]} {eth_test/u1/mac_test0/queue2_info_in[19]} {eth_test/u1/mac_test0/queue2_info_in[20]} {eth_test/u1/mac_test0/queue2_info_in[21]} {eth_test/u1/mac_test0/queue2_info_in[22]} {eth_test/u1/mac_test0/queue2_info_in[23]} {eth_test/u1/mac_test0/queue2_info_in[24]} {eth_test/u1/mac_test0/queue2_info_in[25]} {eth_test/u1/mac_test0/queue2_info_in[26]} {eth_test/u1/mac_test0/queue2_info_in[27]} {eth_test/u1/mac_test0/queue2_info_in[28]} {eth_test/u1/mac_test0/queue2_info_in[29]} {eth_test/u1/mac_test0/queue2_info_in[30]} {eth_test/u1/mac_test0/queue2_info_in[31]} {eth_test/u1/mac_test0/queue2_info_in[32]} {eth_test/u1/mac_test0/queue2_info_in[33]} {eth_test/u1/mac_test0/queue2_info_in[34]} {eth_test/u1/mac_test0/queue2_info_in[35]} {eth_test/u1/mac_test0/queue2_info_in[36]} {eth_test/u1/mac_test0/queue2_info_in[37]} {eth_test/u1/mac_test0/queue2_info_in[38]} {eth_test/u1/mac_test0/queue2_info_in[39]} {eth_test/u1/mac_test0/queue2_info_in[40]} {eth_test/u1/mac_test0/queue2_info_in[41]} {eth_test/u1/mac_test0/queue2_info_in[42]} {eth_test/u1/mac_test0/queue2_info_in[43]} {eth_test/u1/mac_test0/queue2_info_in[44]} {eth_test/u1/mac_test0/queue2_info_in[45]} {eth_test/u1/mac_test0/queue2_info_in[46]} {eth_test/u1/mac_test0/queue2_info_in[47]} {eth_test/u1/mac_test0/queue2_info_in[48]} {eth_test/u1/mac_test0/queue2_info_in[49]} {eth_test/u1/mac_test0/queue2_info_in[50]} {eth_test/u1/mac_test0/queue2_info_in[51]} {eth_test/u1/mac_test0/queue2_info_in[52]} {eth_test/u1/mac_test0/queue2_info_in[53]} {eth_test/u1/mac_test0/queue2_info_in[54]} {eth_test/u1/mac_test0/queue2_info_in[55]} {eth_test/u1/mac_test0/queue2_info_in[56]} {eth_test/u1/mac_test0/queue2_info_in[57]} {eth_test/u1/mac_test0/queue2_info_in[58]} {eth_test/u1/mac_test0/queue2_info_in[59]} {eth_test/u1/mac_test0/queue2_info_in[60]} {eth_test/u1/mac_test0/queue2_info_in[61]} {eth_test/u1/mac_test0/queue2_info_in[62]} {eth_test/u1/mac_test0/queue2_info_in[63]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe10]
set_property port_width 16 [get_debug_ports u_ila_1/probe10]
connect_debug_port u_ila_1/probe10 [get_nets [list {eth_test/u1/mac_test0/read_data_cnt[0]} {eth_test/u1/mac_test0/read_data_cnt[1]} {eth_test/u1/mac_test0/read_data_cnt[2]} {eth_test/u1/mac_test0/read_data_cnt[3]} {eth_test/u1/mac_test0/read_data_cnt[4]} {eth_test/u1/mac_test0/read_data_cnt[5]} {eth_test/u1/mac_test0/read_data_cnt[6]} {eth_test/u1/mac_test0/read_data_cnt[7]} {eth_test/u1/mac_test0/read_data_cnt[8]} {eth_test/u1/mac_test0/read_data_cnt[9]} {eth_test/u1/mac_test0/read_data_cnt[10]} {eth_test/u1/mac_test0/read_data_cnt[11]} {eth_test/u1/mac_test0/read_data_cnt[12]} {eth_test/u1/mac_test0/read_data_cnt[13]} {eth_test/u1/mac_test0/read_data_cnt[14]} {eth_test/u1/mac_test0/read_data_cnt[15]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe11]
set_property port_width 4 [get_debug_ports u_ila_1/probe11]
connect_debug_port u_ila_1/probe11 [get_nets [list {eth_test/u1/mac_test0/read_head_cnt[0]} {eth_test/u1/mac_test0/read_head_cnt[1]} {eth_test/u1/mac_test0/read_head_cnt[2]} {eth_test/u1/mac_test0/read_head_cnt[3]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe12]
set_property port_width 3 [get_debug_ports u_ila_1/probe12]
connect_debug_port u_ila_1/probe12 [get_nets [list {eth_test/u1/mac_test0/queue2_state[0]} {eth_test/u1/mac_test0/queue2_state[1]} {eth_test/u1/mac_test0/queue2_state[2]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe13]
set_property port_width 16 [get_debug_ports u_ila_1/probe13]
connect_debug_port u_ila_1/probe13 [get_nets [list {eth_test/u1/mac_test0/queue2_data_length[0]} {eth_test/u1/mac_test0/queue2_data_length[1]} {eth_test/u1/mac_test0/queue2_data_length[2]} {eth_test/u1/mac_test0/queue2_data_length[3]} {eth_test/u1/mac_test0/queue2_data_length[4]} {eth_test/u1/mac_test0/queue2_data_length[5]} {eth_test/u1/mac_test0/queue2_data_length[6]} {eth_test/u1/mac_test0/queue2_data_length[7]} {eth_test/u1/mac_test0/queue2_data_length[8]} {eth_test/u1/mac_test0/queue2_data_length[9]} {eth_test/u1/mac_test0/queue2_data_length[10]} {eth_test/u1/mac_test0/queue2_data_length[11]} {eth_test/u1/mac_test0/queue2_data_length[12]} {eth_test/u1/mac_test0/queue2_data_length[13]} {eth_test/u1/mac_test0/queue2_data_length[14]} {eth_test/u1/mac_test0/queue2_data_length[15]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe14]
set_property port_width 64 [get_debug_ports u_ila_1/probe14]
connect_debug_port u_ila_1/probe14 [get_nets [list {eth_test/u1/mac_test0/total_queue_data_out[0]} {eth_test/u1/mac_test0/total_queue_data_out[1]} {eth_test/u1/mac_test0/total_queue_data_out[2]} {eth_test/u1/mac_test0/total_queue_data_out[3]} {eth_test/u1/mac_test0/total_queue_data_out[4]} {eth_test/u1/mac_test0/total_queue_data_out[5]} {eth_test/u1/mac_test0/total_queue_data_out[6]} {eth_test/u1/mac_test0/total_queue_data_out[7]} {eth_test/u1/mac_test0/total_queue_data_out[8]} {eth_test/u1/mac_test0/total_queue_data_out[9]} {eth_test/u1/mac_test0/total_queue_data_out[10]} {eth_test/u1/mac_test0/total_queue_data_out[11]} {eth_test/u1/mac_test0/total_queue_data_out[12]} {eth_test/u1/mac_test0/total_queue_data_out[13]} {eth_test/u1/mac_test0/total_queue_data_out[14]} {eth_test/u1/mac_test0/total_queue_data_out[15]} {eth_test/u1/mac_test0/total_queue_data_out[16]} {eth_test/u1/mac_test0/total_queue_data_out[17]} {eth_test/u1/mac_test0/total_queue_data_out[18]} {eth_test/u1/mac_test0/total_queue_data_out[19]} {eth_test/u1/mac_test0/total_queue_data_out[20]} {eth_test/u1/mac_test0/total_queue_data_out[21]} {eth_test/u1/mac_test0/total_queue_data_out[22]} {eth_test/u1/mac_test0/total_queue_data_out[23]} {eth_test/u1/mac_test0/total_queue_data_out[24]} {eth_test/u1/mac_test0/total_queue_data_out[25]} {eth_test/u1/mac_test0/total_queue_data_out[26]} {eth_test/u1/mac_test0/total_queue_data_out[27]} {eth_test/u1/mac_test0/total_queue_data_out[28]} {eth_test/u1/mac_test0/total_queue_data_out[29]} {eth_test/u1/mac_test0/total_queue_data_out[30]} {eth_test/u1/mac_test0/total_queue_data_out[31]} {eth_test/u1/mac_test0/total_queue_data_out[32]} {eth_test/u1/mac_test0/total_queue_data_out[33]} {eth_test/u1/mac_test0/total_queue_data_out[34]} {eth_test/u1/mac_test0/total_queue_data_out[35]} {eth_test/u1/mac_test0/total_queue_data_out[36]} {eth_test/u1/mac_test0/total_queue_data_out[37]} {eth_test/u1/mac_test0/total_queue_data_out[38]} {eth_test/u1/mac_test0/total_queue_data_out[39]} {eth_test/u1/mac_test0/total_queue_data_out[40]} {eth_test/u1/mac_test0/total_queue_data_out[41]} {eth_test/u1/mac_test0/total_queue_data_out[42]} {eth_test/u1/mac_test0/total_queue_data_out[43]} {eth_test/u1/mac_test0/total_queue_data_out[44]} {eth_test/u1/mac_test0/total_queue_data_out[45]} {eth_test/u1/mac_test0/total_queue_data_out[46]} {eth_test/u1/mac_test0/total_queue_data_out[47]} {eth_test/u1/mac_test0/total_queue_data_out[48]} {eth_test/u1/mac_test0/total_queue_data_out[49]} {eth_test/u1/mac_test0/total_queue_data_out[50]} {eth_test/u1/mac_test0/total_queue_data_out[51]} {eth_test/u1/mac_test0/total_queue_data_out[52]} {eth_test/u1/mac_test0/total_queue_data_out[53]} {eth_test/u1/mac_test0/total_queue_data_out[54]} {eth_test/u1/mac_test0/total_queue_data_out[55]} {eth_test/u1/mac_test0/total_queue_data_out[56]} {eth_test/u1/mac_test0/total_queue_data_out[57]} {eth_test/u1/mac_test0/total_queue_data_out[58]} {eth_test/u1/mac_test0/total_queue_data_out[59]} {eth_test/u1/mac_test0/total_queue_data_out[60]} {eth_test/u1/mac_test0/total_queue_data_out[61]} {eth_test/u1/mac_test0/total_queue_data_out[62]} {eth_test/u1/mac_test0/total_queue_data_out[63]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe15]
set_property port_width 64 [get_debug_ports u_ila_1/probe15]
connect_debug_port u_ila_1/probe15 [get_nets [list {eth_out[0]} {eth_out[1]} {eth_out[2]} {eth_out[3]} {eth_out[4]} {eth_out[5]} {eth_out[6]} {eth_out[7]} {eth_out[8]} {eth_out[9]} {eth_out[10]} {eth_out[11]} {eth_out[12]} {eth_out[13]} {eth_out[14]} {eth_out[15]} {eth_out[16]} {eth_out[17]} {eth_out[18]} {eth_out[19]} {eth_out[20]} {eth_out[21]} {eth_out[22]} {eth_out[23]} {eth_out[24]} {eth_out[25]} {eth_out[26]} {eth_out[27]} {eth_out[28]} {eth_out[29]} {eth_out[30]} {eth_out[31]} {eth_out[32]} {eth_out[33]} {eth_out[34]} {eth_out[35]} {eth_out[36]} {eth_out[37]} {eth_out[38]} {eth_out[39]} {eth_out[40]} {eth_out[41]} {eth_out[42]} {eth_out[43]} {eth_out[44]} {eth_out[45]} {eth_out[46]} {eth_out[47]} {eth_out[48]} {eth_out[49]} {eth_out[50]} {eth_out[51]} {eth_out[52]} {eth_out[53]} {eth_out[54]} {eth_out[55]} {eth_out[56]} {eth_out[57]} {eth_out[58]} {eth_out[59]} {eth_out[60]} {eth_out[61]} {eth_out[62]} {eth_out[63]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe16]
set_property port_width 64 [get_debug_ports u_ila_1/probe16]
connect_debug_port u_ila_1/probe16 [get_nets [list {eth_in[0]} {eth_in[1]} {eth_in[2]} {eth_in[3]} {eth_in[4]} {eth_in[5]} {eth_in[6]} {eth_in[7]} {eth_in[8]} {eth_in[9]} {eth_in[10]} {eth_in[11]} {eth_in[12]} {eth_in[13]} {eth_in[14]} {eth_in[15]} {eth_in[16]} {eth_in[17]} {eth_in[18]} {eth_in[19]} {eth_in[20]} {eth_in[21]} {eth_in[22]} {eth_in[23]} {eth_in[24]} {eth_in[25]} {eth_in[26]} {eth_in[27]} {eth_in[28]} {eth_in[29]} {eth_in[30]} {eth_in[31]} {eth_in[32]} {eth_in[33]} {eth_in[34]} {eth_in[35]} {eth_in[36]} {eth_in[37]} {eth_in[38]} {eth_in[39]} {eth_in[40]} {eth_in[41]} {eth_in[42]} {eth_in[43]} {eth_in[44]} {eth_in[45]} {eth_in[46]} {eth_in[47]} {eth_in[48]} {eth_in[49]} {eth_in[50]} {eth_in[51]} {eth_in[52]} {eth_in[53]} {eth_in[54]} {eth_in[55]} {eth_in[56]} {eth_in[57]} {eth_in[58]} {eth_in[59]} {eth_in[60]} {eth_in[61]} {eth_in[62]} {eth_in[63]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe17]
set_property port_width 1 [get_debug_ports u_ila_1/probe17]
connect_debug_port u_ila_1/probe17 [get_nets [list eth_to_pcie_full]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe18]
set_property port_width 1 [get_debug_ports u_ila_1/probe18]
connect_debug_port u_ila_1/probe18 [get_nets [list eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_info_in_en]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe19]
set_property port_width 1 [get_debug_ports u_ila_1/probe19]
connect_debug_port u_ila_1/probe19 [get_nets [list eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/event_switch]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe20]
set_property port_width 1 [get_debug_ports u_ila_1/probe20]
connect_debug_port u_ila_1/probe20 [get_nets [list FIFO_rd_en_p2e]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe21]
set_property port_width 1 [get_debug_ports u_ila_1/probe21]
connect_debug_port u_ila_1/probe21 [get_nets [list FIFO_wr_en_e2p]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe22]
set_property port_width 1 [get_debug_ports u_ila_1/probe22]
connect_debug_port u_ila_1/probe22 [get_nets [list eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/full]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe23]
set_property port_width 1 [get_debug_ports u_ila_1/probe23]
connect_debug_port u_ila_1/probe23 [get_nets [list eth_test/u1/mac_test0/mac_top0/mac_tx0/ip0/ip_sending]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe24]
set_property port_width 1 [get_debug_ports u_ila_1/probe24]
connect_debug_port u_ila_1/probe24 [get_nets [list pcie_to_eth_empty]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe25]
set_property port_width 1 [get_debug_ports u_ila_1/probe25]
connect_debug_port u_ila_1/probe25 [get_nets [list eth_test/u1/mac_test0/queue2_info_in_en]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe26]
set_property port_width 1 [get_debug_ports u_ila_1/probe26]
connect_debug_port u_ila_1/probe26 [get_nets [list eth_test/rec_datain_en]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe27]
set_property port_width 1 [get_debug_ports u_ila_1/probe27]
connect_debug_port u_ila_1/probe27 [get_nets [list eth_test/rec_fifo_empty]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe28]
set_property port_width 1 [get_debug_ports u_ila_1/probe28]
connect_debug_port u_ila_1/probe28 [get_nets [list ten_gig_eth_example_top/rx_axis_tready]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe29]
set_property port_width 1 [get_debug_ports u_ila_1/probe29]
connect_debug_port u_ila_1/probe29 [get_nets [list eth_test/rx_ready]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe30]
set_property port_width 1 [get_debug_ports u_ila_1/probe30]
connect_debug_port u_ila_1/probe30 [get_nets [list eth_test/u1/mac_test0/total_queue_out_en]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe31]
set_property port_width 1 [get_debug_ports u_ila_1/probe31]
connect_debug_port u_ila_1/probe31 [get_nets [list eth_test/u1/mac_test0/tx_ready]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe32]
set_property port_width 1 [get_debug_ports u_ila_1/probe32]
connect_debug_port u_ila_1/probe32 [get_nets [list eth_test/u1/mac_test0/mac_top0/mac_rx0/udp0/write_event_start]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe1]
set_property port_width 64 [get_debug_ports u_ila_2/probe1]
connect_debug_port u_ila_2/probe1 [get_nets [list {ten_gig_eth_example_top/packet_number_10G_send[0]} {ten_gig_eth_example_top/packet_number_10G_send[1]} {ten_gig_eth_example_top/packet_number_10G_send[2]} {ten_gig_eth_example_top/packet_number_10G_send[3]} {ten_gig_eth_example_top/packet_number_10G_send[4]} {ten_gig_eth_example_top/packet_number_10G_send[5]} {ten_gig_eth_example_top/packet_number_10G_send[6]} {ten_gig_eth_example_top/packet_number_10G_send[7]} {ten_gig_eth_example_top/packet_number_10G_send[8]} {ten_gig_eth_example_top/packet_number_10G_send[9]} {ten_gig_eth_example_top/packet_number_10G_send[10]} {ten_gig_eth_example_top/packet_number_10G_send[11]} {ten_gig_eth_example_top/packet_number_10G_send[12]} {ten_gig_eth_example_top/packet_number_10G_send[13]} {ten_gig_eth_example_top/packet_number_10G_send[14]} {ten_gig_eth_example_top/packet_number_10G_send[15]} {ten_gig_eth_example_top/packet_number_10G_send[16]} {ten_gig_eth_example_top/packet_number_10G_send[17]} {ten_gig_eth_example_top/packet_number_10G_send[18]} {ten_gig_eth_example_top/packet_number_10G_send[19]} {ten_gig_eth_example_top/packet_number_10G_send[20]} {ten_gig_eth_example_top/packet_number_10G_send[21]} {ten_gig_eth_example_top/packet_number_10G_send[22]} {ten_gig_eth_example_top/packet_number_10G_send[23]} {ten_gig_eth_example_top/packet_number_10G_send[24]} {ten_gig_eth_example_top/packet_number_10G_send[25]} {ten_gig_eth_example_top/packet_number_10G_send[26]} {ten_gig_eth_example_top/packet_number_10G_send[27]} {ten_gig_eth_example_top/packet_number_10G_send[28]} {ten_gig_eth_example_top/packet_number_10G_send[29]} {ten_gig_eth_example_top/packet_number_10G_send[30]} {ten_gig_eth_example_top/packet_number_10G_send[31]} {ten_gig_eth_example_top/packet_number_10G_send[32]} {ten_gig_eth_example_top/packet_number_10G_send[33]} {ten_gig_eth_example_top/packet_number_10G_send[34]} {ten_gig_eth_example_top/packet_number_10G_send[35]} {ten_gig_eth_example_top/packet_number_10G_send[36]} {ten_gig_eth_example_top/packet_number_10G_send[37]} {ten_gig_eth_example_top/packet_number_10G_send[38]} {ten_gig_eth_example_top/packet_number_10G_send[39]} {ten_gig_eth_example_top/packet_number_10G_send[40]} {ten_gig_eth_example_top/packet_number_10G_send[41]} {ten_gig_eth_example_top/packet_number_10G_send[42]} {ten_gig_eth_example_top/packet_number_10G_send[43]} {ten_gig_eth_example_top/packet_number_10G_send[44]} {ten_gig_eth_example_top/packet_number_10G_send[45]} {ten_gig_eth_example_top/packet_number_10G_send[46]} {ten_gig_eth_example_top/packet_number_10G_send[47]} {ten_gig_eth_example_top/packet_number_10G_send[48]} {ten_gig_eth_example_top/packet_number_10G_send[49]} {ten_gig_eth_example_top/packet_number_10G_send[50]} {ten_gig_eth_example_top/packet_number_10G_send[51]} {ten_gig_eth_example_top/packet_number_10G_send[52]} {ten_gig_eth_example_top/packet_number_10G_send[53]} {ten_gig_eth_example_top/packet_number_10G_send[54]} {ten_gig_eth_example_top/packet_number_10G_send[55]} {ten_gig_eth_example_top/packet_number_10G_send[56]} {ten_gig_eth_example_top/packet_number_10G_send[57]} {ten_gig_eth_example_top/packet_number_10G_send[58]} {ten_gig_eth_example_top/packet_number_10G_send[59]} {ten_gig_eth_example_top/packet_number_10G_send[60]} {ten_gig_eth_example_top/packet_number_10G_send[61]} {ten_gig_eth_example_top/packet_number_10G_send[62]} {ten_gig_eth_example_top/packet_number_10G_send[63]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe2]
set_property port_width 8 [get_debug_ports u_ila_2/probe2]
connect_debug_port u_ila_2/probe2 [get_nets [list {ten_gig_eth_example_top/rx_axis_tkeep[0]} {ten_gig_eth_example_top/rx_axis_tkeep[1]} {ten_gig_eth_example_top/rx_axis_tkeep[2]} {ten_gig_eth_example_top/rx_axis_tkeep[3]} {ten_gig_eth_example_top/rx_axis_tkeep[4]} {ten_gig_eth_example_top/rx_axis_tkeep[5]} {ten_gig_eth_example_top/rx_axis_tkeep[6]} {ten_gig_eth_example_top/rx_axis_tkeep[7]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe3]
set_property port_width 8 [get_debug_ports u_ila_2/probe3]
connect_debug_port u_ila_2/probe3 [get_nets [list {ten_gig_eth_example_top/tx_axis_tkeep[0]} {ten_gig_eth_example_top/tx_axis_tkeep[1]} {ten_gig_eth_example_top/tx_axis_tkeep[2]} {ten_gig_eth_example_top/tx_axis_tkeep[3]} {ten_gig_eth_example_top/tx_axis_tkeep[4]} {ten_gig_eth_example_top/tx_axis_tkeep[5]} {ten_gig_eth_example_top/tx_axis_tkeep[6]} {ten_gig_eth_example_top/tx_axis_tkeep[7]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe4]
set_property port_width 64 [get_debug_ports u_ila_2/probe4]
connect_debug_port u_ila_2/probe4 [get_nets [list {ten_gig_eth_example_top/tx_axis_tdata_dly[0]} {ten_gig_eth_example_top/tx_axis_tdata_dly[1]} {ten_gig_eth_example_top/tx_axis_tdata_dly[2]} {ten_gig_eth_example_top/tx_axis_tdata_dly[3]} {ten_gig_eth_example_top/tx_axis_tdata_dly[4]} {ten_gig_eth_example_top/tx_axis_tdata_dly[5]} {ten_gig_eth_example_top/tx_axis_tdata_dly[6]} {ten_gig_eth_example_top/tx_axis_tdata_dly[7]} {ten_gig_eth_example_top/tx_axis_tdata_dly[8]} {ten_gig_eth_example_top/tx_axis_tdata_dly[9]} {ten_gig_eth_example_top/tx_axis_tdata_dly[10]} {ten_gig_eth_example_top/tx_axis_tdata_dly[11]} {ten_gig_eth_example_top/tx_axis_tdata_dly[12]} {ten_gig_eth_example_top/tx_axis_tdata_dly[13]} {ten_gig_eth_example_top/tx_axis_tdata_dly[14]} {ten_gig_eth_example_top/tx_axis_tdata_dly[15]} {ten_gig_eth_example_top/tx_axis_tdata_dly[16]} {ten_gig_eth_example_top/tx_axis_tdata_dly[17]} {ten_gig_eth_example_top/tx_axis_tdata_dly[18]} {ten_gig_eth_example_top/tx_axis_tdata_dly[19]} {ten_gig_eth_example_top/tx_axis_tdata_dly[20]} {ten_gig_eth_example_top/tx_axis_tdata_dly[21]} {ten_gig_eth_example_top/tx_axis_tdata_dly[22]} {ten_gig_eth_example_top/tx_axis_tdata_dly[23]} {ten_gig_eth_example_top/tx_axis_tdata_dly[24]} {ten_gig_eth_example_top/tx_axis_tdata_dly[25]} {ten_gig_eth_example_top/tx_axis_tdata_dly[26]} {ten_gig_eth_example_top/tx_axis_tdata_dly[27]} {ten_gig_eth_example_top/tx_axis_tdata_dly[28]} {ten_gig_eth_example_top/tx_axis_tdata_dly[29]} {ten_gig_eth_example_top/tx_axis_tdata_dly[30]} {ten_gig_eth_example_top/tx_axis_tdata_dly[31]} {ten_gig_eth_example_top/tx_axis_tdata_dly[32]} {ten_gig_eth_example_top/tx_axis_tdata_dly[33]} {ten_gig_eth_example_top/tx_axis_tdata_dly[34]} {ten_gig_eth_example_top/tx_axis_tdata_dly[35]} {ten_gig_eth_example_top/tx_axis_tdata_dly[36]} {ten_gig_eth_example_top/tx_axis_tdata_dly[37]} {ten_gig_eth_example_top/tx_axis_tdata_dly[38]} {ten_gig_eth_example_top/tx_axis_tdata_dly[39]} {ten_gig_eth_example_top/tx_axis_tdata_dly[40]} {ten_gig_eth_example_top/tx_axis_tdata_dly[41]} {ten_gig_eth_example_top/tx_axis_tdata_dly[42]} {ten_gig_eth_example_top/tx_axis_tdata_dly[43]} {ten_gig_eth_example_top/tx_axis_tdata_dly[44]} {ten_gig_eth_example_top/tx_axis_tdata_dly[45]} {ten_gig_eth_example_top/tx_axis_tdata_dly[46]} {ten_gig_eth_example_top/tx_axis_tdata_dly[47]} {ten_gig_eth_example_top/tx_axis_tdata_dly[48]} {ten_gig_eth_example_top/tx_axis_tdata_dly[49]} {ten_gig_eth_example_top/tx_axis_tdata_dly[50]} {ten_gig_eth_example_top/tx_axis_tdata_dly[51]} {ten_gig_eth_example_top/tx_axis_tdata_dly[52]} {ten_gig_eth_example_top/tx_axis_tdata_dly[53]} {ten_gig_eth_example_top/tx_axis_tdata_dly[54]} {ten_gig_eth_example_top/tx_axis_tdata_dly[55]} {ten_gig_eth_example_top/tx_axis_tdata_dly[56]} {ten_gig_eth_example_top/tx_axis_tdata_dly[57]} {ten_gig_eth_example_top/tx_axis_tdata_dly[58]} {ten_gig_eth_example_top/tx_axis_tdata_dly[59]} {ten_gig_eth_example_top/tx_axis_tdata_dly[60]} {ten_gig_eth_example_top/tx_axis_tdata_dly[61]} {ten_gig_eth_example_top/tx_axis_tdata_dly[62]} {ten_gig_eth_example_top/tx_axis_tdata_dly[63]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe5]
set_property port_width 64 [get_debug_ports u_ila_2/probe5]
connect_debug_port u_ila_2/probe5 [get_nets [list {rx_axis_tdata_out[0]} {rx_axis_tdata_out[1]} {rx_axis_tdata_out[2]} {rx_axis_tdata_out[3]} {rx_axis_tdata_out[4]} {rx_axis_tdata_out[5]} {rx_axis_tdata_out[6]} {rx_axis_tdata_out[7]} {rx_axis_tdata_out[8]} {rx_axis_tdata_out[9]} {rx_axis_tdata_out[10]} {rx_axis_tdata_out[11]} {rx_axis_tdata_out[12]} {rx_axis_tdata_out[13]} {rx_axis_tdata_out[14]} {rx_axis_tdata_out[15]} {rx_axis_tdata_out[16]} {rx_axis_tdata_out[17]} {rx_axis_tdata_out[18]} {rx_axis_tdata_out[19]} {rx_axis_tdata_out[20]} {rx_axis_tdata_out[21]} {rx_axis_tdata_out[22]} {rx_axis_tdata_out[23]} {rx_axis_tdata_out[24]} {rx_axis_tdata_out[25]} {rx_axis_tdata_out[26]} {rx_axis_tdata_out[27]} {rx_axis_tdata_out[28]} {rx_axis_tdata_out[29]} {rx_axis_tdata_out[30]} {rx_axis_tdata_out[31]} {rx_axis_tdata_out[32]} {rx_axis_tdata_out[33]} {rx_axis_tdata_out[34]} {rx_axis_tdata_out[35]} {rx_axis_tdata_out[36]} {rx_axis_tdata_out[37]} {rx_axis_tdata_out[38]} {rx_axis_tdata_out[39]} {rx_axis_tdata_out[40]} {rx_axis_tdata_out[41]} {rx_axis_tdata_out[42]} {rx_axis_tdata_out[43]} {rx_axis_tdata_out[44]} {rx_axis_tdata_out[45]} {rx_axis_tdata_out[46]} {rx_axis_tdata_out[47]} {rx_axis_tdata_out[48]} {rx_axis_tdata_out[49]} {rx_axis_tdata_out[50]} {rx_axis_tdata_out[51]} {rx_axis_tdata_out[52]} {rx_axis_tdata_out[53]} {rx_axis_tdata_out[54]} {rx_axis_tdata_out[55]} {rx_axis_tdata_out[56]} {rx_axis_tdata_out[57]} {rx_axis_tdata_out[58]} {rx_axis_tdata_out[59]} {rx_axis_tdata_out[60]} {rx_axis_tdata_out[61]} {rx_axis_tdata_out[62]} {rx_axis_tdata_out[63]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe6]
set_property port_width 1 [get_debug_ports u_ila_2/probe6]
connect_debug_port u_ila_2/probe6 [get_nets [list rec_fifo_full]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe7]
set_property port_width 1 [get_debug_ports u_ila_2/probe7]
connect_debug_port u_ila_2/probe7 [get_nets [list rx_axis_tvalid_out]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe8]
set_property port_width 1 [get_debug_ports u_ila_2/probe8]
connect_debug_port u_ila_2/probe8 [get_nets [list ten_gig_eth_example_top/tx_axis_tlast_in]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe9]
set_property port_width 1 [get_debug_ports u_ila_2/probe9]
connect_debug_port u_ila_2/probe9 [get_nets [list ten_gig_eth_example_top/tx_axis_tvalid]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_156M]
