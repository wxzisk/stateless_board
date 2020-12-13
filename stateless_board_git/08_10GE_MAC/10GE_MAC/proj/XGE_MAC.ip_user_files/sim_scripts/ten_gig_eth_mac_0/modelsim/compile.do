vlib work
vlib msim

vlib msim/ten_gig_eth_mac_v15_1_2
vlib msim/xil_defaultlib

vmap ten_gig_eth_mac_v15_1_2 msim/ten_gig_eth_mac_v15_1_2
vmap xil_defaultlib msim/xil_defaultlib

vlog -work ten_gig_eth_mac_v15_1_2 -64 -incr \
"../../../ipstatic/hdl/ten_gig_eth_mac_v15_1_rfs.v" \

vlog -work xil_defaultlib -64 -incr \
"../../../../XGE_MAC.srcs/sources_1/ip/ten_gig_eth_mac_0/ten_gig_eth_mac_v15_1_1/hdl/ten_gig_eth_mac_0_core.v" \
"../../../../XGE_MAC.srcs/sources_1/ip/ten_gig_eth_mac_0/synth/ten_gig_eth_mac_0_block.v" \
"../../../../XGE_MAC.srcs/sources_1/ip/ten_gig_eth_mac_0/synth/ten_gig_eth_mac_0.v" \

vlog -work xil_defaultlib "glbl.v"

