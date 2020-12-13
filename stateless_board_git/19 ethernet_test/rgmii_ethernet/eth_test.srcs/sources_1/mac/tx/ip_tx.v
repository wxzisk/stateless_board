//////////////////////////////////////////////////////////////////////////////////////
//Module Name : ip_tx
//Description : This module is used to send ip layer data, generate ip header checksum,
//              receive data from udp or icmp, then send to mac layer
//
//
//////////////////////////////////////////////////////////////////////////////////////
`timescale 1 ns/1 ns
module ip_tx
       (
         input                clk                    ,
         input                rst_n                  ,
         
         input  [47:0]        destination_mac_addr   ,  //destination mac address
         input  [47:0]        source_mac_addr        ,  //source mac address
         input  [7:0]         TTL,
         input  [7:0]         ip_send_type,
         input  [31:0]        source_ip_addr,
         input  [31:0]        destination_ip_addr,
         input  [63:0]         upper_layer_data,         //data from udp or icmp //original version(8 bits)
         output reg           upper_data_req,        //request data from udp or icmp
         
         input                mac_tx_ack,
         input                mac_send_end,
         input                mac_data_req,
         input                upper_tx_ready,
         input                ip_tx_req,
         input  [15:0]        ip_send_data_length ,
         
         output reg           ip_tx_ack,
         output               ip_tx_busy,
         output reg           ip_tx_ready,
         (*mark_debug = "true"*)output reg [63:0]     ip_tx_data,//original version(8 bits)
         output reg           ip_tx_end,
         (*mark_debug = "true"*)output reg           ip_sending //state == IP_SEND, suggestting sending data  
       ) ;
       
localparam mac_type      = 16'h0800 ;
localparam ip_version    = 4'h4     ;  //ipv4
localparam header_len    = 4'h5     ;  //header length

reg            checksum_finish ;
reg  [15:0]    identify_code ;
reg  [15:0]    ip_send_data_length_d0 ;
reg  [15:0]    ip_send_cnt ;
reg  [15:0]    timeout ;
reg  [3:0]     wait_cnt ;
reg            mac_send_end_d0 ;
reg[63:0]  upper_layer_data_dly;

parameter IDLE             = 8'b0000_0001 ;
parameter START            = 8'b0000_0010 ;
parameter WAIT_DATA_LENGTH = 8'b0000_0100 ;
parameter GEN_CHECKSUM     = 8'b0000_1000 ;
parameter SEND_WAIT        = 8'b0001_0000 ;
parameter WAIT_MAC         = 8'b0010_0000 ;
parameter IP_SEND          = 8'b0100_0000 ;
parameter IP_END           = 8'b1000_0000 ;

(*mark_debug = "true"*)reg [7:0]    state  ;
reg [7:0]    next_state ;
(*mark_debug = "true"*)reg [63:0] packet_number_eth_out;
always @(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        packet_number_eth_out <= 0;
    else if(state == IDLE && next_state == START)
        packet_number_eth_out <= packet_number_eth_out + 1;
    else 
        packet_number_eth_out <= packet_number_eth_out;
end

always @(posedge clk or negedge rst_n)
  begin
    if (~rst_n)
      state  <=  IDLE  ;
    else
      state  <= next_state ;
  end
  
always @(*)
  begin
    case(state)
      IDLE            :
        begin
          if (ip_tx_req)
            next_state <= START ;
          else
            next_state <= IDLE ;
        end
      START            :
        begin
          if (mac_tx_ack)
            next_state <= WAIT_DATA_LENGTH ;
          else
            next_state <= START ;
        end  
      WAIT_DATA_LENGTH   :
        begin
          if (wait_cnt == 4'd7)
            next_state <= GEN_CHECKSUM ;
          else
            next_state <= WAIT_DATA_LENGTH ;
        end
      GEN_CHECKSUM     :
        begin
          if (checksum_finish)
            next_state <= SEND_WAIT ;
          else
            next_state <= GEN_CHECKSUM ;
        end
        
      SEND_WAIT       :
        begin
          if (upper_tx_ready)
            next_state <= WAIT_MAC ;
          else if (timeout == 16'hffff)
            next_state <= IDLE ;
          else
            next_state <= SEND_WAIT ;
        end
      WAIT_MAC         :
        begin
          if (mac_data_req)
            next_state <= IP_SEND ;
          else if (timeout == 16'hffff)
            next_state <= IDLE ;
          else
            next_state <= WAIT_MAC ;
        end
      IP_SEND         :
        begin
          if (ip_send_cnt ==  ip_send_data_length_d0[15:3] -1 )
            next_state <= IP_END ;
          else
            next_state <= IP_SEND ;
        end
	  IP_END         :
        begin
            next_state <= IDLE ;
        end
      default          :
        next_state <= IDLE ;
    endcase
  end
 
always @(posedge clk or negedge rst_n)
  begin
    if (~rst_n)
      mac_send_end_d0 <= 1'b0 ;
    else 
      mac_send_end_d0 <= mac_send_end ;
  end  
 
always @(posedge clk or negedge rst_n)
  begin
    if (~rst_n)
      ip_tx_ack <= 1'b0 ;
    else if (state == WAIT_DATA_LENGTH)
      ip_tx_ack <= 1'b1 ;
    else
      ip_tx_ack <= 1'b0 ;
  end  
  
always @(posedge clk or negedge rst_n)
  begin
    if (~rst_n)
      ip_tx_ready <= 1'b0 ;
    else if (state == WAIT_MAC)
      ip_tx_ready <= upper_tx_ready ;
    else
      ip_tx_ready <= 1'b0 ;
  end
  
always @(posedge clk or negedge rst_n)
  begin
    if (~rst_n)
      ip_tx_end <= 1'b0 ;
    else if ((state == IP_SEND || state == IP_END) && (ip_send_cnt >= ip_send_data_length_d0[15:3]))
      ip_tx_end <= 1'b1 ;
    else
      ip_tx_end <= 1'b0 ;
  end
  
//request data from icmp or udp
always @(posedge clk or negedge rst_n)
  begin
    if (~rst_n)
      upper_data_req <= 1'b0 ;
//    else if (state == IP_SEND && ip_send_cnt == 16'd30)
    else if (state == IP_SEND)
      upper_data_req <= 1'b1 ;
    else
      upper_data_req <= 1'b0 ;
  end
  
//timeout counter
always @(posedge clk or negedge rst_n)
  begin
    if (~rst_n)
      timeout <= 16'd0 ;
    else if (upper_tx_ready)
      timeout <= 16'd0 ;
    else if (state == SEND_WAIT || state == WAIT_MAC)
      timeout <= timeout + 1'b1 ;
    else
      timeout <= 16'd0 ;
  end
  
always @(posedge clk or negedge rst_n)
  begin
    if (~rst_n)
      wait_cnt <= 4'd0 ;
    else if (state == WAIT_DATA_LENGTH)
      wait_cnt <= wait_cnt + 1'b1 ;
    else
      wait_cnt <= 4'd0 ;
  end
  
always @(posedge clk or negedge rst_n)
  begin
    if (~rst_n)
      identify_code  <= 16'd0 ;
    else if (ip_tx_end)
      identify_code  <= identify_code + 1'b1 ;
  end
  
always @(posedge clk or negedge rst_n)
  begin
    if (~rst_n)
      ip_send_data_length_d0  <= 16'd0 ;
    else
      begin
        if (ip_send_data_length < 46)
          ip_send_data_length_d0  <= 16'd46 ;
        else
          ip_send_data_length_d0  <= ip_send_data_length+14 ;
      end
  end
  
always @(posedge clk or negedge rst_n)
  begin
    if (~rst_n)
      ip_send_cnt  <= 16'd0 ;
    else if (state == GEN_CHECKSUM || state == IP_SEND)
      ip_send_cnt <= ip_send_cnt + 1'b1 ;
    else
      ip_send_cnt <= 16'd0 ;
  end
//checksum generation

reg  [16:0] checksum_tmp0 ;
reg  [16:0] checksum_tmp1 ;
reg  [16:0] checksum_tmp2 ;
reg  [16:0] checksum_tmp3 ;
reg  [16:0] checksum_tmp4 ;
reg  [17:0] checksum_tmp5 ;
reg  [17:0] checksum_tmp6 ;
reg  [18:0] checksum_tmp7 ;
reg  [19:0] checksum_tmp8 ;
reg  [19:0] check_out ;
reg  [19:0] checkout_buf ;
reg  [15:0] checksum ;


//checksum function
function    [31:0]  checksum_adder
  (
    input       [31:0]  dataina,
    input       [31:0]  datainb
  );
  
  begin
    checksum_adder = dataina + datainb;
  end
endfunction

function    [31:0]  checksum_out
  (
    input       [31:0]  dataina
  );
  
  begin
    checksum_out = dataina[15:0]+dataina[31:16];
  end
  
endfunction


always @(posedge clk or negedge rst_n)
  begin
    if (~rst_n)
      begin
        checksum_tmp0 <= 17'd0 ;
        checksum_tmp1 <= 17'd0 ;
        checksum_tmp2 <= 17'd0 ;
        checksum_tmp3 <= 17'd0 ;
        checksum_tmp4 <= 17'd0 ;
        checksum_tmp5 <= 18'd0 ;
        checksum_tmp6 <= 18'd0 ;
        checksum_tmp7 <= 19'd0 ;
        checksum_tmp8 <= 20'd0 ;
        check_out     <= 20'd0 ;
        checkout_buf  <= 20'd0 ;
      end
    else if (state == GEN_CHECKSUM)
      begin
        checksum_tmp0 <= checksum_adder(16'h4500,ip_send_data_length);
        checksum_tmp1 <= checksum_adder(identify_code, 16'h4000) ;
        checksum_tmp2 <= checksum_adder({TTL,ip_send_type}, 16'h0000) ;
        checksum_tmp3 <= checksum_adder(source_ip_addr[31:16], source_ip_addr[15:0]) ;
        checksum_tmp4 <= checksum_adder(destination_ip_addr[31:16], destination_ip_addr[15:0]) ;
        checksum_tmp5 <= checksum_adder(checksum_tmp0, checksum_tmp1) ;
        checksum_tmp6 <= checksum_adder(checksum_tmp2, checksum_tmp3) ;
        checksum_tmp7 <= checksum_adder(checksum_tmp5, checksum_tmp6) ;
        checksum_tmp8 <= checksum_adder(checksum_tmp4, checksum_tmp7) ;
        check_out     <= checksum_out(checksum_tmp8) ;
        checkout_buf  <= checksum_out(check_out) ;
      end
    else if (state == IDLE)
      begin
        checksum_tmp0 <= 17'd0 ;
        checksum_tmp1 <= 17'd0 ;
        checksum_tmp2 <= 17'd0 ;
        checksum_tmp3 <= 17'd0 ;
        checksum_tmp4 <= 17'd0 ;
        checksum_tmp5 <= 18'd0 ;
        checksum_tmp6 <= 18'd0 ;
        checksum_tmp7 <= 19'd0 ;
        checksum_tmp8 <= 20'd0 ;
        check_out     <= 20'd0 ;
        checkout_buf  <= 20'd0 ;
      end
  end
  
  
  
  
  
always @(posedge clk or negedge rst_n)
  begin
    if (~rst_n)
      checksum <= 32'd0 ;
    else if (state == GEN_CHECKSUM)
      checksum <= ~checkout_buf[15:0] ;
  end
//assign checksum = ~checkout_buf[15:0] ;
//*******************************************************//

always @(posedge clk or negedge rst_n)
  begin
    if (~rst_n)
      checksum_finish <= 1'b0 ;
    else if (state == GEN_CHECKSUM && ip_send_cnt == 16'd13)
      checksum_finish <= 1'b1 ;
    else
      checksum_finish <= 1'b0 ;
  end
  
always @(posedge clk or negedge rst_n)
  begin
    if (~rst_n)
      begin
      ip_tx_data <= 64'h00 ;
      ip_sending <= 0;
      end
    else if (state == IP_SEND)
      begin
        upper_layer_data_dly<=upper_layer_data;
        case(ip_send_cnt)
//          16'd0   :  begin ip_tx_data <= 0  ;  ip_sending <=0; end
//          16'd1   :  begin ip_tx_data <= {48'hffffffffffff,destination_mac_addr[47:32]}  ;  ip_sending <=1; end
//          16'd2   :  begin ip_tx_data <= {destination_mac_addr[31:0],source_mac_addr[47:16]};ip_sending <=1; end
//          16'd3  :  begin ip_tx_data <= {{source_mac_addr[15:0],mac_type},{16'h4500,ip_send_data_length}} ;ip_sending <=1; end
//          16'd4  :   begin ip_tx_data <= {{identify_code,16'h4000},{{TTL,ip_send_type},checksum} };ip_sending <=1; end
//          16'd5  :  begin ip_tx_data <= {source_ip_addr,destination_ip_addr};ip_sending <=1; end
//          default :  begin ip_tx_data <= upper_layer_data;ip_sending <=1; end
//          16'd2   :  begin ip_tx_data <= 0  ;  ip_sending <=0; end
          16'd0   :  begin ip_tx_data <= {destination_mac_addr,source_mac_addr[47:32]}  ;  ip_sending <=1; end
          16'd1   :  begin ip_tx_data <= {source_mac_addr[31:0],{mac_type,16'h4500}};ip_sending <=1; end
          16'd2  :   begin ip_tx_data <= {{ip_send_data_length,identify_code},{16'h4000,{TTL,ip_send_type}}} ;ip_sending <=1; end
          16'd3  :   begin ip_tx_data <= {{checksum,source_ip_addr},destination_ip_addr[31:16] };ip_sending <=1; end
          16'd4  :   begin ip_tx_data <= {destination_ip_addr[15:0],upper_layer_data[63:16]};ip_sending <=1; end
          default :  begin ip_tx_data <= {upper_layer_data_dly[15:0],upper_layer_data[63:16]};ip_sending <=1; end
        endcase
      end
    else if (state == IP_END)
        begin
            ip_tx_data <= 64'hffffffffffffffff;
            ip_sending <= 1;
        end
    else
      begin
      ip_tx_data  <= 64'h0 ;
      ip_sending <= 0;
      end
  end
  
  
  
endmodule
