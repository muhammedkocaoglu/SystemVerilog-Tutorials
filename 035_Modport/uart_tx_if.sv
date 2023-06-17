`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2023 09:04:53 AM
// Design Name: 
// Module Name: uart_tx_if
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


interface uart_tx_if;
  logic [15:0] CLKDIV;
  logic [7:0]  TX_DIN;
  logic        TX_ENA;
  logic        TX_DONE;
  logic        TX_SERIAL;

  modport uart_tx_mp (
    input  CLKDIV,
    input  TX_DIN,
    input  TX_ENA,
    output TX_DONE,
    output TX_SERIAL
  );
endinterface
