`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2022 11:02:58 PM
// Design Name: 
// Module Name: sequence_detector
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


module sequence_detector(
        input  logic clk,
        input  logic rstn,
        input  logic din,
        output logic dout_mealy
    );

    typedef enum logic [1:0] { S0_MEALY, S1_MEALY, S2_MEALY, S3_MEALY } states_mealy;
    states_mealy state_mealy;

    always_ff @(posedge clk) begin
        if (!rstn) begin
            dout_mealy <= 1'b0;
            state_mealy <= S0_MEALY;
        end else begin
            case (state_mealy) 
                S0_MEALY: begin
                    if (din) begin
                        state_mealy <= S1_MEALY;
                        dout_mealy <= 1'b0;
                    end
                end

                S1_MEALY: begin // 1
                    if (!din) begin // 10
                        state_mealy <= S2_MEALY;
                        dout_mealy <= 1'b0;
                    end else begin
                        state_mealy <= S1_MEALY;
                        dout_mealy <= 1'b0;
                    end
                end

                S2_MEALY: begin // 10
                    if (din) begin // 101
                        state_mealy <= S3_MEALY;
                        dout_mealy <= 1'b0;
                    end else begin
                        state_mealy <= S0_MEALY;
                        dout_mealy <= 1'b0;
                    end
                end

                S3_MEALY: begin // 101
                    if (din) begin // 1011
                        state_mealy <= S1_MEALY;
                        dout_mealy <= 1'b1;
                    end else begin
                        state_mealy <= S0_MEALY;
                        dout_mealy <= 1'b0;
                    end
                end

                default: begin
                    dout_mealy <= 1'b0;
                    state_mealy <= S0_MEALY; 
                end
            endcase
        end
    end

endmodule
