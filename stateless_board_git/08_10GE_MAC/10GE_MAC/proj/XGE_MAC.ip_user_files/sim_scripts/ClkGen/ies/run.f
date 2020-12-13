-makelib ies/xil_defaultlib -sv \
  "C:/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies/xpm \
  "C:/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../../XGE_MAC.srcs/sources_1/ip/ClkGen/ClkGen_clk_wiz.v" \
  "../../../../XGE_MAC.srcs/sources_1/ip/ClkGen/ClkGen.v" \
-endlib
-makelib ies/xil_defaultlib \
  glbl.v
-endlib

