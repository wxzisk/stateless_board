`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2020 10:13:48 AM
// Design Name: 
// Module Name: dsc_gen_all
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


module dsc_gen_all(
    //c2h port
     input wire c2h_dsc_byp_ready,
     output wire c2h_dsc_byp_load,
     output wire [63:0] c2h_dsc_byp_src_addr,
     output wire [63:0] c2h_dsc_byp_dst_addr,
     output wire [27:0] c2h_dsc_byp_len,
     output wire [15:0] c2h_dsc_byp_ctl,
     
    //h2c port
     input wire h2c_dsc_byp_ready,
     output wire h2c_dsc_byp_load,     
     output wire [63:0] h2c_dsc_byp_src_addr,
     output wire [63:0] h2c_dsc_byp_dst_addr,
     output wire [27:0] h2c_dsc_byp_len,
     output wire [15:0] h2c_dsc_byp_ctl,
     
     //fifo port
     output wire full_c2h,
     input wire [155:0] din_c2h,
     input wire wr_en_c2h,
     
     output wire full_h2c,
     input wire [155:0] din_h2c,
     input wire wr_en_h2c,
    //data from wangge
//     input  wire [63:0]  data_src_addr,
//     input wire [63:0]  data_dst_addr,
//     input wire [31:0]  data_num,
//     input wire direction,

       //component by src[64] dst[64] len[28] direction[1]
//       input wire [156:0] info,
//       input wire empty,
       
     
    //clk and rst
     input wire clk,
     input wire rst_n
    );
    //wire that connect dsc_gen with fifo
          wire c2h_complete;
//          reg [63:0]  c2h_data_src_addr;
//          reg [63:0]  c2h_data_dst_addr;
//          reg [31:0]  c2h_data_num;
          wire     c2h_init;
          wire [155:0] c2h_info_out;
          reg [155:0] c2h_info_in;
          reg c2h_info_in_en;

          wire h2c_complete;
//          reg [63:0]  h2c_data_src_addr;
//          reg [63:0]  h2c_data_dst_addr;
//          reg [31:0]  h2c_data_num;
          wire     h2c_init;
          wire [155:0] h2c_info_out;
          reg [155:0] h2c_info_in;
          reg h2c_info_in_en;
           
          
    
dsc_gen dsc_gen_c2h(
        .dsc_byp_ready(c2h_dsc_byp_ready),
        .dsc_byp_load(c2h_dsc_byp_load),
        .dsc_byp_src_addr(c2h_dsc_byp_src_addr),
        .dsc_byp_dst_addr(c2h_dsc_byp_dst_addr),
        .dsc_byp_len(c2h_dsc_byp_len),
        .dsc_byp_ctl(c2h_dsc_byp_ctl),
        
        .init(c2h_init),
        .complete(c2h_complete),
        .data_src_addr(c2h_info_out[91:28]),
        .data_dst_addr(c2h_info_out[155:92]),
        .data_num(c2h_info_out[27:0]),
              
        .clk(clk),
        .rst_n(rst_n)
    );
    
    dsc_gen dsc_gen_h2c(
        .dsc_byp_ready(h2c_dsc_byp_ready),
        .dsc_byp_load(h2c_dsc_byp_load),
        .dsc_byp_src_addr(h2c_dsc_byp_src_addr),
        .dsc_byp_dst_addr(h2c_dsc_byp_dst_addr),
        .dsc_byp_len(h2c_dsc_byp_len),
        .dsc_byp_ctl(h2c_dsc_byp_ctl),
        
        .init(h2c_init),
        .complete(h2c_complete),
        .data_src_addr(h2c_info_out[155:92]),
        .data_dst_addr(h2c_info_out[91:28]),
        .data_num(h2c_info_out[27:0]),
        
        .clk(clk),
        .rst_n(rst_n)
    ); 
    
dsc_gen_fifo fifo_generator_0_c2h(
    .full(full_c2h),
    .din(din_c2h),
    .wr_en(wr_en_c2h),
    .wr_rst_busy(),
    
    .empty(c2h_init),
    .dout(c2h_info_out),
    .rd_en(c2h_complete),
    .rd_rst_busy(),
    
    .clk(clk),
    .srst(~rst_n)

);

dsc_gen_fifo fifo_generator_0_h2c(
    .full(full_h2c),
    .din(din_h2c),
    .wr_en(wr_en_h2c),
    .wr_rst_busy(),
    
    .empty(h2c_init),
    .dout(h2c_info_out),
    .rd_en(h2c_complete),
    .rd_rst_busy(),
    
    .clk(clk),
    .srst(~rst_n)

);

endmodule
