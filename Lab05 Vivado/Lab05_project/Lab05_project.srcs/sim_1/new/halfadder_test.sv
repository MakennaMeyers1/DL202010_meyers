`timescale 1ns / 1ps

module  halfadder_test ();
    reg a, b;
    wire c, s;
    
    halfadder  ha0(
    .a(a), .b(b), 
    .c(c), .s(s)
    );
    
    initial  begin
        a=0; b=0;  #10;
        a=1; b=0;  #10;
        a=1; b=1;  #10;
        a=0; b=1;  #10;
        
    $finish;
   end
endmodule  