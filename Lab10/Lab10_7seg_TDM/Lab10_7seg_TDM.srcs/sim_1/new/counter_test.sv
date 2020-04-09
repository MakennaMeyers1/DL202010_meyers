`timescale 1ns / 1ps
// Makenna Meyers , ELC 2137 , 2020-4-09


module counter_test ();

    reg clk , en , rst ;
    reg [3:0] count;
    wire tick;

    counter #(.N(4)) r(.count(count), .clk(clk),
        .en(en), .rst(rst), .tick(tick) );
    
    // clock runs continuously
    always begin
        clk = ~clk ; #5;
    end

    // this block only runs once
    initial begin
    clk =0; en =0; rst =0; count=4'h0; #7;
    rst = 1; #3; // reset
    count = 4'hA; en = 1; rst = 0; #10;
    count = 4'h3; #2;
    en = 0; #5;
    en = 1; #3;
    count = 4'h0; #2;
    en = 0; #10;
    en = 1; #2;
    count = 4'h6; #11;
    $finish ;
    end
endmodule