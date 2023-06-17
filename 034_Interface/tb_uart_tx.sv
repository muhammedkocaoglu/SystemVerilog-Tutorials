`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: MUHAMMED KOCAOGLU
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

  uart_tx_if   _uart_tx(); // create an instance of interface
  logic        CLK = 0;
  logic        SRSTN;

  always #5 CLK <= ~CLK;

  initial begin
    _uart_tx.CLKDIV = 100000000/115200-1;
    SRSTN <= 1'b0;
    #50;
    SRSTN <= 1'b1;

    #50;
    _uart_tx.TX_ENA <= 1'b1;
    _uart_tx.TX_DIN <= 8'hAB;
    #10;
    _uart_tx.TX_ENA <= 1'b0;

    @(posedge _uart_tx.TX_DONE);
    #1000;
    _uart_tx.TX_ENA <= 1'b1;
    _uart_tx.TX_DIN <= 8'h0F;
    #10;
    _uart_tx.TX_ENA <= 1'b0;

    @(posedge _uart_tx.TX_DONE);
    #1000;
    $stop;
  end

  uart_tx uart_tx( 
    .CLK(CLK),
    .SRSTN(SRSTN),
    .CLKDIV(_uart_tx.CLKDIV),
    .TX_DIN(_uart_tx.TX_DIN),
    .TX_ENA(_uart_tx.TX_ENA),
    .TX_DONE(_uart_tx.TX_DONE),
    .TX_SERIAL(_uart_tx.TX_SERIAL)
     );

endmodule