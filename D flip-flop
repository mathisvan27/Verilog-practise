// the D flip-flop is one of the most important circuits in electronics and microprocessors, as it acts as a simple memory storage unit. it is often seen as the fundamental block for building sequential circuits.
// below is an example of a d flip-flop


module top_module (
    input clk,    
    input d,
    output reg q );

    // this was one of the first instances of using @(posedge clk). i learnt that this meant that the always block would run on every rising edge of the clock input, essentially running continually every clock.
    always @(posedge clk) begin
        q <= d;
    end
    

endmodule
