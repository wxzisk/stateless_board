onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+one_to_ten_fifo -L xil_defaultlib -L xpm -L fifo_generator_v13_2_1 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.one_to_ten_fifo xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {one_to_ten_fifo.udo}

run -all

endsim

quit -force
