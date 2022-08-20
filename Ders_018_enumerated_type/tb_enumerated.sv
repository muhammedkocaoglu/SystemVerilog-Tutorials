`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/20/2022 03:43:03 PM
// Design Name: 
// Module Name: tb_enumerated
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


module tb_enumerated;

    typedef enum logic [4:0] {
        S0 = 5'b00001,
        S1 = 5'b00010,
        S2 = 5'b00100,
        S3 = 5'b01000,
        S4 = 5'b10000
    } states_t;
    
    states_t state = S2;

    initial begin
        $display("state.name()  = %b", state.name());
        $display("state.first() = %b", state.first().name());
        $display("state.next()  = %b", state.next().name());
        $display("state.last()  = %b", state.last().name());
        $display("state.prev()  = %b", state.prev().name());
        $display("state.num() = %d", state.num());
    end

endmodule
