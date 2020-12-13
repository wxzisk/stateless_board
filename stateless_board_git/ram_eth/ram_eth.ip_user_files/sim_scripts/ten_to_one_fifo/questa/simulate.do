onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib ten_to_one_fifo_opt

do {wave.do}

view wave
view structure
view signals

do {ten_to_one_fifo.udo}

run -all

quit -force
