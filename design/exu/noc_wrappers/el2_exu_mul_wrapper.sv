module el2_exu_mul_wrapper
import el2_pkg::*;
import noc_types::*;
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
  
  wire [31:0] rs1_in, rs2_in, result_x;
  wire el2_mul_pkt_t mul_p;
  logic send_result, receiver_valid;
  
  // As the MUL always takes one clk, we just have to send packets
  // the next cycle
  always_ff @(posedge clk) send_result <= receiver_valid;
  
  el2_exu_mul_ctl #(.pt(pt)) i_mul (.*,
      .mul_p(mul_p),
      .rs1_in   (  rs1_in    ),   // I
      .rs2_in   (  rs2_in    ),   // I
      .result_x (  result_x  ));  // O
      
  noc_serial_receiver #(
     .PACKET_BITS($bits( { rs1_in, rs2_in, mul_p } )),
     .PADDING_BITS($bits(mul_p))
  ) i_receiver (
    .clk      ( clk_noc                    ),
    .rst      ( ~rst_l                     ),
    .flush    ( noc_sr_flush               ),
    .down     ( down                       ),
    .valid    ( receiver_valid             ),
    .padding  (                            ),
    .packet   ( { rs1_in, rs2_in, mul_p }  ));
    
  noc_serial_sender #(
    .PACKET_BITS($bits(result_x))
  ) i_sender (
    .clk      ( clk_noc             ),
    .rst      ( ~rst_l              ),
    .flush    ( noc_sr_flush        ),
    .enable   ( send_result         ), // Always enabled. the mul doesn't expose when it has made a calculation
    .dst_addr ( `POS_MUL_RCV        ),
    .padding  (                     ), // No padding
    .packet   ( result_x            ),
    .ack      ( ack                 ), // Ignored
    .up       ( up                  ));
endmodule