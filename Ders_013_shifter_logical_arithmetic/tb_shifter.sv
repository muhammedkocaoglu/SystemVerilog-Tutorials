`timescale 1ns / 1ps

module tb_shifter();

    logic signed  [7:0] din;
    logic         [2:0] sel;
    logic         [2:0] shift_count;
    logic signed [7:0] dout;

    shifter shifter_Inst
        (
            .din(din),
            .sel(sel),
            .shift_count(shift_count),
            .dout(dout)
        );

    const logic [7:0] result_vector [0:7] = '{
        8'b10011101,
        8'b01110100,
        8'b01110100,
        8'b00100111,
        8'b11100111,
        8'b01110110,
        8'b01100111,
        8'b10011101
    };
        
        

    initial begin
        din = 8'b10011101;
        shift_count = 2;

        for (int i = 0; i < 8; i++) begin
            sel = i;
            #5;
            assert (dout == result_vector[i]) begin 
                $display("result is correct");
            end else begin
                $display("result is not correct");
            end
        end

        #5;
        $stop;
    end
endmodule
