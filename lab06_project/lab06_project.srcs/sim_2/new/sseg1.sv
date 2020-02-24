`timescale 1ns / 1ps


module sseg1(
    input [7:0] sw,
    input [15] sw,
    output dp,
    output reg [3:0] an,
    output reg [6:0] seg,
    );

wire [4:0] into;
mux2_4b mux1(.sel(sw[15]), .in0(sw[3:0]), .in1(sw[7:4]), .out(into));
sseg_decoder_test deco1(.num(into),.sseg(seg));



endmodule