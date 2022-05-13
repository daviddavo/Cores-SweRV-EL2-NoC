`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.05.2022 18:08:02
// Design Name: 
// Module Name: edge_detector
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// Detects whether a rising_edge has happened on clk_slow. Uses clk_fast as base.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module edge_detector(
    input clk_fast,
    input clk_slow,
    output rising
);

logic q;

always_ff @(posedge clk_fast) q <= clk_slow;
assign rising = clk_slow & ~q;
endmodule
