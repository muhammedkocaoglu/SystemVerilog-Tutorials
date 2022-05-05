`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 05/05/2022 12:41:13 PM
// Design Name:
// Module Name: tb_gray_binary
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


module tb_gray_binary #
    (
        parameter N = 4
    );
    logic [N-1:0] gray_in;
    logic [N-1:0] bin_out;

    logic [N-1:0] bin_in;
    logic [N-1:0] gray_out;
    bin2grayConverter #
        (
            .N(N)
        )
        bin2grayConverter_Inst
        (
            .bin_in(bin_in),
            .gray_out(gray_out)
        );

    gray2binConverter #
        (
            .N(N)
        )
        gray2binConverter_Inst
        (
            .gray_in(gray_out),
            .bin_out(bin_out)
        );

    integer cntr;
    initial 
    begin
        #100;
        for (int i = 0; i < 2**N; i++) begin
            bin_in = i;
            #5;
            assert (bin_in == bin_out) begin
                $display("bin_in is equal to bin_out");
            end
            else begin
                cntr = cntr + 1;  
                $display("bin_in is not equal to bin_out");
            end
        end
        #20;
        $display("error count is %d", cntr);
        #30;
        $stop;
    end
endmodule
