onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+ten_gig_eth_pcs_pma_0 -L gtwizard_ultrascale_v1_6_5 -L xil_defaultlib -L ten_gig_eth_pcs_pma_v6_0_7 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.ten_gig_eth_pcs_pma_0 xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {ten_gig_eth_pcs_pma_0.udo}

run -all

endsim

quit -force
