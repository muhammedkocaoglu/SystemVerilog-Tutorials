`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/29/2023 09:18:30 AM
// Design Name: 
// Module Name: async_fifo_rtl
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


module async_fifo_rtl # (
        parameter DW = 8
    )(
        input  logic          ARSTN,
        input  logic          WR_CLK,
        input  logic          WR_EN,
        input  logic [DW-1:0] DIN,
        output logic          FULL,
        input  logic          RD_CLK,
        input  logic          RD_EN,
        output logic [DW-1:0] DOUT,
        output logic          EMPTY
    );

    logic wr_srstn, rd_srstn;

    sync_reset sync_reset_wr(.CLK(WR_CLK), .ARSTN(ARSTN), .SRSTN(wr_srstn));
    sync_reset sync_reset_rd(.CLK(RD_CLK), .ARSTN(ARSTN), .SRSTN(rd_srstn));


endmodule
