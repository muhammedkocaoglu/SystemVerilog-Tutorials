`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/21/2022 08:48:48 AM
// Design Name: 
// Module Name: tb_digital_multiplier
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


module tb_digital_multiplier   # (
   parameter N = 8
);

   logic [N-1:0]     mul_srcA_i;
   logic [N-1:0]     mul_srcB_i;
   logic [N*2-1:0] mul_result_o;
   logic [N*2-1:0] mul_result_golden;

   digital_multiplier  # (
      .N(N)
   )
   digital_multiplier_inst (
      .mul_srcA_i    (mul_srcA_i    ),
      .mul_srcB_i    (mul_srcB_i    ),
      .mul_result_o  (mul_result_o  )
   );

   initial begin
      repeat(1000) begin
         mul_srcA_i  = $urandom();
         mul_srcB_i  = $urandom();
         mul_result_golden = mul_srcA_i * mul_srcB_i;
         #1;
         assert (mul_result_golden == mul_result_o) 
            $display("true");
         else
            $fatal("false");

         #5;
      end

      $stop;
   end
endmodule
