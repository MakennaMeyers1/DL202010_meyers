`timescale 1ns / 1ps
// Makenna Meyers, ELC 2137, 2020-04-09


module Add3(
    
    input [3:0]in1, 
    output reg [3:0]out1
    );
    
    always @* begin
        if (in1 >= 4'b0101) begin 
            out1 = in1 + 4'b0011;
        end
        
        else begin 
            out1 = in1; 
        end
    end
    
endmodule