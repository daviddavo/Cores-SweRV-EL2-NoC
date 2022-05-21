`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.05.2022 16:17:10
// Design Name: 
// Module Name: el2_exu_alu_receiver
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


module el2_exu_alu_receiver
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
   
   output logic        [31:0]    result_ff,          // final result
   output logic                  flush_upper_out,    // Branch flush
   output logic                  flush_final_out,    // Branch flush or flush entire pipeline
   output logic        [31:1]    flush_path_out,     // Branch flush PC
   output logic        [31:1]    pc_ff,              // flopped PC
   output logic                  pred_correct_out,   // NPC control
   output el2_predict_pkt_t      predict_p_out       // Predicted branch structure
   );
    
  noc_serial_receiver #(
    .PACKET_BITS( $bits(`ALU_PACKET_RESULT) ),
    .PADDING_BITS( $bits(`ALU_PADDING_RESULT) )
  ) i_receiver (
    .clk     ( clk_noc             ),
    .rst     ( ~rst_l              ),
    .flush   ( noc_sr_flush        ), // TODO: Use flush for smth
    .down    ( down                ),
    .valid   ( valid               ),
    .padding ( `ALU_PADDING_RESULT ),
    .packet  ( `ALU_PACKET_RESULT  ));
endmodule
