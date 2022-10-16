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
    parameter RAM_WIDTH = 64, 
    parameter RAM_DEPTH = 512
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
  
    logic [RAM_WIDTH-1:0] ram [RAM_DEPTH-1:0] = '{default:0};
  
    always_ff @(posedge clk) begin
        if (wr_en) begin  
            ram[addra] <= dina;
        end
    end

    always_ff @(posedge clk) begin
        if (rd_en) begin
            doutb <= ram[addrb];
        end
    end
  
  endmodule
  
