`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2022 10:20:38 PM
// Design Name: 
// Module Name: bram_true_dual_port
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


module bram_true_dual_port  # 
(
    parameter RAM_WIDTH = 16,
    parameter RAM_DEPTH = 1024
)
(
    input  logic                         clk,
    input  logic                         wr_ena,
    input  logic                         wr_enb,
    input  logic                         rd_ena,
    input  logic                         rd_enb,
    input  logic [$clog2(RAM_DEPTH)-1:0] addra,
    input  logic [$clog2(RAM_DEPTH)-1:0] addrb,
    input  logic [RAM_WIDTH-1:0]         dina,
    input  logic [RAM_WIDTH-1:0]         dinb,
    output logic [RAM_WIDTH-1:0]         douta,
    output logic [RAM_WIDTH-1:0]         doutb
);

(* ram_style = "block" *) // block, distributed, register
logic [RAM_WIDTH-1:0] dpram [0:RAM_DEPTH-1] = '{default:0};

always_ff @(posedge clk) begin : PORTA
    if (wr_ena) begin
        dpram[addra] <= dina;
    end else if (rd_ena) begin
        douta <= dpram[addra];
    end
end : PORTA

always_ff @(posedge clk) begin : PORTB
    if (wr_enb) begin
        dpram[addrb] <= dinb;
    end else if (rd_enb) begin
        doutb <= dpram[addrb];
    end
end : PORTB
  
endmodule