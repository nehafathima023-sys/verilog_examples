module not_gate (
    input  wire a,
    output wire y
);

assign y = ~a;

endmodule
timescale 1ns/1ps

module tb_not_gate;

    reg a;
    wire y;

    // Instantiate DUT
    not_gate dut (
        .a(a),
        .y(y)
    );

    initial begin
        $monitor("Time=%0t | a=%b -> y=%b", $time, a, y);

        a = 0; #10;
        a = 1; #10;

        $finish;
    end

endmodule
