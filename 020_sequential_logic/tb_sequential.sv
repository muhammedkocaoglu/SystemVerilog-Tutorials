`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2022 08:54:19 AM
// Design Name: 
// Module Name: tb_sequential
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


module tb_sequential(

    );

    logic clk = 0;
    logic [7:0] din, dout_seq, dout_comb;
    logic [7:0] dout_temp;

    always #5 clk  <= ~clk; // generate clock

    initial begin
        #3;
        din <= 3;
        #10;
        din <= 5;
        #10;
        din <= 7;
        #10;
        din <= 9;
        #20;
        $stop;
    end

    always_ff @(posedge clk) begin
        dout_seq    <= din; // non-blocking assignment
        dout_temp   = din; // blocking assignment, temporary variable
    end

    always_comb begin
        dout_comb   = din; // blocking assignment
    end
endmodule
