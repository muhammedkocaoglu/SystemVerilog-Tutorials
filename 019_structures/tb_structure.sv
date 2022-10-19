`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/25/2022 10:14:24 PM
// Design Name: 
// Module Name: tb_structure
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


module tb_structure;

    import structure_pkg::*;

    my_structure s1 = '{default : 0};


    initial begin
        $display("s0.DATA_ID         = %d", s0.DATA_ID);
        $display("s0.DATA_HEADER     = %h", s0.DATA_HEADER);
        $display("s0.DATA_FOOTER     = %h", s0.DATA_FOOTER);
        $display("s0.DATA_START_ADDR = %d", s0.DATA_START_ADDR);
        $display("s0.DATA_END_ADDR   = %d", s0.DATA_END_ADDR);
        $display("s0.DATA_LENGTH     = %d", s0.DATA_LENGTH);
        #10;

        s1.DATA_HEADER = 8'h8d;
        s1.DATA_END_ADDR = 18;
        $display("\n");
        $display("s1.DATA_ID         = %d", s1.DATA_ID);
        $display("s1.DATA_HEADER     = %h", s1.DATA_HEADER);
        $display("s1.DATA_FOOTER     = %h", s1.DATA_FOOTER);
        $display("s1.DATA_START_ADDR = %d", s1.DATA_START_ADDR);
        $display("s1.DATA_END_ADDR   = %d", s1.DATA_END_ADDR);
        $display("s1.DATA_LENGTH     = %d", s1.DATA_LENGTH);
        #10;
        $stop;
    end
    
endmodule
