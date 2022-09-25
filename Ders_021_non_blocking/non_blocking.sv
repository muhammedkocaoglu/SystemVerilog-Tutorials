`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2022 09:46:22 PM
// Design Name: 
// Module Name: non_blocking
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


module non_blocking(
        input  logic       clk,
        input  logic       rstn, // active-low reset
        input  logic       ena,
        input  logic [7:0] srcA,
        input  logic [7:0] srcB,
        output logic [7:0] dout_nb,
        output logic [7:0] dout_b
    );

    /////////////////////
    ////// in VHDL //////
    /////////////////////
    /*
    P_BLOCKING : process(clk, rsnt) 
        variable temp_nb : std_logic_vector(7 downto 0);
    begin
        if rstn = '0' then 
            dout_nb <= (others => '0');
        elsif rising_edge(clk) then 
            temp_nb := (others => '0');
            temp_nb := srcA + srcB + srcC;
            dout_nb <= temp_nb;
        end if;
    end process;
    */

    logic [7:0] temp_nb;
    always_ff @(posedge clk) begin : non_blocking
        if (!rstn) begin
            dout_nb <= '0;
            temp_nb <= '0;
        end else begin // := 
            temp_nb <= srcA + srcB;
            dout_nb <= temp_nb;
        end
    end : non_blocking

    // logic [7:0] temp_b;
    always_ff @(posedge clk) begin : blocking
        logic [7:0] temp_b;
        if (!rstn) begin
            dout_b <= '0;
            temp_b = '0;
        end else begin
            temp_b = srcA + srcB;
            dout_b <= temp_b; // srcA + srcB
        end
    end : blocking

    logic [7:0] cntr_b;
    logic [7:0] cntr_nb;
    always_ff @(posedge clk) begin
        if (!rstn) begin
            cntr_nb <= '0;
        end else begin
            cntr_nb <= cntr_nb + 1;
            if (ena) begin
                cntr_nb <= cntr_nb + 2;
            end
        end
    end


    always_ff @(posedge clk) begin
        if (!rstn) begin
            cntr_b = '0;
        end else begin
            cntr_b = cntr_b + 1;
            if (ena) begin
                cntr_b = cntr_b + 2; // cntr_b + 1 + 2
            end
        end
    end

endmodule