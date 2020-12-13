`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/31 20:52:50
// Design Name: 
// Module Name: test_verilog
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


module test_verilog(
input clk,
input rst,
output reg b,
output reg c
    );
reg [15:0] time_cnt;
reg a;

always@(posedge clk or rst)    
    begin
    if(rst)
        begin
        b<= 0;
        c<=0;
        end
    else
        begin
        b<= a;
        c<= b;
        end
    end  
    
    always@(posedge clk or rst)    
        begin
        if(rst)
            begin
            time_cnt <=0;
            end
        else 
            begin
            time_cnt <= time_cnt + 1;
            end
        end   
        
            always@(posedge clk or rst)    
            begin
            if(rst)
                begin
                a <=0;
                end
            else if(time_cnt == 100)
                begin
                a<= 1;
                end
            end     
endmodule
