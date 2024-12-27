`include "01gates.v"

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
// wire [0:15] aMux16b, cMux16d;   ???
 Mux16 g1(a, b, sel[0], aMux16b);
 Mux16 g2(c, d, sel[0], cMux16d);
 Mux16 g3(aMux16b, cMux16d, sel[1], out);
endmodule

module Mux8Way16(input[0:15] a, b, c, d, e, f, g ,h, input[0:2] sel, output[0:15] out);
 //wire [0:15] Max416abcd, Max416defg;   ???
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