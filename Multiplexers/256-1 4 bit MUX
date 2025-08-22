// declaring a top_module, which is the main module in which the code will run.
module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );

    // this kind of MUX selects 4 bits, meaning that the in[] vector needs to be segmented into 4 bit chunks (leading to 256 chunks). This means that when we're assigning the output, we need to ensure that the correct 4 bit range is selected from the in[] vector.
    assign out = in[ ( (4*sel) + 3 ) -: 4];
endmodule


// this was not a very difficult problem in concept, but I was met with a error when I initally created a 4 bit selection using "in[ ( (4*sel) + 3 ) :  (4*sel)]. This led me to learn how to use the -: operator, which allowed me to create a range of -4 bits (but in a way that uses a constant rather than the sel variable).
