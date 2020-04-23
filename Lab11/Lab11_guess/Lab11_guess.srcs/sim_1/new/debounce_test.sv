`timescale 1ns / 1ps
// ELC 2137 , Makenna Meyers , 2020 -04 -22


module debounce_test ();

    reg clk , reset , in;
    wire out , tick ;
    integer i;
    
    debounce #(.N(2)) db (. clk(clk), .reset ( reset ), .in(in), .out(out), . tick ( tick ));
    
    always begin
      #5 clk = ~clk ;
    end
    
    initial begin
      clk =0; reset =0; in =0; #5;
      reset =1; #10;
      reset =0; #5;
      
      for (i=0; i <10; i=i+1) begin
        #20 in =~ in;
      end
      
      in = 1; #200;
      
      for (i=0; i <10; i=i+1) begin
        #20 in =~ in;
      end
      
      in = 0; #200;
      $finish ;
    end
endmodule 
