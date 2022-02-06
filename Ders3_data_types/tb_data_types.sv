`timescale 1ns / 1ps

module tb_data_types
    #(
         parameter INPUT_WIDTH = 4,
         parameter OUTPUT_WIDTH = INPUT_WIDTH*2
     );


    logic [INPUT_WIDTH-1 : 0] data_a; // explicitly
    logic[INPUT_WIDTH-1 : 0] data_b;
    logic  [OUTPUT_WIDTH-1 : 0] data_o1;
    logic [OUTPUT_WIDTH-1 : 0] data_o2;

    data_types
        #(
            .INPUT_WIDTH(INPUT_WIDTH),
            .OUTPUT_WIDTH(OUTPUT_WIDTH)
        )
        data_types_Inst
        (
            .data_a(data_a), // explicitly
            .data_b(data_b),
            .data_o1(data_o1),
            .data_o2(data_o2)
        );


    initial begin
        #10
        data_a = 4'b0010;
        data_b = 4'b1010;
        #10
        data_a = 4'b1110;
        data_b = 4'b1011;
        #10
        data_a = 4'b0000;
        data_b = 4'b1111;
        #10
        $stop;
    end

endmodule
