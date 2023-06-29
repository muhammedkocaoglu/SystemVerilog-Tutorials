`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/27/2023 04:48:39 PM
// Design Name: 
// Module Name: uart_if
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


interface uart_if;
  logic [15:0] CLKDIV;
  logic [7:0]  DATA;
  logic        ENA;
  logic        DONE;
  logic        SERIAL;

  modport uart_tx_mp(
    input  CLKDIV,
    input  DATA,
    input  ENA,
    output DONE,
    output SERIAL
  );
  
endinterface
