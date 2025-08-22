// the aim of this module is to produce 8 D flip-flops that output the value of the d vector. it contains an active-high asynchonous reset input, meaning that the rising edge of the areset input (triggering the reset) does not necessarily 
// rise as the same time as the clock, meaning that the procedural block must run at either the rising edge of the clock input or the rising edge of the areset input.

module top_module (
    input clk,
    input areset,   // active high asynchronous reset
    input [7:0] d,
    output [7:0] q
);

    
    always @(posedge clk, posedge areset) begin  // if areset was synchronous line would be "always @(posedge clk) begin"
        if (areset) begin
            // if the reset is triggered, set the output q vector to 0 (important not to set the input d vector to 0);
            q <= 0;
        end
        else begin
            q <= d;
        end   
    end
    
    
endmodule
