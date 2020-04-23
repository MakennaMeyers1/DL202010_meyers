`timescale 1ns / 1ps
// ELC 2137 , Makenna Meyers , 2020 -04 -22

module mux_2
    #(parameter N = 1) 
    (input [N-1:0] in0, in1, 
    input sel, 
    output reg [N-1:0]out
    );
    
    always @* 
    begin 
        case (sel) 
            1'b0 : out <= in0;
            default : out <= in1;
        endcase
    end 
    
endmodule
