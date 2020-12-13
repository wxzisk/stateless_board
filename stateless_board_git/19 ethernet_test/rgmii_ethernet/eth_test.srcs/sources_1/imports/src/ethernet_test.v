`timescale 1ns / 1ps  
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    ethernet_test 
//////////////////////////////////////////////////////////////////////////////////
module ethernet_test(
    input       sys_clk,
    input       key_in,
    input       rst_n,
    output      e_reset,
	output      e_mdc,
	inout       e_mdio,
	
	input [63:0] out_to_eth,
//    output gmii_tx_clk,
    input pcie_to_eth_empty,
 
    output FIFO_rd_en,
	output [31:0]          ip_rec_destination_addr,
    output [31:0]          ip_rec_source_addr,
    output [15:0]          udp_rec_destination_port,
    output [15:0]          udp_rec_source_port,
    output                 state_prepared_en,
    output [15:0]           udp_data_length,
    input                    full,
    output[63:0]            gmii_txd,
    output                  gmii_tx_en,
    input [63:0]            gmii_rxd,
    input                   gmii_rx_en,
    input                   eth_to_pcie_full,
     // udp received data and RAM write control signals 
    output [63:0] dma_data_in,
    output  dma_in_en ,
    output  rx_ready,
    output [63:0] event_info_to_pcie,
    output  event_info_to_pcie_en,
    input event_header_fifo_full          
    );

wire            reset_n;
wire            gmii_tx_er;
//wire            gmii_tx_clk;
wire            gmii_crs;
wire            gmii_col;
wire            gmii_rx_er;
wire            gmii_rx_clk;
wire  [ 1:0]    speed_selection; // 1x gigabit, 01 100Mbps, 00 10mbps
wire            duplex_mode;     // 1 full, 0 half
wire            rgmii_rxcpll;
wire[31:0]      host_data_length;

assign speed_selection = 2'b10;
assign duplex_mode = 1'b1;

//  wire sys_clk_ibufg;
//IBUFGDS u_ibufg_sys_clk
// (
//  .I  (refclk_p),            //差分时钟的正端输入，需要和顶层模块的端口直接连接
//  .IB (refclk_n),           // 差分时钟的负端输入，需要和顶层模块的端口直接连接
//  .O  (sys_clk_ibufg)        //时钟缓冲输出
//  );

//MDIO寄存器配置
 miim_top miim_top_m0(
    .reset_i            (1'b0),
    .miim_clock_i       (sys_clk),
    .mdc_o              (e_mdc),
    .mdio_io            (e_mdio),
    .link_up_o          (),                  //link status
    .speed_o            (),                  //link speed
    .speed_override_i   (2'b11)              //11: autonegoation
    );

mac_test mac_test0
(
    .gmii_tx_clk            (sys_clk),
    .gmii_rx_clk            (sys_clk) ,
    .rst_n                  (rst_n),
    .push_button            (key_in),
    .gmii_rx_en             (gmii_rx_en),
    .gmii_rxd               (gmii_rxd),
    .gmii_tx_en             (gmii_tx_en),
    .gmii_txd               (gmii_txd ),
    .data_temp              (out_to_eth),
    .pcie_to_eth_empty      (pcie_to_eth_empty),
    .data_in_en_d0             (FIFO_rd_en),
    .ip_rec_destination_addr  (),
    .ip_rec_source_addr    (),
    .udp_rec_destination_port (),
    .udp_rec_source_port      (),
    .state_prepared_en        (),
    .udp_data_length           (),
    .host_data_length          (host_data_length),//data length from host
    
    .eth_to_pcie_full(eth_to_pcie_full),
    .dma_data_in(dma_data_in),
    .dma_in_en(dma_in_en) ,
    .event_info_to_pcie(event_info_to_pcie),
    .event_info_to_pcie_en(event_info_to_pcie_en),
    .event_header_fifo_full(event_header_fifo_full),
    .rx_ready (rx_ready)

); 

reset reset_m0
(
	.clk(sys_clk),
	.key1(rst_n),
	.rst_n(e_reset)
);
endmodule
