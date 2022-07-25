`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2022 07:18:00 PM
// Design Name: 
// Module Name: alu
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

import alu_pkg::*;

module alu(
   input  logic [N-1:0] A,
   input  logic [N-1:0] B,
   input  logic [2:0]   opcode,
   output logic [N-1:0] Y
);

   always_comb begin
      case(opcode)
         0:    Y = add_alu(A, B);
         1:    Y = sub_alu(A, B);
         2:    Y = sub_alu(A, 1);
         3:    Y = add_alu(A, 1);
         4:    Y = inverse_alu(A);
         5:    Y = and_alu(A, B);
         6:    Y = or_alu(A, B);
         7:    Y = xor_alu(A, B);
         default: Y = '0;
      endcase
   end

endmodule
