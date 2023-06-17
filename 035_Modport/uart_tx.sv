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
    input  logic          CLK,
    input  logic          SRSTN,
    uart_tx_if.uart_tx_mp _uart_tx
  );

  typedef enum logic { S_IDLE, S_TRANSFER } t_state;
  t_state state;

  logic [15:0] cntr;
  logic [3:0]  bitcntr; // 0000 -- 1111
  logic [9:0]  tx_buffer;

  always_ff @(posedge CLK) begin
    if (!SRSTN) begin
      state <= S_IDLE;
      _uart_tx.TX_DONE <= 1'b0;
      _uart_tx.TX_SERIAL <= 1'b1;
    end else begin
      case (state)
        S_IDLE: begin
          _uart_tx.TX_SERIAL <= 1'b1;
          _uart_tx.TX_DONE <= 1'b0;
          if (_uart_tx.TX_ENA) begin
            state <= S_TRANSFER;
            cntr <= 0;
            bitcntr <= 0;
            tx_buffer <= {1'b1, _uart_tx.TX_DIN, 1'b0};
          end
        end

        S_TRANSFER: begin
          _uart_tx.TX_SERIAL <= tx_buffer[0];
          cntr <= cntr + 1;
          if (cntr == _uart_tx.CLKDIV) begin
            cntr <= 0;
            bitcntr <= bitcntr + 1;
            tx_buffer[8:0] <= tx_buffer[9:1];
            if (bitcntr == 9) begin
              _uart_tx.TX_DONE <= 1'b1;
              state <= S_IDLE;
            end
          end
        end
      endcase
    end
  end
endmodule