`timescale 1ns / 1ps


module sseg_decoder(
    input [3:0] num,
    output reg [6:0] sseg
    );
    
    always @(num)
    begin
        case(num)
        0 : sseg = 7'b0000001;
        1 : sseg = 7'b1001111;
        2 : sseg = 7'b0010010;
        3 : sseg = 7'b0000110;
        4 : sseg = 7'b1001100;
        5 : sseg = 7'b0100100;
        6 : sseg = 7'b0100000;
        7 : sseg = 7'b0001111;
        8 : sseg = 7'b0000000;
        9 : sseg = 7'b0000100;
        
        default : sseg = 7'b1111111;
                 
        endcase
        end
endmodule
