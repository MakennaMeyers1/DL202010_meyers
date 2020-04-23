`timescale 1ns / 1ps
// Makenna Meyers , ELC 2137 , 2020-4-09


module sseg4_TDM_test ();

    reg clk , en, rst, sign, hex_dec;
    reg [15:0]data;
    
    wire [6:0] seg;
    wire[3:0] an;
    wire dp;

    sseg4_TDM s4test(.data(data), .hex_dec(hex_dec), .sign(sign), .en(en), .reset(rst), .clock(clk), .seg(seg), .an(an), .dp(dp)); 
    
    always begin
        clk = ~clk; #1;
    end
    
    // this block only runs once
    initial begin
        clk = 0; rst = 0; #5
        rst = 1; #5
        rst = 0; sign = 0; hex_dec = 1; 
        data = 16'b000000000000; #1000000;
        data = 16'b000000000001; #1000000;
        data = 16'b000000000010; #1000000;
        data = 16'b000000000011; #1000000;
        data = 16'b000000000100; #1000000;
        data = 16'b000000000101; #1000000;
        data = 16'b000000000110; #1000000;
        data = 16'b000000000111; #1000000;
        data = 16'b000000001000; #1000000;
        data = 16'b000000001001; #1000000;
        data = 16'b000000001010; #1000000;
        data = 16'b000000001011; #1000000;
        data = 16'b000000001100; #1000000;
        data = 16'b000000001101; #1000000;
        data = 16'b000000001110; #1000000;
        data = 16'b000000001111; #1000000;
        data = 16'b000000010000; #1000000;
        data = 16'b000000010001; #1000000;
        data = 16'b000000010010; #1000000;
        data = 16'b000000010011; #1000000;
        data = 16'b000000010100; #1000000;
        data = 16'b000000010101; #1000000;
        data = 16'b000000010110; #1000000;
        data = 16'b000000010111; #1000000;
        data = 16'b000000011000; #1000000;
        data = 16'b000000011001; #1000000;
        data = 16'b000000011010; #1000000;
        data = 16'b000000011011; #1000000;
        data = 16'b000000011100; #1000000;
        data = 16'b000000011101; #1000000;
        data = 16'b000000011110; #1000000;
        data = 16'b000000011111; #1000000;
        $finish;
    end
    
endmodule

