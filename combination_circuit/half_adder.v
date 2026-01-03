// Half Adder - Behavioral Level Modeling
module half_adder (
    input a, b,
    output sum, carry
);

always @(*) begin
    sum = a ^ b;      // XOR for sum
    carry = a & b;    // AND for carry
end

endmodule

// Testbench for Half Adder
module tb_half_adder;
    reg a, b;
    wire sum, carry;

    // Instantiate half adder
    half_adder uut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        $monitor("Time=%0t | a=%b, b=%b | sum=%b, carry=%b", $time, a, b, sum, carry);
        
        // Test cases
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;
        
        $finish;
    end

endmodule