`timescale 1ns / 1ps
// ELC 2137 , Makenna Meyers , 2020 -04 -22


module guessing_game #( parameter N =21)

    ( input btnU, btnD, btnL, btnR, btnC, clk, en,
    input [15:0]sw,
    
    output [6:0]seg,
    output [3:0]an,
    output [15:0]led,
    output dp
);

    wire db0_out;
    wire db1_out;
    wire db2_out;
    wire db3_out;
    wire [3:0] b_in;
    wire y3, y2, y1, y0;
    wire mux_out;
    wire counter_out;
    wire counter_tick;
    wire tick;
    
    assign b_in = {db3_out, db2_out, db1_out, db0_out};
    assign led[15:3] = 0;
   
    debounce #(.N(21)) db0(.clk(clk), .reset(btnC), .in(btnU), .out(db0_out), .tick(tick));
    debounce #(.N(21)) db1(.clk(clk), .reset(btnC), .in(btnD), .out(db1_out), .tick(tick));
    debounce #(.N(21)) db2(.clk(clk), .reset(btnC), .in(btnL), .out(db2_out), .tick(tick));
    debounce #(.N(21)) db3(.clk(clk), .reset(btnC), .in(btnR), .out(db3_out), .tick(tick));
    guess_FSM #(.N(21)) gfsm(.b(b_in), 
                   .y({{an[0], seg[6]}, {an[0], seg[5]}, {an[0], seg[1]}, {an[0], seg[0]}}),
                   .win(led[1]), .lose(led[0]),
                   .clk(mux_out), .reset(btnC));
    counter #(.N(1)) counter(.clk(clk), .en(1), .rst(btnC), .count(counter_out), .tick(counter_tick));
    mux_2 #(.N(1)) mux_guess(.in0(counter_out), .in1(clk), .out(mux_out), .sel(sw[0])); 
endmodule