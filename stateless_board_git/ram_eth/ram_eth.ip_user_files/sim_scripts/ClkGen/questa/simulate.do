onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib ClkGen_opt

do {wave.do}

view wave
view structure
view signals

do {ClkGen.udo}

run -all

quit -force
