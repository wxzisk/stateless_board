`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/03 12:18:42
// Design Name: 
// Module Name: top
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


module top(
    output [7 : 0] pci_exp_txp,
    output [7 : 0] pci_exp_txn,
    input [7 : 0]  pci_exp_rxp,
    input [7 : 0]  pci_exp_rxn,

    input                      sys_clk_p,
    input                      sys_clk_n,
    input                      sys_rst_n,
    output                     user_clk,
    // data and param from eth
    input [63:0]               data_from_eth,
    input                      fifo_empty,
    output                     fifo_rd_en,
    // event header stored in fifo
    input[63:0]                event_header,
    output                     event_header_in,
    //snd data to eth
    (*mark_debug = "true"*)(* keep = "true" *)input                     pcie_to_eth_full,
    (*mark_debug = "true"*)(* keep = "true" *)output[63:0]              data_to_eth,
    (*mark_debug = "true"*)(* keep = "true" *)output                    to_eth_en
              
    );
//    wire sys_rst_n_c;
//    IBUF   sys_reset_n_ibuf (.O(sys_rst_n_c), .I(sys_rst_n));
//        reg pcie_to_eth_full;
//         wire[63:0] data_to_eth;
//        wire to_eth_en;
        
//    wire user_clk;
    wire user_resetn;
      // Descriptor Bypass Control Logic
    
       wire c2h_dsc_byp_ready;
       wire c2h_dsc_byp_load;
       wire [63:0] c2h_dsc_byp_src_addr;
       wire [63:0] c2h_dsc_byp_dst_addr;
       wire [27:0] c2h_dsc_byp_len;
       wire [15:0] c2h_dsc_byp_ctl;
       
        wire h2c_dsc_byp_ready;
        wire h2c_dsc_byp_load;
        wire [63:0] h2c_dsc_byp_src_addr;
        wire [63:0] h2c_dsc_byp_dst_addr;
        wire [27:0] h2c_dsc_byp_len;
        wire [15:0] h2c_dsc_byp_ctl;
        
        wire [31:0] addrb;
        wire [63:0] dinb;
        wire enb;
        wire [7:0] web;
        wire [63:0] doutb;
        
        wire empty;
        wire [63:0] dout;
        wire rd_en;
        
        wire full_c2h;
        wire [155:0] din_c2h;
        wire wr_en_c2h;
        
        wire full_h2c;
        wire [155:0] din_h2c;
        wire wr_en_h2c;
        
        //axi lite
           //-- AXI Master Write Address Channel
         wire [31:0] m_axil_awaddr;
         wire [2:0]  m_axil_awprot;
         wire     m_axil_awvalid;
         wire     m_axil_awready;
     
         //-- AXI Master Write Data Channel
         wire [31:0] m_axil_wdata;
         wire [3:0]  m_axil_wstrb;
         wire     m_axil_wvalid;
         wire     m_axil_wready;
         //-- AXI Master Write Response Channel
         wire     m_axil_bvalid;
         wire     m_axil_bready;
         wire [1:0]  m_axil_bresp;
         //-- AXI Master Read Address Channel
         wire [31:0] m_axil_araddr;
         wire [2:0]  m_axil_arprot;
         wire     m_axil_arvalid;
         wire     m_axil_arready;
         //-- AXI Master Read Data Channel
         wire [31:0] m_axil_rdata;
         wire [1:0]  m_axil_rresp;
         wire     m_axil_rvalid;
         wire     m_axil_rready;

         
                  wire [7:0] status_ports_c2h_sts0;
                  wire [7:0] status_ports_h2c_sts0;
                  wire [7:0] status_ports_c2h_sts1;
                  wire [7:0] status_ports_h2c_sts1;
                 
                 reg h_h2c_success;
                 reg h_c2h_success;
                 reg c_h2c_success;
                 reg c_c2h_success;
                 
                 reg h_h2c_sts_reg;
                 reg h_c2h_sts_reg;
                 reg c_h2c_sts_reg;
                 reg c_c2h_sts_reg;
                 
                 
                 
                 always @ (posedge user_clk) begin
                     if (!user_resetn) begin
                         h_h2c_sts_reg <= 1'b0;
                         h_h2c_success <= 1'b0;
                         
                         h_c2h_sts_reg <= 1'b0;
                         h_c2h_success <= 1'b0;
                         
                         c_h2c_success <= 1'b0;
                         
                         c_c2h_success <= 1'b0;
                         
                     end else begin
                         h_h2c_sts_reg <= status_ports_h2c_sts1[0:0];
                         h_h2c_success <= (~status_ports_h2c_sts1[0:0]) & h_h2c_sts_reg;
                         
                         h_c2h_sts_reg <= status_ports_c2h_sts1[0:0];
                         h_c2h_success <= (~status_ports_c2h_sts1[0:0]) & h_c2h_sts_reg;
                         
                         c_h2c_success <= status_ports_h2c_sts0[3:3];
                         
                         c_c2h_success <= status_ports_c2h_sts0[3:3];
                                 
                     end
                 end
    
    xdma_and_ram xdma_and_ram_i(
    .sys_rst_n       ( sys_rst_n ),
    .refclk_clk_p    (sys_clk_p),
    .refclk_clk_n    (sys_clk_n),
    
    // Tx
    .pci_exp_txn     ( pci_exp_txn ),
    .pci_exp_txp     ( pci_exp_txp ),
    
    // Rx
    .pci_exp_rxn     ( pci_exp_rxn ),
    .pci_exp_rxp     ( pci_exp_rxp ),
    
    .axi_aclk   (user_clk),
    .axi_aresetn (user_resetn),
    
    .c2h_dsc_byp_ready    (c2h_dsc_byp_ready),
    .c2h_dsc_byp_src_addr (c2h_dsc_byp_src_addr),
    .c2h_dsc_byp_dst_addr (c2h_dsc_byp_dst_addr),
    .c2h_dsc_byp_len      (c2h_dsc_byp_len),
    .c2h_dsc_byp_ctl      (c2h_dsc_byp_ctl),
    .c2h_dsc_byp_load     (c2h_dsc_byp_load),
    
    .h2c_dsc_byp_ready    (h2c_dsc_byp_ready),
    .h2c_dsc_byp_src_addr (h2c_dsc_byp_src_addr),
    .h2c_dsc_byp_dst_addr (h2c_dsc_byp_dst_addr),
    .h2c_dsc_byp_len      (h2c_dsc_byp_len),
    .h2c_dsc_byp_ctl      (h2c_dsc_byp_ctl),
    .h2c_dsc_byp_load     (h2c_dsc_byp_load),
    
    .status_ports_c2h_sts0 (status_ports_c2h_sts0),
    .status_ports_c2h_sts1 (status_ports_c2h_sts1),
    .status_ports_h2c_sts0 (status_ports_h2c_sts0),
    .status_ports_h2c_sts1 (status_ports_h2c_sts1),
    
    .addrb (addrb),
    .dinb (dinb),
    .enb (1),
    .web (web),
    .doutb(doutb)
     
    );
    
    dsc_gen_all dsc_gen_all_i(
        .c2h_dsc_byp_ready(c2h_dsc_byp_ready),
        .c2h_dsc_byp_load(c2h_dsc_byp_load),
        .c2h_dsc_byp_src_addr(c2h_dsc_byp_src_addr),
        .c2h_dsc_byp_dst_addr(c2h_dsc_byp_dst_addr),
        .c2h_dsc_byp_len(c2h_dsc_byp_len),
        .c2h_dsc_byp_ctl(c2h_dsc_byp_ctl),
     
        .h2c_dsc_byp_ready(h2c_dsc_byp_ready),
        .h2c_dsc_byp_load(h2c_dsc_byp_load),
        .h2c_dsc_byp_src_addr(h2c_dsc_byp_src_addr),
        .h2c_dsc_byp_dst_addr(h2c_dsc_byp_dst_addr),
        .h2c_dsc_byp_len(h2c_dsc_byp_len),
        .h2c_dsc_byp_ctl(h2c_dsc_byp_ctl),
        
        .full_c2h(full_c2h),
        .din_c2h(din_c2h),
        .wr_en_c2h(wr_en_c2h),
        
        .full_h2c(full_h2c),
        .din_h2c(din_h2c),
        .wr_en_h2c(wr_en_h2c),
        
        .clk(user_clk),
        .rst_n(sys_rst_n)
    );
    
despatch despatch_i(
    .clk(user_clk),
    .rst_n (sys_rst_n),
    .addrb(addrb),
    .dinb(dinb),
    .enb(enb),
    .web(web),
    .doutb(doutb),
            
    .fifo_empty(fifo_empty),
    .data_from_eth(data_from_eth),
    .fifo_rd_en(fifo_rd_en),
    
    .pcie_to_eth_full(pcie_to_eth_full),
    .data_to_eth_1(data_to_eth),
    .to_eth_en(to_eth_en),
    
    .event_header(event_header),
    .event_header_in(event_header_in),
    
    .full_c2h(full_c2h),
    .din_c2h(din_c2h),
    .wr_en_c2h(wr_en_c2h),
            
    .full_h2c(full_h2c),
    .din_h2c(din_h2c),
    .wr_en_h2c(wr_en_h2c),
            
    .h_h2c_success(h_h2c_success),
    .h_c2h_success(h_c2h_success),
    .c_h2c_success(c_h2c_success),
    .c_c2h_success(c_c2h_success)
    );
    
endmodule
