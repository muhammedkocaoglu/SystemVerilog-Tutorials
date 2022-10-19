`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2022 03:25:39 PM
// Design Name: 
// Module Name: bram_dual_port
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


module bram_dual_port # 
(
    parameter RAM_WIDTH = 16,
    parameter RAM_DEPTH = 1024
)
(
    input  logic                         clk,
    input  logic                         wr_ena,
    input  logic                         rd_enb,
    input  logic [$clog2(RAM_DEPTH)-1:0] addra,
    input  logic [$clog2(RAM_DEPTH)-1:0] addrb,
    input  logic [RAM_WIDTH-1:0]         dina,
    output logic [RAM_WIDTH-1:0]         doutb
);

(* ram_style = "block" *) // block, distributed, register
logic [RAM_WIDTH-1:0] dpram [0:RAM_DEPTH-1] = '{default:0};

always_ff @(posedge clk) begin : WRITE
    if (wr_ena) begin
        dpram[addra] <= dina;
    end
end : WRITE

always_ff @(posedge clk) begin : READ
    if (rd_enb) begin
        doutb <= dpram[addrb];
    end
end : READ
  
endmodule
  
