-makelib ies_lib/xil_defaultlib -sv \
  "E:/Vivado/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "E:/Vivado/Vivado/2017.4/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "E:/Vivado/Vivado/2017.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "E:/Vivado/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../ram_eth.srcs/sources_1/ip/ClkGen/ClkGen_clk_wiz.v" \
  "../../../../ram_eth.srcs/sources_1/ip/ClkGen/ClkGen.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

