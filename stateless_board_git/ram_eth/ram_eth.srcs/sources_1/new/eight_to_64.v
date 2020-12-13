`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/05 21:17:18
// Design Name: 
// Module Name: 8_to_64
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

`timescale 1 ns/1 ns
module eight_to_64
(
// en = data in en, out_en = data out en
input[7:0] data_temp,
input en,
input clk,
input rst_n,
input full,
input[31:0] host_data_length,
output reg[67:0] data_out,
output reg out_en
);

reg [3:0] cnt;
reg [31:0] data_cnt;
reg [63:0] data64; 
reg [31:0] real_data_length;

always @(posedge clk or negedge rst_n)
    begin
        if(rst_n == 0)
        real_data_length <= 0;
        else if(host_data_length != 0)
        real_data_length <= host_data_length;
        else 
        real_data_length <= real_data_length;
    end
   
always @(posedge clk or negedge rst_n)
    begin
        if(rst_n == 0)
            begin
            cnt <= 0;
            data_cnt <= 0;
            data64 <= 0;
            data_out <=0;
            out_en <= 0;
            out_en <= 1'b0;
            end
        else if(en == 1 && data_cnt < real_data_length-8)
            begin
            if(cnt < 8 || full)
                begin 
                data64 <= (data64<<8)+data_temp;
                cnt<=cnt+1'b1;
                data_cnt <= data_cnt +1'b1;
                data_out<=data_out;
                out_en <= 1'b0;
                end
            else 
                begin
                data64 <= 0;
                cnt <=0;
                data_out <={4'b1111,data64} ;
                out_en <= 1'b1;
                end 
            end
        else if(en == 1 && data_cnt >= real_data_length-8)
            begin
             if(cnt < 8 || full)
                begin 
                data64 <= (data64<<8)+data_temp;
                cnt<=cnt+1'b1;
                data_cnt <= data_cnt +1'b1;
                data_out<=data_out;
                out_en <= 1'b0;
                end
            else 
                begin
                data64 <= 0;
                cnt <=0;
                data_cnt <= 0;
                data_out <={4'b0101,data64} ;
                out_en <= 1'b1;
                end 
            end
        else
            begin
                if(data64 != 0) 
                    begin 
                    case(real_data_length[2:0])
                        3'b001:begin cnt <= 0; data_out <={4'b0101,{data64[7:0],56'b0}}; data64<= 0;out_en <= 1'b1;end
                        3'b010:begin cnt <= 0; data_out <={4'b0101,{data64[15:0],48'b0}};data64<= 0;out_en <= 1'b1;end
                        3'b011:begin cnt <= 0; data_out <={4'b0101,{data64[23:0],40'b0}};data64<= 0;out_en <= 1'b1;end
                        3'b100:begin cnt <= 0; data_out <={4'b0101,{data64[31:0],32'b0}};data64<= 0;out_en <= 1'b1;end
                        3'b101:begin cnt <= 0; data_out <={4'b0101,{data64[39:0],24'b0}};data64<= 0;out_en <= 1'b1;end
                        3'b110:begin cnt <= 0; data_out <={4'b0101,{data64[47:0],16'b0}};data64<= 0;out_en <= 1'b1;end
                    default:
                        begin cnt <= 0; data_out <={4'b0101,{data64[55:0],8'b0}};data64<= 0;out_en <= 1'b1;end
                    endcase
                    data_cnt <= 0;
                    end
                else
                    begin 
                    cnt <= 0; 
                    data_out <=0; 
                    data_cnt <= 0;
                    data64<= 0;
                    out_en <= 1'b0;
                    end
            end
end
endmodule
