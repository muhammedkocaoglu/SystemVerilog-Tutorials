`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/20/2022 10:03:37 AM
// Design Name: 
// Module Name: digital_multiplier
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


module digital_multiplier # (
      parameter N = 4
   )(
      input  logic [N-1:0]   mul_srcA_i,
      input  logic [N-1:0]   mul_srcB_i,
      output logic [N*2-1:0] mul_result_o
   );

   logic [N*2-1:0] temp;
   logic [N*2-1:0] mul_result_int;

   always_comb begin 
      mul_result_int = 0;
      temp  = {{N{1'b0}}, mul_srcB_i};
      for (int i = 0; i < N; i++) begin
         if (mul_srcA_i[i]) begin
            mul_result_int = mul_result_int + temp;
         end
         temp = temp << 1; // shift left
      end
   end

   assign mul_result_o = mul_result_int;

endmodule
