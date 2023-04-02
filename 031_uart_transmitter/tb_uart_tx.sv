`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2023 10:15:39 AM
// Design Name: 
// Module Name: tb_uart_tx
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


module tb_uart_tx(

  );

  logic        CLK = 0;
  logic        SRSTN;
  logic [15:0] CLKDIV = 100000000/115200-1;
  logic [7:0]  TX_DIN;
  logic        TX_ENA;
  logic        TX_DONE;
  logic        TX_SERIAL;

  always #5 CLK <= ~CLK;

  initial begin
    SRSTN <= 1'b0;
    #50;
    SRSTN <= 1'b1;

    #50;
    TX_ENA <= 1'b1;
    TX_DIN <= 8'hAB;
    #10;
    TX_ENA <= 1'b0;

    @(posedge TX_DONE);
    #1000;
    TX_ENA <= 1'b1;
    TX_DIN <= 8'h0F;
    #10;
    TX_ENA <= 1'b0;

    @(posedge TX_DONE);
    #1000;
    $stop;
  end

  uart_tx uart_tx( .* );

endmodule
