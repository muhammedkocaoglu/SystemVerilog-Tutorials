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
  uart_if _uart_tx_if(); // _uart_tx_if.CLKDIV, _uart_tx_if.DATA

  always #5 CLK <= ~CLK;

  initial begin
    _uart_tx_if.CLKDIV = 100000000/115200-1;
    SRSTN <= 1'b0;
    #50;
    SRSTN <= 1'b1;

    #50;
    _uart_tx_if.ENA <= 1'b1;
    _uart_tx_if.DATA <= 8'hAB;
    #10;
    _uart_tx_if.ENA <= 1'b0;

    @(posedge _uart_tx_if.DONE);
    #1000;
    _uart_tx_if.ENA <= 1'b1;
    _uart_tx_if.DATA <= 8'h0F;
    #10;
    _uart_tx_if.ENA <= 1'b0;

    @(posedge _uart_tx_if.DONE);
    #1000;
    $stop;
  end

  uart_tx uart_tx( .* );

endmodule