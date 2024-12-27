`include "../01/01gates.v"

module HalfAdder(input a, b, output sum, carry);
 Xor g1(a, b, sum);
 And g2(a, b, carry);
endmodule

module FullAdder(input a, b, c, output sum, carry);
 wire H1sum, H1carry, H2carry;  //???
 HalfAdder g1(a, b, H1sum, H1carry);
 HalfAdder g2(H1sum, c, sum, H2carry);
 Or g3(H1carry, H2carry, carry);
endmodule

module Add16(input[0:15] a,b, output[0:15] out);
 wire [0:15] c; // ???
 FullAdder g1(a[0],  b[0],  1'b0,  out[0],  c[0]);
 FullAdder g2(a[1],  b[1],  c[0],  out[1],  c[1]);
 FullAdder g3(a[2],  b[2],  c[1],  out[2],  c[2]);
 FullAdder g4(a[3],  b[3],  c[2],  out[3],  c[3]);
 FullAdder g5(a[4],  b[4],  c[3],  out[4],  c[4]);
 FullAdder g6(a[5],  b[5],  c[4],  out[5],  c[5]);
 FullAdder g7(a[6],  b[6],  c[5],  out[6],  c[6]);
 FullAdder g8(a[7],  b[7],  c[6],  out[7],  c[7]);
 FullAdder g9(a[8],  b[8],  c[7],  out[8],  c[8]);
 FullAdder g10(a[9],  b[9],  c[8],  out[9],  c[9]);
 FullAdder g11(a[10], b[10], c[9],  out[10], c[10]);  
 FullAdder g12(a[11], b[11], c[10], out[11], c[11]);   
 FullAdder g13(a[12], b[12], c[11], out[12], c[12]);   
 FullAdder g14(a[13], b[13], c[12], out[13], c[13]);   
 FullAdder g15(a[14], b[14], c[13], out[14], c[14]);   
 FullAdder g16(a[15], b[15], c[14], out[15], c[15]);
endmodule

module Inc16(input[0:15] in, output[0:15] out);
  Add16 g1(in, 16'h1, out);
endmodule


module ALU(input[0:15] x, y, input zx, nx, zy, ny, f, no, output[0:15] out, output zr, ng);
 wire[0:15] M16x, NM16x, MNMx, M16y, NM16y, MNMy, Andxy, Addxy, MAAxy, NMAAxy, out;
 wire orLow, orHigh, notzr;

 Mux16 g1(x, 16'b0, zx, M16x);
 Mux16 g2(y, 16'b0, zy, M16y);
 Not16 g3(M16x, NM16x);
 Not16 g4(M16y, NM16y);
 Mux16 g5(M16x, NM16x, nx, MNMx);
 Mux16 g6(M16y, NM16y, ny, MNMy);

 And16 g7(MNMx, MNMy, Andxy);
 Add16 g8(MNMx, MNMy, Addxy);

 Mux16 g9(Andxy, Addxy, f, MAAxy);
 Not16 g10(MAAxy, NMAAxy);

 Mux16 g11(MAAxy, NMAAxy, no, out);

 Or8Way g12(out[0:7], orLow);
 Or8Way g13(out[8:15], orHigh);

 Or g14(orLow, orHigh, notzr);
 Not g15(notzr, zr);
endmodule