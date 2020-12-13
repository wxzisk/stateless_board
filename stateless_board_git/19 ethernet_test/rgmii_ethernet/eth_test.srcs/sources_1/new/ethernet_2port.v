`timescale 1ns / 1ps  
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    ethernet_test 
//////////////////////////////////////////////////////////////////////////////////
module ethernet_2port(
//input sys_clk_p,      // ??????????200Mhz? ??
//input sys_clk_n,      // ??????????200Mhz? ??  
input CLK,
input key,
input rst_n,
input [63:0] out_to_eth,
//output gmii_tx_clk_out,
input pcie_to_eth_empty,

output FIFO_rd_en,      
output [31:0]          ip_rec_destination_addr,
output [31:0]          ip_rec_source_addr,
output [15:0]          udp_rec_destination_port,
output [15:0]          udp_rec_source_port,
output                 state_prepared_en,
output [15:0]          udp_data_length,
output [63:0]           gmii_txd,
output                  gmii_tx_en,
input [63:0]            gmii_rxd,
(*mark_debug = "true"*)output  reg                 rec_datain_en,
(*mark_debug = "true"*)input                  rec_fifo_empty,
(*mark_debug = "true"*)input [10:0]                   ten_to_one_data_count,
input                   full_to_10g,

     // udp received data and RAM write control signals 
output [63:0] dma_data_in,
output  dma_in_en,
input eth_to_pcie_full,

output [63:0] event_info_to_pcie,
output  event_info_to_pcie_en,
input event_header_fifo_full
); 

 
    //=========================================================================
    // ???????????
    //===========================================================================
//  wire sys_clk_ibufg;
//IBUFGDS u_ibufg_sys_clk
// (
//  .I  (sys_clk_p),            //????????????????????????
//  .IB (sys_clk_n),           // ????????????????????????
//  .O  (sys_clk_ibufg)        //??????
//  );
(*mark_debug = "true"*) wire rx_ready;
 reg [15:0] cnt;
 (*mark_debug = "true"*)reg [31:0] IDLE_cnt;
 localparam IDLE = 3'b001;
 localparam PACKET_JUDGE = 3'b010;
 localparam PACKET_IN= 3'b100;  
(*mark_debug = "true"*)reg [2:0] state;
reg [2:0] next_state;
reg [15:0] packet_len;
reg tail;
reg [15:0] packet_type;
reg wrong_packet;
reg right_packet;
reg [47 : 0] mac;

reg gmii_rx_en;
reg [63:0] gmii_rxd_d0;
reg [63:0] gmii_rxd_d1;
(*mark_debug = "true"*)reg [63:0] gmii_rxd_real;
(*mark_debug = "true"*)reg [63:0] packet_number_eth_in;
(*mark_debug = "true"*)reg [10:0] ten_to_one_data_count_d0;
(*mark_debug = "true"*)reg [10:0] ten_to_one_data_count_d1;
reg [10:0] ten_to_one_data_count_d2;
reg [10:0] ten_to_one_data_count_d3;
reg is_stp_packet;
always @(posedge CLK or negedge rst_n)
begin
    if(~rst_n)
        packet_number_eth_in <= 0;
    else if(state == IDLE && next_state == PACKET_IN)
        packet_number_eth_in <= packet_number_eth_in + 1;
    else 
        packet_number_eth_in <= packet_number_eth_in;
end
always @(posedge CLK or negedge rst_n)
  begin
    if (~rst_n)
      state  <=  IDLE  ;
    else
      state  <= next_state ;
  end
  
always @(*)
  begin
      case(state)
          IDLE:
                if(gmii_rxd[47:0] == 48'hc0_fe_01_35_0a_00)
                    next_state <= PACKET_JUDGE;
                else
                    next_state <= IDLE;
          PACKET_JUDGE:
                if(rx_ready ==1 && rec_fifo_empty == 0 )
                      next_state <= PACKET_IN;
                else if(rx_ready ==1 && rec_fifo_empty == 1 && ten_to_one_data_count_d0 >0 && ten_to_one_data_count_d0 == ten_to_one_data_count_d1)
                      next_state <= PACKET_IN;
                else
                      next_state <= PACKET_JUDGE; 
          PACKET_IN:
                  if(cnt > 4 && cnt == packet_len[15:3] - 2 + tail)
                     next_state <= IDLE;
                  else
                     next_state <= PACKET_IN;
      endcase
  end
always@ (*)
begin 
    if(~rst_n)
        gmii_rxd_real <= 0;
    else
        begin
            gmii_rxd_real[63:56] <= gmii_rxd[7:0];
            gmii_rxd_real[55:48] <= gmii_rxd[15:8];
            gmii_rxd_real[47:40] <= gmii_rxd[23:16];
            gmii_rxd_real[39:32] <= gmii_rxd[31:24];
            gmii_rxd_real[31:24] <= gmii_rxd[39:32];
            gmii_rxd_real[23:16] <= gmii_rxd[47:40];
            gmii_rxd_real[15:8] <= gmii_rxd[55:48];
            gmii_rxd_real[7:0] <= gmii_rxd[63:56];
        end
end

always@ (posedge CLK or negedge rst_n)
begin
    if(~rst_n)
        begin
        gmii_rxd_d0 <= 0;
        gmii_rxd_d1 <= 0;
        end
    else 
        begin
        gmii_rxd_d0 <= gmii_rxd_real;
        gmii_rxd_d1 <= gmii_rxd_d0;
        end
end 

always@(*)
begin
    if(~rst_n)
        rec_datain_en = 0;
    else if(state == IDLE && next_state == IDLE)
        rec_datain_en = 1;
    else if(state == PACKET_JUDGE && next_state == PACKET_IN)
        rec_datain_en = 1;
    else if(state == PACKET_IN)
        rec_datain_en = 1;
    else 
        rec_datain_en =0;
end

always@ (posedge CLK or negedge rst_n)
begin
    if(~rst_n)
        cnt <= 0;
    else if(state == PACKET_IN)
        cnt <= cnt + 1'b1;
    else 
        cnt <= 0;
end

always@ (posedge CLK or negedge rst_n)
begin
    if(~rst_n)
        IDLE_cnt <= 0;
    else if(state == IDLE && ten_to_one_data_count != 0)
        IDLE_cnt <= IDLE_cnt + 1'b1;
    else 
        IDLE_cnt <= 0;
end

always@ (posedge CLK or negedge rst_n)
begin
    if(~rst_n)
        begin
            ten_to_one_data_count_d0 <= 0;
            ten_to_one_data_count_d1 <= 0;
        end
    else if(IDLE_cnt == 42)
        begin
            ten_to_one_data_count_d0 <= ten_to_one_data_count;
            ten_to_one_data_count_d1 <= 0;
        end
    else if(IDLE_cnt == 50)
        begin
           ten_to_one_data_count_d0 <= ten_to_one_data_count_d0; 
           ten_to_one_data_count_d1 <= ten_to_one_data_count;
        end
    else if(state == PACKET_IN)
        begin
            ten_to_one_data_count_d0 <= 0;
            ten_to_one_data_count_d1 <= 0;
        end
    else 
        begin
            ten_to_one_data_count_d0 <= ten_to_one_data_count_d0;
            ten_to_one_data_count_d1 <= ten_to_one_data_count_d1;
        end
end

//always@ (posedge CLK or negedge rst_n)
//begin
//    if(~rst_n)
//        gmii_rx_en <= 0;
//    else if(state == PACKET_IN)
//        begin
//            if(cnt == 1 && gmii_rxd_real[63:16] == 48'h0180c2000000)
//                gmii_rx_en <= 0;                
//            else if(cnt == 1 && gmii_rxd_real[63:16] == 48'h000a3501fec0)
//                gmii_rx_en <= 1;
//            else if(cnt ==1 && gmii_rxd_real[63:16] != 48'h000a3501fec0)
//                gmii_rx_en <= 0;
//            else if(cnt > 1 && is_stp_packet)
//                gmii_rx_en <= 0;
//            else if(cnt > 1 && wrong_packet)
//                gmii_rx_en <= 0;
//            else if(cnt > 1 && ~wrong_packet)
//                gmii_rx_en <= 1;
//        end
//    else
//        gmii_rx_en <= 0;
//end

always@ (*)
begin
    if(~rst_n)
        gmii_rx_en <= 0;
    else if(state == PACKET_IN)
        gmii_rx_en <= 1;                
    else
        gmii_rx_en <= 0;
end


always@ (posedge CLK or negedge rst_n)
begin
    if(~rst_n)
        begin
            packet_len <= 0;
        end
    else if(cnt == 1 && packet_type == 16'h0800 && gmii_rxd_real[63:48] > 16'd50)
        begin
            packet_len <= gmii_rxd_real[63:48] + 14;
        end
    else if(cnt == 1 && packet_type == 16'h86dd && gmii_rxd_real[47:32] > 16'd10)
        begin
            packet_len <= gmii_rxd_real[47:32] + 54;
        end
    else if(cnt == 1 && packet_type == 16'h0800 && gmii_rxd_real[63:48] <= 16'd50)
        begin
            packet_len <= 16'd64;
        end
    else if(cnt == 1 && packet_type == 16'h86dd && gmii_rxd_real[47:32] <= 16'd10)
        begin
            packet_len <= 16'd64;
        end
    else if(cnt == 1 && packet_type == 16'h8808)
        begin
            packet_len <= 16'd64;
        end
    else if(state == PACKET_IN)
        begin
            packet_len <= packet_len;
        end
    else
        begin
            packet_len <= 0;
        end   
end              

always@ (posedge CLK or negedge rst_n)
begin
    if(~rst_n)
        begin
            wrong_packet <= 0;
        end
    else if(state == PACKET_IN && cnt == 1 && gmii_rxd_real[63:16] == 48'h0180c2000000)
        begin
            wrong_packet <= 0;
        end
    else if( state == PACKET_IN && cnt == 1 && gmii_rxd_real[63:16] != 48'h000a3501fec0)
        begin
            wrong_packet <= 1;
        end
    else if( state == PACKET_IN && cnt == 1 && gmii_rxd_real[63:16] == 48'h000a3501fec0)
        begin
            wrong_packet <= 0;
        end
    else
        begin
            wrong_packet <= wrong_packet;
        end   
end   

always@ (posedge CLK or negedge rst_n)
begin
    if(~rst_n)
        begin
            packet_type <= 0;
        end
    else if(state == PACKET_IN && cnt == 0)
        begin
            packet_type <= gmii_rxd_real[31:16];
        end
    else
        begin
            packet_type <= packet_type;
        end   
end   

always@ (posedge CLK or negedge rst_n)
begin
    if(~rst_n)
        begin
            mac <= 0;
        end
    else if(state == PACKET_IN && cnt == 1)
        begin
            mac <= gmii_rxd_real[63:16];
        end
    else
        begin
            mac<= mac;
        end   
end   

always@ (posedge CLK or negedge rst_n)
begin
    if(~rst_n)
        begin
            tail <= 0;
        end
    else if(cnt == 4 && packet_len[2:0] == 0)
        begin  
            tail <= 0;    
        end
    else if(cnt == 4 && packet_len[2:0] > 0)
        begin
            tail <= 1;
        end
    else
        begin
            tail <= tail;
        end   
end

ethernet_test u1(
.sys_clk(CLK),
.key_in(key),
.rst_n(rst_n),
.out_to_eth (out_to_eth),
//.gmii_tx_clk(gmii_tx_clk_out),
.pcie_to_eth_empty(pcie_to_eth_empty),
.FIFO_rd_en(FIFO_rd_en),
.ip_rec_destination_addr  (),
.ip_rec_source_addr       (),
.udp_rec_destination_port (),
.udp_rec_source_port      (),
.state_prepared_en        (),
.udp_data_length          (), 
.full(full_to_10g),
.gmii_txd(gmii_txd),
.gmii_tx_en(gmii_tx_en),
.gmii_rxd(gmii_rxd_d1),
.gmii_rx_en(gmii_rx_en),

.eth_to_pcie_full(eth_to_pcie_full),
.dma_data_in(dma_data_in),
.dma_in_en(dma_in_en),
.event_info_to_pcie(event_info_to_pcie),
.event_info_to_pcie_en(event_info_to_pcie_en),
.event_header_fifo_full(event_header_fifo_full),
.rx_ready (rx_ready)
);
          
    
endmodule                      
