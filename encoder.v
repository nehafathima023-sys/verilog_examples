module encoder4x2 (
    input  wire [3:0] d,   // one-hot inputs
    output reg  [1:0] y     // encoded output
);

always @(*) begin
    case (d)
        4'b0001: y = 2'b00;
        4'b0010: y = 2'b01;
        4'b0100: y = 2'b10;
        4'b1000: y = 2'b11;
        default: y = 2'bxx; // invalid / no input / multiple inputs
    endcase
end

endmodule
timescale 1ns/1ps

module tb_encoder4x2;

    reg  [3:0] d;
    wire [1:0] y;

    // DUT instantiation
    encoder4x2 dut (
        .d(d),
        .y(y)
    );

    initial begin
        $monitor("Time=%0t | d=%b -> y=%b", $time, d, y);

        d = 4'b0001; #10;
        d = 4'b0010; #10;
        d = 4'b0100; #10;
        d = 4'b1000; #10;

        // Invalid cases
        d = 4'b0000; #10;
        d = 4'b0011; #10;

        $finish;
    end

endmodule

