`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.05.2022 13:17:49
// Design Name: 
// Module Name: el2_exu_alu_sender
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


module el2_exu_alu_sender
import el2_pkg::*;
import noc_types::*;
(
   node_port.up          up0,                       // To NoC input
   node_port.up          up1,
  
   input logic           clk_noc,                   // Exu NoC clock
   input logic           rst_l,                     // Reset
   input logic           noc_sr_flush,              // Allows sending new data
   
   input  logic                  flush_upper_x,      // Branch flush from previous cycle
   input  logic                  flush_lower_r,      // Master flush of entire pipeline
   input  logic                  enable,             // Clock enable
   input  logic                  valid_in,           // Valid
   input  el2_alu_pkt_t          ap,                 // predecodes
   input  logic                  csr_ren_in,         // CSR select
   input  logic        [31:0]    csr_rddata_in,      // CSR data
   input  logic signed [31:0]    a_in,               // A operand
   input  logic        [31:0]    b_in,               // B operand
   input  logic        [31:1]    pc_in,              // for pc=pc+2,4 calculations
   input  el2_predict_pkt_t      pp_in,              // Predicted branch structure
   input  logic        [12:1]    brimm_in            // Branch offset
   );
   
   logic sender_enable;
   assign sender_enable = 1'b1;
   
   noc_serial_sender #(
      .PACKET_BITS($bits(`ALU_PACKET0)),
      .PADDING_BITS($bits(`ALU_PADDING0))
   ) i_sender0 (
    .clk      ( clk_noc               ),
    .rst      ( ~rst_l                ),
    .dst_addr ( `POS_ALU_WRAPPER0     ),
    .enable   ( sender_enable         ),
    .flush    ( noc_sr_flush          ),
    .padding  ( `ALU_PADDING0         ),
    .packet   ( `ALU_PACKET0          ),
    .ack      (                       ),
    .up       ( up0                   ));
    
   noc_serial_sender #(
      .PACKET_BITS($bits(`ALU_PACKET1)),
      .PADDING_BITS($bits(`ALU_PADDING1))
   ) i_sender1 (
    .clk      ( clk_noc               ),
    .rst      ( ~rst_l                ),
    .dst_addr ( `POS_ALU_WRAPPER1     ),
    .enable   ( sender_enable         ),
    .flush    ( noc_sr_flush          ),
    .padding  ( `ALU_PADDING1         ),
    .packet   ( `ALU_PACKET1          ),
    .ack      (                       ),
    .up       ( up1                   ));
endmodule
