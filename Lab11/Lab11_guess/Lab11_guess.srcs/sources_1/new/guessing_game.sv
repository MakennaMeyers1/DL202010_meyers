`timescale 1ns / 1ps
// ELC 2137 , Makenna Meyers , 2020 -04 -22


module guessing_game #( parameter N =21)

    ( input btnU, btnD, btnL, btnR, btnC, clk, en,
    input [15:0]sw,
    
    output [6:0]seg,
    output [3:0]an,
    output [15:0]led
);

    wire db0_out;
    wire db1_out;
    wire db2_out;
    wire db3_out;
    wire [3:0]y;
    wire win;
    wire lose;
    wire mux_out;
    wire counter_out;
    wire counter_tick;
    wire tick;
   
   
    debounce #(.N(21)) db0(.clk(clk), .reset(btnC), .in(btnU), .out(db0_out));
    debounce #(.N(21)) db1(.clk(clk), .reset(btnC), .in(btnD), .out(db1_out));
    debounce #(.N(21)) db2(.clk(clk), .reset(btnC), .in(btnL), .out(db2_out));
    debounce #(.N(21)) db3(.clk(clk), .reset(btnC), .in(btnR), .out(db3_out));
    
    guess_FSM #(.N(21)) gfsm(.b( {db3_out, db2_out, db1_out, db0_out}), .y(y), .win(win), .lose(lose),
                   .clk(mux_out), .reset(btnC));
                   
    counter #(.N(1)) counter(.clk(clk), .en(1), .rst(btnC), .count(counter_out), .tick(counter_tick));
    
    mux_2 #(.N(1)) mux_guess(.in0(counter_out), .in1(clk), .out(mux_out), .sel(sw[0])); 
    
    
    assign led[15:3] = 0;
    assign led[1] = win;
    assign led[0] = lose;
    
    assign seg[6] = y[3];
    assign seg[5] = y[2];
    assign seg[1] = y[1];
    assign seg[0] = y[0];
    
    assign an[0] = y[3:0];
    
endmodule
