`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.04.2022 20:10:58
// Design Name: 
// Module Name: el2_exu_div_sender
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
module el2_exu_div_sender
import el2_pkg::*;
import noc_types::*;
import noc_functions::build_header;
(
   node_port.up          up,                        // To NoC input
  
   input logic           clk,                       // RISC-V NoC
   input logic           clk_noc,                   // Exu NoC clock
   input logic           rst_l,                     // Reset

   input el2_div_pkt_t   dp,                         // valid, sign, rem
   input logic  [31:0]   dividend,                  // Numerator
   input logic  [31:0]   divisor,                   // Denominator

   input logic           cancel                     // Cancel divide
  );
  
  // TODO: When to flush??
  
  noc_serial_sender #(
    .PACKET_BITS($bits(dividend) + $bits(divisor)),
    .PADDING_BITS($bits(dp)+1)
  ) i_sender (
    .clk      ( clk_noc               ),
    .rst      ( ~rst_l                ),
    .dst_addr ( `POS_DIV_WRAPPER      ),
    .enable   ( dp.valid              ),
    .flush    ( flush                 ),
    .padding  ( { dp, cancel }        ),
    .packet   ( { dividend, divisor } ),
    .ack      (                       ),
    .up       ( up                    ));
endmodule
