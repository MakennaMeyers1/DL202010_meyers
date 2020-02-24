`timescale 1ns / 1ps


module sseg_decoder_test();

reg [3:0] num;
wire [6:0] sseg;
int i;

sseg_decoder deco0(.num(num),.sseg(sseg));

initial begin

    for(i=0; i<16; i=i+1)
    begin
        num = i; #10;
    end

end



endmodule