`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/04 14:59:02
// Design Name: 
// Module Name: states_ram
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


module states_ram(
    input clk,
    input rst_n,
	input [31:0]          ip_rec_destination_addr,
    input [31:0]          ip_rec_source_addr,
    input [15:0]          udp_rec_destination_port,
    input [15:0]          udp_rec_source_port,
    input                 state_prepared_en,
    input [15:0]          udp_data_length,
    input                    not_stateless,
//    input [15:0]                rx_cnt,
    output reg [31:0]       throughput_data_length,
    output reg [31:0]       throughput_trans_time,
    output reg [31:0]       throughput_miss_cnt
    );
reg [31:0] s_ip_ram [9:0];
reg [31:0] d_ip_ram [9:0];
reg [15:0]  s_port_ram [9:0];
reg [15:0]  d_port_ram [9:0];
reg [3:0] if_in;
reg [31:0] wait_cnt;
reg [31:0] miss_cnt;
reg [31:0] data_length_total;
reg [31:0] time_cnt;
reg [31:0] start_time;
reg [31:0] end_time;
reg [15:0] flow_cnt;
//reg [15:0] length_added;
//reg cnt_added;
//reg miss_cnt_added;

always @(posedge clk or negedge rst_n)
begin
    if(~rst_n) 
        begin 
        wait_cnt <= 0;
        end
    else if(state_prepared_en == 1'b1) 
        begin 
        wait_cnt <= wait_cnt +1'b1;
        end
    else 
        begin
        wait_cnt <=0;
        end
end

always @(posedge clk or negedge rst_n)
begin
    if(~rst_n) 
        time_cnt <= 0;
    else
        time_cnt <= time_cnt +1'b1;    
end

always @(posedge clk or negedge rst_n)
begin
    if(~rst_n) 
        start_time <= 0;
    else if(state_prepared_en == 1'b1 && flow_cnt == 16'd50)
        start_time <= time_cnt;    
    else 
        start_time <= start_time;
end

always @(posedge clk or negedge rst_n)
begin
    if(~rst_n) 
        end_time <= 0;
    else if(state_prepared_en == 1'b1 && flow_cnt == 16'd1000)
        end_time <= time_cnt;    
    else 
        end_time <= end_time;
end

// add current data length to total reg
always @(posedge clk or negedge rst_n)
begin
    if(~rst_n) 
        begin
        data_length_total <= 0;
//        length_added <= 0;
        end
    else if(wait_cnt ==3   && flow_cnt >=16'd50 && flow_cnt <= 16'd1000)
        begin
        data_length_total <= data_length_total + udp_data_length;
//        length_added <= 0;
        end
    else
        begin
        data_length_total <= data_length_total;
//        length_added <= 16'hffff;
        end
end

always @(posedge clk or negedge rst_n)
begin
    if(~rst_n) 
        begin
        flow_cnt <= 0;
        end
    else if(wait_cnt == 3)
        begin
        flow_cnt <= flow_cnt + 1'b1 ;
        end 
    else 
        begin
        flow_cnt <= flow_cnt;
        end
end

always @(posedge clk or negedge rst_n)
begin
    if(~rst_n) 
        begin
        throughput_trans_time <=0;
        end   
    else if(state_prepared_en == 1'b1&& flow_cnt == 16'd1000)  
        begin
        //bits / us
        throughput_trans_time <= end_time - start_time;
        end
    else 
        begin
        throughput_trans_time <= throughput_trans_time;
        end
end

always @(posedge clk or negedge rst_n)
begin
    if(~rst_n) 
        begin
        throughput_data_length <= 0 ;
        end   
    else if(flow_cnt == 16'd1000)  
        begin
        //bits / us
        throughput_data_length <= data_length_total;
        end
    else 
        begin
        throughput_data_length <= throughput_data_length;
        end
end

always @(posedge clk or negedge rst_n)
begin
    if(~rst_n) 
        begin
        throughput_miss_cnt <= 0;
        end   
    else if(flow_cnt == 16'd1000 && not_stateless == 1'b1)  
        begin
        //bits / us
        throughput_miss_cnt <= miss_cnt;
        end
    else if(flow_cnt == 16'd1000 && not_stateless == 1'b0)
        begin
        throughput_miss_cnt <= 0;
        end
    else
        throughput_miss_cnt <= throughput_miss_cnt;
end

always @(posedge clk or negedge rst_n)
begin 
    if(~rst_n) 
        begin
        if_in[3] <= 1'b0;
        end
    else if(wait_cnt < 3)
        begin
        case(ip_rec_source_addr)
        s_ip_ram[0]: if_in[3] <=1'b1; 
        s_ip_ram[1]: if_in[3] <=1'b1; 
        s_ip_ram[2]: if_in[3] <=1'b1; 
        s_ip_ram[3]: if_in[3] <=1'b1;  
        s_ip_ram[4]: if_in[3] <=1'b1;
        s_ip_ram[5]: if_in[3] <=1'b1;
        s_ip_ram[6]: if_in[3] <=1'b1; 
        s_ip_ram[7]: if_in[3] <=1'b1; 
        s_ip_ram[8]: if_in[3] <=1'b1;  
        s_ip_ram[9]: if_in[3] <=1'b1;  
        default:  if_in[3] <=1'b0; 
        endcase
        end
    else
        begin
        if_in[3] = if_in[3];
        end
end

always @(posedge clk or negedge rst_n)
begin 
    if(~rst_n) 
        begin
        if_in[2] <= 1'b0;
        end
    else if(wait_cnt < 3)
        begin
        case(ip_rec_destination_addr)
        d_ip_ram[0]: if_in[2] <=1'b1; 
        d_ip_ram[1]: if_in[2] <=1'b1; 
        d_ip_ram[2]: if_in[2] <=1'b1; 
        d_ip_ram[3]: if_in[2] <=1'b1;  
        d_ip_ram[4]: if_in[2] <=1'b1;
        d_ip_ram[5]: if_in[2] <=1'b1;
        d_ip_ram[6]: if_in[2] <=1'b1; 
        d_ip_ram[7]: if_in[2] <=1'b1; 
        d_ip_ram[8]: if_in[2] <=1'b1;  
        d_ip_ram[9]: if_in[2] <=1'b1;  
        default:  if_in[2] <=1'b0; 
        endcase
        end
    else
        begin
        if_in[2] <= if_in[2];
        end
end

always @(posedge clk or negedge rst_n)
begin 
    if(~rst_n) 
        begin
        if_in[1] <= 1'b0;
        end
    else if(wait_cnt < 3)
        begin
        case(udp_rec_source_port)
        s_port_ram[0]: if_in[1] <=1'b1; 
        s_port_ram[1]: if_in[1] <=1'b1; 
        s_port_ram[2]: if_in[1] <=1'b1; 
        s_port_ram[3]: if_in[1] <=1'b1;  
        s_port_ram[4]: if_in[1] <=1'b1;
        s_port_ram[5]: if_in[1] <=1'b1;
        s_port_ram[6]: if_in[1] <=1'b1; 
        s_port_ram[7]: if_in[1] <=1'b1; 
        s_port_ram[8]: if_in[1] <=1'b1;  
        s_port_ram[9]: if_in[1] <=1'b1;  
        default:  if_in[1] <=1'b0; 
        endcase
        end
    else
        begin
        if_in[1] <= if_in[1];
        end
end

always @(posedge clk or negedge rst_n)
begin 
    if(~rst_n) 
        begin
        if_in[0] <= 1'b0;
        end
    else if(wait_cnt < 3)
        begin
        case(udp_rec_destination_port)
        d_port_ram[0]: if_in[0] <=1'b1; 
        d_port_ram[1]: if_in[0] <=1'b1; 
        d_port_ram[2]: if_in[0] <=1'b1; 
        d_port_ram[3]: if_in[0] <=1'b1;  
        d_port_ram[4]: if_in[0] <=1'b1;
        d_port_ram[5]: if_in[0] <=1'b1;
        d_port_ram[6]: if_in[0] <=1'b1; 
        d_port_ram[7]: if_in[0] <=1'b1; 
        d_port_ram[8]: if_in[0] <=1'b1;  
        d_port_ram[9]: if_in[0] <=1'b1;  
        default:  if_in[0] <=1'b0; 
        endcase
        end
    else
        begin
        if_in[0] <= if_in[0];
        end
end

always @(posedge clk or negedge rst_n)
begin 
    if(~rst_n) 
        begin
        s_ip_ram[0] <= 0;s_ip_ram[1] <= 0;s_ip_ram[2] <= 0;s_ip_ram[3] <= 0;s_ip_ram[4] <= 0;
        s_ip_ram[5] <= 0;s_ip_ram[6] <= 0;s_ip_ram[7] <= 0;s_ip_ram[8] <= 0;s_ip_ram[9] <= 0;
        d_ip_ram[0] <= 0;d_ip_ram[1] <= 0;d_ip_ram[2] <= 0;d_ip_ram[3] <= 0;d_ip_ram[4] <= 0;
        d_ip_ram[5] <= 0;d_ip_ram[6] <= 0;d_ip_ram[7] <= 0;d_ip_ram[8] <= 0;d_ip_ram[9] <= 0;
        s_port_ram[0] <= 0;s_port_ram[1] <= 0;s_port_ram[2] <= 0;s_port_ram[3] <= 0;s_port_ram[4] <= 0;
        s_port_ram[5] <= 0;s_port_ram[6] <= 0;s_port_ram[7] <= 0;s_port_ram[8] <= 0;s_port_ram[9] <= 0;
        d_port_ram[0] <= 0;d_port_ram[1] <= 0;d_port_ram[2] <= 0;d_port_ram[3] <= 0;d_port_ram[4] <= 0;
        d_port_ram[5] <= 0;d_port_ram[6] <= 0;d_port_ram[7] <= 0;d_port_ram[8] <= 0;d_port_ram[9] <= 0;
        miss_cnt <= 0; 
        end
    else if(wait_cnt ==3  && if_in !=4'b1111)
        begin
        s_ip_ram[0] <= s_ip_ram[1];s_ip_ram[1] <= s_ip_ram[2];s_ip_ram[2] <= s_ip_ram[3];s_ip_ram[3] <= s_ip_ram[4];s_ip_ram[4] <= s_ip_ram[5];
        s_ip_ram[5] <= s_ip_ram[6];s_ip_ram[6] <= s_ip_ram[7];s_ip_ram[7] <= s_ip_ram[8];s_ip_ram[8] <= s_ip_ram[9];s_ip_ram[9] <= ip_rec_source_addr;
        d_ip_ram[0] <= d_ip_ram[1];d_ip_ram[1] <= d_ip_ram[2];d_ip_ram[2] <= d_ip_ram[3];d_ip_ram[3] <= d_ip_ram[4];d_ip_ram[4] <= d_ip_ram[5];
        d_ip_ram[5] <= d_ip_ram[6];d_ip_ram[6] <= d_ip_ram[7];d_ip_ram[7] <= d_ip_ram[8];d_ip_ram[8] <= d_ip_ram[9];d_ip_ram[9] <= ip_rec_destination_addr;
        s_port_ram[0] <= s_port_ram[1];s_port_ram[1] <= s_port_ram[2];s_port_ram[2] <= s_port_ram[3];s_port_ram[3] <= s_port_ram[4];s_port_ram[4] <= s_port_ram[5];
        s_port_ram[5] <= s_port_ram[6];s_port_ram[6] <= s_port_ram[7];s_port_ram[7] <= s_port_ram[8];s_port_ram[8] <= s_port_ram[9];s_port_ram[9] <= udp_rec_source_port;
        d_port_ram[0] <= d_port_ram[1];d_port_ram[1] <= d_port_ram[2];d_port_ram[2] <= d_port_ram[3];d_port_ram[3] <= d_port_ram[4];d_port_ram[4] <= d_port_ram[5];
        d_port_ram[5] <= d_port_ram[6];d_port_ram[6] <= d_port_ram[7];d_port_ram[7] <= d_port_ram[8];d_port_ram[8] <= d_port_ram[9];d_port_ram[9] <= udp_rec_destination_port;
        miss_cnt <= miss_cnt + 1'b1 ; 
        end
   else
        begin
           s_ip_ram[0] <= s_ip_ram[0];s_ip_ram[1] <= s_ip_ram[1];s_ip_ram[2] <= s_ip_ram[2];s_ip_ram[3] <= s_ip_ram[3];s_ip_ram[4] <= s_ip_ram[4];
           s_ip_ram[5] <= s_ip_ram[5];s_ip_ram[6] <= s_ip_ram[6];s_ip_ram[7] <= s_ip_ram[7];s_ip_ram[8] <= s_ip_ram[8];s_ip_ram[9] <= s_ip_ram[9];
           d_ip_ram[0] <= d_ip_ram[0];d_ip_ram[1] <= d_ip_ram[1];d_ip_ram[2] <= d_ip_ram[2];d_ip_ram[3] <= d_ip_ram[3];d_ip_ram[4] <= d_ip_ram[4];
           d_ip_ram[5] <= d_ip_ram[5];d_ip_ram[6] <= d_ip_ram[6];d_ip_ram[7] <= d_ip_ram[7];d_ip_ram[8] <= d_ip_ram[8];d_ip_ram[9] <= d_ip_ram[9];
           s_port_ram[0] <= s_port_ram[0];s_port_ram[1] <= s_port_ram[1];s_port_ram[2] <= s_port_ram[2];s_port_ram[3] <= s_port_ram[3];s_port_ram[4] <= s_port_ram[4];
           s_port_ram[5] <= s_port_ram[5];s_port_ram[6] <= s_port_ram[6];s_port_ram[7] <= s_port_ram[7];s_port_ram[8] <= s_port_ram[8];s_port_ram[9] <= s_port_ram[9];
           d_port_ram[0] <= d_port_ram[0];d_port_ram[1] <= d_port_ram[1];d_port_ram[2] <= d_port_ram[2];d_port_ram[3] <= d_port_ram[3];d_port_ram[4] <= d_port_ram[4];
           d_port_ram[5] <= d_port_ram[5];d_port_ram[6] <= d_port_ram[6];d_port_ram[7] <= d_port_ram[7];d_port_ram[8] <= d_port_ram[8];d_port_ram[9] <= d_port_ram[9];
           miss_cnt<= miss_cnt; 
        end       
end
    
endmodule

