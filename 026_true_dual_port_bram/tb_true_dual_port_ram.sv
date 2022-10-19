`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2022 10:37:03 PM
// Design Name: 
// Module Name: tb_true_dual_port_ram
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


module tb_true_dual_port_ram # 
(
    parameter RAM_WIDTH = 16,
    parameter RAM_DEPTH = 1024
);

    logic                         clk=0;
    logic                         wr_ena;
    logic                         wr_enb;
    logic                         rd_ena;
    logic                         rd_enb;
    logic [$clog2(RAM_DEPTH)-1:0] addra;
    logic [$clog2(RAM_DEPTH)-1:0] addrb;
    logic [RAM_WIDTH-1:0]         dina;
    logic [RAM_WIDTH-1:0]         dinb;
    logic [RAM_WIDTH-1:0]         douta;
    logic [RAM_WIDTH-1:0]         doutb;

    bram_true_dual_port # 
    (
        .RAM_WIDTH(RAM_WIDTH),
        .RAM_DEPTH(RAM_DEPTH)
    )
    bram_true_dual_port_inst
    (
        .*
    );

    always #5 clk <= ~clk;

    initial begin
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        wr_ena <= 1'b1;
        wr_enb <= 1'b1;
        addra <= 0;
        addrb <= 1;
        dina <= 16'habcd;
        dinb <= 16'h1234;
        @(negedge clk);
        wr_ena <= 1'b0;
        wr_enb <= 1'b0;
        #50;
        @(negedge clk);
        rd_ena <= 1'b1;
        rd_enb <= 1'b1;
        addra <= 1;
        addrb <= 0;
        @(negedge clk);
        rd_ena <= 1'b0;
        rd_enb <= 1'b0;
        #50;
        $stop;
    end
endmodule
