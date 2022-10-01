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


module tb_sequence_detector(

    );
    bit   clk;
    logic rstn;
    logic din;
    logic dout_mealy;

    sequence_detector sequence_detector( .* );

    logic [3:0] seq;

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
            din <= 1'b0;
        end else begin
            din <= $random();
        end
    end

    always_ff @(posedge clk) begin
        if (!rstn) begin
            seq <= 4'b0;
        end else begin
            seq <= {seq[2:0], din};
            $display("din: %b, seq: %b and dout_mealy = %b", din, seq, dout_mealy);
        end
    end
endmodule
