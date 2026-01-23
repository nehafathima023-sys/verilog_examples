// 4x1 Multiplexer
module mux_4x1(
    input [3:0] data_in,    // 4 input lines
    input [1:0] sel,        // 2-bit select signal
    output reg data_out     // Output
);

always @(*) begin
    case(sel)
        2'b00: data_out = data_in[0];
        2'b01: data_out = data_in[1];
        2'b10: data_out = data_in[2];
        2'b11: data_out = data_in[3];
        default: data_out = 1'b0;
    endcase
end

endmodule

// Testbench
module tb_mux_4x1;
    reg [3:0] data_in;
    reg [1:0] sel;
    wire data_out;

    mux_4x1 uut(
        .data_in(data_in),
        .sel(sel),
        .data_out(data_out)
    );

    initial begin
        $monitor("Time=%0t | sel=%b | data_in=%b | data_out=%b", 
                 $time, sel, data_in, data_out);
        
        data_in = 4'b1010;
        
        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;
        
        $finish;
    end

endmodule