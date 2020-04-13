`timescale 1ns / 1ps
// Makenna Meyers , ELC 2137 , 2020-4-09


module sseg4_TDM_test ();

    reg clk , en , rst, sign, hex_dec;
    reg [15:0]data;
    
    wire [6:0] seg;
    wire [3:0] an;
    wire dp;
    wire [1:0] count;
    wire tick;

    sseg4_TDM s4test(.data(data), .hex_dec(hex_dec), .sign(sign), .en(en), .reset(rst), .clock(clk), .seg(seg), .an(an), .dp(dp));
    
    // clock runs continuously
    always begin
        clk = ~clk ; #30;
    end
    
    // this block only runs once
    initial begin
    clk = 0; en = 1; rst = 1; #30;
    en = 1; rst = 0; #10;
    en = 1; rst = 0; #10;
    en = 1; rst = 0; #10;
    en = 1; rst = 0; #10;
    en = 1; rst = 0; #10;
    en = 1; rst = 0; #10;
    en = 1; rst = 0; #10;
    en = 1; rst = 0; #10;
    en = 1; rst = 0; #10;
    en = 1; rst = 0; #10;
    en = 1; rst = 0; #10;
    en = 1; rst = 0; #10;
    en = 1; rst = 0; #10;
    en = 1; rst = 0; #10;
    en = 1; rst = 0; #10;
    en = 1; rst = 0; #10;
    en = 1; rst = 0; #10;
    en = 1; rst = 0; #10;
    en = 1; rst = 0; #10;
    en = 1; rst = 0; #10;
    en = 1; rst = 0; #10;
    en = 1; rst = 0; #10;
    en = 1; rst = 0; #10;
    en = 1; rst = 0; #10;
    en = 1; rst = 0; #10;
    en = 1; rst = 0; #10;
    $finish ;
    end
endmodule