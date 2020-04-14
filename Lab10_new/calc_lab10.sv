`timescale 1ns / 1ps
// Makenna Meyers , ELC 2137 , 2020-4-09


module calc_lab10(

    input btnU, btnD, btnC, clk, en,
    input [15:0]sw,
    
    output [6:0]seg,
    output [3:0]an,
    output [15:0]led,
    output dp
);

    top_lab_9 calc_unit(.btnU(btnU), .btnC(btnC), .btnD(btnD), .clk(clk), .sw(sw[11:0]), .led(led));
    sseg4_TDM disp_unit(.data({8'b00000000, led[15:8]}), .hex_dec(sw[15]), .sign(sw[14]), .reset(sw[13]), .clock(clk), .en(1), .seg(seg), .an(an), .dp(1));
endmodule

