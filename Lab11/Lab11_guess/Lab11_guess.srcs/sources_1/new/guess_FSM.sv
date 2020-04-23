`timescale 1ns / 1ps
// ELC 2137 , Makenna Meyers , 2020 -04 -22

module guess_FSM #( parameter N =21)
    ( input clk , reset ,
    input b0, b1, b2, b3 ,
    output reg y0, y1, y2, y3,
    output reg win, lose );

// define states as local parameters ( constants )
  localparam [3:0]
    s0 = 4'b000 ,
    s1 = 4'b0001 ,
    s2 = 4'b0011 ,
    s3 = 4'b0010 ,
    swin = 4'b0110 ,
    slose = 4'b0100 ;
    
// internal signals
    reg [1:0] state , state_next ;

// state memory ( register )
  always_ff @( posedge clk or posedge
        reset )
   if ( reset ) begin
     state <= s0 ;
   end
   else begin
     state <= state_next ;
   end

// combined next - state and output logic
always_comb begin
    // default behavior
    state_next = state ;
    
  case ( state )
   s0 : begin
    y0 = 1;
    if (~b0 & ~b1 & ~b2 & ~b3)
      state_next = s1 ;
    else if (~b3 & ~b2 & ~b1 & b0)
      state_next = swin ;
    else if (b3 | b2 | b1)
      state_next = slose ;
   end
   
  s1 : begin
     y1 = 1; // Moore output
    if (~b0 & ~b1 & ~b2 & ~b3)
      state_next = s2 ;
    else if (~b3 & ~b2 & b1 & ~b0)
      state_next = swin ;
    else if (b3 | b2 | b0)
      state_next = slose ;
  end
  
  s2 : begin
     y2 = 2;
    if (~b0 & ~b1 & ~b2 & ~b3)
      state_next = s3 ;
    else if (~b3 & b2 & ~b1 & ~b0)
      state_next = swin ;
    else if (b3 | b1 | b0)
      state_next = slose ;
  end
  
  s3 : begin
     y3 = 3;
    if (~b0 & ~b1 & ~b2 & ~b3)
      state_next = s0 ;
    else if (b3 & ~b2 & ~b1 & ~b0)
      state_next = swin ;
    else if (b2 | b1 | b0)
      state_next = slose ;
  end
  
  swin : begin
     win = 1;
    if (~b0 & ~b1 & ~b2 & ~b3)
      state_next = s0 ;
  end

  slose : begin
     lose = 1;
    if (~b0 & ~b1 & ~b2 & ~b3)
      state_next = s0 ;
  end
  
 endcase
end

endmodule 