`timescale 1ns / 1ps


module mux2_4b_test();

reg sel, in0, in1;
wire out;

mux2_4b mux0(.sel(sel), .in0(in0), .in1(in1), .out(out));



initial begin 
in0 = 0;
in1 = 0;
sel = 0;
#100;

in0 = 0; in1 = 0; sel = 0; #100;
in0 = 0; in1 = 0; sel = 1; #100;
in0 = 0; in1 = 1; sel = 0; #100;
in0 = 0; in1 = 1; sel = 1; #100;
in0 = 1; in1 = 0; sel = 0; #100;
in0 = 1; in1 = 0; sel = 1; #100;
in0 = 1; in1 = 1; sel = 0; #100;
in0 = 1; in1 = 1; sel = 1; #100;
end

endmodule
