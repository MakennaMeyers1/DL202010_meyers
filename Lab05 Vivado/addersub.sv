/*
`timescale 1ns / 1ps

module addersub(input cin,
                input [3:0] a, b,
                output cout,
                output [3:0] sum);
                
        wire x0,x1,x2,x3;
        wire c0,c1,c2,c3;
        
        xor (x0, b[0], cin);
        xor (x1, b[1], cin);
        xor (x2, b[2], cin);
        xor (x3, b[3], cin);
        
         //xor (cout,c2,cin);
        
        fulladder fa0(.a(a[0]), .b(x0), .cin(cin), .sum(sum[0]), .cout(c0));
        fulladder fa1(.a(a[1]), .b(x1), .cin(c0), .sum(sum[1]), .cout(c1));
        fulladder fa2(.a(a[2]), .b(x2), .cin(c1), .sum(sum[2]), .cout(c2));
        fulladder fa3(.a(a[3]), .b(x3), .cin(c2), .sum(sum[3]), .cout(c3));
        
        
        endmodule
        
        */
       
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
        //xor (cout, c1, c1);
        xor (V, c1, c0); 
        
        fulladder fa0(.a(a[0]), .b(x0), .cin(cin), .sum(sum[0]), .cout(c0));
        fulladder fa1(.a(a[1]), .b(x1), .cin(c0), .sum(sum[1]), .cout(c1));
        
        
        endmodule
        
        
        
        /*
    `timescale 1ns / 1ps    
        module full_adder(S, Cout, A, B, Cin);
   output S;
   output Cout;
   input  A;
   input  B;
   input  Cin;
   
   wire   w1;
   wire   w2;
   wire   w3;
   wire   w4;
   
   xor(w1, A, B);
   xor(S, Cin, w1);
   and(w2, A, B);   
   and(w3, A, Cin);
   and(w4, B, Cin);   
   or(Cout, w2, w3, w4);
endmodule // full_adder
*/