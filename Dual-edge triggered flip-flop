// this module combines the ability to incorporate dual edge detection with a D flip-flop. a big issue I had that I was not allowed to just create a procedural block
// using the @(posedge clk, negedge clk) statement, as it doesn't work with the sensitivity list. but as input d can change on the rising or falling edge of the clock
// i had to make sure i could figure out how to detect it on both edges. this led me to create 2 different procedural blocks, one on the rising edge and one on the falling edge.
// each block contained a flip flop that would store the value of in, and then the output q was the output of a 2-1 multiplexer between q1 and q2 using the clock as the selector bit.


module top_module (
    input clk,
    input d,
    output q
);
	reg q1, q2;

    // create a D flip-flop for the positive edge of the clock
    always @(posedge clk) begin
        q1 <= d;
    end
    
    // create a D flip-flop for the negative edge of the clock
    always @(negedge clk) begin
        q2 <= d;
    end


    // the output q is determined by whether the clock is high or low
    assign q = clk ? q1 : q2;

endmodule
