`timescale 1ns / 1ps
// Makenna Meyers , ELC 2137 , 2020-4-01


module top_lab_9(

    input btnU, btnD, btnC, clk,
    input [11:0]sw,
    output [15:0]led
);
    wire [7:0]reg1_out, reg2_out, alu_out;
    
    register #(.N(8)) reg1(.clk(clk), .rst(btnC), .en(btnD), .D(sw[7:0]), .Q(reg1_out));
    alu #(.N(8)) a(.in0(sw[7:0]), .in1(reg1_out), .op(sw[11:8]), .out(alu_out));
    register #(.N(8)) reg2(.clk(clk), .rst(btnC), .en(btnU), .D(alu_out), .Q(reg2_out));
    
    assign led [7:0] = reg1_out; 
    assign led [15:8] = reg2_out;
endmodule
