// 4-bit ALU
module ALU(
    input [3:0] A,      // 4-bit input A
    input [3:0] B,      // 4-bit input B
    input [1:0] Sel,    // 2-bit operation select
    output reg [3:0] F, // 4-bit output
    output reg Cout     // Carry out (for addition/subtraction)
);

always @(*) begin
    case(Sel)
        2'b00: {Cout, F} = A + B;        // Addition
        2'b01: {Cout, F} = A - B;        // Subtraction
        2'b10: F = A & B;                // AND
        2'b11: F = A | B;                // OR
        default: F = 4'b0000;
    endcase
end

endmodule
`timescale 1ns/1ps

module ALU_tb;

// Testbench signals
reg [3:0] A;
reg [3:0] B;
reg [1:0] Sel;
wire [3:0] F;
wire Cout;

// Instantiate the ALU
ALU uut (
    .A(A),
    .B(B),
    .Sel(Sel),
    .F(F),
    .Cout(Cout)
);

initial begin
    // Display format
    $monitor("Time=%0t | A=%b B=%b Sel=%b => F=%b Cout=%b", $time, A, B, Sel, F, Cout);

    // Test 1: Addition
    A = 4'b0101; B = 4'b0011; Sel = 2'b00;
    #10;

    // Test 2: Subtraction
    A = 4'b1100; B = 4'b0101; Sel = 2'b01;
    #10;

    // Test 3: AND
    A = 4'b1010; B = 4'b1100; Sel = 2'b10;
    #10;

    // Test 4: OR
    A = 4'b1010; B = 4'b0101; Sel = 2'b11;
    #10;

    $finish;
end

endmodule
