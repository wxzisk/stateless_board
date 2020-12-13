`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/17 13:43:44
// Design Name: 
// Module Name: portb_ctrl
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
////////////////////////////////////////////////////////////////////////////// ////


module portb_ctrl(
    input clk,
    input rst_n,
    input[63:0] rec_udp_data,//data recived
    input[31:0] rec_udp_data_addr,
    output reg[31:0] addrb_0,
    output reg enb_0,
    output reg[7:0] web_0,
    output reg FIFO_wr_en_p2e,
    output reg FIFO_rd_en_e2p,
    output reg [63:0] dinb_0,
    input 	pcie_to_eth_full,
    input eth_to_pcie_empty
    
    
    );
 
 reg [13:0] cnt;
 
//always @(posedge clk or negedge rst_n)
//begin
//    if(rst_n == 0)
//        begin
//        addrb_0 <= 0;
//        enb_0 <= 0;
//        web_0 <= 0 ; 
//        cnt <=0;
//        wr_en <=0;
//        end
//    else
//        begin
//            if(cnt>14'd8192)
//                begin
//                addrb_0 <= 0;
//                enb_0 <= 0;
//                web_0 <= 0;
//                cnt <= cnt+14'd4;
//                wr_en <= 0;
//                end
//            else
//                begin
//                addrb_0 <= addrb_0 + 14'd4;
//                enb_0 <= 1;
//                web_0 <= 0;
//                cnt <=cnt + 14'd4;
//                wr_en <= 1;
//                end
//    end
//end
always @(posedge clk or negedge rst_n)
begin
    if(rst_n == 0)
        begin
        addrb_0 <= 0;
        enb_0 <= 0;
        web_0 <= 0 ; 
        cnt <=0;
        FIFO_wr_en_p2e <=0;
        dinb_0 <= 0;
        FIFO_rd_en_e2p <= 0 ;
        end
    else if(eth_to_pcie_empty == 0)
        begin
                addrb_0 <= cnt;
                enb_0 <= 1;
                web_0 <= 8'hff;
                dinb_0 <= rec_udp_data;
                cnt <= cnt+14'd4;
                FIFO_wr_en_p2e <= 0;
                FIFO_rd_en_e2p <= ~eth_to_pcie_empty;
                end
     else   
                begin
                addrb_0 <= 0;
                enb_0 <= 0;
                web_0 <= 0;
                dinb_0 <=  0;
                cnt <=0;
                FIFO_wr_en_p2e <= 0;
                FIFO_rd_en_e2p <= 0;
                end

end
endmodule
