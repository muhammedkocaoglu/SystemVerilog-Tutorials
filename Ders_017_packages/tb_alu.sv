`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2022 07:23:22 PM
// Design Name: 
// Module Name: tb_alu
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

module tb_alu;


logic [N-1:0] A;
logic [N-1:0] B;
logic [2:0]   opcode;
logic [N-1:0] Y;

alu alu_inst (
   .A          (A       ),
   .B          (B       ),
   .opcode     (opcode  ),
   .Y          (Y       )
);

initial begin
   #10;

   A = 73;
   B = 42;
   for (int i = 0; i < 8; i++) begin
      opcode = i;
      #5;
   end
end
endmodule

