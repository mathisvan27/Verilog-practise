// finite state machines are a way of handling multiple states with their own logic, then linking them through transition logic
// a useful way of looking at it is by breaking down the states of a vending machine, from drink selection, payment and dispensal.
// each of these states have their own processes and transition between these states using logic.


// this FSM has two states, A and B. if input in is 0, the state is transitioned to the next state (A to B or B to A). the output
// is set to 0 if the current state is A or 1 if the current state is B. if areset is triggered, the state is reset to B.

module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

    parameter A=0, B=1; 
    reg state, next_state;

    always @(*) begin    // This is a combinational always block
        // State transition logic
        if (in == 1) begin
            next_state <= state;
        end
        else if (in == 0 & state == A) begin
            next_state <= B;
        end
        else begin
            next_state <= A;
        end
    end

    always @(posedge clk, posedge areset) begin    // This is a sequential always block
        // State flip-flops with asynchronous reset
        if (areset) begin
            state <= B;
        end
        else begin
            state <= next_state;
        end
    end

    // Output logic
    // assign out = (state == ...);
    assign out = (state == A) ? 0 : 1;
endmodule
