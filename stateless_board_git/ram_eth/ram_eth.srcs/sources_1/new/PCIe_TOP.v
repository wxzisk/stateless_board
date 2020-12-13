`timescale 1 ps / 1 ps

module PCIe_TOP
(
	input [7:0] pcie_rxn,
	input [7:0] pcie_rxp,
	output [7:0] pcie_txn,
	output [7:0] pcie_txp,
	input refclk_clk_p,
	input refclk_clk_n,
	input PCIE_RESET_N,
//	input sys_clk_p,
//	input sys_clk_n
// pcie clk , data and data valid signal to eth
	output pcie_clk_out,
	output[63:0] out_to_eth,
	output FIFO_wr_en_p2e,
     // udp received data and RAM write control signals 
    input  [63:0] pcie_in ,
    input [31 : 0 ]rec_data_ram_write_addr,
    output FIFO_rd_en_e2p,
    
    input pcie_to_eth_full,
    input eth_to_pcie_empty
);

wire cllk_100M;
wire [31:0] addrb;
wire enb;
wire [7:0]web;
wire [63:0]dinb_0;

//ClkGen ClkGen
//(.clk_in1_p(sys_clk_p),
// .clk_in1_n(sys_clk_n),
// .reset(0),
// .clkout_100M(cllk_100M),
// .locked()
//);

bd_design bd_design
(.pcie_rxn(pcie_rxn),
 .pcie_rxp(pcie_rxp),
 .pcie_txn(pcie_txn),
 .pcie_txp(pcie_txp),
 .refclk_clk_p(refclk_clk_p),
 .refclk_clk_n(refclk_clk_n),
 .reset_n(PCIE_RESET_N),
 .user_lnk_up(),
 .axi_aclk(pcie_clk_out),
 
 .addrb_0(addrb),
 .dinb_0(dinb_0),
 .enb_0(enb),
 .web_0(web),
 .doutb_0(out_to_eth)
);

portb_ctrl portb_ctrl
(.clk(pcie_clk_out),
 .rst_n(PCIE_RESET_N),
 .addrb_0(addrb),
 .enb_0(enb),
 .web_0(web),
 .FIFO_wr_en_p2e(FIFO_wr_en_p2e),
 .FIFO_rd_en_e2p(FIFO_rd_en_e2p),
 .rec_udp_data(pcie_in),
 .rec_udp_data_addr(),
 .dinb_0(dinb_0),
 .pcie_to_eth_full(pcie_to_eth_full),
 .eth_to_pcie_empty(eth_to_pcie_empty)
);


endmodule