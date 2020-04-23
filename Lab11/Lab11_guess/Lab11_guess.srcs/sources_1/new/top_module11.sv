`timescale 1ns / 1ps
// ELC 2137 , Makenna Meyers , 2020 -04 -22


module top_module11(

    input btnU, btnD, btnL, btnR, btnC, clk, en,
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
    wire [3:0]b_in;
    wire [3:0]y_out;
    wire win;
    wire lose;
    wire mux_out;
    wire counter_out;
   
    debounce db1(.clk(clk), .rst(btnC), .in(btnU), .out(db0_out), .tick(sw[11:0]));
    debounce db2(.clk(clk), .rst(btnC), .in(btnD), .out(db1_out), .tick(sw[11:0]));
    debounce db3(.clk(clk), .rst(btnC), .in(btnL), .out(db2_out), .tick(sw[11:0]));
    debounce db4(.clk(clk), .rst(btnC), .in(btnR), .out(db3_out), .tick(sw[11:0]));
    guess_FSM gfsm(.b0(b_in[0]), .b1(b_in[1]), .b2(b_in[2]), .b3(b_in[3]), .y0(y_out[0]), 
                   .y1(y_out[1]), .y2(y_out[2]), .y3(y_out[3]), .win(win), .lose(lose),
                   .clk(mux_out), .reset(btnC));
    counter #(.N(18)) counter(.clk(clock), .en(en), .rst(reset), .count(count_timer), .tick(tick_timer));
    mux_2 #(.N(16)) mux_guess(.in0(counter_out), .in1(clk), .out(mux_out), .sel(sw[0])); 
endmodule