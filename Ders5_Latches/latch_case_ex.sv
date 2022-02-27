`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2022 04:36:07 PM
// Design Name: 
// Module Name: latch_case_ex
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


module latch_case_ex(
        input logic [1:0] sel,
        output logic [3:0] dout
    );


    always_comb 
    begin
        case (sel)
            2'b00 :
            begin
                dout = 4'b0001;
            end

            2'b01 :
            begin
                dout = 4'b0010;
            end

            2'b10 :
            begin
                dout = 4'b0100;
            end

            2'b11 :
            begin
                dout = 4'b1000;
            end

           default :
            begin
                dout = 4'b0000;
            end
        endcase
    end
    
endmodule
