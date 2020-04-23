`timescale 1ns / 1ps
// ELC 2137 , Makenna Meyers , 2020 -04 -22


module guess_FSM_test ();

    reg clk , reset ;
    reg [3:0]b;
    reg [3:0]y;
    wire win, lose ;
    integer i;
    
    guess_FSM #(.N(4)) gFSM (. clk(clk), .reset(reset), .b(b), .y(y), .win(win), .lose(lose));
    
    always begin
      #5 clk = ~clk ;
    end
    
    initial begin
      clk =0; reset =0; b = 4'b0000; #5;
      reset =1; #10;
      reset =0; #5;
   
      for (i=0; i <10; i=i+1) begin
        #20
        b = 4'b0001; #10;
        b = 4'b0000; #10;
      end
    
      for (i=0; i <10; i=i+1) begin
        #20  
        b = 4'b0000; #10;
        b = 4'b0010; #10;
      end
  
      for (i=0; i <10; i=i+1) begin
        #20  
        b = 4'b0010; #10;
        b = 4'b0011; #10;
      end

      for (i=0; i <10; i=i+1) begin
        #20 
        b = 4'b0011; #10;
        b = 4'b0111; #10;
      end
      
      for (i=0; i <10; i=i+1) begin
        #20 
        b = 4'b0110; #10;
        b = 4'b0100; #10;
      end
      
      for (i=0; i <10; i=i+1) begin
        #20 
        b = 4'b0100; #10;
        b = 4'b0101; #10;
      end
    
      $finish ;
    end
endmodule 