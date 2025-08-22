// this module is designed to instantiate a given bcd_fadd module, which creates a one digit BCD ripple carry adder, 4 times. 



module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    
    wire [4:0] carry;
    assign carry[0] = cin;
    generate
        genvar i;
        for (i = 0 ; i < 4 ; i++) begin :forloop
            bcd_fadd instance1(.a(a[((4*i)+3) -: 4]) ,.b(b[((4*i)+3) -: 4]) , .sum(sum[((4*i)+3) -: 4]) , .cin(carry[i]) ,.cout(carry[i+1]) );
        end
    endgenerate
    assign cout = carry[4];

endmodule
