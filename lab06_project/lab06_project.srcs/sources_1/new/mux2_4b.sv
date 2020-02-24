`timescale 1ns / 1ps


module mux2_4b(
    input [7:4] in0,
    input [3:0] in1,
    input sel,
    output [3:0] out
    );
    
    assign out = sel?in1:in0;
    
endmodule
