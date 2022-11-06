`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2022 09:09:19 AM
// Design Name: 
// Module Name: tb_sync_fifo
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

module tb_sync_fifo #(
    parameter DATA_WIDTH = 8,
    parameter DATA_ADDR = 9 // 2**9-1:0 511:0
);

    logic       clk=0;
    logic       srstn;
    logic [7:0] din;
    logic       wr_en;
    logic       rd_en;
    logic [7:0] dout;
    logic       full;
    logic       empty;
    logic [8:0] data_count;

    always #5 clk <= ~clk;

    initial begin
        srstn <= 1'b0;
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        srstn <= 1'b1;

        #250_000;
        $stop;
    end

    logic [7:0] fifo_golden [$]; // push_back, pop_front

    logic write_active, read_active;

    logic [1:0] write_cntr;
    logic [3:0] read_cntr;
    always_ff @(posedge clk) begin
        if (!srstn) begin 
            write_cntr <= 0;
            read_cntr <= 0;
            write_active <= 1'b0;
            read_active <= 1'b0;
        end else begin 
            write_cntr <= write_cntr + 1;
            read_cntr <= read_cntr + 1;

            write_active <= 1'b0;
            read_active <= 1'b0;

            if (write_cntr == 0) write_active <= 1'B1;
            if (read_cntr == 1)  read_active  <= 1'B1;
        end
    end

    always_ff @(posedge clk) begin : P_WRITE
        if (!srstn) begin 
            wr_en <= 1'b0;
            din <= 0;
        end else begin
            wr_en <= 1'b0;
            if (!full && write_active) begin
                wr_en <= 1'b1;
                din <= $random();
            end

            if (wr_en) begin 
                fifo_golden.push_back(din);
            end
        end
    end : P_WRITE

    always_ff @(posedge clk) begin : P_READ
        logic rd_en_prev;
        logic [7:0] dout_var;
        if (!srstn) begin 
            rd_en <= 1'b0;
        end else begin
            rd_en <= 1'b0;
            if (!empty && read_active) begin
                rd_en <= 1'b1;
            end

            rd_en_prev <= rd_en;

            if (rd_en_prev) begin 
                dout_var = fifo_golden.pop_front();
                assert (dout_var == dout) $display("true: dout_var == %h, dout == %h", dout_var, dout);
                else   $fatal("false: dout_var == %h, dout == %h", dout_var, dout);
            end
        end
    end : P_READ


    sync_fifo_rtl # (
        .DATA_WIDTH (DATA_WIDTH),
        .DATA_ADDR  (DATA_ADDR)
    )
    sync_fifo_rtl_inst(
        .clk        (clk            ),
        .srstn      (srstn          ),
        .din        (din            ),
        .wr_en      (wr_en          ),
        .rd_en      (rd_en          ),
        .dout       (dout           ),
        .full       (full           ),
        .empty      (empty          ),
        .data_count (data_count     )        
    );

endmodule