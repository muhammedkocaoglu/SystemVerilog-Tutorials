`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/24/2022 10:29:50 PM
// Design Name: 
// Module Name: tb_user_defined_type
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


module tb_user_defined_type(

   );

   typedef logic [7:0] muhammed_t;

   muhammed_t [3:0] a;

   initial begin
      a[0] = 8'hAB;
      a[1] = 8'h45;
      a[2] = 8'hde;
      a[3] = 8'hc6;
      #50;
      $stop;
   end

endmodule

