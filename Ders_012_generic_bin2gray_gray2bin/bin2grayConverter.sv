`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 05/05/2022 10:05:12 AM
// Design Name:
// Module Name: bin2grayConverter
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


module bin2grayConverter # (
        parameter N = 4
    )
    (
        input logic [N-1:0] bin_in,
        output logic [N-1:0] gray_out
    );

    always_comb
    begin
        gray_out[N-1] = bin_in[N-1];
        for (int i = 0; i < N-1; i++)
        begin
            gray_out[i] = bin_in[i+1] ^ bin_in[i];
        end
    end
endmodule
