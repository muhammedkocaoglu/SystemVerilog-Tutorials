`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/25/2022 10:09:30 PM
// Design Name: 
// Module Name: structure_pkg
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


package structure_pkg;

typedef struct {
    integer DATA_ID;
    logic  [7:0]  DATA_HEADER;
    logic  [7:0]  DATA_FOOTER;
    integer DATA_START_ADDR;
    integer DATA_END_ADDR;
    integer DATA_LENGTH;
} my_structure;

localparam my_structure s0 = '{
    DATA_ID : 0,
    DATA_HEADER : 8'hAB,
    DATA_FOOTER : 8'hFC,
    DATA_START_ADDR : 7,
    DATA_END_ADDR : 42,
    DATA_LENGTH : 42 - 7 + 1
};
endpackage
