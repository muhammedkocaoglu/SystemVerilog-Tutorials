`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2022 11:59:24 PM
// Design Name: 
// Module Name: priority_case
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


module priority_case(
    input logic a,
    input logic b,
    input logic c,
    input logic [1:0] sel,
    output logic dout
    );
	
	always_comb
	begin
		priority case (sel)   												// 00 01 10 11
			2'b00 : dout = a;
			2'b01 : dout = b;
			2'b10 : dout = c;
		endcase
	end 
endmodule
