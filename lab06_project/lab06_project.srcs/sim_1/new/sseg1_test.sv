`timescale 1ns / 1ps

module sseg1_test();
reg [15:0] sw;
wire [3:0] an;
wire [6:0] seg;
wire dp; 
wire [3:0] into;

assign dp = 1;
assign an[3:2] = 1;
assign an[1:0] = 0;

mux2_4b mux1(.sel(sw[15]), .in0(sw[3:0]), .in1(sw[7:4]), .out(into));
sseg_decoder_test deco1(.num(into),.sseg(seg));


initial begin
// Initialize
sw = 16'h0000; #10;
// Test case 1
sw [7:0] = 2'h77;
sw [15] = 1'b0 ; #10;
//an[0] = 0;
//an[1] = 1;
sw [15] = 1'b1 ; #10;
//an[0] = 1;
//an[1] = 0;
// Test case 2
// repeat with a different #
end

endmodule