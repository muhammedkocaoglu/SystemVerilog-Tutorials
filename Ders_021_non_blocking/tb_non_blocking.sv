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
    logic       rstn;
    logic       trig = 0;
    logic [7:0] srcA = 0;
    logic [7:0] srcB = 0;
    logic [7:0] srcC = 0;
    logic [7:0] dout_nb;
    logic [7:0] dout_b;

    non_blocking non_blocking_inst ( .* );

    always #5 clk <= ~clk;

    initial begin
        rstn    <= 1'b0;
        @(negedge clk);
        @(negedge clk);
        rstn    <= 1'b1;
        @(negedge clk);
        srcA <= 3;
        srcB <= 5;
        srcC <= 7;

        #50;
        trig    <= 1'b1;
        #50;
        $stop;
    end

endmodule
