//////////////////////////////////////////////////////////////////////////////////////
//Module Name : udp_rx
//Description : This module is used to receive UDP data and verify UDP checksum
//
//////////////////////////////////////////////////////////////////////////////////////
`timescale 1 ns/1 ns
module udp_rx
(
 input                  clk,   
 input                  rst_n,  
 
 (*mark_debug = "true"*)input      [63:0]       udp_rx_data,
 input                  udp_rx_req,
 
 input                  mac_rec_error, 
 input      [7:0]       net_protocol,
 input      [31:0]      ip_rec_source_addr,
 input      [31:0]      ip_rec_destination_addr,
 input                  ip_checksum_error,
 input                  ip_addr_check_error,
 
 input      [15:0]      upper_layer_data_length, 
 output     [63:0]      udp_rec_ram_rdata ,      //udp ram read data
 input      [31:0]      udp_rec_ram_read_addr,   //udp ram read address
 output reg [15:0]      udp_rec_data_length,     //udp data length
 output reg             udp_rec_data_valid,       //udp data valid
 input [47:0]           mac_rx_source_mac_addr,
 output [15:0]          udp_rec_destination_port,
 output [15:0]          udp_rec_source_port,
 output reg             state_prepared_en,
 output reg  [15:0]             udp_data_length,
 
 //descriptor info(1 cycle), with data if there are data need to be transfered to host,
 output reg[63:0]       dma_data_in,
 output reg             dma_in_en,
 input                  eth_to_pcie_full,
 
 // event info out
 input event_info_out_en,
 output [63:0]  event_info_out,
 output queue1_empty,
  

 
 output reg[63:0] event_info_to_pcie,
 output reg event_info_to_pcie_en,
 input event_header_fifo_full,
 output udp_rx_ready 
);

reg  [15:0]             udp_rx_cnt ;
reg                     verify_end ;
reg                     udp_checksum_error ;  
          
reg	 [31:0]             ram_write_addr ;
reg	                    ram_wr_en ;

reg  [63:0]              udp_rx_data_d0 ;
reg  [63:0]              udp_rx_data_d1 ;         //udp data resigster
 //rec IB header
reg [31:0] IB_parameter;//the fisrt 32-bit parameter
reg[63:0]  IB_addr;
reg[31:0]  IB_len;

reg [63:0] event_info_0;//ram addr and length
reg [63:0] event_info_1;//IB header high 64bits
reg [63:0] event_info_2;//IB header low 64bits
reg [31:0] event_info_ip;
reg [47:0] event_info_mac;
reg [15:0] event_info_port;
(*mark_debug = "true"*)wire full;
parameter IDLE             =  8'b0000_0001  ;
parameter REC_HEAD         =  8'b0000_0010  ;
parameter REC_DATA         =  8'b0000_0100  ;
parameter REC_ODD_DATA     =  8'b0000_1000  ;
parameter VERIFY_CHECKSUM  =  8'b0001_0000  ;
parameter REC_ERROR        =  8'b0010_0000  ;
parameter REC_END_WAIT     =  8'b0100_0000  ;
parameter REC_END          =  8'b1000_0000  ;

(*mark_debug = "ture"*)reg [7:0]     state      ;
reg [7:0]     next_state ;
reg [31:0]    port;
assign udp_rx_ready = (state == IDLE);
assign udp_rec_source_port = port[31:16];
assign udp_rec_destination_port = port[15:0];
always @(posedge clk or negedge rst_n)
begin
  if (~rst_n)
    state <= IDLE ;
  else 
    state <= next_state ;
end

always @(*)
begin
    case(state)
	 IDLE            :begin
	                  if (udp_rx_req == 1'b1)
						next_state <= REC_HEAD ;
					  else
						next_state <= IDLE ;
					  end
	 REC_HEAD       : 
							next_state <= REC_DATA ;
						
	 REC_DATA       : begin
	                    if (ip_checksum_error || ip_addr_check_error)
						  next_state <= REC_ERROR ;
//						else if (udp_data_length[2:0] != 0 && udp_rx_cnt == udp_data_length[15:3] - 2)
//						  next_state <= REC_ODD_DATA ;
						else if (udp_rx_cnt == udp_data_length[15:3] - 1)
//						  next_state <= VERIFY_CHECKSUM ;
						  next_state <= REC_END ;
						else
	                      next_state <= REC_DATA ;
						end
	 REC_ODD_DATA   : begin
	                    if (ip_checksum_error)
							next_state <= REC_ERROR ;
						else if (udp_rx_cnt == udp_data_length[15:3] - 1)
//							next_state <= VERIFY_CHECKSUM ;
							next_state <= REC_END ;
						else
	                       next_state <= REC_ODD_DATA ;
						end
	 VERIFY_CHECKSUM :begin
                       if (udp_checksum_error)
					       next_state <= REC_ERROR ;
					   else if (verify_end)
					       next_state <= REC_END ;
                       else if (udp_rx_cnt == 16'hffff)
							next_state <= IDLE ;
						else
							next_state <= VERIFY_CHECKSUM ;
						end
	 REC_ERROR      : next_state <= IDLE  ; 
//	 REC_END_WAIT   : begin
//	                    if (udp_rx_cnt == 16'd8)
//                            next_state <= REC_END ;
//                        else
//	                      next_state <= REC_END_WAIT ;
//                       end
	 REC_END        : next_state <= IDLE  ;
	 default        : next_state <= IDLE  ;
	 endcase
end

//udp data length 
always @(posedge clk or negedge rst_n)
begin
  if (~rst_n)
    udp_data_length <= 16'd0 ;
  else if (state == IDLE)
    udp_data_length <= upper_layer_data_length ;
end

always @(posedge clk or negedge rst_n)
begin
  if (~rst_n)
    udp_rec_data_length <= 16'd0 ;
  else if (state == REC_END)
    udp_rec_data_length <= udp_data_length ;
end

always @(posedge clk or negedge rst_n)
begin
  if (~rst_n)
    udp_rx_cnt <= 16'd0 ;
//  else if (state == REC_HEAD || state == REC_DATA || state== REC_END)
else if (state == REC_HEAD || state == REC_DATA )
    udp_rx_cnt <= udp_rx_cnt + 1'b1 ;
  else
    udp_rx_cnt <= 16'd0 ;
end

always @(posedge clk or negedge rst_n)
begin
  if (~rst_n)
    begin
     udp_rx_data_d0 <= 64'd0 ;
     udp_rx_data_d1 <= 64'd0 ;
    end
  else
    begin
     udp_rx_data_d0 <= udp_rx_data ;
     udp_rx_data_d1 <=udp_rx_data_d0;
     end
end
	  
always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        ram_wr_en <= 0;
    else if((state == REC_DATA || state == REC_ODD_DATA) && udp_rx_cnt < udp_data_length[15:3] && udp_rx_cnt > 2)
        ram_wr_en <= 1;
    else
        ram_wr_en <= 0;
end

(*mark_debug = "true"*)reg[4:0] write_event_cnt;
(*mark_debug = "true"*)reg write_event_start;

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        begin
            write_event_cnt <= 0;
        end
//    else if(state == REC_DATA && udp_rx_cnt == 1 && ~ip_addr_check_error)
    else if(write_event_cnt > 0  && write_event_cnt < 5)
        begin
            write_event_cnt <= write_event_cnt + 1'b1;
        end
    else if(write_event_start==1)
        begin
            write_event_cnt <= write_event_cnt + 1;
        end
    else
        begin
            write_event_cnt <= 0;
        end
end

// event_switch = 1 means the event aimed to eth, 0 to pcie
(*mark_debug ="true" *)reg event_switch;
always @(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        begin
            event_switch <=0;
            write_event_start <= 0;
        end
    else if(udp_rx_data[63:56] == 8'b00110000 && udp_rx_cnt== 1 && ~ip_addr_check_error)//IB type == RDP (write data)
        begin
            event_switch <=1;
            write_event_start <= 1;
        end
    else if(udp_rx_data[63:56] == 8'b01100000 && udp_rx_cnt == 1 && ~ip_addr_check_error)//IB type == GD(tell how to send)
        begin
            event_switch <=0;
            write_event_start <= 1;
        end
    else if(udp_rx_data[63:56] == 8'b01010000 && udp_rx_cnt == 1 && ~ip_addr_check_error)//CQEP
        begin
            event_switch <=1;
            write_event_start <= 1;
        end
    else 
        begin
            event_switch <= event_switch;
            write_event_start <= 0;
        end
end

always @(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        begin
            event_info_0<= 64'd0;
            event_info_1<= 64'd0;
            event_info_2<= 64'd0;
            event_info_ip<= 32'd0;
            event_info_mac<= 48'd0;
            event_info_port<= 16'd0;
            
        end
    else if(write_event_cnt == 1)
        begin
            event_info_ip<= ip_rec_source_addr;
            event_info_mac<= mac_rx_source_mac_addr;
            event_info_port<= udp_rec_source_port;
            if(IB_parameter[31:28] == 4'b0011)//RDP (write data)
                begin
                event_info_0<= {32'd0,ip_rec_source_addr};
                event_info_1<= {{4'b0100,IB_parameter[27:0]},IB_addr[63:32]};
                event_info_2<= {IB_addr[31:0],IB_len};
                end
            else if(IB_parameter[31:28] == 4'b0110)//GD(tell how to send)
                begin
                event_info_0 <= {udp_rx_data_d0[31:0],ip_rec_source_addr};
                event_info_1 <= {{4'b0111,IB_parameter[27:0]},IB_addr[63:32]};
                event_info_2 <= {IB_addr[31:0],IB_len};
                end
            else if(IB_parameter[31:28] == 4'b0101)//CQEP
                begin
                event_info_0 <= {32'd0,ip_rec_source_addr};
                event_info_1 <= {{4'b1001,IB_parameter[27:0]},IB_addr[63:32]};
                event_info_2 <= {IB_addr[31:0],IB_len};
                end
            else
                begin
                event_info_0 <= event_info_0;
                event_info_1 <= event_info_1;
                event_info_2 <= event_info_2;
                end
        end
    else
        begin
            event_info_0<= event_info_0;
            event_info_1<= event_info_1;
            event_info_2<= event_info_2;
            event_info_ip<= event_info_ip;
            event_info_mac<= event_info_mac;
            event_info_port<= event_info_port;
        end
end

reg[15:0] dma_cnt;
reg with_data;//indicate whether data is avaliable 
always @(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        begin
            dma_data_in <=64'd0;
            dma_in_en <= 1'd0;
        end
    else if(~eth_to_pcie_full && udp_rx_cnt == 2)
        begin
            if(IB_parameter[31:28] == 4'b0011)//RDP(with data to be received)
                begin
                dma_data_in <={{IB_addr[46:0],udp_rx_data[15:0]},1'b1};
                dma_in_en<= 1;
                end
            else if(IB_parameter[31:28] == 4'b0110)//GD(tell how to send)
                begin
                dma_data_in <={{IB_addr[46:0],udp_rx_data[15:0]},1'b0};
                dma_in_en <=1;
                end
            else 
                begin
                dma_data_in <= 0;
                dma_in_en <=0;
                end
        end
    else if(~eth_to_pcie_full && udp_rx_cnt >2)
        begin
            if(IB_parameter[31:28] == 4'b0011)
                begin
                dma_data_in <=udp_rx_data;
                dma_in_en<= 1;
                end
            else if(IB_parameter[31:28] == 4'b0110)//GD(tell how to send)
                begin
                dma_data_in <=0;
                dma_in_en <=0;
                end
            else 
                begin
                dma_data_in <= 0;
                dma_in_en <=0;
                end
        end
    else
        begin
        dma_data_in <= 0; 
        dma_in_en <=0;
        end   
end

 (*mark_debug = "true"*)reg [63:0] event_info_in;
 (*mark_debug = "true"*)reg event_info_in_en;

//store in the pre-event fifo to pcie, the module pcie get the event header to put in front of the h2c data
always @(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        begin
            event_info_to_pcie <= 64'd0;
            event_info_to_pcie_en <= 0;
        end
    else if(~event_header_fifo_full && write_event_cnt == 2 && ~event_switch)
        begin
            event_info_to_pcie <= event_info_0;
            event_info_to_pcie_en <= 1;
        end
    else if(~event_header_fifo_full && write_event_cnt == 3 && ~event_switch)
        begin
            event_info_to_pcie <= event_info_1;
            event_info_to_pcie_en <= 1;
        end 
    else if(~event_header_fifo_full && write_event_cnt == 4 && ~event_switch)
         begin
            event_info_to_pcie <= event_info_2;
            event_info_to_pcie_en <= 1;
         end
    else if(~event_header_fifo_full && write_event_cnt == 5 && ~event_switch)
         begin
            event_info_to_pcie <= {event_info_port,event_info_mac};
            event_info_to_pcie_en <= 1;
         end
    else
        begin   
            event_info_to_pcie <= 0;
            event_info_to_pcie_en <= 0;
        end
end

////
always @(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        begin
            event_info_in <= 64'd0;
            event_info_in_en <= 0;
        end
    else if(~full && write_event_cnt == 2 && event_switch)
        begin
            event_info_in <= event_info_0;
            event_info_in_en <= 1;
        end
    else if(~full && write_event_cnt == 3 && event_switch)
        begin
            event_info_in <= event_info_1;
            event_info_in_en <= 1;
        end 
    else if(~full && write_event_cnt == 4 && event_switch)
         begin
            event_info_in <= event_info_2;
            event_info_in_en <= 1;
         end
    else if(~full && write_event_cnt == 5 && event_switch)
         begin
            event_info_in <= {event_info_port,event_info_mac};
            event_info_in_en <= 1;
         end
    else
        begin   
            event_info_in <= 0;
            event_info_in_en <= 0;
        end
end

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        begin
            IB_parameter <= 32'd0;
            IB_addr <= 64'd0;
            IB_len <= 32'd0;
        end
    else if((state == REC_DATA || state == REC_ODD_DATA) && udp_rx_cnt == 1)
        begin
            IB_parameter <= udp_rx_data[63:32];
            IB_addr[63:32] <=  udp_rx_data[31:0];
            IB_addr[31:0] <=32'd0;
            IB_len <= 32'd0;
        end
    else if((state == REC_DATA || state == REC_ODD_DATA) && udp_rx_cnt == 2)
        begin
            IB_parameter <= IB_parameter;
            IB_addr[63:32] <=  IB_addr[63:32];
            IB_addr[31:0] <=  udp_rx_data[63:32];
            IB_len <= udp_rx_data[31:0];
        end
    else
        begin
            IB_parameter <= IB_parameter;
            IB_addr <= IB_addr;
            IB_len <= IB_len;
        end
end

always @(posedge clk or negedge rst_n)
begin
  if (~rst_n)
    ram_write_addr <= 31'd0 ;
  else if ((state == REC_DATA || state == REC_ODD_DATA) && udp_rx_cnt < udp_data_length[15:3] && udp_rx_cnt > 2)
    ram_write_addr <= {16'd0,udp_rx_cnt - 3} ;
  else
    ram_write_addr <= 31'd0 ;
end

udp_rx_ram_8_2048 udp_receive_ram
(	
    .clka(clk),    // input wire clka
    .wea(ram_wr_en),      // input wire [0 : 0] wea
    .addra(ram_write_addr),  // input wire [10 : 0] addra
    .dina(udp_rx_data_d0),    // input wire [63 : 0] dina
    .clkb(clk),    // input wire clkb
    .addrb(udp_rec_ram_read_addr),  // input wire [10 : 0] addrb
    .doutb(udp_rec_ram_rdata)  // output wire [63 : 0] doutb
	);
////


always @(posedge clk or negedge rst_n )
begin
    if(rst_n ==1'b0) 
        port <= 0 ;
    else if(state == REC_HEAD )
    begin
        port <= udp_rx_data[63:32];  
    end
    else 
        port <= port;
end

always @(posedge clk or negedge rst_n )
begin
    if(rst_n == 1'b0)
        state_prepared_en <= 1'b0;
    else if(state == REC_DATA && udp_rx_cnt > 10 && udp_rx_cnt <=20) 
        state_prepared_en <= 1'b1;
    else 
        state_prepared_en <= 1'b0;
end

 fifo_generator_1 event_queue_1
 (
 .full(),
 .din(event_info_in),
 .wr_en(event_info_in_en),
 .empty(queue1_empty),
 .dout(event_info_out),
 .rd_en(event_info_out_en),
 .srst(~rst_n),
 .clk(clk),
 .prog_full(full)
 );   
 
//****************************************************************//
//verify checksum
//****************************************************************//
reg  [16:0] checksum_tmp0 ;
reg  [16:0] checksum_tmp1 ;
reg  [16:0] checksum_tmp2 ;
reg  [17:0] checksum_tmp3 ;
reg  [18:0] checksum_tmp4 ;
reg  [31:0] checksum_tmp5 ;
reg  [31:0] checksum_buf ;
reg  [31:0] check_out ;
reg  [31:0] checkout_buf ;
wire [15:0] checksum ;
reg  [2:0]  checksum_cnt ;

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
			checksum_tmp3 <= 18'd0 ;
			checksum_tmp4 <= 19'd0 ; 
    end		
    else if (state == REC_HEAD)
    begin
      checksum_tmp0 <= checksum_adder(ip_rec_source_addr[31:16],ip_rec_source_addr[15:0]);  //source ip address
      checksum_tmp1 <= checksum_adder(ip_rec_destination_addr[31:16],ip_rec_destination_addr[15:0]);     //destination ip address
      checksum_tmp2 <= checksum_adder({8'd0,net_protocol},udp_data_length);                   //protocol type
			checksum_tmp3 <= checksum_adder(checksum_tmp0,checksum_tmp1);                   //protocol type
      checksum_tmp4 <= checksum_adder(checksum_tmp2,checksum_tmp3);
	 end
	 else if (state == IDLE)
	 begin
			checksum_tmp0 <= 17'd0 ; 
			checksum_tmp1 <= 17'd0 ;
			checksum_tmp2 <= 17'd0 ;
			checksum_tmp3 <= 18'd0 ;
			checksum_tmp4 <= 19'd0 ; 
    end	
end

always @(posedge clk or negedge rst_n)
begin
  if(rst_n == 1'b0)
      checksum_tmp5 <= 32'd0; 
  else if (state == REC_HEAD || state == REC_DATA)     
  begin
     if (udp_rx_cnt[0] == 1'b1)
      checksum_tmp5 <= checksum_adder({udp_rx_data_d0,udp_rx_data},checksum_buf);	
  end		
  else if (state == REC_ODD_DATA)
      checksum_tmp5 <= checksum_adder({udp_rx_data,8'h00},checksum_tmp5);   //if udp data length is odd, fill with one byte 8'h00
  else if (state == IDLE)
			checksum_tmp5 <= 32'd0 ;
end

always @(posedge clk or negedge rst_n)
begin
  if(rst_n == 1'b0)
      checksum_cnt <= 3'd0 ; 
  else if (state == 	VERIFY_CHECKSUM)	
	   checksum_cnt <= checksum_cnt + 1'b1 ;
  else
	   checksum_cnt <= 3'd0 ;	
end

always @(posedge clk or negedge rst_n)
begin
  if(rst_n == 1'b0)
      check_out <= 32'd0; 
  else if (state == 	VERIFY_CHECKSUM)	
  begin  
	 if(checksum_cnt == 3'd0)
	   check_out <= checksum_adder(checksum_tmp4, checksum_tmp5);
	 else if (checksum_cnt == 3'd1)
	   check_out <= checksum_out(check_out) ;
	 else if (checksum_cnt == 3'd2)
	   check_out <= checksum_out(check_out) ;	
  end
end

always @(posedge clk or negedge rst_n)
begin
  if (~rst_n)
    checksum_buf <= 32'd0 ;
  else if (state == REC_HEAD || state == REC_DATA)
    checksum_buf <= checksum_tmp5 ;
  else
    checksum_buf <= 32'd0 ;
end

always @(posedge clk or negedge rst_n)
begin
  if (~rst_n)
    checkout_buf <= 32'd0 ;
  else if (state == 	VERIFY_CHECKSUM)	
    checkout_buf <= check_out ;
  else
    checkout_buf <= 32'd0 ;
end

assign checksum = ~checkout_buf[15:0] ;
//**************************************************//
//generate udp rx end
always @(posedge clk or negedge rst_n)
begin
  if (~rst_n)
  begin
    udp_checksum_error <= 1'b0 ;
		verify_end <= 1'b0 ;
  end
  else if (state == VERIFY_CHECKSUM && checksum_cnt == 3'd4)
  begin
    if (checksum == 16'd0)	 
	 begin
      udp_checksum_error <= 1'b0 ;
			verify_end <= 1'b1 ;
    end
	 else
	 begin
	   udp_checksum_error <= 1'b1 ;
		 verify_end <= 1'b0 ;
	 end
  end
  else
  begin
    udp_checksum_error <= 1'b0 ;
		verify_end <= 1'b0 ;
  end
end 

always @(posedge clk or negedge rst_n)
begin
  if (~rst_n)
    udp_rec_data_valid <= 1'b0 ;
	else if (state == REC_HEAD)
		udp_rec_data_valid <= 1'b0 ;
  else if (state == REC_END)
  begin
    if (mac_rec_error)
      udp_rec_data_valid <= 1'b0 ;
	 else 
      udp_rec_data_valid <= 1'b1 ;
  end
end

	
endmodule
