`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2022 09:05:31 AM
// Design Name: 
// Module Name: tb_bram_single_port
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


module tb_bram_single_port  # 
(
    parameter RAM_WIDTH = 8,
    parameter RAM_DEPTH = 1024
);
    logic                         clk=0;
    logic                         wr_en;
    logic                         rd_en;
    logic [$clog2(RAM_DEPTH)-1:0] addr;
    logic [RAM_WIDTH-1:0]         din;
    logic [RAM_WIDTH-1:0]         dout;

    bram_single_port # 
    (
        .RAM_WIDTH  (RAM_WIDTH),
        .RAM_DEPTH  (RAM_DEPTH)
    )
    bram_single_port_inst 
    (
        .*
    );

    always #5 clk <= ~clk;

    initial begin
        #100;
        @(negedge clk);
        wr_en <= 1'b1;
        din <= 8'hAB;
        addr <= 0;
        @(negedge clk);
        din <= 8'hCD;
        addr <= 1;
        @(negedge clk);
        wr_en <= 1'b0;

        #50;

        @(negedge clk);
        addr <= 0;
        rd_en <= 1'b1;
        @(negedge clk);
        addr <= 1;
        @(negedge clk);
        rd_en <= 1'b0;
        #50;
        $stop;
    end
endmodule
