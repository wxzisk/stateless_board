//////////////////////////////////////////////////////////////////////////////////////
//Module Name : mac_tx
//Description : This module is MAC layer module, which receive data from ARP or IP module,
//              In this module, CRC checksum is generated
//
//////////////////////////////////////////////////////////////////////////////////////
`timescale 1 ns/1 ns
module mac_tx
       (
           input                  clk,
           input                  rst_n,
           
//           input      [31:0]      crc_result ,
//           output reg             crcen,
//           output reg             crcre,
//           output reg [7:0]       crc_din,
           
           input                  mac_tx_req,
//           input      [7:0]       mac_frame_data,  //data from ip or arp //original version(8 bits)
           input[63:0]            mac_frame_data,
           input                  mac_tx_ready,    //ready from ip or arp
           input                  mac_tx_end,      //end from ip or arp
           
           output reg             mac_tx_ack,
//           output reg [7:0]       mac_tx_data,//original version(8 bits)
           output reg [63:0]       mac_tx_data,
           output reg             mac_send_end,
           output reg             mac_data_valid,
           output reg             mac_data_req     //request data from arp or ip
         
       ) ;
       
       
reg  [3:0]          mac_tx_cnt    ;
//reg  [31:0]         crc ;

//reg  [7:0]          mac_frame_data_dly ;//original version(8 bits)
reg  [63:0]          mac_frame_data_dly ;
reg                 mac_tx_end_dly ;
//reg  [7:0]          mac_tx_data_tmp ;//original version(8 bits)
reg [63:0]          mac_tx_data_tmp;
reg                 mac_data_valid_tmp ;
reg  [15:0]         timeout ;
reg  [15:0]         mac_tx_data_cnt;

//MAC send FSM
parameter SEND_IDLE         =  6'b000_001  ;
parameter SEND_START        =  6'b000_010  ;
parameter SEND_PREAMBLE     =  6'b000_100  ;
parameter SEND_DATA         =  6'b001_000  ;
parameter SEND_CRC          =  6'b010_000  ;
parameter SEND_END          =  6'b100_000  ;

(*mark_debug = "true"*)reg [5:0]     send_state      ;
reg [5:0]     send_next_state ;


always @(posedge clk or negedge rst_n)
  begin
    if (~rst_n)
      send_state <= SEND_START ;
    else
      send_state <= send_next_state ;
  end
  
always @(*)
  begin
    case(send_state)
      SEND_IDLE    :
	    begin
		  if (mac_tx_req)
		    send_next_state <= SEND_START ;
		  else
		    send_next_state <= SEND_IDLE ;
	    end
      SEND_START     :
        begin
          if (mac_tx_ready)
            send_next_state <= SEND_PREAMBLE ;//original version (SEND_PREAMBLE)
          else
            send_next_state <= SEND_START ;
        end
      SEND_PREAMBLE   :
        begin
          if (mac_tx_cnt == 1)
            send_next_state <= SEND_DATA ;
          else
            send_next_state <= SEND_PREAMBLE ;
        end
      SEND_DATA       :
        begin
          if (mac_tx_end_dly)
            send_next_state <= SEND_END ;//original version(SEND_CRC)
          else if (timeout == 16'hffff)
            send_next_state <= SEND_END ;
          else
            send_next_state <= SEND_DATA ;
        end
      SEND_CRC        :
        begin
          if (mac_tx_cnt == 1)
            send_next_state <= SEND_END ;
          else
            send_next_state <= SEND_CRC ;
        end
      SEND_END        :
        send_next_state <= SEND_IDLE  ;
      default         :
        send_next_state <= SEND_IDLE  ;
    endcase
  end
  
 always @(posedge clk or negedge rst_n)
  begin
    if (~rst_n)
      mac_tx_ack <= 1'b0 ;
    else if (send_state == SEND_START)
      mac_tx_ack <= 1'b1 ;
    else
      mac_tx_ack <= 1'b0 ;
  end 
  
always @(posedge clk or negedge rst_n)
  begin
    if (~rst_n)
      mac_send_end <= 1'b0 ;
    else if (send_state == SEND_END)
      mac_send_end <= 1'b1 ;
    else
      mac_send_end <= 1'b0 ;
  end
  
//always @(posedge clk or negedge rst_n)
//  begin
//    if (~rst_n)
//      begin
//        crcre   <= 1'b1 ;
//        crcen   <= 1'b0 ;
//        crc_din <= 8'd0 ;
//      end
//    else if (send_state == SEND_DATA || (send_state == SEND_PREAMBLE && mac_tx_cnt == 1))
//      begin
//        crcre   <= 1'b0 ;
//        crcen   <= 1'b1 ;
//        crc_din <= mac_frame_data ;
//      end
//    else
//      begin
//        crcre   <= 1'b1 ;
//        crcen   <= 1'b0 ;
//        crc_din <= 8'd0 ;
//      end
//  end
  
  
always @(posedge clk or negedge rst_n)
  begin
    if (~rst_n)
      mac_data_valid_tmp <= 1'b0 ;
    else if (send_state == SEND_PREAMBLE || send_state == SEND_DATA || (send_state == SEND_CRC && mac_tx_cnt < 4))
      mac_data_valid_tmp <= 1'b1 ;
    else
      mac_data_valid_tmp <= 1'b0 ;
  end
  
always @(posedge clk or negedge rst_n)
  begin
    if (~rst_n)
      mac_data_valid <= 1'b0 ;
    else
      mac_data_valid <= mac_data_valid_tmp ;
  end
//request data from arp or ip
always @(posedge clk or negedge rst_n)
  begin
    if (~rst_n)
      mac_data_req <= 1'b0 ;
    else if (send_state == SEND_PREAMBLE && mac_tx_cnt == 1)
      mac_data_req <= 1'b1 ;
    else
      mac_data_req <= 1'b0 ;
  end
//timeout counter
always @(posedge clk or negedge rst_n)
  begin
    if (~rst_n)
      timeout <= 16'd0 ;
    else if (send_state == SEND_DATA)
      timeout <= timeout + 1'b1 ;
    else
      timeout <= 16'd0 ;
  end
  
  
//always @(posedge clk or negedge rst_n)
//  begin
//    if (~rst_n)
//      crc <= 32'hffffffff ;
//    else if (crcen)
//      crc <= crc_result ;
//  end
always @(posedge clk or negedge rst_n)
  begin
    if (~rst_n)
      mac_tx_data_cnt <= 16'd0 ;
    else if (send_state == SEND_DATA)
      mac_tx_data_cnt <= mac_tx_data_cnt + 1'b1 ;
    else
      mac_tx_data_cnt <= 16'd0 ;
  end
  
always @(posedge clk or negedge rst_n)
  begin
    if (~rst_n)
      begin
        mac_frame_data_dly <= 64'd0 ;
        mac_tx_end_dly     <= 1'b0 ;
      end
    else
      begin
        mac_frame_data_dly <= mac_frame_data ;
        mac_tx_end_dly     <= mac_tx_end ;
      end
  end
  
always @(posedge clk or negedge rst_n)
  begin
    if (~rst_n)
      mac_tx_cnt <= 4'd0 ;
    else if (send_state == SEND_PREAMBLE || send_state == SEND_CRC)
      mac_tx_cnt <= mac_tx_cnt + 1'b1 ;
    else
      mac_tx_cnt <= 4'd0 ;
  end
//mac send data frame
always @(posedge clk or negedge rst_n)
  begin
    if (~rst_n)
      mac_tx_data_tmp <= 64'h00 ;
//    else if (send_state == SEND_PREAMBLE)
//      begin
//          mac_tx_data_tmp <= 64'h00_00_00_00_00_00_55_55 ;
//      end
    else if (send_state == SEND_DATA)
      begin
        if(mac_tx_data_cnt == 8)
          mac_tx_data_tmp <= 64'h00_00_00_00_00_00_55_55 ;
        else if(mac_tx_data_cnt == 9)
          mac_tx_data_tmp <= {48'h55_55_55_55_55_d5,mac_frame_data_dly[15:0]} ;
        else
          mac_tx_data_tmp <= mac_frame_data_dly;
      end
  end
  
always @(posedge clk or negedge rst_n)
  begin
    if (~rst_n)
      mac_tx_data <= 64'h00 ;
    else if (send_state == SEND_CRC)
      begin
        case(mac_tx_cnt)
          4'd0    : mac_tx_data <= mac_tx_data_tmp ;
//          4'd1    : mac_tx_data <= {~crc[24], ~crc[25], ~crc[26], ~crc[27], ~crc[28], ~crc[29], ~crc[30], ~crc[31]} ;
//          4'd2    : mac_tx_data <= {~crc[16], ~crc[17], ~crc[18], ~crc[19], ~crc[20], ~crc[21], ~crc[22], ~crc[23]} ;
//          4'd3    : mac_tx_data <= {~crc[8], ~crc[9], ~crc[10], ~crc[11], ~crc[12], ~crc[13], ~crc[14], ~crc[15]}   ;
//          4'd4    : mac_tx_data <= {~crc[0], ~crc[1], ~crc[2], ~crc[3], ~crc[4], ~crc[5], ~crc[6], ~crc[7]}   ;
          default : mac_tx_data <= 0 ;
        endcase
      end
    else
      mac_tx_data <= mac_tx_data_tmp ;
  end
  
endmodule
