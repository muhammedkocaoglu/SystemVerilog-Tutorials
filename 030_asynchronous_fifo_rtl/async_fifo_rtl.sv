`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/28/2023 09:13:39 AM
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

    logic wr_srstn, wr_srstn_prev;
    logic rd_srstn, rd_srstn_prev;

    always_ff @(posedge WR_CLK, negedge ARSTN) begin : SYNC_WR_RST
        if (!ARSTN) begin
            {wr_srstn, wr_srstn_prev} <= 2'b00;
        end else begin
            wr_srstn_prev <= 1'b1;
            wr_srstn <= wr_srstn_prev;
        end
    end : SYNC_WR_RST

    always_ff @(posedge RD_CLK, negedge ARSTN) begin : SYNC_RD_RST
        if (!ARSTN) begin
            {rd_srstn, rd_srstn_prev} <= 2'b00;
        end else begin
            rd_srstn_prev <= 1'b1;
            rd_srstn <= rd_srstn_prev;
        end
    end : SYNC_RD_RST
endmodule
