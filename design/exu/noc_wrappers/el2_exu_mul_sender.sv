module el2_exu_mul_sender
import el2_pkg::*;
import noc_types::*;
(
   node_port.up          up,                        // To NoC input
  
   input logic           clk_noc,                   // Exu NoC clock
   input logic           rst_l,                     // Reset
   
   input logic           noc_sr_flush,              // Allows sending new data
   
   input el2_mul_pkt_t   mul_p,                     // {Valid, RS1 signed operand, RS2 signed operand, Select low 32-bits of result}

   input logic [31:0]    rs1_in,                    // A operand
   input logic [31:0]    rs2_in                     // B operand 
);
   noc_serial_sender #(
     .PACKET_BITS($bits( { rs1_in, rs2_in, mul_p } ))
   ) i_sender (
     .clk      ( clk_noc                   ),
     .rst      ( ~rst_l                    ),
     .dst_addr ( `POS_MUL_WRAPPER          ),
     .enable   ( mul_p.valid               ),
     .flush    ( noc_sr_flush              ),
     .padding  (                           ),
     .packet   ( { rs1_in, rs2_in, mul_p } ),
     .ack      (                           ), // Ignored
     .up       ( up                        ));
endmodule