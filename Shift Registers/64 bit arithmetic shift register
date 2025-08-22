// this module creates a 64 bit shift register, where the direction of shift depends on an input amount vector.
// the amount vector determines whether the bits shift left or right, as well as whether it shifts by 1 bit or 8 bits.
// an important thing to remember with arithmetic shift registers compared to logical shift registers is that the push in bits are equal to the sign bits of the original vector.
// this means that if the shift register is shifted right by 8 bits, 8 sign bits must be pushed in to the left.


module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q); 
    
    
    always @(posedge clk) begin
        if (load) begin
            q <= data;
        end
        else if (ena) begin

            // create a case statement for what direction/how many bits are shifted
            case (amount)

                // use concatenation to create the shift register
                2'b00: q <= {q[62:0], 1'b0};
                2'b01: q <= {q[55:0], 8'b0};
                2'b10: q <= {q[63], q[63:1]};
                2'b11: q <= {{8{q[63]}}, q[63:8]};
                default: q <= q;
            endcase
        end
    end

endmodule
