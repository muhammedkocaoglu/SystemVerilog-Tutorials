`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2022 09:51:58 PM
// Design Name: 
// Module Name: tb_bram_dual_port
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


module tb_bram_dual_port # 
(
    parameter RAM_WIDTH = 16,
    parameter RAM_DEPTH = 1024
);

    logic                         clk=0;
    logic                         wr_ena;
    logic                         rd_enb;
    logic [$clog2(RAM_DEPTH)-1:0] addra;
    logic [$clog2(RAM_DEPTH)-1:0] addrb;
    logic [RAM_WIDTH-1:0]         dina;
    logic [RAM_WIDTH-1:0]         doutb;

    bram_dual_port # 
    (
        .RAM_WIDTH(RAM_WIDTH),
        .RAM_DEPTH(RAM_DEPTH)
    )
    bram_dual_port_inst
    (
        .*
    );

    always #5 clk <= ~clk;

    initial begin
        #50;
        @(negedge clk);
        wr_ena <= 1'b1;
        addra <= 0;
        dina <= 16'habcd;
        @(negedge clk);
        wr_ena <= 1'b0;

        #50;
        @(negedge clk);
        addrb <= 0;
        rd_enb <= 1'b1;
        @(negedge clk);
        rd_enb <= 1'b0;
        #50;
        $stop;
    end
endmodule
