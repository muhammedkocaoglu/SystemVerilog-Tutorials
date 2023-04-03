`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: MUHAMMED KOCAOGLU
// 
// Create Date: 04/03/2023 09:03:15 PM
// Design Name: 
// Module Name: uart_rx
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


module uart_rx (
  input  logic        CLK,
  input  logic        SRSTN,
  input  logic [15:0] CLKDIV, // CLKFREQ/BAUDRATE-1
  input  logic        RX_SERIAL,
  output logic [7:0]  RX_DOUT,
  output logic        RX_DONE
);

  typedef enum logic { S_IDLE, S_RECEIVE } state_t;
  state_t state;

  logic [8:0]  rx_buffer;
  logic [3:0]  bitcntr;
  logic [15:0] cntr;

  always_ff @(posedge CLK) begin
    if (!SRSTN) begin
      state <= S_IDLE;
      RX_DONE <= 1'b0;
      cntr <= 0;
    end else begin
      case (state)
        S_IDLE: begin
          RX_DONE <= 1'b0;
          if (!RX_SERIAL) begin
            cntr <= cntr + 1;
            if (cntr == CLKDIV[15:1]) begin
              state <= S_RECEIVE;
              bitcntr <= 0;
              cntr <= 0;
            end
          end
        end

        S_RECEIVE: begin
          cntr <= cntr + 1;
          if (cntr == CLKDIV) begin
            cntr <= 0;
            bitcntr <= bitcntr + 1;
            rx_buffer <= {RX_SERIAL, rx_buffer[8:1]};
          end
          if (bitcntr == 9) begin
            RX_DOUT <= rx_buffer[7:0];
            RX_DONE <= 1'b1;
            state <= S_IDLE;
          end
        end
      endcase
    end
  end
endmodule