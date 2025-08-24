// this was by far the most difficult task i was presented with. the concepts were simple, especially with creating the counters for the units and minutes.
// this was becasue both of the minutes and seconds only count up to 59 before having to reset and trigger the next unit.
// the main problem was trying to get the hour counter (alongside the AM/PM function) to work as it can only go from 1 to 12, resetting at 12 instead of 00.
// at first i tried just doing ss,mm and hh as a single vector, but soon realised that i had to split each into 2 1 digit BCDs or else the output would be in hex rather than dec (an issue when the time is over 9 seconds, minutes and hours.


module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss);

    // Internal registers for BCD digits of seconds and minutes
    reg [3:0] s1, s2, m1, m2;

    // Wires to enable the next counter stage
    wire ena_s1, ena_s2, ena_m1, ena_m2, ena_h;

    // The first second digit is always enabled by the main enable
    assign ena_s1 = ena;
    // Enable the tens-of-seconds digit when the first digit rolls over from 9
    assign ena_s2 = ena && (s1 == 9);
    // Enable the minutes digit when seconds roll over from 59
    assign ena_m1 = ena && (s2 == 5) && (s1 == 9);
    // Enable the tens-of-minutes digit when the first digit rolls over from 9
    assign ena_m2 = ena && (m1 == 9) && (s2 == 5) && (s1 == 9);
    // Enable the hour counter when minutes roll over from 59
    assign ena_h  = ena && (m2 == 5) && (m1 == 9) && (s2 == 5) && (s1 == 9);

    // Instantiate the counters for seconds and minutes
    // These count up to a specified max value and then roll over to 0.
    secmin sec1 (clk, reset, ena_s1, 4'd9, s1);
    secmin sec2 (clk, reset, ena_s2, 4'd5, s2);
    secmin min1 (clk, reset, ena_m1, 4'd9, m1);
    secmin min2 (clk, reset, ena_m2, 4'd5, m2);

    // Instantiate the new 12-hour counter
    hour hour_counter (clk, reset, ena_h, pm, hh);

    // Combine the BCD digits into 8-bit outputs
    assign ss = {s2, s1};
    assign mm = {m2, m1};
    // Note: hh is now driven directly by the hour_counter module

endmodule


// This module is a generic BCD counter that counts from 0 to a specified max value.
module secmin(
    input clk,
    input reset,
    input ena,
    input [3:0] max,
    output reg [3:0] q);

    always @(posedge clk) begin
        if (reset) begin
            q <= 0;
        end
        // If enabled and at the max value, roll over to 0
        else if (ena && (q == max)) begin
            q <= 0;
        end
        // Otherwise, if enabled, increment
        else if (ena) begin
            q <= q + 1; // Note: Use non-blocking for increment
        end
    end
endmodule


// This module implements the logic for a 12-hour clock with an AM/PM indicator.
module hour(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output [7:0] hh);

    // Internal registers to store the hour in BCD format (h2 = tens, h1 = units)
    reg [3:0] h1, h2;

    // Continuously assign the BCD digits to the 8-bit output
    assign hh = {h2, h1};

    always @(posedge clk) begin
        // create all the special cases, where the hours are reset to 12, hours are going from 09 to 10, 11 to 12, and 12 back to 01
        if (reset) begin
            // On reset, set the time to 12:00 AM
            h2 <= 1;
            h1 <= 2;
            pm <= 0; // 0 for AM, 1 for PM
        end
        else if (ena) begin
            // This block only executes when the hour needs to change
            if (h2 == 1 && h1 == 1) begin         // If the time is 11:xx
                h2 <= 1;
                h1 <= 2;                          // Go to 12:xx
                pm <= ~pm;                        // Flip between AM and PM
            end
            else if (h2 == 1 && h1 == 2) begin    // If the time is 12:xx
                h2 <= 0;
                h1 <= 1;                          // Go to 1:xx
            end
            else if (h2 == 0 && h1 == 9) begin    // If the time is 9:xx
                h2 <= 1;
                h1 <= 0;                          // Go to 10:xx
            end
            // if none of the special cases just increment the hours
            else begin                            // For all other hours (1-8)
                h1 <= h1 + 1;                     // Just increment the units digit
            end
        end
    end
endmodule
