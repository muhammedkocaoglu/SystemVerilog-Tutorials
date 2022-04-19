`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2022 11:16:05 PM
// Design Name: 
// Module Name: unique_modifer
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

// priority 

module unique_modifer( // parallel_case
        input logic [3:0] interrupt, // 0001 0010 0100 1000 0000
        input logic [7:0] a_i, b_i, c_i, d_i,
        output logic [7:0] a_o, b_o, c_o, d_o 
    );
		
    always_comb  
    begin
        {d_o, c_o, b_o, a_o} = 32'b0;
		(* parallel_case *)
        case (interrupt) inside  
            4'b1??? : a_o = a_i;
            4'b?1?? : b_o = b_i;
            4'b??1? : c_o = c_i;
            4'b???1 : d_o = d_i;
        endcase
    end
	
endmodule
