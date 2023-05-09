`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: MUHAMMED KOCAOGLU
// 
// Create Date: 05/09/2023 08:41:53 PM
// Design Name: 
// Module Name: fifo_reader
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


module fifo_reader(
    input  logic CLK,
    input  logic EMPTY,
    output logic RD_EN
  );

  logic [3:0] cntr=0;

  always_ff @(posedge CLK) begin
      cntr <= cntr + 1;
      if (cntr == 4'b1111) begin
        if (!EMPTY) begin    
          RD_EN <= 1'b1;
        end
      end else begin
        RD_EN <= 1'b0;
      end
  end

endmodule
