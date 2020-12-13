onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L ten_gig_eth_mac_v15_1_2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.ten_gig_eth_mac_0 xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {ten_gig_eth_mac_0.udo}

run -all

quit -force
