`timescale 1ns / 1ps
// ELC 2137 , Makenna Meyers , 2020 -04 -22

module guess_FSM #( parameter N =21)
    ( input clk , reset ,
    input [3:0]b,
    output reg [3:0]y,
    output reg win, lose );

// define states as local parameters ( constants )
  localparam [3:0]
    s0 = 4'b0000 ,
    s1 = 4'b0001 ,
    s2 = 4'b0011 ,
    s3 = 4'b0010 ,
    swin = 4'b0110 ,
    slose = 4'b0100 ;
    
// internal signals
    reg [1:0] state , state_next ;

// state memory ( register )
  always_ff @( posedge clk or posedge reset )
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
    y[0] = 1;
    if (~b[0] & ~b[1] & ~b[2] & ~b[3])
      state_next = s1 ;
    else if (~b[3] & ~b[2] & ~b[1] & b[0])
      state_next = swin ;
    else if (b[3] | b[2] | b[1])
      state_next = slose ;
   end
   
  s1 : begin
     y[1] = 1; // Moore output
    if (~b[0] & ~b[1] & ~b[2] & ~b[3])
      state_next = s2 ;
    else if (~b[3] & ~b[2] & b[1] & ~b[0])
      state_next = swin ;
    else if (b[3] | b[2] | b[0])
      state_next = slose ;
  end
  
  s2 : begin
     y[2] = 1;
    if (~b[0] & ~b[1] & ~b[2] & ~b[3])
      state_next = s3 ;
    else if (~b[3] & b[2] & ~b[1] & ~b[0])
      state_next = swin ;
    else if (b[3] | b[1] | b[0])
      state_next = slose ;
  end
  
  s3 : begin
     y[3] = 1;
    if (~b[0] & ~b[1] & ~b[2] & ~b[3])
      state_next = s0 ;
    else if (b[3] & ~b[2] & ~b[1] & ~b[0])
      state_next = swin ;
    else if (b[2] | b[1] | b[0])
      state_next = slose ;
  end
  
  swin : begin
     win = 1;
    if (~b[0] & ~b[1] & ~b[2] & ~b[3])
      state_next = s0 ;
  end

  slose : begin
     lose = 1;
    if (~b[0] & ~b[1] & ~b[2] & ~b[3])
      state_next = s0 ;
  end
  
 endcase
end

endmodule 