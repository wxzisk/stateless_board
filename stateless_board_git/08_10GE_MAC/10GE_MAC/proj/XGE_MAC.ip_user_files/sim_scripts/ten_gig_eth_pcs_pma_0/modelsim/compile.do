vlib work
vlib msim

vlib msim/gtwizard_ultrascale_v1_6_5
vlib msim/xil_defaultlib
vlib msim/ten_gig_eth_pcs_pma_v6_0_7

vmap gtwizard_ultrascale_v1_6_5 msim/gtwizard_ultrascale_v1_6_5
vmap xil_defaultlib msim/xil_defaultlib
vmap ten_gig_eth_pcs_pma_v6_0_7 msim/ten_gig_eth_pcs_pma_v6_0_7

vlog -work gtwizard_ultrascale_v1_6_5 -64 -incr \
"../../../ipstatic/hdl/gtwizard_ultrascale_v1_6_bit_sync.v" \
"../../../ipstatic/hdl/gtwizard_ultrascale_v1_6_gthe3_cpll_cal.v" \
"../../../ipstatic/hdl/gtwizard_ultrascale_v1_6_gthe3_cal_freqcnt.v" \
"../../../ipstatic/hdl/gtwizard_ultrascale_v1_6_gthe4_cpll_cal.v" \
"../../../ipstatic/hdl/gtwizard_ultrascale_v1_6_gthe4_cal_freqcnt.v" \
"../../../ipstatic/hdl/gtwizard_ultrascale_v1_6_gtye4_cpll_cal.v" \
"../../../ipstatic/hdl/gtwizard_ultrascale_v1_6_gtye4_cal_freqcnt.v" \
"../../../ipstatic/hdl/gtwizard_ultrascale_v1_6_gtwiz_buffbypass_rx.v" \
"../../../ipstatic/hdl/gtwizard_ultrascale_v1_6_gtwiz_buffbypass_tx.v" \
"../../../ipstatic/hdl/gtwizard_ultrascale_v1_6_gtwiz_reset.v" \
"../../../ipstatic/hdl/gtwizard_ultrascale_v1_6_gtwiz_userclk_rx.v" \
"../../../ipstatic/hdl/gtwizard_ultrascale_v1_6_gtwiz_userclk_tx.v" \
"../../../ipstatic/hdl/gtwizard_ultrascale_v1_6_gtwiz_userdata_rx.v" \
"../../../ipstatic/hdl/gtwizard_ultrascale_v1_6_gtwiz_userdata_tx.v" \
"../../../ipstatic/hdl/gtwizard_ultrascale_v1_6_reset_sync.v" \
"../../../ipstatic/hdl/gtwizard_ultrascale_v1_6_reset_inv_sync.v" \

vlog -work xil_defaultlib -64 -incr \
"../../../../XGE_MAC.srcs/sources_1/ip/ten_gig_eth_pcs_pma_0/ip_0/sim/gtwizard_ultrascale_v1_6_gthe3_channel.v" \
"../../../../XGE_MAC.srcs/sources_1/ip/ten_gig_eth_pcs_pma_0/ip_0/sim/ten_gig_eth_pcs_pma_0_gt_gthe3_channel_wrapper.v" \
"../../../../XGE_MAC.srcs/sources_1/ip/ten_gig_eth_pcs_pma_0/ip_0/sim/ten_gig_eth_pcs_pma_0_gt_gtwizard_gthe3.v" \
"../../../../XGE_MAC.srcs/sources_1/ip/ten_gig_eth_pcs_pma_0/ip_0/sim/ten_gig_eth_pcs_pma_0_gt_gtwizard_top.v" \
"../../../../XGE_MAC.srcs/sources_1/ip/ten_gig_eth_pcs_pma_0/ip_0/sim/ten_gig_eth_pcs_pma_0_gt.v" \

vlog -work ten_gig_eth_pcs_pma_v6_0_7 -64 -incr \
"../../../ipstatic/hdl/ten_gig_eth_pcs_pma_v6_0_rfs.v" \

vlog -work xil_defaultlib -64 -incr \
"../../../../XGE_MAC.srcs/sources_1/ip/ten_gig_eth_pcs_pma_0/synth/ten_gig_eth_pcs_pma_0_ff_synchronizer_rst.v" \
"../../../../XGE_MAC.srcs/sources_1/ip/ten_gig_eth_pcs_pma_0/synth/ten_gig_eth_pcs_pma_0_ff_synchronizer.v" \
"../../../../XGE_MAC.srcs/sources_1/ip/ten_gig_eth_pcs_pma_0/synth/ten_gig_eth_pcs_pma_0_local_clock_and_reset.v" \
"../../../../XGE_MAC.srcs/sources_1/ip/ten_gig_eth_pcs_pma_0/synth/ten_gig_eth_pcs_pma_0_sim_speedup_controller.v" \
"../../../../XGE_MAC.srcs/sources_1/ip/ten_gig_eth_pcs_pma_0/synth/ten_gig_eth_pcs_pma_0_cable_pull_logic.v" \
"../../../../XGE_MAC.srcs/sources_1/ip/ten_gig_eth_pcs_pma_0/synth/ten_gig_eth_pcs_pma_0_block.v" \
"../../../../XGE_MAC.srcs/sources_1/ip/ten_gig_eth_pcs_pma_0/synth/ten_gig_eth_pcs_pma_0.v" \

vlog -work xil_defaultlib "glbl.v"

