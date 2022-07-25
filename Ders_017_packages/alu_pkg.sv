`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2022 07:07:45 PM
// Design Name: 
// Module Name: alu_pkg
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


package alu_pkg;

   

   localparam N = 8;
   typedef logic [N-1:0] muhammed_t;

   typedef struct {
      muhammed_t     d1;
      muhammed_t     d2;
      logic [31:0]   d3;
   } my_struct_t;

   function logic add_alu(muhammed_t srcA, muhammed_t srcB);
      return srcA + srcB;
   endfunction

   function muhammed_t sub_alu(muhammed_t srcA, muhammed_t srcB);
      return srcA - srcB;
   endfunction

   function muhammed_t and_alu(muhammed_t srcA, muhammed_t srcB);
      return srcA & srcB;
   endfunction

   function muhammed_t or_alu(muhammed_t srcA, muhammed_t srcB);
      return srcA | srcB;
   endfunction

   function muhammed_t xor_alu(muhammed_t srcA, muhammed_t srcB);
      return srcA ^ srcB;
   endfunction

   function muhammed_t inverse_alu(muhammed_t srcA);
      return ~srcA;
   endfunction
endpackage
