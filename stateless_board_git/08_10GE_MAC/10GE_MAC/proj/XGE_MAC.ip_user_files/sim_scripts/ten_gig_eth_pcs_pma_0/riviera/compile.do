vlib work
vlib riviera

vlib riviera/gtwizard_ultrascale_v1_6_5
vlib riviera/xil_defaultlib
vlib riviera/ten_gig_eth_pcs_pma_v6_0_7

vmap gtwizard_ultrascale_v1_6_5 riviera/gtwizard_ultrascale_v1_6_5
vmap xil_defaultlib riviera/xil_defaultlib
vmap ten_gig_eth_pcs_pma_v6_0_7 riviera/ten_gig_eth_pcs_pma_v6_0_7

vlog -work gtwizard_ultrascale_v1_6_5  -v2k5 \
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

vlog -work xil_defaultlib  -v2k5 \
"../../../../XGE_MAC.srcs/sources_1/ip/ten_gig_eth_pcs_pma_0/ip_0/sim/gtwizard_ultrascale_v1_6_gthe3_channel.v" \
"../../../../XGE_MAC.srcs/sources_1/ip/ten_gig_eth_pcs_pma_0/ip_0/sim/ten_gig_eth_pcs_pma_0_gt_gthe3_channel_wrapper.v" \
"../../../../XGE_MAC.srcs/sources_1/ip/ten_gig_eth_pcs_pma_0/ip_0/sim/ten_gig_eth_pcs_pma_0_gt_gtwizard_gthe3.v" \
"../../../../XGE_MAC.srcs/sources_1/ip/ten_gig_eth_pcs_pma_0/ip_0/sim/ten_gig_eth_pcs_pma_0_gt_gtwizard_top.v" \
"../../../../XGE_MAC.srcs/sources_1/ip/ten_gig_eth_pcs_pma_0/ip_0/sim/ten_gig_eth_pcs_pma_0_gt.v" \

vlog -work ten_gig_eth_pcs_pma_v6_0_7  -v2k5 \
"../../../ipstatic/hdl/ten_gig_eth_pcs_pma_v6_0_rfs.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../../XGE_MAC.srcs/sources_1/ip/ten_gig_eth_pcs_pma_0/synth/ten_gig_eth_pcs_pma_0_ff_synchronizer_rst.v" \
"../../../../XGE_MAC.srcs/sources_1/ip/ten_gig_eth_pcs_pma_0/synth/ten_gig_eth_pcs_pma_0_ff_synchronizer.v" \
"../../../../XGE_MAC.srcs/sources_1/ip/ten_gig_eth_pcs_pma_0/synth/ten_gig_eth_pcs_pma_0_local_clock_and_reset.v" \
"../../../../XGE_MAC.srcs/sources_1/ip/ten_gig_eth_pcs_pma_0/synth/ten_gig_eth_pcs_pma_0_sim_speedup_controller.v" \
"../../../../XGE_MAC.srcs/sources_1/ip/ten_gig_eth_pcs_pma_0/synth/ten_gig_eth_pcs_pma_0_cable_pull_logic.v" \
"../../../../XGE_MAC.srcs/sources_1/ip/ten_gig_eth_pcs_pma_0/synth/ten_gig_eth_pcs_pma_0_block.v" \
"../../../../XGE_MAC.srcs/sources_1/ip/ten_gig_eth_pcs_pma_0/synth/ten_gig_eth_pcs_pma_0.v" \

vlog -work xil_defaultlib "glbl.v"

