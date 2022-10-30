`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2022 12:29:08 AM
// Design Name: 
// Module Name: tb_sync_fifo_ip
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


module tb_sync_fifo_ip(

    );

    logic       clk=0;
    logic       srst;
    logic [7:0] din;
    logic       wr_en;
    logic       rd_en;
    logic [7:0] dout;
    logic       full;
    logic       empty;
    logic [8:0] data_count;

    sync_fifo_ip sync_fifo_ip_inst( .* );

    parameter DATA_WIDTH = 8;
    parameter FIFO_DEPTH = 2**9;

    always #5 clk <= ~clk;

    initial begin
        srst <= 1'b1;
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        srst <= 1'b0;
        #250000;
        $stop;
    end

    logic [7:0] fifo_golden [$]; // push_back, pop_front

    logic write_active, read_active;
    logic [3:0] cntr_read;
    logic [1:0] cntr_write;

    always_ff @(posedge clk) begin
        if (srst) begin
            cntr_read <= 0;
            cntr_write <= 0;
            {write_active, read_active} <= 2'b00;
        end else begin
            {write_active, read_active} <= 2'b00;
            cntr_read <= cntr_read + 1;
            cntr_write <= cntr_write + 1;

            if (cntr_read  == 0) read_active <= 1'b1;
            if (cntr_write == 1) write_active <= 1'b1;
        end
    end

    always_ff @(posedge clk) begin
        if (srst) begin
            wr_en <= 0;
            din <= 0;
        end else begin
            wr_en <= 1'b0;
            if (!full && write_active) begin // && write_active
                din <= $random();
                wr_en <= 1;
            end
            if (wr_en) begin
                fifo_golden.push_back(din);
            end
        end
    end

    always_ff @(posedge clk) begin
        logic rd_en_prev;
        logic [7:0] dout_var;
        if (srst) begin 
            rd_en <= 0;
        end else begin
            rd_en <= 0;
            if (!empty && read_active) begin 
                rd_en <= 1;
            end

            rd_en_prev <= rd_en;

            if (rd_en_prev) begin
                dout_var = fifo_golden.pop_front();
                assert (dout_var == dout) $display("true: dout_var == %h and dout == %h ", dout_var, dout);
                else   $fatal("error: dout_var == %h and dout == %h ", dout_var, dout);
            end

        end
    end



endmodule
