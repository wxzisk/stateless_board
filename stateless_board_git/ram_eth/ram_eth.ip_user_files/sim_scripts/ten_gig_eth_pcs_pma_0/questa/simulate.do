onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib ten_gig_eth_pcs_pma_0_opt

do {wave.do}

view wave
view structure
view signals

do {ten_gig_eth_pcs_pma_0.udo}

run -all

quit -force
