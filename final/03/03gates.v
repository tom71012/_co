`include "../02/02gates.v"

//參考在README
module DFF (input in, clock, output out);
 reg q;
 assign out = q;

 always @(posedge clock) begin
   q = in;
 end
endmodule
//

module Bit (input in, clock, load, output out);
 wire Mo;
 Mux m1(out, in, load, Mo);
 DFF d1(Mo, clock, out);
endmodule

module Register (input[0:15] in, input clock, load, output[0:15] out);
 Bit g1(in[0],  clock, load, out[0]);
 Bit g2(in[1],  clock, load, out[1]);
 Bit g3(in[2],  clock, load, out[2]);
 Bit g4(in[3],  clock, load, out[3]);
 Bit g5(in[4],  clock, load, out[4]);
 Bit g6(in[5],  clock, load, out[5]);
 Bit g7(in[6],  clock, load, out[6]);
 Bit g8(in[7],  clock, load, out[7]);
 Bit g9(in[8],  clock, load, out[8]);
 Bit g10(in[9],  clock, load, out[9]);
 Bit g11(in[10], clock, load, out[10]);
 Bit g12(in[11], clock, load, out[11]);
 Bit g13(in[12], clock, load, out[12]);
 Bit g14(in[13], clock, load, out[13]);
 Bit g15(in[14], clock, load, out[14]);
 Bit g16(in[15], clock, load, out[15]);
endmodule

module RAM8(input[0:15] in, input clock, load, input[0:2] address, output[0:15] out);
 wire[0:15] R1,R2,R3,R5,R6,o5,R7,R8;

 DMux8Way g1(load, address, DM1, DM2, DM3, DM4, DM5, DM6, DM7, DM8);

 Register r1(in, clock, DM1, R1);
 Register r2(in, clock, DM2, R2);
 Register r3(in, clock, DM3, R3);
 Register r4(in, clock, DM4, R4);
 Register r5(in, clock, DM5, R5);
 Register r6(in, clock, DM6, R6);
 Register r7(in, clock, DM7, R7);
 Register r8(in, clock, DM8, R8);

 Mux8Way16 g2(R1, R2, R3, R4, R5, R6, R7, R8, address, out);
endmodule

module RAM64(input[0:15] in, input clock, load, input[0:5] address, output[0:15] out);
 wire[0:15] R1,R2,R3,R5,R6,o5,R7,R8;

 DMux8Way g1(load, address[3:5], DM1, DM2, DM3, DM4, DM5, DM6, DM7, DM8);

 RAM8 m1(in, clock, DM1, address[0:2], R1);
 RAM8 m2(in, clock, DM2, address[0:2], R2);
 RAM8 m3(in, clock, DM3, address[0:2], R3);
 RAM8 m4(in, clock, DM4, address[0:2], R4);
 RAM8 m5(in, clock, DM5, address[0:2], R5);
 RAM8 m6(in, clock, DM6, address[0:2], R6);
 RAM8 m7(in, clock, DM7, address[0:2], R7);
 RAM8 m8(in, clock, DM8, address[0:2], R8);

 Mux8Way16 g2(R1, R2, R3, R4, R5, R6, R7, R8, address[3:5], out);
endmodule
/*
module RAM512(input[0:15] in, input clock, load, input[0:8] address, output[0:15] out);
 wire[0:15] R1,R2,R3,R5,R6,o5,R7,R8;

 DMux8Way g1(load, address[6:8], DM1, DM2, DM3, DM4, DM5, DM6, DM7, DM8);

 RAM64 m1(in, clock, DM1, address[0:5], R1);
 RAM64 m2(in, clock, DM2, address[0:5], R2);
 RAM64 m3(in, clock, DM3, address[0:5], R3);
 RAM64 m4(in, clock, DM4, address[0:5], R4);
 RAM64 m5(in, clock, DM5, address[0:5], R5);
 RAM64 m6(in, clock, DM6, address[0:5], R6);
 RAM64 m7(in, clock, DM7, address[0:5], R7);
 RAM64 m8(in, clock, DM8, address[0:5], R8);

 Mux8Way16 g2(R1, R2, R3, R4, R5, R6, R7, R8, address[6:8], out);
endmodule

module RAM4K(input[0:15] in, input clock, load, input[0:11] address, output[0:15] out);
 wire[0:15] R1,R2,R3,R5,R6,o5,R7,R8;

 DMux8Way g1(load, address[9:11], DM1, DM2, DM3, DM4, DM5, DM6, DM7, DM8);

 RAM512 m1(in, clock, DM1, address[0:8], R1);
 RAM512 m2(in, clock, DM2, address[0:8], R2);
 RAM512 m3(in, clock, DM3, address[0:8], R3);
 RAM512 m4(in, clock, DM4, address[0:8], R4);
 RAM512 m5(in, clock, DM5, address[0:8], R5);
 RAM512 m6(in, clock, DM6, address[0:8], R6);
 RAM512 m7(in, clock, DM7, address[0:8], R7);
 RAM512 m8(in, clock, DM8, address[0:8], R8);

 Mux8Way16 g2(R1, R2, R3, R4, R5, R6, R7, R8, address[9:11], out);
endmodule
*/
module RAM8K(input[0:15] in, input clock, load, input[0:12] address, output[0:15] out);
    reg[0:15] m[0:2**13 - 1];

    assign out = m[address];

    always @(posedge clock) begin
        if (load) m[address] = in;
    end
endmodule

module RAM16K(input[0:15] in, input clock, load, input[0:13] address, output[0:15] out);
    reg[0:15] m[0:2**14 - 1];

    assign out = m[address];

    always @(posedge clock) begin
        if (load) m[address] = in;
    end
endmodule

module ROM32K(input[0:15] address, output[0:15] out);
    reg[0:15] m[0:2**15 - 1];

    assign out = m[address];
endmodule

module PC(input[0:15] in, input clock, load, inc, reset, output[0:15] out);
 wire[0:15] MO1, MO2, MO3, IncRout, Rout;
/*Copy
 Or g1(load, inc, loadInc);
 Or g2(loadInc, reset, loadIncReset); //loadIncReset 1'b1
*/
 Inc16 inc1(Rout, IncRout);

 Mux16 g3(Rout, IncRout, inc, MO1);
 Mux16 g4(MO1, in, load, MO2);
 Mux16 g5(MO2, 16'b0, reset, MO3);

 Register res1(MO3, clock, 1'b1, Rout);
 And16 g6(Rout, Rout, out);
endmodule