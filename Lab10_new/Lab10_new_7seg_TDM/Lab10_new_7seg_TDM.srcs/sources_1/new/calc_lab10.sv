`timescale 1ns / 1ps
// Makenna Meyers , ELC 2137 , 2020-4-09


module calc_lab10(

    input btnU, btnD, btnC, clock,
    input [15:0]sw,
    
    output [6:0]sseg,
    output [3:0]an,
    output dp,
    output [15:0]led
);
    
    top_lab_9 calc_unit(.btnU(btnU), .btnC(btnC), .btnD(btnD), .clk(clock), .sw(sw[11:0]), .led(led[7:0]));
    sseg4_TDM disp_unit(.data({8'b00000000, led[15:8]}), .hex_dec(sw[15]), .sign(sw[14]), .reset(sw[13]), .clock(clock), .seg(sseg), .an(an), .dp(dp));
endmodule
