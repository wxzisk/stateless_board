//////////////////////////////////////////////////////////////////////////////////////
//Module Name : udp_tx
//Description : This module is used to send UDP data and generate UDP checksum
//
//////////////////////////////////////////////////////////////////////////////////////
`timescale 1 ns/1 ns
module udp_tx
       (
          input                    clk,
          input                    rst_n,
          input      [31:0]        source_ip_addr,
          input      [31:0]        destination_ip_addr,
          input      [15:0]        udp_send_source_port,
          input      [15:0]        udp_send_destination_port,
          input      [15:0]        udp_send_data_length,
          input      [63:0]         ram_wr_data,
          input                    ram_wr_en,         //write en
          output reg               udp_ram_data_req,      //request data written to ram
          input                    mac_send_end,      //mac send finished
          input                    udp_tx_req,
          output reg               ip_tx_req,         //udp request ip
          input                    ip_tx_ack,         //ip ack for udp transfer
          input                    udp_data_req,
          output reg               udp_tx_ready,
          output reg [63:0]         udp_tx_data,//original version(8 bits)
          output reg               udp_tx_end,
          output                   almost_full,
          output                   tx_ready,
          //snd IB header
          input[31:0] snd_IB_parameter,
          input[63:0] snd_IB_addr,
          input[31:0] snd_IB_len 
       ) ;
       
reg                       ram_rd_en ;
wire [3:0]                usedw     ;
reg  [3:0]                fifo_count ;

reg  [63:0]                ram_rdata_d0  ;//original version(8 bits)
reg  [63:0]                ram_rdata_d1  ;//original version(8 bits)
//reg  [7:0]                ram_wr_data_d0 ;
//reg  [7:0]                ram_wr_data_d1 ;

reg  [15:0]                ram_wr_data_d10;
reg  [15:0]                ram_wr_data_d20;
reg  [15:0]                ram_wr_data_d30;
reg  [15:0]                ram_wr_data_d40;



wire [63:0]                ram_rdata ;//original version(8 bits)
reg  [5:0]                ram_data_length ;

reg  [15:0]               udp_send_cnt  ;
reg  [15:0]               udp_data_length ;      //valid data length
reg  [15:0]               udp_total_data_length ;//data length when transfer

reg [15:0]                timeout ;

reg                       mac_send_end_d0 ;



parameter IDLE              = 6'b000001 ;
parameter START             = 6'b000010 ;
parameter LEN_LATCH         = 6'b000100 ;
parameter SEND_WAIT         = 6'b001000 ;
parameter UDP_SEND          = 6'b010000 ;
parameter UDP_END           = 6'b100000 ;


(*mark_debug = "true"*)reg [5:0]    state  ;
reg [5:0]    next_state ;


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
//          if (usedw > 4'd0)
          if(udp_tx_req)
            next_state <= START ;
          else
            next_state <= IDLE ;
        end		
      START            :
        begin
          next_state <= LEN_LATCH ;
        end  
      LEN_LATCH   :
	    begin
		  if (ip_tx_ack)
		    next_state <= SEND_WAIT ;
		  else
		    next_state <= LEN_LATCH ;
		end
      SEND_WAIT      :
        begin
          if (udp_data_req)
            next_state <= UDP_SEND ;
          else if (timeout == 16'hffff)
            next_state <= IDLE ;
          else
            next_state <= SEND_WAIT ;
        end
        
      UDP_SEND       :
        begin
          if (udp_send_cnt == udp_total_data_length[15:3])
            next_state <= UDP_END ;
          else
            next_state <= UDP_SEND ;
        end
	  UDP_END       :
        begin
          if (mac_send_end_d0)
            next_state <= IDLE ;
          else
            next_state <= UDP_END ;
        end
      default        :
        next_state <= IDLE ;
    endcase
  end
  
reg  [16:0]        checksum_tmp0   ;
reg  [16:0]        checksum_tmp1   ;
reg  [16:0]        checksum_tmp2   ;
reg  [16:0]        checksum_tmp3   ;
reg  [16:0]        checksum_tmp4   ;
reg  [17:0]        checksum_tmp5   ;
reg  [17:0]        checksum_tmp6   ;
reg  [18:0]        checksum_tmp7   ;
reg  [19:0]        checksum_tmp8   ;
                                   
reg  [31:0]        checksum_tmp9   ;
                                   
reg  [31:0]        checksum_buf    ;
reg  [31:0]        check_out       ;
reg  [31:0]        checkout_buf    ;
wire [15:0]        checksum        ;
reg  [15:0]        checksum_cnt    ;
                                   
reg                checksum_wr     ;
reg                checksum_rd     ;
reg  [31:0]        checksum_in     ;
reg                checksum_finish ;
reg  [15:0]        checksum_udp_len ;
wire [31:0]        checksum_q       ;  

reg  [5:0] ip_tx_req_cnt;

always @(posedge clk or negedge rst_n)
  begin
    if (~rst_n)
      fifo_count <= 4'd0 ;
    else
      fifo_count <= usedw ;
  end 
  
always @(posedge clk or negedge rst_n)
  begin
    if (~rst_n)
      checksum_rd <= 1'b0 ;
    else if (state == IDLE && state != next_state)
      checksum_rd <= 1'b1 ;
	else
	  checksum_rd <= 1'b0 ;
  end  
//always@(posedge clk or negedge rst_n)
//  begin
//    if(~rst_n)
//      ip_tx_req_cnt <= 6'd0;
//    else if(state == LEN_LATCH)
//      ip_tx_req_cnt <= ip_tx_req_cnt +1'd1;
//    else
//      ip_tx_req_cnt <= 6'd0;
//  end
always @(posedge clk or negedge rst_n)
  begin
    if (~rst_n)
      ip_tx_req <= 1'b0 ;
    else if (state == LEN_LATCH )
      ip_tx_req <= 1'b1 ;
	else 
	  ip_tx_req <= 1'b0 ;
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
      udp_tx_ready <= 1'b0 ;
    else if (state == SEND_WAIT)
      udp_tx_ready <= 1'b1 ;
    else
      udp_tx_ready <= 1'b0 ;
  end
  
  
  
  
//timeout counter
always @(posedge clk or negedge rst_n)
  begin
    if (~rst_n)
      timeout <= 16'd0 ;
    else if (state == SEND_WAIT)
      timeout <= timeout + 1'b1 ;
    else
      timeout <= 16'd0 ;
  end
  
  
udp_tx_data_fifo tx_data_fifo
 (
  .clk          (clk            ),                  // input wire clk
  .srst         (~rst_n         ),                // input wire srst
  .din          (ram_wr_data    ),                  // input wire [63 : 0] din
  .wr_en        (ram_wr_en      ),              // input wire wr_en
  .rd_en        (ram_rd_en      ),              // input wire rd_en
  .dout         (ram_rdata      ),                // output wire [63 : 0] dout
  .full         (               ),                // output wire full
  .almost_full  (almost_full    ),  // output wire almost_full
  .empty        (               )              // output wire empty
 
);

//always @(posedge clk or negedge rst_n)
//  begin
//    if(rst_n == 1'b0)
//      begin
//        ram_wr_data_d0 <= 8'd0 ;
//        ram_wr_data_d1 <= 8'd0 ;
//      end
//    else
//      begin
//        ram_wr_data_d0 <= ram_wr_data[7:0] ;
//        ram_wr_data_d1 <= ram_wr_data_d0 ;
//      end
//  end

//seperate the 64-bits ram_wr_data to four 16-bitsram_wr_data_dx0
always @(posedge clk or negedge rst_n)
  begin
    if(rst_n == 1'b0)
      begin
        ram_wr_data_d10 <= 16'd0 ;
      end
    else
      begin
        ram_wr_data_d10 <= ram_wr_data[15:0] ;
      end
  end
  
always @(posedge clk or negedge rst_n)
    begin
      if(rst_n == 1'b0)
        begin
          ram_wr_data_d20 <= 16'd0 ;
        end
      else
        begin
          ram_wr_data_d20 <= ram_wr_data[31:16] ;
        end
    end
    
always @(posedge clk or negedge rst_n)
      begin
        if(rst_n == 1'b0)
          begin
            ram_wr_data_d30 <= 16'd0 ;
          end
        else
          begin
            ram_wr_data_d30 <= ram_wr_data[47:32] ;
          end
      end

always @(posedge clk or negedge rst_n)
  begin
    if(rst_n == 1'b0)
      begin
        ram_wr_data_d40 <= 16'd0 ;
      end
    else
      begin
        ram_wr_data_d40 <= ram_wr_data[63:48] ;
      end
  end
  
//ram signal

always @(posedge clk or negedge rst_n)
  begin
    if(rst_n == 1'b0)
      begin
        ram_rdata_d0 <= 64'd0 ;
        ram_rdata_d1 <= 64'd0 ;
      end
    else
      begin
        ram_rdata_d0 <= ram_rdata ;
        ram_rdata_d1 <= ram_rdata_d0 ;
      end
  end
  
  
  
always @(posedge clk or negedge rst_n)
  begin
    if(rst_n == 1'b0)
      ram_rd_en <= 1'b0 ;
//    else if (state == UDP_SEND && udp_send_cnt > 1 && udp_send_cnt < udp_data_length[15:2])//udp_data_length - 3(original version)
    else if (state == UDP_SEND && udp_send_cnt < udp_data_length[15:3])
      ram_rd_en <= 1'b1 ;
    else
      ram_rd_en <= 1'b0 ;
  end
  
  
//checksum counter
always @(posedge clk or negedge rst_n)
  begin
    if (~rst_n)
      udp_send_cnt  <= 16'd0 ;
    else if (state == UDP_SEND)
      udp_send_cnt <= udp_send_cnt + 1'b1 ;
    else
      udp_send_cnt <= 16'd0 ;
  end
  


reg [15:0]   fifo_udp_len ;
always @(posedge clk or negedge rst_n)
 begin
   if (~rst_n)
     fifo_udp_len  <= 16'd0 ;
   else
     fifo_udp_len <= checksum_q[31:16] + 16'd22 ;
 end
//generate udp and ip data length
always @(posedge clk or negedge rst_n)
  begin
    if(rst_n == 1'b0)
      begin
        udp_total_data_length <= 16'd0 ;
        udp_data_length <= 16'd0 ;
      end
    else if (state == LEN_LATCH)
        begin
            udp_data_length <= {udp_send_data_length[15:3],3'd0} + 16'd30 ;
            udp_total_data_length <= {udp_send_data_length [15:3],3'd0} + 16'd22 ;
        end
    else
        begin
            udp_data_length <= udp_data_length;
            udp_total_data_length <= udp_total_data_length;
        end
  end
  

assign tx_ready = (state == IDLE);
//*****************************************************************************************//
//send udp data
// the period of UDP_SEND maybe wrong
//*****************************************************************************************//
always @(posedge clk or negedge rst_n)
  begin
    if (~rst_n)
      udp_tx_data <= 64'h00  ;
    else if (state == UDP_SEND)
      begin
        case(udp_send_cnt)
          16'd0   :  udp_tx_data <={{udp_send_source_port,udp_send_destination_port},{udp_data_length,checksum_q[15:0] }} ;
          16'd1   :  udp_tx_data <={snd_IB_parameter,snd_IB_addr[63:32]};
          16'd2   :  udp_tx_data <= {snd_IB_addr[31:0],snd_IB_len};
          default :
            begin
              if (udp_data_length <= 30)
                udp_tx_data <= 0 ;
              else
                udp_tx_data <= ram_rdata_d0 ;
            end
        endcase
      end
    else
      udp_tx_data <= 0 ;
  end

  
//*****************************************************************************************//
//generate udp checksum
//*****************************************************************************************//
localparam CK_IDLE           = 6'b000001 ;
localparam HEADER_CHECKSUM   = 6'b000010 ;
localparam GEN_CHECKSUM      = 6'b000100 ;
localparam GEN_ODD_CHECKSUM  = 6'b001000 ;
localparam GEN_CHECKSUM_END  = 6'b010000 ;
localparam CHECKSUM_WAIT     = 6'b100000 ;

reg [5:0]    ck_state  ;
reg [5:0]    ck_next_state ;

always @(posedge clk or negedge rst_n)
  begin
    if (~rst_n)
      ck_state  <=  IDLE  ;
    else
      ck_state  <= ck_next_state ;
  end
  
always @(*)
  begin
    case(ck_state)
      CK_IDLE            :
        begin
          if (udp_tx_req)
            ck_next_state <= HEADER_CHECKSUM ;
          else
            ck_next_state <= CK_IDLE ;
        end		
      HEADER_CHECKSUM :
        begin
          if (checksum_cnt == 16'd8)
            begin
              if (checksum_udp_len == 16'd9)
                ck_next_state <= GEN_ODD_CHECKSUM ;
              else
                ck_next_state <= GEN_CHECKSUM ;
            end
          else
            ck_next_state <= HEADER_CHECKSUM ;
        end
      GEN_CHECKSUM    :
        begin
          if (checksum_udp_len[0] == 1'b0 && checksum_cnt == checksum_udp_len - 9)
            ck_next_state <= GEN_CHECKSUM_END ;
          else if (checksum_udp_len[0] == 1'b1 && checksum_cnt == checksum_udp_len - 10)
            ck_next_state <= GEN_ODD_CHECKSUM ;
          else
            ck_next_state <= GEN_CHECKSUM ;
        end
      GEN_ODD_CHECKSUM:
        begin
          if (checksum_cnt == checksum_udp_len - 9)
            ck_next_state <= GEN_CHECKSUM_END ;
          else
            ck_next_state <= GEN_ODD_CHECKSUM ;
        end
      GEN_CHECKSUM_END :
        begin
          if (checksum_finish)
            ck_next_state <= CHECKSUM_WAIT ;
          else
            ck_next_state <= GEN_CHECKSUM_END ;
        end
      CHECKSUM_WAIT      :
        begin          
            ck_next_state <= CK_IDLE ;
        end      
      default        :
        ck_next_state <= CK_IDLE ;
    endcase
  end



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
    if(rst_n == 1'b0)
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
      end
    else if (ck_state == HEADER_CHECKSUM)
      begin
        checksum_tmp0 <= checksum_adder(source_ip_addr[31:16],source_ip_addr[15:0]);  //source ip address
        checksum_tmp1 <= checksum_adder(destination_ip_addr[31:16],destination_ip_addr[15:0]);     //destination ip address
        checksum_tmp2 <= checksum_adder({8'd0,8'd17},checksum_udp_len);                   //protocol type
        checksum_tmp3 <= checksum_adder(udp_send_source_port,udp_send_destination_port);           //udp data length
        checksum_tmp4 <= checksum_adder(checksum_udp_len, 16'd0);
        checksum_tmp5 <= checksum_adder(checksum_tmp0, checksum_tmp1);
        checksum_tmp6 <= checksum_adder(checksum_tmp2, checksum_tmp3);
        checksum_tmp7 <= checksum_adder(checksum_tmp5, checksum_tmp6);
        checksum_tmp8 <= checksum_adder(checksum_tmp4, checksum_tmp7);
      end
    else if (ck_state == CK_IDLE)
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
      end
      
  end

reg[31:0] temp0;
reg[31:0] temp1;
reg[31:0] temp_sum;
always@(posedge clk or  negedge rst_n)
  begin
    if(~rst_n)
      begin
      temp0 <= 0;
      temp1 <= 0;
      temp_sum <= 0;
      end
    else if(ck_state == GEN_CHECKSUM)
      begin
      temp0 <= ram_wr_data_d10 + ram_wr_data_d20;
      temp1 <= ram_wr_data_d30 + ram_wr_data_d40;
      temp_sum <=temp0 + temp1;
      end
    else
      temp0 <= 0;
      temp1 <= 0;
      temp_sum <= 0;
  end
  
always @(posedge clk or negedge rst_n)
  begin
    if(rst_n == 1'b0)
      checksum_tmp9 <= 32'd0 ;
    else if (ck_state == GEN_CHECKSUM)
      begin
        if(checksum_cnt[0] == 1'b1)
//          checksum_tmp9 <= checksum_adder({ram_wr_data_d1,ram_wr_data_d0},checksum_buf);
           checksum_tmp9 <= checksum_adder(temp_sum,checksum_buf);
      end
    else if (ck_state == GEN_ODD_CHECKSUM)
//      checksum_tmp9 <= checksum_adder({ram_wr_data_d0,8'h00},checksum_tmp9);        //if udp data length is odd, fill with one byte 8'h00
        checksum_tmp9 <= checksum_adder(temp_sum,checksum_buf);
    else if (ck_state == CK_IDLE)
      checksum_tmp9 <= 32'd0 ;
  end
  
always @(posedge clk or negedge rst_n)
  begin
    if (~rst_n)
      checksum_buf <= 32'd0 ;
    else if (ck_state == GEN_CHECKSUM)
      checksum_buf <= checksum_tmp9 ;
    else
      checksum_buf <= 32'd0 ;
  end


always @(posedge clk or negedge rst_n)
  begin
    if(rst_n == 1'b0)
      checksum_cnt <= 16'd0 ;
    else if ((ck_state ==  HEADER_CHECKSUM || ck_state ==  GEN_CHECKSUM || ck_state ==  GEN_ODD_CHECKSUM || ck_state ==  GEN_CHECKSUM_END) && (ck_state != ck_next_state))
      checksum_cnt <= 16'd0 ;
    else if (ck_state ==  HEADER_CHECKSUM || ck_state ==  GEN_CHECKSUM || ck_state ==  GEN_ODD_CHECKSUM || ck_state ==  GEN_CHECKSUM_END)
      checksum_cnt <= checksum_cnt + 1'b1 ;
	else
	  checksum_cnt <= 16'd0 ;
  end
  
always @(posedge clk or negedge rst_n)
  begin
    if(rst_n == 1'b0)
      check_out <= 32'd0;
    else if (ck_state ==  GEN_CHECKSUM_END)
      begin
        if(checksum_cnt == 16'd0)
          check_out <= checksum_adder(checksum_tmp9, checksum_tmp8);
        else if (checksum_cnt == 16'd1)
          check_out <= checksum_out(check_out) ;
        else if (checksum_cnt == 16'd2)
          check_out <= checksum_out(check_out) ;
      end
  end
  
always @(posedge clk or negedge rst_n)
  begin
    if (~rst_n)
      checkout_buf <= 32'd0 ;
    else if (ck_state == GEN_CHECKSUM_END)
      checkout_buf <= ~check_out ;
  end
  
// assign checksum = ~checkout_buf[15:0] ;


always @(posedge clk or negedge rst_n)
  begin
    if (~rst_n)
      checksum_finish <= 1'b0 ;
    else if (ck_state == GEN_CHECKSUM_END && checksum_cnt == 16'd4)
      checksum_finish <= 1'b1 ;
    else
      checksum_finish <= 1'b0 ;
  end
  

always @(posedge clk or negedge rst_n)
  begin
    if(rst_n == 1'b0)
      udp_ram_data_req <= 1'b0 ;
    else if (ck_state == HEADER_CHECKSUM && checksum_cnt == 16'd5)
      udp_ram_data_req <= 1'b1 ;
    else
      udp_ram_data_req <= 1'b0 ;
  end  


always @(posedge clk or negedge rst_n)
  begin
    if (~rst_n)
      checksum_wr <= 1'b0 ;
    else if (ck_state == CHECKSUM_WAIT)
      checksum_wr <= 1'b1 ;
    else
      checksum_wr <= 1'b0 ;
  end

  
always @(posedge clk or negedge rst_n)
  begin
    if (~rst_n)
      checksum_udp_len <= 16'd0 ;
    else if ((ck_state == CK_IDLE) && (ck_state != ck_next_state))
      checksum_udp_len <= udp_send_data_length + 8 ;
  end

always @(posedge clk or negedge rst_n)
  begin
    if (~rst_n)
      checksum_in <= 32'd0 ;
    else if (ck_state == CHECKSUM_WAIT)
      checksum_in <= {checksum_udp_len, checkout_buf[15:0] } ;
    else
      checksum_in <= 32'd0 ;
  end  
  
always @(posedge clk or negedge rst_n)
  begin
    if (~rst_n)
      udp_tx_end <= 1'b0 ;
    else if (ck_state == CHECKSUM_WAIT)
      udp_tx_end <= 1'b1 ;
    else
      udp_tx_end <= 1'b0 ;
  end  


udp_checksum_fifo udp_tx_checksum
(
  .clk        (clk        ),                // input wire clk
  .srst       (~rst_n     ),              // input wire srst
  .din        (checksum_in),                // input wire [31 : 0] din
  .wr_en      (checksum_wr),            // input wire wr_en
  .rd_en      (checksum_rd),            // input wire rd_en
  .dout       (checksum_q ),              // output wire [31 : 0] dout
  .full       (           ),              // output wire full
  .empty      (           ),            // output wire empty
  .data_count (usedw      )  // output wire [3 : 0] data_count
);
endmodule