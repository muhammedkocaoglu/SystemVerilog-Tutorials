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
        input  logic       rstn,
        input  logic       trig,
        input  logic [7:0] srcA,
        input  logic [7:0] srcB,
        input  logic [7:0] srcC,
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

    // dout_nb <= srcA + srcB + srcC
    always_ff @(posedge clk, negedge rstn) begin : non_blocking
        logic [7:0] temp_nb;
        if (!rstn) begin
            dout_nb <= '0;
            temp_nb <= '0;
        end else begin
            temp_nb <= srcA + srcB + srcC;
            dout_nb <= temp_nb;
        end
    end : non_blocking

    // dout_b = srcA + srcB + srcC
    // logic [7:0] temp_b;
    always_ff @(posedge clk, negedge rstn) begin : mixed
        logic [7:0] temp_b;
        if (!rstn) begin
            dout_b  <= '0;
            temp_b  = '0;
        end else begin
            temp_b = '0;
            temp_b = srcA + srcB + srcC;
            dout_b <= temp_b; // dout_b <= srcA + srcB + srcC
        end
    end : mixed

    logic [7:0] cntr_b;
    logic [7:0] cntr_nb;
    always_ff @(posedge clk, negedge rstn) begin
        if (!rstn) begin
            cntr_nb <= '0;
        end else begin
            cntr_nb <= cntr_nb + 1;
            if (trig) begin
                cntr_nb <= cntr_nb + 2; // cntr_nb <= cntr_nb + 2;
            end
        end
    end

    always_ff @(posedge clk, negedge rstn) begin
        if (!rstn) begin
            cntr_b = '0;
        end else begin
            cntr_b = cntr_b + 1;
            if (trig) begin
                cntr_b = cntr_b + 2; // cntr_b = cntr_b + 1 + 2
            end
        end
    end

endmodule