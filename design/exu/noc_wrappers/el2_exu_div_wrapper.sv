`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.05.2022 16:34:26
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


module el2_exu_div_wrapper
import noc_types::*;
import el2_pkg::*;
#(
`include "el2_param.vh"   
)
  (
   node_port.down down,           // From NoC output
   node_port.up   up,             // To NoC output
   
   input logic    clk,            // Top level clock
   input logic    clk_noc,        // Exu NoC clock
   input logic    rst_l,          // Reset
   input logic    noc_sr_flush,   // Flush
   input logic    scan_mode       // scan mode
  );
  
  wire [31:0] dividend, divisor, out;
  wire div_cancel;
  wire el2_div_pkt_t div_p;
  
  // TODO: Whats scan_mode??
  el2_exu_div_ctl #(.pt(pt)) i_div (.*,
      .cancel     ( div_cancel     ),
      .dp         ( div_p          ),
      .dividend   ( dividend       ),
      .divisor    ( divisor        ),
      .finish_dly ( finish_dly     ),
      .out        ( out            ));
      
  noc_serial_receiver #(
    .PACKET_BITS($bits(dividend) + $bits(divisor)),
    .PADDING_BITS($bits(div_p)+1)
  ) i_receiver (
    .clk      ( clk_noc             ),
    .rst      ( ~rst_l              ),
    .flush    ( noc_sr_flush        ),
    .down     ( down                ),
    .valid    ( valid               ), // TODO: Use valid for smth
    .padding  ( {div_p, div_cancel} ),
    .packet   ( {dividend, divisor} ));
  
  noc_serial_sender #(
    .PACKET_BITS( $bits(out) )
  ) i_sender (
    .clk       ( clk_noc        ),
    .rst       ( ~rst_l         ),
    .flush     ( noc_sr_flush   ),
    .enable    ( finish_dly     ),
    .dst_addr  ( `POS_DIV_RCV   ),
    .padding   (                ),
    .packet    ( out            ),
    .ack       ( ack            ),
    .up        ( up             ));
endmodule
