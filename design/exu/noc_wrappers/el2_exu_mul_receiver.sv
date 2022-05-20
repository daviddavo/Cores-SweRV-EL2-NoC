`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.05.2022 17:26:48
// Design Name: 
// Module Name: el2_exu_mul_receiver
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


module el2_exu_mul_receiver
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
   
   output logic [31:0]   result_x                   // Result
  );
  
  // TODO: We can use the valid bit to stall if the result has not arrived yet
  noc_serial_receiver #(
    .PACKET_BITS($bits(result_x))
  ) i_receiver (
    .clk     ( clk_noc        ),
    .rst     ( ~rst_l         ),
    .flush   ( noc_sr_flush   ),
    .down    ( down           ),
    .valid   ( valid          ), // Ignored
    .padding (                ),
    .packet  ( result_x       ));
endmodule
