`timescale 1ns / 1ps
// Makenna Meyers , ELC 2137 , 2020-4-09


module counter_test ();

    reg clk , en , rst ;
    wire [1:0] count;
    wire tick;

    counter #(.N(2)) r(.count(count), .clk(clk),
        .en(en), .rst(rst), .tick(tick) );
    
    // clock runs continuously
    always begin
        clk = ~clk ; #5;
    end
    
    // this block only runs once
    initial begin
    clk = 0; en = 1; rst = 1; #5;
    clk = 1; en = 1; rst = 1; #5;
    clk = 0; en = 1; rst = 1; #5;
    clk = 1; en = 1; rst = 1; #5;
    clk = 0; en = 1; rst = 1; #5;
    clk = 1; en = 1; rst = 1; #5;
    clk = 0; en = 1; rst = 1; #5;
    clk = 1; en = 1; rst = 1; #5;
    clk = 0; en = 1; rst = 1; #5;
    clk = 1; en = 1; rst = 1; #5;
    clk = 0; en = 0; rst = 0; #5;
    clk = 1; en = 0; rst = 0; #5;
    clk = 0; en = 0; rst = 0; #5;
    clk = 1; en = 0; rst = 0; #5;
    clk = 0; en = 0; rst = 0; #5;
    clk = 1; en = 0; rst = 0; #5;
    clk = 0; en = 0; rst = 0; #5;
    clk = 1; en = 0; rst = 0; #5;
    clk = 0; en = 0; rst = 0; #5;
    clk = 1; en = 0; rst = 0; #5;
    clk = 0; en = 1; rst = 0; #5;
    clk = 1; en = 1; rst = 0; #5;
    clk = 0; en = 1; rst = 0; #5;
    clk = 1; en = 1; rst = 0; #5;
    clk = 0; en = 1; rst = 0; #5;
    clk = 1; en = 1; rst = 0; #5;
    clk = 0; en = 1; rst = 0; #5;
    clk = 1; en = 1; rst = 0; #5;
    clk = 0; en = 1; rst = 0; #5;
    clk = 1; en = 1; rst = 0; #5;
    clk = 0; en = 1; rst = 0; #5;
    clk = 1; en = 1; rst = 0; #5;
    clk = 0; en = 1; rst = 0; #5;
    clk = 1; en = 1; rst = 0; #5;
    clk = 0; en = 1; rst = 0; #5;
    clk = 1; en = 1; rst = 0; #5;
    clk = 0; en = 1; rst = 0; #5;
    clk = 1; en = 1; rst = 0; #5;
    clk = 0; en = 1; rst = 0; #5;
    clk = 1; en = 1; rst = 0; #5;
    clk = 0; en = 1; rst = 0; #5;
    clk = 1; en = 1; rst = 0; #5;
    clk = 0; en = 1; rst = 0; #5;
    clk = 1; en = 1; rst = 0; #5;
    clk = 0; en = 1; rst = 0; #5;
    clk = 1; en = 1; rst = 0; #5;
    clk = 0; en = 1; rst = 0; #5;
    clk = 1; en = 1; rst = 0; #5;
    clk = 0; en = 1; rst = 0; #5;
    clk = 1; en = 1; rst = 0; #5;
    clk = 0; en = 1; rst = 0; #5;
    clk = 1; en = 1; rst = 0; #5;
    clk = 0; en = 1; rst = 0; #5;
    clk = 1; en = 1; rst = 0; #5;
    clk = 0; en = 1; rst = 0; #5;
    clk = 1; en = 1; rst = 0; #5;
    $finish ;
    end
endmodule