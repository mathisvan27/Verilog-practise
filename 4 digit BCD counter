// this  module creates a 4 digit counter (up to 9999) by creating and instantiating a counter module 4 times, once for the units, tens, hundreds and thousands digits.



module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);

    // create outputs for the units, tens, hundreds and thousands
    wire [3:0] q1, q2, q3, q4;

    // create enable flags for the counters for each digit, depending on whether the previous digits are equal to 9
    wire enable;
    assign enable = 1;
    assign ena[1] = q1 == 9;
    assign ena[2] = (q2 == 9) & (q1 == 9);
    assign ena[3] = (q3 == 9) & (q2 == 9) & (q1 == 9);

    // instantiate the counters for the digits
    counter units (clk, reset, enable, q1);
    counter tens (clk, reset, ena[1], q2);
    counter hundreds (clk, reset, ena[2], q3);
    counter thousands (clk, reset, ena[3], q4);

    // concatenate the outputs of the instantiations to create a final 4 digit number
    assign q = {q4,q3,q2,q1};
    
endmodule

// this module is used to create the counter for the units, tens, hundreds and thousands digits
module counter (
    input clk,
    input reset,
    input ena,
    output [3:0] q);
    
    always @(posedge clk) begin
    
        // if the reset input is triggered or the number is at 9 reset back to 0
        if (reset | (q == 9 & ena)) begin
            q <= 0;
        end
        
        // if not then increment
        else if (ena) begin
            q++;
        end
        
    end
endmodule
