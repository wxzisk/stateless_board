`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/08/29 17:06:59
// Design Name: 
// Module Name: ram_eth
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ram_eth(
//input sys_clk_p,      // 开发板上差分输入时钟200Mhz， 正极
//input sys_clk_n,      // 开发板上差分输入时钟200Mhz， 负极  
//input key,
//input rst_n,
input [7:0] pcie_rxn,
input [7:0] pcie_rxp,
output [7:0] pcie_txn,
output [7:0] pcie_txp,
input SYS_CLK_P,                   /////
input SYS_CLK_N,                       /////
input refclk_p,                            ////
input refclk_n,                            //////
input refclk_clk_p, //connect to pcie
input refclk_clk_n,
input sys_rst,
//input sys_rst_n,
output phy3_txp,
output phy3_txn,
input phy3_rxp,
input phy3_rxn,
input PCIE_RESET_N
    );
    //=========================================================================
    // 差分时钟转换成单端时钟
    //===========================================================================
//  wire sys_clk_ibufg;
    wire clk_156M;
//IBUFGDS u_ibufg_sys_clk
// (
//  .I  (SYS_CLK_P),            //差分时钟的正端输入，需要和顶层模块的端口直接连接
//  .IB (SYS_CLK_N),           // 差分时钟的负端输入，需要和顶层模块的端口直接连接r 
//  .O  (clk_156M)        //时钟缓冲输出
//  );
  

  wire [63:0] pcie_out;//data from pcie to eth(pcie out)
  (*mark_debug = "true"*)wire [63:0] eth_in;//data from pcie to eth(eth in)
  wire [63:0] pcie_in;// data from eth to pcie (pcie in)
  (*mark_debug = "true"*)wire [63:0] eth_out;//data from eth to pcie(eth out)
  wire FIFO_wr_en_p2e;
  (*mark_debug = "true"*)wire FIFO_wr_en_e2p;
  (*mark_debug = "true"*)wire FIFO_rd_en_p2e;
  (*mark_debug = "true"*)wire FIFO_rd_en_e2p;
//  wire CLK;
  wire pcie_clk_out; 
  wire empty;
  wire [31:0] ip_rec_destination_addr;
  wire [31:0] ip_rec_source_addr;
  wire [15:0] udp_rec_destination_port;
  wire [15:0] udp_rec_source_port;
  wire state_prepared_en;
  wire [15:0] udp_data_length;
  wire [31:0]throughput_data_length;
  wire [31:0]throughput_trans_time;
  wire [31:0]throughput_miss_cnt;
  wire [10:0]  host_data_length;

  wire[63:0] eth_to_fifo;//64 bits data from eth to fifo
  wire[63:0] fifo_to_10g;//64 bits data from fifo to 10G
  wire full_1g;
  wire empty_10g;
  wire out_en;
  wire data_in_en_10g;

  wire[9:0] data_count;

  wire [31:0]rec_data_ram_write_addr;
  
  wire [63:0] gmii_rxd;
  wire gmii_rx_en;
  (*mark_debug = "true"*) wire [63:0] rx_axis_tdata_out;
  (*mark_debug = "true"*) wire rx_axis_tvalid_out;
  wire rec_fifo_full;
  wire rec_datain_en;
  wire rec_fifo_empty;
  (*mark_debug = "true"*)wire pcie_to_eth_empty;
  wire pcie_to_eth_full;
  (*mark_debug = "true"*)wire eth_to_pcie_empty;
  (*mark_debug = "true"*)wire eth_to_pcie_full;
  wire [63:0] event_info_to_pcie;
  wire event_info_to_pcie_en;
  wire [63:0] event_header_to_pcie;
  wire event_header_to_pcie_en;
  wire event_header_fifo_full;
  wire clk_200M;
  wire ont_to_ten_full;
  wire [10:0] ten_to_one_data_count;
  
  ClkGen ClkGen(
  .clk_in1_n(SYS_CLK_N),
  .clk_in1_p(SYS_CLK_P),
  .reset(sys_rst),
  .clkout_200M(clk_200M),
  .locked()
  );
  
  ethernet_2port eth_test(
//  .sys_clk_p(),
//  .sys_clk_n(),
  .CLK(clk_200M),
  .key(1'b1),
  .rst_n(~sys_rst),
  .ip_rec_destination_addr  (),
  .ip_rec_source_addr    (),
  .udp_rec_destination_port (),
  .udp_rec_source_port      (),
  .state_prepared_en        (),
  .udp_data_length          (),
  //one to ten
  .gmii_txd(eth_to_fifo),
  .gmii_tx_en(out_en),
  .full_to_10g(full_1g),
  //eth to pcie
  .eth_to_pcie_full(eth_to_pcie_full),
  .dma_data_in(eth_out),
  .dma_in_en(FIFO_wr_en_e2p),
  //ten to one
  .rec_datain_en(rec_datain_en),
  .rec_fifo_empty(rec_fifo_empty), 
  .gmii_rxd(gmii_rxd),
  .ten_to_one_data_count(ten_to_one_data_count),
  //pcie to eth
  .pcie_to_eth_empty(pcie_to_eth_empty),
  .out_to_eth(eth_in),
  .FIFO_rd_en(FIFO_rd_en_p2e),
  //event header
  .event_info_to_pcie(event_info_to_pcie),
  .event_info_to_pcie_en(event_info_to_pcie_en),
  .event_header_fifo_full(event_header_fifo_full)
  );
 //send ram
 one_to_ten_fifo one_to_ten
 (
 .full(),
 .din(eth_to_fifo),
 .wr_en(out_en),
 .empty(empty_10g),
 .dout(fifo_to_10g),
 .rd_en(data_in_en_10g),
 .rst(sys_rst),
 .wr_clk(clk_200M),
 .rd_clk(clk_156M),
 .prog_full(full_1g)
 );
 
 //rec_ram
  ten_to_one_fifo ten_to_one
 (
 .full(rec_fifo_full),
 .prog_empty(rec_fifo_empty),
 .din(rx_axis_tdata_out),
 .wr_en(rx_axis_tvalid_out),
 .empty(),
 .dout(gmii_rxd),
 .rd_en(rec_datain_en),
 .rst(sys_rst),
 .wr_clk(clk_156M),
 .rd_clk(clk_200M),
 .rd_data_count(ten_to_one_data_count)
  );
 
 event_header_fifo event_header_fifo
      (
      .rst (sys_rst),
      .wr_clk(clk_200M) ,
      .rd_clk(pcie_clk_out),
      .din(event_info_to_pcie),
      .wr_en(event_info_to_pcie_en),
      .rd_en(event_header_to_pcie_en),
      .dout(event_header_to_pcie),
      .full(event_header_fifo_full),
      .empty()
      );
 
  ten_gig_eth_example_top ten_gig_eth_example_top
  (
      .reset(sys_rst),       
      .SYS_CLK_P(SYS_CLK_P),
      .SYS_CLK_N(SYS_CLK_N),
      .refclk_p(refclk_p),
      .refclk_n(refclk_n),
      .phy3_txp(phy3_txp),
      .phy3_txn(phy3_txn),
      .phy3_rxp(phy3_rxp),
      .phy3_rxn(phy3_rxn),
      .phy3_tx_disable(),
      .data_temp(fifo_to_10g),
      .clk_out_156M(clk_156M),
//      .tx_axis_tvalid_in(1),
//      .tx_axis_tlast_in(data_send_last),
      .empty(empty_10g),
      .fifo_rd_en(data_in_en_10g),
      
      .rx_axis_tdata_out(rx_axis_tdata_out),
      .rx_axis_tvalid_out(rx_axis_tvalid_out),
      .out_fifo_full(rec_fifo_full)
  );
  
  top PCIe_TOP(
  .pci_exp_rxn(pcie_rxn),
  .pci_exp_rxp(pcie_rxp),
  .pci_exp_txn(pcie_txn),
  .pci_exp_txp(pcie_txp),
  .sys_clk_p(refclk_clk_p),
  .sys_clk_n(refclk_clk_n),
  .sys_rst_n(PCIE_RESET_N),
  .user_clk(pcie_clk_out),
  // data and param from eth
  .data_from_eth(pcie_in),
  .fifo_empty(eth_to_pcie_empty),
  .fifo_rd_en(FIFO_rd_en_e2p),
  // event header stored in fifo
  .event_header(event_header_to_pcie),
  .event_header_in(event_header_to_pcie_en),
  //snd data to eth
  .pcie_to_eth_full(pcie_to_eth_full),
  .data_to_eth(pcie_out),
  .to_eth_en(FIFO_wr_en_p2e)
  );
  
  fifo_generator_2 pcie_to_eth
  (
  .rst (sys_rst),
  .wr_clk(pcie_clk_out) ,
  .rd_clk(clk_200M),
  .din(pcie_out),
  .wr_en(FIFO_wr_en_p2e),
  .rd_en(FIFO_rd_en_p2e),
  .dout(eth_in),
  .full(pcie_to_eth_full),
  .empty (pcie_to_eth_empty)
  );
  
  fifo_generator_2 eth_to_pcie
    (
    .rst (sys_rst),
    .wr_clk(clk_200M) ,
    .rd_clk(pcie_clk_out),
    .din(eth_out),
    .wr_en(FIFO_wr_en_e2p),
    .rd_en(FIFO_rd_en_e2p),
//    .rd_en(0),
    .dout(pcie_in),
    .full(eth_to_pcie_full),
    .empty (eth_to_pcie_empty)
    );
  
//  FIFO pcie_to_eth(
//  .pcie_out(pcie_out),
//  .rd_en(FIFO_rd_en),
//  .wr_en(FIFO_wr_en),
//  .wr_clk(pcie_clk_out),
//  .rd_clk(clk_156M),
//  .rst(sys_rst),
//  .eth_in(eth_in),
//  .empty(empty),
//  .full()
//  );
  
//states_ram states_ram(
//    .clk(gmii_tx_clk_out),
//    .rst_n(sys_rst_n),
//    .ip_rec_destination_addr(ip_rec_destination_addr),
//    .ip_rec_source_addr(ip_rec_source_addr),
//    .udp_rec_destination_port(udp_rec_destination_port),
//    .udp_rec_source_port(udp_rec_source_port),
//    .state_prepared_en(state_prepared_en),
//    .udp_data_length(udp_data_length),
//    .not_stateless(1),
//    .throughput_data_length(throughput_data_length),
//    .throughput_trans_time(throughput_trans_time),
//    .throughput_miss_cnt(throughput_miss_cnt)
//    );
    
endmodule



