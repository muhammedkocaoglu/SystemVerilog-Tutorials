`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/29/2023 09:22:36 AM
// Design Name: 
// Module Name: tb_async_fifo_rtl
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


module tb_async_fifo_rtl # (
    parameter DW = 8
);

    localparam WR_CLKFREQ = 100_000_000;
    localparam RD_CLKFREQ = 40_000_000;

    real wr_clkperiod = (1.0/WR_CLKFREQ) * (10**9); // 10
    real rd_clkperiod = (1.0/RD_CLKFREQ) * (10**9); // 25

    logic          ARSTN;
    logic          WR_CLK=0;
    logic          WR_EN;
    logic [DW-1:0] DIN;
    logic          FULL;
    logic          RD_CLK=0;
    logic          RD_EN;
    logic [DW-1:0] DOUT;
    logic          EMPTY;

    async_fifo_rtl # (.DW(DW))
    async_fifo_rtl (.*);

    always #(wr_clkperiod/2.0) WR_CLK <= ~WR_CLK;
    always #(rd_clkperiod/2.0) RD_CLK <= ~RD_CLK;

    initial begin
        ARSTN <= 1'b0;
        #53;
        ARSTN <= 1'b1;
        #100;
        ARSTN <= 1'b0;
        #53;
        ARSTN <= 1'b1;
        #100;
        $stop;
    end


endmodule
