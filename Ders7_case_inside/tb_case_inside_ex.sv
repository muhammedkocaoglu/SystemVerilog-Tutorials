`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 04/08/2022 11:26:37 PM
// Design Name:
// Module Name: tb_case_inside_ex
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


module tb_case_inside_ex;

    logic [3:0] sel;
    logic [3:0] a;
    logic [3:0] b;
    logic [3:0] c;
    logic [3:0] d;
    logic [3:0] dout;

    case_inside_ex
        case_inside_ex_Inst(
            .sel(sel),
            .a(a),
            .b(b),
            .c(c),
            .d(d),
            .dout(dout)
        );

    initial begin
        for (int i = 0; i < 16; i++)
        begin
            sel = i;
            a = i + 1;
            b = i + 2;
            c = i + 3;
            d = i + 4;
            #5;
            $display("sel: %b ====> dout = %b ------ a = %b, b = %b, c = %b, d = %b", sel, dout, a, b, c, d);

        end
    end
endmodule
