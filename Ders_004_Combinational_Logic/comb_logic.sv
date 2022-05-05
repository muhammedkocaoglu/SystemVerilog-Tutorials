`timescale 1ns / 1ps

// d_o = a_i * b_i + c_i;

module comb_logic(
        input logic [7:0] a_i,
        input logic [7:0] b_i,
        input logic [7:0] c_i,
        output logic [15:0] d_o
    );

    function logic [15:0] mul_and_add();
        mul_and_add = a_i * b_i + c_i; // blocking 
    endfunction 

    always_comb
    begin
        d_o = mul_and_add(); 
    end
endmodule
