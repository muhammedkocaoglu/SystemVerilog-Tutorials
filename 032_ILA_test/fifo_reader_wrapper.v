`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: MUHAMMED KOCAOGLU
// 
// Create Date: 05/09/2023 08:45:32 PM
// Design Name: 
// Module Name: fifo_reader_wrapper
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


module fifo_reader_wrapper(
    input  wire CLK,
    input  wire EMPTY,
    output wire RD_EN
  );
  fifo_reader fifo_reader(
    .CLK(CLK),
    .EMPTY(EMPTY),
    .RD_EN(RD_EN)
  );
endmodule
