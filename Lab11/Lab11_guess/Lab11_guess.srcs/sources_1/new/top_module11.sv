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
    wire win;
    wire lose;
    wire mux_out;
    wire counter_out;
    wire counter_tick;
    wire tick;
   
   
    debounce db1(.clk(clk), .reset(btnC), .in(btnU), .out(db0_out), .tick(tick));
    debounce db2(.clk(clk), .reset(btnC), .in(btnD), .out(db1_out), .tick(tick));
    debounce db3(.clk(clk), .reset(btnC), .in(btnL), .out(db2_out), .tick(tick));
    debounce db4(.clk(clk), .reset(btnC), .in(btnR), .out(db3_out), .tick(tick));
    guess_FSM gfsm(.b0(b_in[0]), .b1(b_in[1]), .b2(b_in[2]), .b3(b_in[3]), .y0({seg[0], an[0]}), 
                   .y1({seg[1], an[1]}), .y2({seg[2], an[2]}), .y3({seg[3], an[3]}), .win(led[15:8]), .lose(led[7:0]),
                   .clk(mux_out), .reset(btnC));
    counter #(.N(8)) counter(.clk(clk), .en(1), .rst(btnC), .count(counter_out), .tick(counter_tick));
    mux_2 #(.N(16)) mux_guess(.in0(counter_out), .in1(clk), .out(mux_out), .sel(sw[0])); 
endmodule