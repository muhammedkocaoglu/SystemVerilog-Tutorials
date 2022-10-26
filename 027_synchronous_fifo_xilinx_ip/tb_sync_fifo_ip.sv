`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2022 08:05:20 PM
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


module tb_sync_fifo_ip();

    logic       clk=0;
    logic       rst;
    logic [7:0] din;
    logic       wr_en;
    logic       rd_en;
    logic [7:0] dout;
    logic       full;
    logic       empty;
    logic [5:0] data_count;

    logic [7:0] fifo_golden [$];

    always #5 clk <= ~clk;

    initial begin
        rst <= 1'b1;
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        rst <= 1'b0;
        #25000;
        $stop;
    end

    logic [3:0] cntr;
    logic ena_wr, ena_rd;

    always_ff @(posedge clk) begin
        if (rst) begin
            cntr <= 0;
            {ena_rd, ena_wr} <= 2'b00;
        end else begin
            {ena_rd, ena_wr} <= 2'b00;
            cntr <= cntr + 1;
            if (cntr < 15)  ena_wr <= 1'b1;
            if (cntr < 2)   ena_rd <= 1'b1;
        end
    end

    always_ff @(posedge clk) begin
        logic wr_en_var;
        logic [7:0] din_var;
        if (rst) begin
            wr_en <= 0;
            din <= 0;
        end else begin
            wr_en <= 0;
            if (!full && ena_wr) begin
                wr_en_var = $random();
                din_var = $random();
                if (wr_en_var) begin
                    fifo_golden.push_back(din_var);
                    din <= din_var;
                    wr_en <= 1;
                end
            end
        end
    end

    always_ff @(posedge clk) begin
        logic rd_en_prev;
        logic [7:0] dout_var;
        if (rst) begin
            rd_en <= 0;
        end else begin
            rd_en <= 1'b0;
            if (!empty && ena_rd) begin
                rd_en <= $random();
            end

            rd_en_prev <= rd_en;

            if (rd_en_prev) begin
                dout_var = fifo_golden.pop_front();
                assert (dout == dout_var) $display("true. dout %h == dout golden %h", dout, dout_var);
                else   $fatal("false. dout %h == dout golden %h", dout, dout_var);
            end
        end
    end

    sync_fifo_ip sync_fifo_ip_inst(.*);
endmodule
