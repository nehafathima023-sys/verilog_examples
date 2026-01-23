// 1x4 Demultiplexer
module demux_1x4 (
    input wire data_in,
    input wire [1:0] sel,
    output reg [3:0] data_out
);

always @(*) begin
    data_out = 4'b0000;
    case (sel)
        2'b00: data_out[0] = data_in;
        2'b01: data_out[1] = data_in;
        2'b10: data_out[2] = data_in;
        2'b11: data_out[3] = data_in;
    endcase
end

endmodule

// Testbench for 1x4 Demultiplexer
module demux_1x4_tb;
    reg data_in;
    reg [1:0] sel;
    wire [3:0] data_out;

    demux_1x4 dut (
        .data_in(data_in),
        .sel(sel),
        .data_out(data_out)
    );

    initial begin
        $monitor("Time=%0t | data_in=%b | sel=%b | data_out=%b",
                 $time, data_in, sel, data_out);

        // Test case 1: sel=00
        data_in = 1'b1;
        sel = 2'b00;
        #10;

        // Test case 2: sel=01
        sel = 2'b01;
        #10;

        // Test case 3: sel=10
        sel = 2'b10;
        #10;

        // Test case 4: sel=11
        sel = 2'b11;
        #10;

        // Test case 5: data_in=0
        data_in = 1'b0;
        sel = 2'b00;
        #10;

        $finish;
    end

endmodule