`timescale 1ns / 1ps
// ELC 2137 , Makenna Meyers , 2020 -04 -22

module an(
    input [1:0]digit_sel,
    output reg [3:0]an
    );
    
    always @* 
    begin 
        case ({digit_sel}) 
            2'b00 : an <= 4'b1110;
            2'b01 : an <= 4'b1101;
            2'b10 : an <= 4'b1011;
            default : an <= 4'b0111;
        endcase
    end    
    
endmodule
