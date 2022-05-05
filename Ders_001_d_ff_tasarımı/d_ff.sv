`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 02/01/2022 08:32:59 PM
// Design Name:
// Module Name: d_ff
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


module d_ff(
        input clk,
        input reset,
        input d,
        output  q
    );

    reg qReg;
    
    always @(posedge clk )
    begin
        if (reset)  // active high reset
            qReg  <= 0;
        else
            qReg   <= d;
    end

    assign q = qReg;

endmodule
