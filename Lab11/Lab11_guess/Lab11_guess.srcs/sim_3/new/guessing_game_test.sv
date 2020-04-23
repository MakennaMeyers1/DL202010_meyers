`timescale 1ns / 1ps
// ELC 2137 , Makenna Meyers , 2020 -04 -22


module guessing_game_test();

    reg clk , reset , in;
    wire out , tick ;
    integer i;
    
    guessing_game game (. clk(clk), .reset ( reset ), .in(in), .out(out), . tick ( tick ));
    
    always begin
      #5 clk = ~clk ;
    end
    
    initial begin
      clk =0; reset =0; in =0; #5;
      reset =1; #10;
      reset =0; #5;
      // bounce
      for (i=0; i <10; i=i+1) begin
        #20 in =~ in;
      end
      // hold input = 1 for a while
      in = 1; #200;
      // bounce
      for (i=0; i <10; i=i+1) begin
        #20 in =~ in;
      end
      // hold input = 0 for a while
      in = 0; #200;
      $finish ;
    end
endmodule 