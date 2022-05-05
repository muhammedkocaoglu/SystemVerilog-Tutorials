`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2022 10:10:28 PM
// Design Name: 
// Module Name: tb_unique_modifer
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


module tb_unique_modifer;
	logic [3:0] interrupt; // 0001 0010 0100 1000 0000
	logic [7:0] a_i, b_i, c_i, d_i;
	logic [7:0] a_o, b_o, c_o, d_o;
	
	unique_modifer unique_modifer_Inst( .* );
	
	initial begin
		interrupt = 4'b0;
		a_i = 8'h01;
		b_i = 8'h02;
		c_i = 8'h03;
		d_i = 8'h04;
		#10;
		
		interrupt = 4'b0001;
		#10;
		assert (a_o == 0 && b_o == 0 && c_o == 0 && d_o == d_i) $display("okey!!!");
		else $error("not okey!!!");
		#10;
		
		interrupt = 4'b0010;
		#10;
		assert (a_o == 0 && b_o == 0 && c_o == c_i && d_o == 0) $display("okey!!!");
		else $error("not okey!!!");
		#10;
		
		interrupt = 4'b0100;
		#10;
		assert (a_o == 0 && b_o == b_i && c_o == 0 && d_o == 0) 
			$display("okey!!!");
		else 
			$error("not okey!!!");
		#10;
		
		interrupt = 4'b1000;
		#10;
		assert (a_o == a_i && b_o == 0 && c_o == 0 && d_o == 0) $display("okey!!!");
		else $error("not okey!!!");
		#10;
		
		#50;
		interrupt = 4'b0011;
		#50;
		$stop;
		
	end

endmodule
