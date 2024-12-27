module Nand(input a, b, output out);
 nand g1(out, a, b);
endmodule

module Not(input a, output out);
 Nand g1(a, a, out);
endmodule

module And(input a, b, output out);
 Nand g1(a, b, aNandb);
 Not g2(aNandb, out);
endmodule

module Or(input a, b, output out);
 Not g1(a, Nota);
 Not g2(b, Notb);
 Nand g3(Nota, Notb, out);
endmodule

module Xor(input a, b, output out);
 Or g1(a, b, aOrb);
 Nand g2(a, b, aNandb);
 And g3(aOrb, aNandb, out);
endmodule

module Or8Way(input [7:0] in,output out);
 Or g1(in[0], in[1], o1);
 Or g2(in[2], in[3], o2);
 Or g3(in[4], in[5], o3);
 Or g4(in[6], in[7], o4);
 Or g5(o1, o2, o5);
 Or g6(o3, o4, o6);
 Or g7(o5, o6, out);
endmodule

module Not16(input[0:15] in, output[0:15] out);
 Not g1(in[0], out[0]);
 Not g2(in[1], out[1]);
 Not g3(in[2], out[2]);
 Not g4(in[3], out[3]);
 Not g5(in[4], out[4]);
 Not g6(in[5], out[5]);
 Not g7(in[6], out[6]);
 Not g8(in[7], out[7]);
 Not g9(in[8], out[8]);
 Not g10(in[9], out[9]);
 Not g11(in[10], out[10]);
 Not g12(in[11], out[11]);
 Not g13(in[12], out[12]);
 Not g14(in[13], out[13]);
 Not g15(in[14], out[14]);
 Not g16(in[15], out[15]);
endmodule

module And16(input[0:15] a, b, output[0:15] out);
 And g1(a[0], b[0], out[0]);
 And g2(a[1], b[1], out[1]);
 And g3(a[2], b[2], out[2]);
 And g4(a[3], b[3], out[3]);
 And g5(a[4], b[4], out[4]);
 And g6(a[5], b[5], out[5]);
 And g7(a[6], b[6], out[6]);
 And g8(a[7], b[7], out[7]);
 And g9(a[8], b[8], out[8]);
 And g10(a[9], b[9], out[9]);
 And g11(a[10], b[10], out[10]);
 And g12(a[11], b[11], out[11]);
 And g13(a[12], b[12], out[12]);
 And g14(a[13], b[13], out[13]);
 And g15(a[14], b[14], out[14]);
 And g16(a[15], b[15], out[15]);
endmodule

module Or16(input[0:15] a, b, output[0:15] out);
 Or g1(a[0], b[0], out[0]);
 Or g2(a[1], b[1], out[1]);
 Or g3(a[2], b[2], out[2]);
 Or g4(a[3], b[3], out[3]);
 Or g5(a[4], b[4], out[4]);
 Or g6(a[5], b[5], out[5]);
 Or g7(a[6], b[6], out[6]);
 Or g8(a[7], b[7], out[7]);
 Or g9(a[8], b[8], out[8]);
 Or g10(a[9], b[9], out[9]);
 Or g11(a[10], b[10], out[10]);
 Or g12(a[11], b[11], out[11]);
 Or g13(a[12], b[12], out[12]);
 Or g14(a[13], b[13], out[13]);
 Or g15(a[14], b[14], out[14]);
 Or g16(a[15], b[15], out[15]);
endmodule

module Mux(input a, b, sel, output out);
 Not g1(sel, Nsel);
 And g2(a, Nsel, aAndNsel);
 And g3(b, sel, bAndsel);
 Or g4(aAndNsel, bAndsel, out);
endmodule

module DMux(input in, sel, output a, b);
 Not g1(sel, Nsel);
 And g2(in, Nsel, a);
 And g3(in, sel, b);
endmodule

module Mux16(input[0:15] a, b, input sel, output[0:15] out);
 Mux g1(a[0], b[0], sel, out[0]);
 Mux g2(a[1], b[1], sel, out[1]);
 Mux g3(a[2], b[2], sel, out[2]);
 Mux g4(a[3], b[3], sel, out[3]);
 Mux g5(a[4], b[4], sel, out[4]);
 Mux g6(a[5], b[5], sel, out[5]);
 Mux g7(a[6], b[6], sel, out[6]);
 Mux g8(a[7], b[7], sel, out[7]);
 Mux g9(a[8], b[8], sel, out[8]);
 Mux g10(a[9], b[9], sel, out[9]);
 Mux g11(a[10], b[10], sel, out[10]);
 Mux g12(a[11], b[11], sel, out[11]);
 Mux g13(a[12], b[12], sel, out[12]);
 Mux g14(a[13], b[13], sel, out[13]);
 Mux g15(a[14], b[14], sel, out[14]);
 Mux g16(a[15], b[15], sel, out[15]);
endmodule

module Mux4Way16(input[0:15] a, b, c, d,input[0:1] sel, output[0:15] out);
wire [0:15] aMux16b, cMux16d; //  ???
 Mux16 g1(a, b, sel[0], aMux16b);
 Mux16 g2(c, d, sel[0], cMux16d);
 Mux16 g3(aMux16b, cMux16d, sel[1], out);
endmodule

module Mux8Way16(input[0:15] a, b, c, d, e, f, g ,h, input[0:2] sel, output[0:15] out);
wire [0:15] Max416abcd, Max416defg; //   ???
 Mux4Way16 g1(a, b, c, d, sel[0:1], Max416abcd);
 Mux4Way16 g2(e, f, g, h, sel[0:1], Max416defg);
 Mux16 g3(Max416abcd, Max416defg, sel[2], out);
endmodule

module DMux4Way(input in, input[0:1] sel, output a, b, c, d);
 DMux g1(in, sel[1], DM1, DM2);
 DMux g2(DM1, sel[0], a, b);
 DMux g3(DM2, sel[0], c, d);
endmodule

module DMux8Way(input in, input[0:2] sel, output a, b, c, d, e, f, g ,h);
 DMux g1(in, sel[2], DM1, DM2);
 DMux4Way g2(DM1, sel[0:1], a, b, c, d);
 DMux4Way g3(DM2, sel[0:1], e, f, g, h);
endmodule