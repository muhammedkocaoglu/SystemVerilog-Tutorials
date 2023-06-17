`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: MUHAMMED KOCAOGLU
// 
// Create Date: 04/01/2023 08:48:11 AM
// Design Name: 
// Module Name: uart_tx
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


module uart_tx(
    input  logic        CLK,
    input  logic        SRSTN,
    input  logic [15:0] CLKDIV,
    input  logic [7:0]  TX_DIN,
    input  logic        TX_ENA,
    output logic        TX_DONE,
    output logic        TX_SERIAL
  );

  typedef enum logic { S_IDLE, S_TRANSFER } t_state;
  t_state state;

  logic [15:0] cntr;
  logic [3:0]  bitcntr; // 0000 -- 1111
  logic [9:0]  tx_buffer;

  always_ff @(posedge CLK) begin
    if (!SRSTN) begin
      state <= S_IDLE;
      TX_DONE <= 1'b0;
      TX_SERIAL <= 1'b1;
    end else begin
      case (state)
        S_IDLE: begin
          TX_SERIAL <= 1'b1;
          TX_DONE <= 1'b0;
          if (TX_ENA) begin
            state <= S_TRANSFER;
            cntr <= 0;
            bitcntr <= 0;
            tx_buffer <= {1'b1, TX_DIN, 1'b0};
          end
        end

        S_TRANSFER: begin
          TX_SERIAL <= tx_buffer[0];
          cntr <= cntr + 1;
          if (cntr == CLKDIV) begin
            cntr <= 0;
            bitcntr <= bitcntr + 1;
            tx_buffer[8:0] <= tx_buffer[9:1];
            if (bitcntr == 9) begin
              TX_DONE <= 1'b1;
              state <= S_IDLE;
            end
          end
        end
      endcase
    end
  end
endmodule