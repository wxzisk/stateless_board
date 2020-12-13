onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L gtwizard_ultrascale_v1_6_5 -L xil_defaultlib -L ten_gig_eth_pcs_pma_v6_0_7 -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.ten_gig_eth_pcs_pma_0 xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {ten_gig_eth_pcs_pma_0.udo}

run -all

quit -force
