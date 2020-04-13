`timescale 1ns / 1ps
// Makenna Meyers , ELC 2137 , 2020-04-09


module sseg4_TDM(

input [15:0]data, 
input hex_dec,
input sign,
input reset,
input clock,
input en,

output [6:0]seg, 
output [3:0]an,
output dp

);

wire [15:0]bcd_out; 
wire [15:0]hex_dec_out; 
wire [3:0]dig_sel_out; 
wire [6:0]sseg_decode_out; 
wire out1;
wire [1:0] counter_timer_tick;
wire [1:0] counter2_out;

BCDmod11 bcd(.in1(data[10:0]),.out11(bcd_out));
mux2 #(.N(16)) mux_hexdec(.in0(data), .in1(bcd_out), .out(hex_dec_out), .sel(hex_dec)); 
mux4 #(.N(4)) mux_digit_sel(.in3(hex_dec_out[15:12]), .in2(hex_dec_out[11:8]), .in1(hex_dec_out[7:4]),
            .in0(hex_dec_out[3:0]), .out(dig_sel_out), .sel(counter2_out)); 
sseg_decoder s(.num(dig_sel_out),.sseg(sseg_decode_out));
mux2 #(.N(7)) mux_sseg(.in0(sseg_decode_out), .in1(7'b0111111), .out(seg), .sel(out1)); 
an_decode ad(.digit_sel(counter2_out), .an(an)); 
and a1(out1, sign, ~an[3]);
counter #(.N(18)) timer(.clk(clock), .en(en), .rst(reset), .tick(counter_timer_tick) );
counter #(.N(2)) counter2(.clk(counter_timer_tick), .en(en), .rst(reset), .count(counter2_out));

assign en=1;
assign dp=1;
 
endmodule