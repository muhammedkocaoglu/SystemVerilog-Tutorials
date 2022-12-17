`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2022 03:57:24 PM
// Design Name: 
// Module Name: tb_async_fifo_ip
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


module tb_async_fifo_ip(

    );

    localparam WR_CLKFREQ = 100_000_000;
    localparam RD_CLKFREQ = 40_000_000;

    real wr_clkperiod = (1.0/WR_CLKFREQ) * (10**9);
    real rd_clkperiod = (1.0/RD_CLKFREQ) * (10**9);

    logic rst;
    logic wr_clk=0;
    logic rd_clk=0;
    logic [7 : 0] din=0;
    logic wr_en=0; // 100MHZ
    logic rd_en=0; // 40MHZ
    logic [7 : 0] dout;
    logic full;
    logic empty;

    logic ena;

    logic [7:0] golden_fifo [$];

    always #(wr_clkperiod/2.0) wr_clk <= ~wr_clk; 
    always #(rd_clkperiod/2.0) rd_clk <= ~rd_clk; 

    initial begin
        ena <= 0;
        rst <= 1'b1;
        #100;
        rst <= 1'b0;
        #100;
        ena <= 1'b1;
        #1000000;
        $stop;
    end

    logic [1:0] wr_cntr=0;
    always_ff @(posedge wr_clk && ena == 1) begin
        wr_cntr <= wr_cntr + 1;
        wr_en <= 0;
        if (wr_cntr == 0 && full == 0) begin
            wr_en <= 1;
            din <= $random();
        end

        if (wr_en) begin
            golden_fifo.push_back(din);
        end
    end

    logic [7:0] rd_cntr=0;
    logic [7:0] golden_dout;
    always_ff @(posedge rd_clk && ena == 1) begin
        rd_cntr <= rd_cntr + 1;
        rd_en <= 0;
        if (rd_cntr == 5 && empty == 0) begin
            rd_en <= 1;
        end

        if (rd_en) begin
            golden_dout = golden_fifo.pop_front();
        end
    end

    always begin 
        @(negedge rd_en);
        #200ps; // intra-assignment delay in XILINX FIFO GENERATOR IP
        assert (golden_dout == dout) $display("true");
        else    $fatal("fatal");
    end

    async_fifo_ip your_instance_name (
        .rst(rst),        // input wire rst
        .wr_clk(wr_clk),  // input wire wr_clk
        .rd_clk(rd_clk),  // input wire rd_clk
        .din(din),        // input wire [7 : 0] din
        .wr_en(wr_en),    // input wire wr_en
        .rd_en(rd_en),    // input wire rd_en
        .dout(dout),      // output wire [7 : 0] dout
        .full(full),      // output wire full
        .empty(empty)     // output wire empty
    );
endmodule
