onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib dsc_gen_fifo_opt

do {wave.do}

view wave
view structure
view signals

do {dsc_gen_fifo.udo}

run -all

quit -force
