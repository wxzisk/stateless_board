// (c) Copyright 1995-2020 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.

// IP VLNV: xilinx.com:ip:ten_gig_eth_pcs_pma:6.0
// IP Revision: 11

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
ten_gig_eth_pcs_pma_0 your_instance_name (
  .rxrecclk_out(rxrecclk_out),                  // output wire rxrecclk_out
  .coreclk(coreclk),                            // input wire coreclk
  .dclk(dclk),                                  // input wire dclk
  .txusrclk(txusrclk),                          // input wire txusrclk
  .txusrclk2(txusrclk2),                        // input wire txusrclk2
  .areset(areset),                              // input wire areset
  .txoutclk(txoutclk),                          // output wire txoutclk
  .areset_coreclk(areset_coreclk),              // input wire areset_coreclk
  .gttxreset(gttxreset),                        // input wire gttxreset
  .gtrxreset(gtrxreset),                        // input wire gtrxreset
  .txuserrdy(txuserrdy),                        // input wire txuserrdy
  .qpll0lock(qpll0lock),                        // input wire qpll0lock
  .qpll0outclk(qpll0outclk),                    // input wire qpll0outclk
  .qpll0outrefclk(qpll0outrefclk),              // input wire qpll0outrefclk
  .reset_counter_done(reset_counter_done),      // input wire reset_counter_done
  .txp(txp),                                    // output wire txp
  .txn(txn),                                    // output wire txn
  .rxp(rxp),                                    // input wire rxp
  .rxn(rxn),                                    // input wire rxn
  .sim_speedup_control(sim_speedup_control),    // input wire sim_speedup_control
  .reset_tx_bufg_gt(reset_tx_bufg_gt),          // output wire reset_tx_bufg_gt
  .qpll0reset(qpll0reset),                      // output wire qpll0reset
  .xgmii_txd(xgmii_txd),                        // input wire [63 : 0] xgmii_txd
  .xgmii_txc(xgmii_txc),                        // input wire [7 : 0] xgmii_txc
  .xgmii_rxd(xgmii_rxd),                        // output wire [63 : 0] xgmii_rxd
  .xgmii_rxc(xgmii_rxc),                        // output wire [7 : 0] xgmii_rxc
  .configuration_vector(configuration_vector),  // input wire [535 : 0] configuration_vector
  .status_vector(status_vector),                // output wire [447 : 0] status_vector
  .core_status(core_status),                    // output wire [7 : 0] core_status
  .tx_resetdone(tx_resetdone),                  // output wire tx_resetdone
  .rx_resetdone(rx_resetdone),                  // output wire rx_resetdone
  .signal_detect(signal_detect),                // input wire signal_detect
  .tx_fault(tx_fault),                          // input wire tx_fault
  .drp_req(drp_req),                            // output wire drp_req
  .drp_gnt(drp_gnt),                            // input wire drp_gnt
  .core_to_gt_drpen(core_to_gt_drpen),          // output wire core_to_gt_drpen
  .core_to_gt_drpwe(core_to_gt_drpwe),          // output wire core_to_gt_drpwe
  .core_to_gt_drpaddr(core_to_gt_drpaddr),      // output wire [15 : 0] core_to_gt_drpaddr
  .core_to_gt_drpdi(core_to_gt_drpdi),          // output wire [15 : 0] core_to_gt_drpdi
  .gt_drprdy(gt_drprdy),                        // output wire gt_drprdy
  .gt_drpdo(gt_drpdo),                          // output wire [15 : 0] gt_drpdo
  .gt_drpen(gt_drpen),                          // input wire gt_drpen
  .gt_drpwe(gt_drpwe),                          // input wire gt_drpwe
  .gt_drpaddr(gt_drpaddr),                      // input wire [15 : 0] gt_drpaddr
  .gt_drpdi(gt_drpdi),                          // input wire [15 : 0] gt_drpdi
  .core_to_gt_drprdy(core_to_gt_drprdy),        // input wire core_to_gt_drprdy
  .core_to_gt_drpdo(core_to_gt_drpdo),          // input wire [15 : 0] core_to_gt_drpdo
  .tx_disable(tx_disable),                      // output wire tx_disable
  .pma_pmd_type(pma_pmd_type)                  // input wire [2 : 0] pma_pmd_type
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

// You must compile the wrapper file ten_gig_eth_pcs_pma_0.v when simulating
// the core, ten_gig_eth_pcs_pma_0. When compiling the wrapper file, be sure to
// reference the Verilog simulation library.

