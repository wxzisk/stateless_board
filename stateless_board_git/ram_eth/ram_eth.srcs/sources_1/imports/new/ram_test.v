`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/07/23 20:41:21
// Design Name: 
// Module Name: ram_test
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


module ram_test(
    clkb_0,
    rstb_0,
    addrb_0,
    dinb_0,
//    doutb_0,
    enb_0,
    web_0
    );
    input   clkb_0;
    input   rstb_0;
    output reg [31:0] dinb_0;
(*DONT_TOUCH= "{TURE|FALSE}" *)   output reg [31:0] addrb_0;
//(*DONT_TOUCH= "{TURE|FALSE}" *)    input  wire[31:0] doutb_0;
(*DONT_TOUCH= "{TURE|FALSE}" *)    output reg enb_0;
(*DONT_TOUCH= "{TURE|FALSE}" *)     output reg [3:0] web_0;
//(*DONT_TOUCH= "{TURE|FALSE}" *)    reg [31:0]  data;
    reg [31:0]  wait_cnt;


      
always @(posedge clkb_0 or negedge rstb_0)
    begin
      if(rstb_0)
      begin
        addrb_0 <= 32'd0;
        dinb_0 <= 32'd0;
      end
      else if(wait_cnt <32'hfff)
        addrb_0 <= 32'd0;
      else if ( addrb_0 < 32'd8000)
        addrb_0 <= addrb_0 + 32'd4;
      else if(addrb_0 >= 32'd8000)
        addrb_0 <= 32'd0; 
      else 
        addrb_0 <= addrb_0;  
    end

always @(posedge clkb_0 or negedge rstb_0)
    begin
        if(rstb_0)  //这里的复位信号是高电平复位
            enb_0 <= 1'b0;
        else 
            enb_0 <= 1'b1;
    end 
    
    always @(posedge clkb_0 or negedge rstb_0)
    begin
        if(rstb_0)
            web_0 <= 4'b0000;
        else if(wait_cnt >32'hfff && wait_cnt <= 32'hfff_ffff)
            web_0 <= 4'b0000;
            else web_0 <= 4'b0000;
    end
    
      
//always @(posedge clkb_0 or negedge rstb_0)
//    begin
//        if(rstb_0)
//            data <= 32'b0;
//        else if(enb_0 == 1'b1)
//            data <= doutb_0; 
//        else data <= data;  
//    end 
  
always @(posedge clkb_0 or negedge rstb_0)
    begin
    if(rstb_0)
        wait_cnt <= 32'b0;
    else if (wait_cnt <= 32'h1fff_ffff)
        wait_cnt <= wait_cnt + 1'b1;
    else 
        wait_cnt <= 32'b0;   
    end
endmodule
