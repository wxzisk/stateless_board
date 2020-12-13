onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+ten_gig_eth_mac_0 -L ten_gig_eth_mac_v15_1_2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.ten_gig_eth_mac_0 xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {ten_gig_eth_mac_0.udo}

run -all

endsim

quit -force
