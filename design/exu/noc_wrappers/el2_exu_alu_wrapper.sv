`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.05.2022 13:53:22
// Design Name: 
// Module Name: el2_exu_alu_wrapper
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


module el2_exu_alu_wrapper
import noc_types::*;
import el2_pkg::*;
#(
`include "el2_param.vh"   
)
   (
   node_port.down down0,          // From NoC output
   node_port.down down1,          // From NoC output
   node_port.up   up,             // To NoC output
   
   input logic    clk,            // Top level clock
   input logic    clk_noc,        // Exu NoC clock
   input logic    rst_l,          // Reset
   input logic    noc_sr_flush,   // Flush
   input logic    scan_mode       // scan mode
   );
   
   // ALU INPUTS
   logic                  flush_upper_x;      // Branch flush from previous cycle
   logic                  flush_lower_r;      // Master flush of entire pipeline
   logic                  enable;             // Clock enable
   logic                  valid_in;           // Valid
   el2_alu_pkt_t          ap;                 // predecodes
   logic                  csr_ren_in;         // CSR select
   logic        [31:0]    csr_rddata_in;      // CSR data
   logic signed [31:0]    a_in;               // A operand
   logic        [31:0]    b_in;               // B operand
   logic        [31:1]    pc_in;              // for pc=pc+2,4 calculations
   el2_predict_pkt_t      pp_in;              // Predicted branch structure
   logic        [12:1]    brimm_in;           // Branch offset
   // END ALU INPUTS
   
   // ALU OUTPUTS
   logic        [31:0]    result_ff;          // final result
   logic                  flush_upper_out;    // Branch flush
   logic                  flush_final_out;    // Branch flush or flush entire pipeline
   logic        [31:1]    flush_path_out;     // Branch flush PC
   logic        [31:1]    pc_ff;              // flopped PC
   logic                  pred_correct_out;   // NPC control
   el2_predict_pkt_t      predict_p_out;      // Predicted branch structure
   // END ALU OUTPUTS
   
   el2_exu_alu_ctl #(.pt(pt)) i_alu (.*);
   
   noc_serial_receiver #(
        .PACKET_BITS($bits(`ALU_PACKET0)),
        .PADDING_BITS($bits(`ALU_PADDING0))
   ) i_receiver0 (
    .clk      ( clk_noc             ),
    .rst      ( ~rst_l              ),
    .flush    ( noc_sr_flush        ),
    .down     ( down0               ),
    .valid    ( valid0              ), // TODO: Use valid for smth
    .padding  ( `ALU_PADDING0       ),
    .packet   ( `ALU_PACKET0        ));
   
   noc_serial_receiver #(
        .PACKET_BITS($bits(`ALU_PACKET1)),
        .PADDING_BITS($bits(`ALU_PADDING1))
   ) i_receiver1 (
    .clk      ( clk_noc             ),
    .rst      ( ~rst_l              ),
    .flush    ( noc_sr_flush        ),
    .down     ( down1               ),
    .valid    ( valid1              ), // TODO: Use valid for smth
    .padding  ( `ALU_PADDING1       ),
    .packet   ( `ALU_PACKET1        ));
    
   noc_serial_sender #(
    .PACKET_BITS( $bits(`ALU_PACKET_RESULT) ),
    .PADDING_BITS( $bits(`ALU_PADDING_RESULT) )
   ) i_sender (
    .clk       ( clk_noc             ),
    .rst       ( ~rst_l              ),
    .flush     ( noc_sr_flush        ),
    .enable    ( 1'b1                ),
    .dst_addr  ( `POS_ALU_RCV        ),
    .padding   ( `ALU_PADDING_RESULT ),
    .packet    ( `ALU_PACKET_RESULT  ),
    .ack       ( ack                 ),
    .up        ( up                  ));
endmodule
