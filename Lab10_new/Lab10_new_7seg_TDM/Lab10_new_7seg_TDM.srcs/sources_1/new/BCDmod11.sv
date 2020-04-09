`timescale 1ns / 1ps
// Makenna Meyers , ELC 2137 , 2020-04-09


module BCDmod11(

    input [10:0]in1, 
    output [15:0]out11
    
    );
  
  wire [3:0] ina, outa, inb, outb, inc, outc,
             ind, outd, ine, oute, inf, outf, 
             ing, outg, inh, outh, ini, outi, 
             inj, outj, ink, outk, inl, outl, 
             inm, outm, inn, outn, ino, outo;   
    
    assign ina={1'b0, in1[10:8]}; 
    assign inb={outa[2:0], in1[7]}; 
    assign inc={outb[2:0], in1[6]}; 
    assign ind={outc[2:0], in1[5]}; 
    assign ine={outd[2:0], in1[4]}; 
    assign inf={oute[2:0], in1[3]}; 
    assign ing={outf[2:0], in1[2]}; 
    assign inh={outg[2:0], in1[1]}; 
    assign ini={1'b0, outa[3], outb[3], outc[3]}; 
    assign inj={outi[2:0], outd[3]}; 
    assign ink={outj[2:0], oute[3]}; 
    assign inl={outk[2:0], outf[3]}; 
    assign inm={outl[2:0], outg[3]}; 
    assign inn={1'b0, outi[3], outj[3], outk[3]}; 
    assign ino={outn[2:0], outl[3]}; 
    
    Add3 a1(.in1(ina), .out1(outa));
    Add3 b1(.in1(inb), .out1(outb));
    Add3 c1(.in1(inc), .out1(outc));
    Add3 d1(.in1(ind), .out1(outd));
    Add3 e1(.in1(ine), .out1(oute));
    Add3 f1(.in1(inf), .out1(outf));
    Add3 g1(.in1(ing), .out1(outg));
    Add3 h1(.in1(inh), .out1(outh));
    Add3 i1(.in1(ini), .out1(outi));
    Add3 j1(.in1(inj), .out1(outj));
    Add3 k1(.in1(ink), .out1(outk));
    Add3 l1(.in1(inl), .out1(outl));
    Add3 m1(.in1(inm), .out1(outm));
    Add3 n1(.in1(inn), .out1(outn));
    Add3 o1(.in1(ino), .out1(outo));  
    
    assign out11 = {1'b0, 1'b0, outn[3], outo[3:0], 
                    outm[3:0], outh[3:0], in1[0]}; 
    
endmodule