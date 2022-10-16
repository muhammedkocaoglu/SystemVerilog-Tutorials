`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2022 10:24:12 PM
// Design Name: 
// Module Name: bram_single_port
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


module bram_single_port #
(
    parameter RAM_WIDTH = 8,  
    parameter RAM_DEPTH = 1024
) 
(
    input  logic                         clk,
    input  logic                         wr_en, 
    input  logic                         rd_en, 
    input  logic [$clog2(RAM_DEPTH)-1:0] addr,  
    input  logic [RAM_WIDTH-1:0]         din,    
    output logic [RAM_WIDTH-1:0]         dout
);
    (* ram_style="block" *) // block, distributed, register
    reg [RAM_WIDTH-1:0] ram [0:RAM_DEPTH-1] = '{default:0};

    always @(posedge clk) begin
        if (wr_en) begin
            ram[addr] <= din;
        end else if (rd_en) begin 
            dout <= ram[addr];
        end
    end
  
endmodule
