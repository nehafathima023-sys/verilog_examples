// Full Adder using Data Flow Modeling
module full_adder (
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
);
    assign Sum = A ^ B ^ Cin; // Sum is the XOR of A, B, and Cin
    assign Cout = (A & B) | (Cin & (A ^ B)); // Cout is generated based on the carry logic
endmodule

// Test Bench for Full Adder
module tb_full_adder;
    reg A;
    reg B;
    reg Cin;
    wire Sum;
    wire Cout;

    // Instantiate the full adder
    full_adder uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        // Test cases
        $monitor("A=%b, B=%b, Cin=%b | Sum=%b, Cout=%b", A, B, Cin, Sum, Cout);
        
        // Test case 1
        A = 0; B = 0; Cin = 0; #10;
        // Test case 2
        A = 0; B = 0; Cin = 1; #10;
        // Test case 3
        A = 0; B = 1; Cin = 0; #10;
        // Test case 4
        A = 0; B = 1; Cin = 1; #10;
        // Test case 5
        A = 1; B = 0; Cin = 0; #10;
        // Test case 6
        A = 1; B = 0; Cin = 1; #10;
        // Test case 7
        A = 1; B = 1; Cin = 0; #10;
        // Test case 8
        A = 1; B = 1; Cin = 1; #10;

        $finish; // End the simulation
    end
endmodule