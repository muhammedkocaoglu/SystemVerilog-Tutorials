`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/29/2023 09:14:20 AM
// Design Name: 
// Module Name: sync_reset
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


module sync_reset(
        input  logic CLK,
        input  logic ARSTN,
        output logic SRSTN
    );

    logic srstn_reg;

    always_ff @(posedge CLK, negedge ARSTN) begin
        if (!ARSTN) begin
            srstn_reg <= 1'b0;
            SRSTN <= 1'b0;
        end else begin
            srstn_reg <= 1'b1;
            SRSTN <= srstn_reg;
        end
    end
endmodule
