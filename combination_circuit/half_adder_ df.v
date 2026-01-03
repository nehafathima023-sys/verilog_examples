// Half Adder - Dataflow Modeling
module half_adder_df(
    input a,
    input b,
    output sum,
    output carry
);

    // Dataflow modeling using continuous assignments
    assign sum = a ^ b;        // XOR for sum
    assign carry = a & b;      // AND for carry

endmodule