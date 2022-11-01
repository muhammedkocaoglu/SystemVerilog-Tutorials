`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2022 08:09:39 PM
// Design Name: 
// Module Name: sync_fifo_rtl
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


module sync_fifo_rtl # (
    parameter DATA_WIDTH = 8,
    parameter DATA_ADDR = 9 // 2**9-1:0 511:0
)(
    input  logic                  clk,
    input  logic                  srstn,
    input  logic [DATA_WIDTH-1:0] din,
    input  logic                  wr_en,
    input  logic                  rd_en,
    output logic [DATA_WIDTH-1:0] dout,
    output logic                  full,
    output logic                  empty,
    output logic [DATA_ADDR:0]    data_count
);

    logic [DATA_WIDTH-1:0] dpram [0:2**DATA_ADDR-1];
    logic [DATA_ADDR-1:0] rd_ptr, wr_ptr;

    always_ff @(posedge clk) begin
        if (!srstn) begin
            rd_ptr <= '0;
            wr_ptr <= '0;
            dout   <= '0;
        end else begin 
            case ({wr_en, rd_en})
                2'b00: ; // no operation 

                2'b01: begin
                    dout <= dpram[rd_ptr];
                    rd_ptr <= rd_ptr + 1;
                    data_count <= data_count - 1;
                end

                2'b10: begin
                    dpram[wr_ptr] <= din;
                    wr_ptr <= wr_ptr + 1;
                    data_count <= data_count + 1;
                end

                2'b11: begin
                    dout <= dpram[rd_ptr];
                    rd_ptr <= rd_ptr + 1;
                    dpram[wr_ptr] <= din;
                    wr_ptr <= wr_ptr + 1;
                    data_count <= data_count;
                end

            endcase
        end
    end

    assign empty = (data_count == 0);
    assign full  = (data_count == 2**DATA_ADDR);

endmodule
