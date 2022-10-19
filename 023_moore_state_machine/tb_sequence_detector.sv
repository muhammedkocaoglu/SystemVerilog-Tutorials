`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2022 11:23:30 PM
// Design Name: 
// Module Name: tb_sequence_detector
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
// 1011

module tb_sequence_detector(

    );

    logic clk=0;
    logic rstn;
    logic din;
    logic dout_mealy;
    logic dout_moore;

    sequence_detector sequence_detector(.*);

    always #5 clk <= ~clk;

    initial begin
        rstn <= 1'b0;
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        rstn <= 1'b1;

        #1000;
        $stop;
    end

    always_ff @(posedge clk) begin
        if (!rstn) begin
            din <= 0;
        end else begin
            din <= $random();
        end
    end

    logic [3:0] seq;

    always_ff @(posedge clk) begin
        if (!rstn) begin
            seq <= 4'b0;
        end else begin
            seq <= {seq[2:0], din};
            $display("din: %b, seq: %b, dout_mealy: %b, dout_moore: %b", din, seq, dout_mealy, dout_moore);
        end
    end

endmodule
