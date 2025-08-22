// this module creates a 32 bit linear feedback shift register, with taps at bit positions 32, 22, 2 and 1.
// taps incorporate XOR statements with the previous q value and q[0].


module top_module(
    input clk,
    input reset,
    output reg [31:0] q
);

    always @(posedge clk) begin
        if (reset) begin
            // on reset, load the register with the specified state of 32'h1
            q <= 32'h1;
        end 
        else begin

            // simple shifts for the non-tapped sections
            q[30:22] <= q[31:23];
            q[20:2]  <= q[21:3];

            // feedback logic at the tap locations
            q[31] <= q[0];                // tap 32: the output bit becomes the new MSB.
            q[21] <= q[22] ^ q[0];        // tap 22: input to q[21] is q[22] XOR feedback.
            q[1]  <= q[2]  ^ q[0];        // tap 2:  input to q[1] is q[2] XOR feedback.
            q[0]  <= q[1]  ^ q[0];        // tap 1:  input to q[0] is q[1] XOR feedback.
        end
    end

endmodule
