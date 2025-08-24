// shift registers are the fundamental way to store and manipulate binary data. the following module is an example of a 4 bit shift right register with an async reset

module top_module(
    input clk,
    input areset,  // async active-high reset to zero
    input load,
    input ena,
    input [3:0] data,
    output reg [3:0] q); 
    
    always @(posedge clk, posedge areset) begin
        if (areset) begin
            q <= 0;
        end
       	else if (load) begin
            q <= data;
        end
        else if (ena) begin

            // for shift right registers, the push in value on the leftmost bit is a 0
            q <= {1'b0,q[3:1]};
        end
    end
    

endmodule
