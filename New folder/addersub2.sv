`timescale 1ns / 1ps

module addersub(input cin,
                input [1:0] a, b,
                output cout, V,
                output [1:0] sum);
                
        wire x0,x1;
        wire c0;
        
        xor (x0, b[0], cin);
        xor (x1, b[1], cin);
        xor (cout, c1, cin);
        xor (V, c1, c0); 
        
        fulladder fa0(.a(a[0]), .b(x0), .cin(cin), .sum(sum[0]), .cout(c0));
        fulladder fa1(.a(a[1]), .b(x1), .cin(c0), .sum(sum[1]), .cout(c1));
        
        
        endmodule