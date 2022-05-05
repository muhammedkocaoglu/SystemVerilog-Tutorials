`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2022 08:49:37 AM
// Design Name: 
// Module Name: gray2binConverter
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


module gray2binConverter # (
        parameter N = 4
    )
    (   
        input logic [N-1:0] gray_in,
        output logic [N-1:0] bin_out
    );

    genvar i;
    assign bin_out[N-1] = gray_in[N-1];
    generate
        for (i=0; i < N-1; i++) begin
            assign bin_out[i] = bin_out[i+1] ^ gray_in[i];
        end
    endgenerate

    

endmodule
