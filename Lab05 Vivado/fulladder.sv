`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/11/2020 03:26:50 PM
// Design Name: 
// Module Name: fulladder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module  fulladder (input a, b, cin ,output sum , cout);

wire s1 , c1, c2;
halfadder  ha0(.a(a), .b(b), .s(s1), .c(c1));
halfadder  ha1(.a(a), .b(b), .s(sum), .c(cout));

or o1(cout,c1,c2);
/*assign  c1 = a&b; 
assign  s1 = a^b; 
assign  c2 = cin & s1; 

assign  sum = cin & s1; 
assign  cout = c1 | c2; */
endmodule

