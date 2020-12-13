//////////////////////////////////////////////////////////////////////////////////////
//Module Name : mac_rx
//Description : This module is used to receive MAC layer data and verify CRC
//
//////////////////////////////////////////////////////////////////////////////////////
`timescale 1 ns/1 ns
module mac_rx
(
 input                  clk,   
 input                  rst_n,    
 
 input                  rx_dv,
 input      [63:0]       mac_rx_datain,
 
 input      [31:0]      crc_result ,       
 output reg                crcen,          
 output reg                crcre, 
 output reg    [7:0]       crc_din,
 
 input                  checksum_err,     //checksum error from IP layer
 input                  ip_addr_check_error,
 input                  ip_rx_end,        //ip receive end
 input                  arp_rx_end,       //arp receive end 
 output reg             ip_rx_req,        //ip rx request
 output reg             arp_rx_req,       //arp rx request
 
 output     [63:0]       mac_rx_dataout,
 output reg[63:0]       mac_data_to_ip,
 output reg             mac_rec_error ,
 
 output reg [47:0]      mac_rx_destination_mac_addr,
 output reg [47:0]      mac_rx_source_mac_addr,
 output              mac_rx_ready
);

reg [15:0]               mac_rx_cnt       ;
reg [15:0]              mac_crc_cnt      ;
reg                     mac_sync         ;   //check preamble is right, then sync
reg [63:0]              preamble         ;           
reg [3:0]               preamble_cnt     ;
           
reg [15:0]              frame_type       ;   //type 16'h0800 IP; 16'h0806 ARP

           
wire                    rx_dv_posedge    ;
reg                     rx_dv_d0         ;
reg                     rx_dv_d1         ;
       
reg [63:0]               mac_rx_data_d0   ;
reg [63:0]               mac_rx_data_d1   ;
reg [63:0]               mac_rx_data_d2   ;
       
wire                    mac_rx_head_end  ;
       
reg  [15:0]             timeout          ;
       


//MAC receive FSM
parameter IDLE                =  9'b000_000_001 ;
parameter REC_DATA         =  9'b000_010_000 ;
parameter REC_CRC             =  9'b001_000_000 ;
parameter REC_ERROR           =  9'b010_000_000 ;
parameter REC_END             =  9'b100_000_000 ;

(*mark_debug = "ture"*)reg [8:0]     rec_state      ;
reg [8:0]     rec_next_state ;

assign mac_rx_ready = (rec_state == IDLE);
always @(posedge clk or negedge rst_n)
begin
  if (~rst_n)
    rec_state <= IDLE ;
  else 
    rec_state <= rec_next_state ;
end

always @(*)
begin
    case(rec_state)
	 IDLE            :  begin
	                      if (rx_dv_posedge == 1'b1)
                                rec_next_state <= REC_DATA ;
                        else
                                rec_next_state <= IDLE ;
	                    end
	 REC_DATA     : begin
	                      if (checksum_err || ip_addr_check_error)
                            rec_next_state <= REC_ERROR ;
                        else if (ip_rx_end)
                            rec_next_state <= REC_END ;
                        else if (timeout == 16'hffff)
                            rec_next_state <= REC_ERROR ;
                        else
                        rec_next_state <= REC_DATA ;
                        end
	 REC_ERROR      : 			rec_next_state <= IDLE  ;
	 REC_END        : 			rec_next_state <= IDLE  ;
	 default        : 			rec_next_state <= IDLE  ;
	 endcase
end




assign mac_rx_dataout  = mac_rx_data_d2 ;
assign rx_dv_posedge   = ~rx_dv_d0 & rx_dv ;


always @(posedge clk or negedge rst_n)
begin
  if (~rst_n)
    ip_rx_req <= 	1'b0 ;
  else if (rec_state == REC_DATA && mac_rx_cnt == 16'd1)
    ip_rx_req <=  1'b1 ;
  else
    ip_rx_req <=  1'b0 ;
end

//rx dv and rx data resigster
always @(posedge clk or negedge rst_n)
begin
  if (~rst_n)
  begin
    rx_dv_d0       <= 1'b0 ;
		rx_dv_d1       <= 1'b0 ;
    mac_rx_data_d0 <= 64'd0 ;
		mac_rx_data_d1 <= 64'd0 ;
		mac_rx_data_d2 <= 64'd0 ;
  end
  else
  begin
		rx_dv_d0       		<= rx_dv ;
		rx_dv_d1      	  <= rx_dv_d0 ;
		mac_rx_data_d0 		<= mac_rx_datain ;
		mac_rx_data_d1	 	<= mac_rx_data_d0 ;
		mac_rx_data_d2 		<= mac_rx_data_d1 ;
  end
end
//timeout
always @(posedge clk or negedge rst_n)
begin
  if (~rst_n)
    timeout <= 16'd0 ;
  else if (rec_state == REC_DATA )
    timeout <= timeout + 1'b1 ;
  else
    timeout <= 16'd0 ;
end

always @(posedge clk or negedge rst_n)
begin
  if (~rst_n)
    mac_rx_cnt <= 16'd0 ;
  else if ( rec_state == REC_DATA )
    mac_rx_cnt <= mac_rx_cnt + 1'b1 ;
  else
    mac_rx_cnt <= 16'd0 ;
end

always @(posedge clk or negedge rst_n)
begin
  if (~rst_n)
    mac_crc_cnt <= 16'd0 ;
  else if (rx_dv_d1)
    mac_crc_cnt <= mac_crc_cnt + 1'b1 ;
  else
    mac_crc_cnt <= 16'd0 ;
end

always @(posedge clk or negedge rst_n)
begin
  if (~rst_n)
    mac_rec_error <= 1'b0 ;
  else if (rx_dv_posedge)
    mac_rec_error <= 1'b0 ;
  else if (rec_state == REC_ERROR)
    mac_rec_error <= 1'b1 ;
end


always @(posedge clk or negedge rst_n)
begin
  if (~rst_n) 
    begin
    mac_rx_destination_mac_addr  <= 48'd0 ;
    mac_rx_source_mac_addr  <= 48'd0 ;
    frame_type  <= 16'd0 ;
    mac_data_to_ip <=64'd0;
    end
  else if (rec_state == REC_DATA)
  begin
    case(mac_rx_cnt)
      16'd0   :
                begin 
                    mac_rx_destination_mac_addr <= mac_rx_datain[63:16] ;
                    mac_rx_source_mac_addr<= mac_rx_source_mac_addr;
                    frame_type  <= frame_type;
                    mac_data_to_ip <=0;
                end
      16'd1   :
                begin
                    mac_rx_destination_mac_addr<= mac_rx_destination_mac_addr;
                    mac_rx_source_mac_addr<= {mac_rx_data_d0[15:0],mac_rx_datain[63:32]};
                    frame_type<=mac_rx_datain[31:16]; 
                    mac_data_to_ip <= 0;
                end
      16'd2 : 
                begin 
                    mac_rx_destination_mac_addr <= mac_rx_destination_mac_addr ;
                    mac_rx_source_mac_addr <= mac_rx_source_mac_addr;
                    frame_type  <= frame_type;
                    mac_data_to_ip <= {32'd0,{mac_rx_data_d0[15:0],mac_rx_datain[63:48]}};
                end
      default:
                begin 
                    mac_rx_destination_mac_addr <= mac_rx_destination_mac_addr ;
                    mac_rx_source_mac_addr <= mac_rx_source_mac_addr;
                    frame_type  <= frame_type;
                    mac_data_to_ip <= {mac_rx_data_d0[47:0],mac_rx_datain[63:48]};
                end
	 endcase
  end
  else
    begin
    mac_rx_destination_mac_addr <= mac_rx_destination_mac_addr ;
    mac_rx_destination_mac_addr <= mac_rx_destination_mac_addr ;
    frame_type  <= frame_type;
    mac_data_to_ip <= mac_data_to_ip;
    end
end

endmodule


