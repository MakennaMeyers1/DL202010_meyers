`timescale 1ns / 1ps
// Makenna Meyers , ELC 2137 , 2020-4-01


module top_lab9(

    input btnU,
    input btnD,
    input [11:0]sw,
    input clk,
    input btnC,
    output [15:0]led
);
    wire [7:0]reg1_out;
    wire [7:0]alu_out;
    wire [15:8]reg2_out;
    
    register reg1(.clk(clk), .rst(btnC), .en(btnD), .D(sw[7:0]), .Q(reg1_out));
    alu a(.in0(sw[7:0]), .in1(reg1_out), .op(sw[11:8]), .out(alu_out));
    register reg2(.clk(clk), .rst(btnC), .en(btnU), .D(alu_out), .Q(reg2_out));
    
    assign led = {reg1_out , reg2_out};
endmodule
