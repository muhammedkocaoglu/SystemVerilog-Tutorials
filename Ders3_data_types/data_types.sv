`timescale 1ns / 1ps

module data_types
    #(
         parameter INPUT_WIDTH = 4,
         parameter OUTPUT_WIDTH = INPUT_WIDTH*2
     )
     (
         input logic [INPUT_WIDTH-1 : 0] data_a, // explicitly
         input  logic[INPUT_WIDTH-1 : 0] data_b,
         output logic  [OUTPUT_WIDTH-1 : 0] data_o1,
         output logic [OUTPUT_WIDTH-1 : 0] data_o2
     );

    // logic

    wire [OUTPUT_WIDTH-1:0] wire1 = {data_a, data_b};

    logic [OUTPUT_WIDTH-1:0] logic1;
    assign logic1 = {data_a, data_b};


    always @(data_a, data_b) // always @(*) // always_comb
    begin
        data_o1 = {data_a, data_b};
    end

    assign data_o2 = {data_a, data_b};
endmodule
