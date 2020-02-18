`timescale 1ns / 1ps

module  fulladder_test ();
reg cin; 
reg [3:0] a , b;
wire  cout , sum;

halfadder  ha0(.a(a), .b(b), .s(s1), .c(c1));
initial begin
    cin=0; a=0; b=0;  #10;
    cin=0; a=0; b=1;  #10;
    cin=0; a=1; b=0;  #10;
    cin=0; a=1; b=1;  #10;
    cin=1; a=0; b=0;  #10;
    cin=1; a=0; b=1;  #10;
    cin=1; a=1; b=0;  #10;
    cin=1; a=1; b=1;  #10;
    
    $finish;
end

halfadder  ha1(.a(a), .b(b), .s(sum), .c(cout));
initial begin
    cin=0; a=0; b=0;  #10;
    cin=0; a=0; b=1;  #10;
    cin=0; a=1; b=0;  #10;
    cin=0; a=1; b=1;  #10;
    cin=1; a=0; b=0;  #10;
    cin=1; a=0; b=1;  #10;
    cin=1; a=1; b=0;  #10;
    cin=1; a=1; b=1;  #10;
    
    $finish;
end
endmodule 