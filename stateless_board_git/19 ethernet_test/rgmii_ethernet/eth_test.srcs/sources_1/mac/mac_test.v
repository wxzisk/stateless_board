
//////////////////////////////////////////////////////////////////////////////////////
//Module Name : mac_top
//Description :
//
//////////////////////////////////////////////////////////////////////////////////////
//`define TEST_SPEED
`timescale 1 ns/1 ns
module mac_test
(
 input                rst_n  ,
 input                push_button,      
 input                gmii_tx_clk ,
 input                gmii_rx_clk ,
 input                gmii_rx_en,
 input  [63:0]         gmii_rxd,
 output          gmii_tx_en,
 output  [63:0] gmii_txd,
 input [63:0] data_temp,
 input pcie_to_eth_empty,
 output reg data_in_en_d0,
 output reg [31:0]           host_data_length,
 input                   eth_to_pcie_full,
output [31:0]          ip_rec_destination_addr,
output [31:0]          ip_rec_source_addr,
output [15:0]          udp_rec_destination_port,
output [15:0]          udp_rec_source_port,
output                 state_prepared_en,
output [15:0]           udp_data_length,

output                  rx_ready,

 // udp received data and RAM write control signals 
        output [63:0] dma_data_in,
        output  dma_in_en,
        
output [63:0] event_info_to_pcie,
output  event_info_to_pcie_en,
input event_header_fifo_full
);

localparam UDP_WIDTH = 64 ;
localparam UDP_DEPTH = 100 ;


reg                  gmii_rx_en_d0 ;
reg   [63:0]          gmii_rxd_d0 ;
wire                 gmii_tx_en_tmp ;
//wire   [7:0]         gmii_txd_tmp ;//original version(8 bits)
//reg   [7:0]          ram_wr_data ;//original version(8 bits)
wire [63:0]          gmii_txd_tmp;
reg  [63:0]          ram_wr_data ;
reg                  ram_wr_en ;
wire                 udp_ram_data_req ;
reg   [15:0]         udp_send_data_length ;

//wire  [7:0]          tx_ram_wr_data ;//original version(8 bits)

wire                 udp_tx_req ;
wire                 arp_request_req ;

reg                  write_end ;

wire [63:0]          udp_rec_ram_rdata ;
reg  [31:0]          udp_rec_ram_read_addr ;
wire [15:0]          udp_rec_data_length ;
wire                 udp_rec_data_valid ;

wire                 udp_tx_end  ;
wire                 almost_full ;
(*mark_debug = "true"*)wire                 tx_ready;
reg                  udp_ram_wr_en ;
reg                  udp_write_end ;

reg  [31:0]          wait_cnt ;
reg [31:0]           data_ram_addr;
reg [31:0]           data_ram_length;
reg [31:0]           destination_ip_addr;
reg [15:0]           udp_send_destination_port;
reg [47:0]           send_destination_mac;
reg [31:0]           snd_IB_parameter;
reg [63:0]           snd_IB_addr;
reg [31:0]           snd_IB_len;
wire                 queue2_empty;

//total event queue control param
reg [63:0] total_queue_data_in;
(*mark_debug = "true"*)wire [63:0] total_queue_data_out;
reg total_queue_in_en;
(*mark_debug = "true"*)reg total_queue_out_en;
wire total_queue_empty;
wire total_queue_full;
//event queue2 control param(pcie)
(*mark_debug ="true"*)reg queue2_info_in_en;
reg event2_info_out_en;
wire[63:0] event2_info_out;
//event queue1 control param(udp_rx)
wire[63:0] event_info_out;
reg event_info_out_en;
wire queue1_empty;
reg tx_fifo_wr_en_d0;
reg tx_fifo_wr_en_d1;
(*mark_debug ="true"*)reg [63:0] queue2_info_in;


reg  [10:0] i;
reg  [6:0] j;

reg  write_sel ;

wire button_negedge ;

wire mac_not_exist ;
wire arp_found ;

parameter IDLE          = 9'b0_0000_0001 ;//001
//parameter ARP_REQ       = 9'b0_0000_0010 ;
//parameter ARP_SEND      = 9'b0_0000_0100 ;
parameter GET_INFO      = 9'b0_0000_0100 ;//004
parameter GET_DATA      = 9'b0_0000_1000;//008
parameter GEN_REQ       = 9'b0_0001_0000 ;//010
parameter WRITE_RAM     = 9'b0_0010_0000 ;//020
parameter SEND          = 9'b0_0100_0000 ;//040
parameter WAIT          = 9'b0_1000_0000 ;//080
parameter CHECK_ARP     = 9'b1_0000_0000 ;//100

reg [8:0]    state  ;
reg [8:0]    next_state ;
reg  [15:0]  ram_cnt ;
reg    almost_full_d0 ;
reg    almost_full_d1 ;
reg [29:0]    data_cnt;

wire [31:0] rec_IB_parameter;
wire [63:0] rec_IB_addr;
wire [31:0] rec_IB_len;


reg [3:0] get_info_cnt;
wire[63:0] tx_data;
reg tx_data_rd_en;
reg tx_data_rd_en_d0;
always @(posedge gmii_tx_clk or negedge rst_n)
  begin
    if (~rst_n)
      state  <=  IDLE  ;
    else
      state  <= next_state ;
  end

reg no_data;
always @(*)
  begin
    case(state)
      IDLE        :
        begin
          if(~total_queue_empty && tx_ready)
//            next_state <=GEN_REQ ;
            next_state <= GET_INFO;
          else
            next_state <= IDLE ;
        end
      GET_INFO  :
        begin
            if(get_info_cnt == 4)
                next_state <= WRITE_RAM;
            else
                next_state <= GET_INFO;
        end
// disable ARP module 
//      ARP_REQ     :
//        next_state <= ARP_SEND ;
//      ARP_SEND    :
//        begin
//          if (mac_send_end)
//            next_state <= ARP_WAIT ;
//          else
//            next_state <= ARP_SEND ;
//        end
//      ARP_WAIT    :
//        begin
//          if (arp_found)
//            next_state <= WAIT ;
//          else if (wait_cnt == 32'd125_000_000)
//            next_state <= ARP_REQ ;
//          else
//            next_state <= ARP_WAIT ;
//        end
      GEN_REQ     :
        begin
//          if (udp_ram_data_req && no_data)
//            next_state <= WAIT;
//          else 
          if(udp_ram_data_req)
            next_state <= WRITE_RAM ;
          else
            next_state <= GEN_REQ ;
        end
      WRITE_RAM   :
        begin
          if (write_end) 
            next_state <= WAIT     ;
          else
            next_state <= WRITE_RAM ;
        end
        //State SEND is unmeaning 
      SEND        :
        begin
          if (udp_tx_end)
            next_state <= WAIT ;
          else
            next_state <= SEND ;
        end
        
      WAIT        :
        begin
            next_state <= IDLE ;
        end
//      CHECK_ARP   :
//        begin
//          if (mac_not_exist)
//            next_state <= ARP_REQ ;
//          else if (almost_full_d1)
//            next_state <= CHECK_ARP ;
//          else
//            next_state <= GEN_REQ ;
//        end
      default     :
        next_state <= IDLE ;
    endcase
  end
  

always@ (posedge gmii_tx_clk or negedge rst_n)
    begin
        if(~rst_n)
            get_info_cnt <= 4'b0000;
        else if(state == GET_INFO)
            get_info_cnt <= get_info_cnt +1'b1;
        else 
            get_info_cnt <= 4'b0000;
    end
always@ (posedge gmii_tx_clk or negedge rst_n)
begin
    if(~rst_n)
        total_queue_out_en <= 0;
    else if(state == GET_INFO && get_info_cnt <=3)
        total_queue_out_en <= 1;
    else
        total_queue_out_en <= 0;
end    
always@ (posedge gmii_tx_clk or negedge rst_n)
begin
    if(~rst_n)
        begin
            udp_send_data_length <= 0;
            destination_ip_addr <= 0;
        end
    else if(get_info_cnt == 2)
        begin
            udp_send_data_length <= total_queue_data_out[63:32];
            destination_ip_addr <= total_queue_data_out[31:0];
        end
    else
        begin
            udp_send_data_length <= udp_send_data_length;
            destination_ip_addr <= destination_ip_addr;
        end
end

always@ (posedge gmii_tx_clk or negedge rst_n)
begin
    if(~rst_n)
        begin
            snd_IB_parameter <= 0;
        end
    else if(get_info_cnt == 3)
        begin
            snd_IB_parameter <= total_queue_data_out[63:32];
        end
    else
        begin
            snd_IB_parameter <= snd_IB_parameter;
        end
end

always@ (posedge gmii_tx_clk or negedge rst_n)
begin
    if(~rst_n)
        begin
            snd_IB_addr<= 0;
        end
    else if(get_info_cnt == 3)
        begin
            snd_IB_addr <= {total_queue_data_out[31:0],32'd0};
        end
    else if(get_info_cnt == 4)
        begin
            snd_IB_addr <= {snd_IB_addr[63:32],total_queue_data_out[63:32]};
        end
    else
        snd_IB_addr <= snd_IB_addr;
end

////
always@ (posedge gmii_tx_clk or negedge rst_n)
begin
    if(~rst_n)
        begin
            snd_IB_len <= 0;
        end
    else if(get_info_cnt == 4)
        begin
            snd_IB_len <= total_queue_data_out[31:0];
        end
    else
        begin
            snd_IB_len <= snd_IB_len;
        end
end

////
always@ (posedge gmii_tx_clk or negedge rst_n)
begin
    if(~rst_n)
        begin
            udp_send_destination_port <= 0;
            send_destination_mac <= 0;
        end
    else if(get_info_cnt == 5)
        begin
            udp_send_destination_port <= total_queue_data_out[63:48];
            send_destination_mac <= total_queue_data_out[47:0];
        end
    else
        begin
            udp_send_destination_port <= udp_send_destination_port;
            send_destination_mac <= send_destination_mac;
        end
end

   
always@(posedge gmii_rx_clk or negedge rst_n)
  begin
    if(rst_n == 1'b0)
      begin
        gmii_rx_en_d0 <= 1'b0 ;
        gmii_rxd_d0   <= 64'd0 ;
      end
    else
      begin
        gmii_rx_en_d0 <= gmii_rx_en ;
        gmii_rxd_d0   <= gmii_rxd ;
      end
  end
  

mac_top mac_top0
(
 .gmii_tx_clk                 (gmii_tx_clk)                  ,
 .gmii_rx_clk                 (gmii_rx_clk)                  ,
 .rst_n                       (rst_n)  ,
 
 .source_mac_addr             (48'h00_0a_35_01_fe_c0)   ,       //source mac address
 .TTL                         (8'h80),
 .source_ip_addr              (32'hc0a81f06),
// .destination_ip_addr         (destination_ip_addr),
// .udp_send_source_port        (udp_send_source_port),
// .udp_send_destination_port   (udp_send_destination_port),
 .destination_ip_addr         (destination_ip_addr),
 .udp_send_source_port        (16'd12345),
 .udp_send_destination_port   (udp_send_destination_port),
 .send_destination_mac        (send_destination_mac),
 
 .ram_wr_data                 (tx_data) ,
 .ram_wr_en                   (tx_data_rd_en_d0),
 .udp_ram_data_req            (udp_ram_data_req),
 .udp_send_data_length        (udp_send_data_length),
 .udp_tx_end                  (udp_tx_end                 ),
 .almost_full                 (almost_full                ), 
 .tx_ready                    (tx_ready),
 .udp_tx_req                  (udp_tx_req),
 .arp_request_req             (arp_request_req ),
 
 .mac_send_end                (mac_send_end),
 .mac_data_valid              (gmii_tx_en_tmp),
 .mac_tx_data                 (gmii_txd_tmp),
 .rx_dv                       (gmii_rx_en   ),
 .mac_rx_datain               (gmii_rxd ),
 
 .udp_rec_ram_rdata           (udp_rec_ram_rdata),
 .udp_rec_ram_read_addr       (udp_rec_ram_read_addr),
 .udp_rec_data_length         (udp_rec_data_length ),
 
 .udp_rec_data_valid          (udp_rec_data_valid),
 .arp_found                   (arp_found ),
 .mac_not_exist               (mac_not_exist ),
 .ip_rec_destination_addr  (ip_rec_destination_addr),
 .ip_rec_source_addr    (ip_rec_source_addr),
 .udp_rec_destination_port (udp_rec_destination_port),
 .udp_rec_source_port      (udp_rec_source_port),
 .state_prepared_en        (state_prepared_en),
 .udp_data_length           (udp_data_length)  ,
 
 .ip_tx_data    (  gmii_txd  ),
 .ip_sending    ( gmii_tx_en  ),
 
 .eth_to_pcie_full(eth_to_pcie_full),
 .IB_parameter(rec_IB_parameter),
 .IB_addr(rec_IB_addr),
 .IB_len(rec_IB_len),
 
 .snd_IB_parameter(snd_IB_parameter),
 .snd_IB_addr(snd_IB_addr),
 .snd_IB_len(snd_IB_len),
 
.dma_data_in(dma_data_in),
 .dma_in_en(dma_in_en),
 .event_info_out(event_info_out),
 .event_info_out_en(event_info_out_en),
 .queue1_empty(queue1_empty),
 .rx_ready(rx_ready),
 .event_info_to_pcie(event_info_to_pcie),
 .event_info_to_pcie_en(event_info_to_pcie_en),
 .event_header_fifo_full(event_header_fifo_full)
) ;

 
        
ax_debounce ax0
(
  .clk(gmii_rx_clk),
  .rst_n(rst_n),
  .button_in(push_button),
  .button_posedge(),
  .button_negedge(button_negedge),
  .button_out()
);
  
fifo_generator_1 event_queue_2
(
.full(),
.din(queue2_info_in),
.wr_en(queue2_info_in_en),
.empty(queue2_empty),
.dout(event2_info_out),
.rd_en(event2_info_out_en),
.srst(~rst_n),
.clk(gmii_tx_clk)
);  
       
 fifo_generator_1 total_event_queue
 (
 .full(),
 .din(total_queue_data_in),
 .wr_en(total_queue_in_en),
 .empty(total_queue_empty),
 .dout(total_queue_data_out),
 .rd_en(total_queue_out_en),
 .srst(~rst_n),
 .clk(gmii_tx_clk)
 );           
  
  
 tx_data_fifo tx_data_fifo
 (
 .full(),
 .din(data_temp),
 .wr_en(tx_fifo_wr_en_d0),
 .empty(),
 .dout(tx_data),
 .rd_en(tx_data_rd_en),
 .clk(gmii_tx_clk),
 .srst(~rst_n)
 );
          



localparam QUEUE2_IDLE = 3'b001;
localparam QUEUE2_READ_INFO = 3'b010;  
localparam QUEUE2_READ_DATA = 3'b100;

(*mark_debug ="true"*)reg [2:0] queue2_state;
reg [2:0] queue2_next_state;
(*mark_debug ="true"*)reg [3:0] read_head_cnt;
reg [3:0] read_head_cnt_last;
(*mark_debug ="true"*)reg [15:0] read_data_cnt;
(*mark_debug ="true"*)reg [15:0] queue2_data_length;
reg queue2_data_length_tail;
reg [63:0] event_header_pre_0;
reg [63:0] event_header_pre_1;
reg [63:0] event_header_pre_2;
reg [63:0] event_header_pre_3;


always @(posedge gmii_tx_clk or negedge rst_n)
  begin
    if (~rst_n)
      queue2_state  <=  QUEUE2_IDLE  ;
    else
      queue2_state  <= queue2_next_state ;
  end
  
always @(*)
  begin
      case(queue2_state)
          QUEUE2_IDLE:
                    if( ~pcie_to_eth_empty)
                        queue2_next_state <= QUEUE2_READ_INFO;
                    else
                        queue2_next_state <= QUEUE2_IDLE;
          QUEUE2_READ_INFO:
                  if(read_head_cnt == 5 && ~pcie_to_eth_empty)
                      queue2_next_state <= QUEUE2_READ_DATA;
                  else
                      queue2_next_state <= QUEUE2_READ_INFO;
          QUEUE2_READ_DATA:
                  if((read_data_cnt == queue2_data_length[15:3] + queue2_data_length_tail - 3) && ~pcie_to_eth_empty)
                      queue2_next_state <= IDLE;
                  else
                      queue2_next_state <= QUEUE2_READ_DATA;
      endcase
  end
  

always @ (posedge gmii_tx_clk or negedge rst_n)
    begin
        if(~rst_n)
            data_in_en_d0 <= 0;
        else if(queue2_next_state == QUEUE2_READ_INFO || queue2_next_state == QUEUE2_READ_DATA)
            data_in_en_d0 <= 1;
        else
            data_in_en_d0 <= 0;
    end
    
reg data_in_en;   
always @(posedge gmii_tx_clk or negedge rst_n)
    begin
        if(~rst_n)
            data_in_en <= 1'b0;
        else if(~pcie_to_eth_empty && queue2_state == QUEUE2_READ_INFO)
            data_in_en <= 1'b1;
        else if(~pcie_to_eth_empty && queue2_state == QUEUE2_READ_DATA)
            data_in_en <= 1'b1;
        else 
            data_in_en <= 1'b0;
    end
////
always @ (posedge gmii_tx_clk or negedge rst_n)
    begin
        if(~rst_n)
            begin
                tx_fifo_wr_en_d0 <= 1'b0;
                tx_fifo_wr_en_d1 <= 1'b0;
            end
        else if(queue2_next_state == QUEUE2_READ_DATA || queue2_next_state == QUEUE2_IDLE)
            begin
                tx_fifo_wr_en_d0 <= data_in_en;
                tx_fifo_wr_en_d1 <= tx_fifo_wr_en_d0;
            end
        else 
            begin
                tx_fifo_wr_en_d0 <= 0;
                tx_fifo_wr_en_d1 <= 0;
            end
    end
    
       
always @(posedge gmii_tx_clk or negedge rst_n)
begin
    if(~rst_n) event_header_pre_0 <= 0;
    else if(read_head_cnt == 2 && read_head_cnt_last ==1) event_header_pre_0 <= data_temp;
    else event_header_pre_0 <= event_header_pre_0;
end
always @(posedge gmii_tx_clk or negedge rst_n)
begin
    if(~rst_n) event_header_pre_1 <= 0;
    else if(read_head_cnt == 3 && read_head_cnt_last ==2) event_header_pre_1 <= data_temp;
    else event_header_pre_1 <= event_header_pre_1;
end
always @(posedge gmii_tx_clk or negedge rst_n)
begin
    if(~rst_n) event_header_pre_2 <= 0;
    else if(read_head_cnt == 4 && read_head_cnt_last ==3) event_header_pre_2 <= data_temp;
    else event_header_pre_2 <= event_header_pre_2;
end
always @(posedge gmii_tx_clk or negedge rst_n)
begin
    if(~rst_n) event_header_pre_3 <= 0;
    else if(read_head_cnt == 5 && read_head_cnt_last ==4) event_header_pre_3 <= data_temp;
    else event_header_pre_3 <= event_header_pre_3;
end

reg event_queue1_transfer_start;
reg [3:0] transfer_cnt;
reg [3:0] transfer_cnt_d0;
always@ (posedge gmii_tx_clk or negedge rst_n)
    begin
        if(~rst_n)
            begin
                event_queue1_transfer_start <= 0;
            end
        else if(read_head_cnt == 5 && data_temp[15:3] <= 4)
            begin
                event_queue1_transfer_start <= 1;
            end
        else if(read_data_cnt == queue2_data_length[15:3] - 5 && queue2_data_length[15:3] >4)
            begin
                event_queue1_transfer_start <= 1;
            end        
        else
            begin
                event_queue1_transfer_start <= 0;
            end
    end 
    
always@ (posedge gmii_tx_clk or negedge rst_n)
    begin
        if(~rst_n)
            transfer_cnt <= 0;
        else if(event_queue1_transfer_start == 1)
            transfer_cnt <= 1;
        else if(transfer_cnt > 0 && transfer_cnt <4)
            transfer_cnt <= transfer_cnt + 1'b1;
        else if(transfer_cnt ==4 )
            transfer_cnt <= 0;
        else
            transfer_cnt <= transfer_cnt;
    end
    
always@ (posedge gmii_tx_clk or negedge rst_n)
begin
    if(~rst_n)
        transfer_cnt_d0 <= 0;
    else
        transfer_cnt_d0 <= transfer_cnt;
end
            
always@ (posedge gmii_tx_clk or negedge rst_n)
    begin
        if(~rst_n)
            begin
                queue2_info_in <= 0;
                queue2_info_in_en <= 0;
            end
        else if(transfer_cnt == 1 && transfer_cnt_d0 ==0)
            begin
                queue2_info_in <= event_header_pre_0;
                queue2_info_in_en <= 1;
            end  
        else if(transfer_cnt == 2 && transfer_cnt_d0 ==1)
            begin
                queue2_info_in <= event_header_pre_1;
                queue2_info_in_en <= 1;
            end
        else if(transfer_cnt == 3 && transfer_cnt_d0 ==2)
            begin
                queue2_info_in <= event_header_pre_2;
                queue2_info_in_en <= 1;
            end
        else if(transfer_cnt == 4 && transfer_cnt_d0 ==3)
            begin
                queue2_info_in <= event_header_pre_3;
                queue2_info_in_en <= 1;
            end
        else
            begin
                queue2_info_in <= 0;
                queue2_info_in_en <= 0;
            end
    end
    
always @(posedge gmii_tx_clk or negedge rst_n)
begin
    if(~rst_n)
        begin
        read_head_cnt <=0;
        read_head_cnt_last <= 0;
        end
    else if(~pcie_to_eth_empty && queue2_state == QUEUE2_READ_INFO)
        begin
        read_head_cnt <= read_head_cnt + 1;
        read_head_cnt_last <= read_head_cnt;
        end
    else if(queue2_state == QUEUE2_IDLE || queue2_state == QUEUE2_READ_DATA)
        begin
        read_head_cnt <= 0;
        read_head_cnt_last <= read_head_cnt;
        end
    else
        begin
        read_head_cnt <=read_head_cnt;
        read_head_cnt_last <= read_head_cnt;
        end
end

always @(posedge gmii_tx_clk or negedge rst_n)
begin
    if(~rst_n)
        begin
            read_data_cnt <=0;
        end
    else if(~pcie_to_eth_empty && queue2_state ==QUEUE2_READ_DATA)
        begin
            read_data_cnt <= read_data_cnt + 1;
        end
    else if(queue2_state == QUEUE2_IDLE || queue2_state == QUEUE2_READ_INFO)
        begin
            read_data_cnt <=0;
        end
    else
        begin
        read_data_cnt <= read_data_cnt;
        end
end 


////
always @(posedge gmii_tx_clk or negedge rst_n)
begin
    if(~rst_n)
        begin
        queue2_data_length <=0;
        end
    else if(read_head_cnt == 4 && read_head_cnt_last == 3)
        begin
        queue2_data_length <= data_temp[15:0];
        end
    else
        begin
        queue2_data_length <= queue2_data_length;
        end
end      

always @(posedge gmii_tx_clk or negedge rst_n)
begin
    if(~rst_n)
        begin
        queue2_data_length_tail <=0;
        end
    else if(read_head_cnt == 4 && read_head_cnt_last == 3 && data_temp[2:0] !=0  )
        begin
        queue2_data_length_tail <= 1;
        end
    else if(read_head_cnt == 4 && read_head_cnt_last == 3 && data_temp[2:0] ==0  )
        begin
        queue2_data_length_tail <= 0;
        end
    else
        begin
        queue2_data_length_tail <= queue2_data_length_tail;
        end
end

always@(posedge gmii_rx_clk or negedge rst_n)
  begin
    if(rst_n == 1'b0)
      begin
        almost_full_d0   <= 1'b0 ;
        almost_full_d1   <= 1'b0 ;
      end
    else
      begin
        almost_full_d0   <= almost_full ;
        almost_full_d1   <= almost_full_d0 ;
      end
  end
  
  
always@(posedge gmii_tx_clk or negedge rst_n)
  begin
    if(rst_n == 1'b0)
      write_sel <= 1'b0 ;
    else if (state == WAIT)
      begin
        if (udp_rec_data_valid)
          write_sel <= 1'b1 ;
        else
          write_sel <= 1'b0 ;
      end
  end
  
assign udp_tx_req    = (state == GET_INFO && next_state ==WRITE_RAM) ;
//assign arp_request_req  = (state == ARP_REQ) ;

//always@(posedge gmii_tx_clk or negedge rst_n)
//  begin
//    if(rst_n == 1'b0)
//      wait_cnt <= 0 ;
//    else if ((state==IDLE||state == WAIT || state == ARP_WAIT) && state != next_state)
//      wait_cnt <= 0 ;
//    else if (state==IDLE||state == WAIT || state == ARP_WAIT)
//      wait_cnt <= wait_cnt + 1'b1 ;
//	 else
//	   wait_cnt <= 0 ;
//  end
  
  always@(posedge gmii_tx_clk or negedge rst_n)
    begin
      if(rst_n == 1'b0)
        wait_cnt <= 0 ;
      else if ((state==IDLE||state == WAIT) && state != next_state)
        wait_cnt <= 0 ;
      else if (state==IDLE||state == WAIT)
        wait_cnt <= wait_cnt + 1'b1 ;
       else
         wait_cnt <= 0 ;
    end

always@(posedge gmii_tx_clk or negedge rst_n)
  begin
    if(rst_n == 1'b0)
      begin
        write_end  <= 1'b0;
        tx_data_rd_en  <= 0 ;
        i <= 0 ;
      end
    else if (state == WRITE_RAM)
      begin
        if(i == udp_send_data_length[15:3] )
          begin
            tx_data_rd_en <= 0;
            write_end <= 1'b1;
          end
        else
          begin
            write_end <= 1'b0 ;
            tx_data_rd_en <= 1;
            i <= i+1'b1;
          end         
      end
    else
      begin
        write_end  <= 1'b0;
        tx_data_rd_en <=0;
        i <= 0 ;
      end
  end
////
always@(posedge gmii_tx_clk or negedge rst_n)
  begin
    if(rst_n == 1'b0)
      tx_data_rd_en_d0 <= 0 ;
    else
      tx_data_rd_en_d0 <= tx_data_rd_en ;
  end
    
//send udp received data to udp tx ram
always@(posedge gmii_tx_clk or negedge rst_n)
  begin
    if(rst_n == 1'b0)
      udp_rec_ram_read_addr <= 32'd0 ;
    else if (state == WRITE_RAM)
      udp_rec_ram_read_addr <= udp_rec_ram_read_addr + 1'b1 ;
    else
      udp_rec_ram_read_addr <= 32'd0 ;
  end

    
always@(posedge gmii_tx_clk or negedge rst_n)
  begin
    if(rst_n == 1'b0)
      udp_ram_wr_en <= 1'b0 ;
    else if (state == WRITE_RAM && udp_rec_ram_read_addr < udp_rec_data_length - 8)
      udp_ram_wr_en <= 1'b1 ;
    else
      udp_ram_wr_en <= 1'b0 ;
  end
  
always@(posedge gmii_tx_clk or negedge rst_n)
  begin
    if(rst_n == 1'b0)
      udp_write_end <= 1'b0 ;
    else if (state == WRITE_RAM && udp_rec_ram_read_addr == udp_rec_data_length - 8)
      udp_write_end <= 1'b1 ;
    else
      udp_write_end <= 1'b0 ;
  end

localparam QUEUE_IDLE = 3'b001;
localparam QUEUE1_IN  = 3'b010;
localparam QUEUE2_IN  = 3'b100;

reg [2:0] queue_state;
reg [2:0] queue_next_state;

always @(posedge gmii_tx_clk or negedge rst_n)
  begin
    if (~rst_n)
      queue_state  <=  QUEUE_IDLE  ;
    else
      queue_state  <= queue_next_state ;
  end

reg [3:0] QUEUE1_IN_cnt;
reg [3:0] QUEUE2_IN_cnt;
always @(*)
begin
    case(queue_state)
        QUEUE_IDLE:
                    queue_next_state <= QUEUE1_IN;
        QUEUE1_IN:
                if(queue1_empty)
                    queue_next_state <= QUEUE2_IN;
                else if(QUEUE1_IN_cnt == 5)
                    queue_next_state <= QUEUE2_IN;
                else
                    queue_next_state <= QUEUE1_IN;
        QUEUE2_IN:
                if(queue2_empty)
                    queue_next_state <= QUEUE1_IN;
                else if(QUEUE2_IN_cnt == 5)
                    queue_next_state <= QUEUE1_IN;
                else
                    queue_next_state <= QUEUE2_IN;
    endcase
end

always @(posedge gmii_tx_clk or negedge rst_n)
begin
    if(~rst_n)
        QUEUE1_IN_cnt <= 0;
    else if(queue_state == QUEUE1_IN)
        QUEUE1_IN_cnt <= QUEUE1_IN_cnt + 1'b1;
    else   
        QUEUE1_IN_cnt <= 0;
end

always @(posedge gmii_tx_clk or negedge rst_n)
begin
    if(~rst_n)
        QUEUE2_IN_cnt <= 0;
    else if(queue_state == QUEUE2_IN)
        QUEUE2_IN_cnt <= QUEUE2_IN_cnt + 1'b1;
    else   
        QUEUE2_IN_cnt <= 0;
end

always @(posedge gmii_tx_clk or negedge rst_n)
begin
    if(~rst_n)
        begin
        event_info_out_en <= 0;
        event2_info_out_en <=0;
        end
    else if(queue_state == QUEUE1_IN && ~queue1_empty && QUEUE1_IN_cnt <=3)
        begin
        event_info_out_en<= 1;
        event2_info_out_en <=0;
        end
    else if(queue_state == QUEUE2_IN && ~queue2_empty && QUEUE2_IN_cnt <=3)
        begin
        event_info_out_en <=0;
        event2_info_out_en<=1;
        end
    else
        begin
        event_info_out_en <= 0;
        event2_info_out_en <=0;
        end
end

always @(posedge gmii_tx_clk or negedge rst_n)
begin
    if(~rst_n)
        begin
        total_queue_in_en <= 0;
        end
    else if(event_info_out_en)
        begin
        total_queue_in_en <= event_info_out_en;
        end
    else if(event2_info_out_en)
        begin
        total_queue_in_en <= event2_info_out_en;
        end
    else
        begin
        total_queue_in_en <= 0;
        end
end

always @(*)
begin
    if(queue_state == QUEUE1_IN)
        total_queue_data_in = event_info_out;
    else if(queue_state == QUEUE2_IN)
        total_queue_data_in = event2_info_out;
    else
        total_queue_data_in = 0;
end
endmodule


