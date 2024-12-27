`include "../03/03gates.v"

module Memory(input[0:15] in, input clock, load, input[0:14] address, output[0:15] out);
 wire[0:15] R16out, R8out, Kbout, M16out;

 Not g1(address[14], Nout);
 And g2(Nout, load, NoAndload);
 And g3(address[14], load, AAndload);
 
 RAM16K r1(in, clock, NoAndload, address[0:13], R16out);
 RAM8K  screen(in, clock, AAndload, address[0:12], R8out);
 Register keyboard(16'h0F0F, clock, 1'b0, Kbout);
  
 Mux16 m1(R8out, Kbout,  address[13], M16out);
 Mux16 m2(R16out, M16out, address[14], out);
endmodule

module CPU(input[0:15] inM, ins, input clock, reset, output[0:15] outM, output writeM, output[0:14] addressM, pc);
 wire[0:15] Aregin, OutA, MuOutA, ALUout, OutD, Outpc, OutaddressM;

    //Determine Type
    Not g1(ins[15], AinS);
    Not g2(AinS, CinS);
    
    And g3(CinS, ins[5], ALUtoA);
    Mux16 g4(ins, ALUout, ALUtoA, Aregin);
    
    Or g5(AinS, ALUtoA, LoadA);
    Register A(Aregin, clock, LoadA, OutA);
    
    Mux16 g6(OutA, inM, ins[12], MuOutA);

    And g7(CinS, ins[4], LoadD);
    Register D(ALUout, clock, LoadD, OutD);
    
    ALU alu1(OutD, MuOutA, ins[11], ins[10], ins[9], ins[8], ins[7], ins[6], ALUout, Zr, Ng);
        
    //Set outputs for writing memory
    Or16 g8(16'b0, OutA, OutaddressM);
    assign addressM = OutaddressM[0:14];
    Or16 g9(16'b0, ALUout, outM);
    And g10(CinS, ins[3], writeM);
    
    //PC Part
    And g11(Zr, ins[1], jeq);
    And g12(Ng, ins[2], jlt);

    Or g13(Zr, Ng, zeroOrNeg);
    Not g14(zeroOrNeg, positive);
    
    And g15(positive, ins[0], jgt);
    Or g16(jeq, jlt, jle);
    Or g17(jle, jgt, jumpToA);
    And g18(CinS, jumpToA, PCload);

    Not g19(PCload, PCinc);
    PC pc1(OutA, clock, PCinc, PCload, reset, Outpc);
    assign pc = Outpc[0:14];
endmodule

module Computer(input clock, reset);
  wire[0:15] OutM, outMem, OutRom;
  wire[0:14] addressM, pc;

  CPU cpu(outMem, OutRom, clock, reset, OutM, WirM, addressM, pc);	
  Memory ram(OutM, !clock, WirM, addressM, outMem);
  ROM32K rom(pc, OutRom);
endmodule