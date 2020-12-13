onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib one_to_ten_fifo_opt

do {wave.do}

view wave
view structure
view signals

do {one_to_ten_fifo.udo}

run -all

quit -force
