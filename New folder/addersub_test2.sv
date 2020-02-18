
   
 `timescale 1ns / 1ps

module addersub_test();
    reg cin;
    reg [1:0] a, b;
    reg [4:0] i;
    wire [1:0] sum;
    wire cout;
    
    addersub AS(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));
    
    
    initial 
        begin
            for(i=0; i <= 8'hff; i = i+1)
                begin
                    a[1:0] = i [4:3];
                    b[1:0] = i [2:1];
                    cin = i[0];
                    #20;
                end
         end
    endmodule
    
   