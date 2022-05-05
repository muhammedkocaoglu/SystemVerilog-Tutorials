`timescale 1ns / 1ps


module tb_comb_logic();

    logic [7:0] a_i;
    logic [7:0] b_i;
    logic [7:0] c_i;
    logic [15:0] d_o;

    comb_logic 
        comb_logic_Inst (
            .a_i(a_i),
            .b_i(b_i),
            .c_i(c_i),
            .d_o(d_o)
        );

    initial begin
        a_i = 8'h00;
        b_i = 8'h00;
        c_i = 8'h00;

        #20

        a_i = 8'h01;
        b_i = 8'h02;
        c_i = 8'h03;

        #20

        a_i = 8'h04;
        b_i = 8'h05;
        c_i = 8'h06;

        #20

        a_i = 8'h07;
        b_i = 8'h08;
        c_i = 8'h09;

        #20
        $stop;
    end

    initial
    begin
        $timeformat(-9, 2, " ns");
    end

    initial
    begin
        $monitor("@%t : %d * %d + %d = %d", $time, a_i, b_i, c_i, d_o);
    end

endmodule
