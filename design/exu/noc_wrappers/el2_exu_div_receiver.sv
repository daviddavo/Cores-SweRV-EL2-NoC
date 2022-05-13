`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.04.2022 20:10:58
// Design Name: 
// Module Name: el2_exu_div_wrapper
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
module el2_exu_div_receiver
import el2_pkg::*;
import noc_types::*;
#(
`include "el2_param.vh"
)
  (
   node_port.down        down,                      // From NoC output
  
   input logic           clk_noc,                   // NoC clock
   input logic           rst_l,                     // Reset
   
   input logic           noc_sr_flush,              // Allows sending new data

   output logic          finish_dly,                // Finish to match data
   output logic [31:0]   out                        // Result
  );
  
  assign finish_dly = valid; 
  
  noc_serial_receiver #(
    .PACKET_BITS($bits(out))
  ) i_receiver (
    .clk     ( clk_noc        ),
    .rst     ( ~rst_l         ),
    .flush   ( noc_sr_flush   ), // TODO: Use flush for smth
    .down    ( down           ),
    .valid   ( valid          ),
    .padding (                ),
    .packet  ( out            ));
endmodule
