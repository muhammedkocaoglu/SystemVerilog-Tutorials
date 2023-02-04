`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/04/2023 10:16:08 PM
// Design Name: 
// Module Name: sync_bin_ptr
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


module sync_bin_ptr # (
    parameter integer WIDTH = 10
  )(
    input  logic             SRC_CLK,
    input  logic             DST_CLK,
    input  logic [WIDTH-1:0] SRC_BIN_PTR,
    output logic [WIDTH-1:0] DST_BIN_PTR
  );

  logic [WIDTH-1:0] src_gray_ptr;
  logic [WIDTH-1:0] dst_gray_ptr0;
  logic [WIDTH-1:0] dst_gray_ptr1;

  always_ff @(posedge SRC_CLK) begin
    src_gray_ptr <= bin2gray_f(SRC_BIN_PTR);
  end

  always_ff @(posedge DST_CLK) begin
    dst_gray_ptr0 <= src_gray_ptr;
    dst_gray_ptr1 <= dst_gray_ptr0;
    DST_BIN_PTR <= gray2bin_f(dst_gray_ptr1);
  end

  // convert gray encoding to binary encoding
  function logic [WIDTH-1:0] gray2bin_f(input logic [WIDTH-1:0] gray_i);
    logic [WIDTH-1:0] var_bin; 
    var_bin[WIDTH - 1] = gray_i[WIDTH - 1];
    for (int i=WIDTH-2; i>=0; i--) begin 
        var_bin[i] = var_bin[i + 1] ^ gray_i[i];
    end
    return var_bin;
  endfunction

  // convert binary encoding to gray encoding
  function logic [WIDTH-1:0] bin2gray_f(input logic [WIDTH-1:0] bin_i);
    logic [WIDTH-1:0] var_gray; 
    var_gray[WIDTH - 1] = bin_i[WIDTH - 1];
    for (int i=WIDTH - 2; i>=0; i--) begin 
        var_gray[i] = bin_i[i + 1] ^ bin_i[i];
    end
    return var_gray;
  endfunction
endmodule
