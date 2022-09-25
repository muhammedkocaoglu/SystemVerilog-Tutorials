`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2022 10:27:37 PM
// Design Name: 
// Module Name: tb_non_blocking
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


module tb_non_blocking(

    );

    bit         clk;
    logic       rstn; // active-low reset
    logic       ena = 0;
    logic [7:0] srcA = 0;
    logic [7:0] srcB = 0;
    logic [7:0] dout_nb;
    logic [7:0] dout_b;

    non_blocking non_blocking( .* );

    always #5 clk <= ~clk;

    initial begin
        rstn    <= 1'b0;
        @(negedge clk); 
        @(negedge clk);
        rstn    <= 1'b1;

        srcA    <= 5;
        srcB    <= 7;

        #100;
        ena <= 1;
        #100;
        $stop;
    end
endmodule
