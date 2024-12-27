`include "mux.v"

module main;
reg[0:15] a, b, c, d, e, f, g, h;
reg[0:2]  sel;
wire[0:15] mux2, mux4, mux8;
wire mux01, dmux0, dmux1;
//註解範圍複製:https://gitlab.com/cccnqu111/co/-/blob/master/verilog/02-nand2tetris/mux_test.v
Mux       g1(1'b0, 1'b1, sel[2], mux01);
DMux      g2(1'b1, sel[0], dmux0, dmux1);
Mux16     g4(a, b, sel[0], mux2);
Mux4Way16 g5(a, b, c, d, sel[0:1], mux4);
Mux8Way16 g6(a, b, c, d, e, f, g, h, sel[0:2], mux8);

initial

begin
  $monitor("%4dns sel=%d mux2=%x mux4=%x mux8=%x mux01=%d dmux0=%d dmux1=%d", $stime, sel, mux2, mux4, mux8, mux01, dmux0, dmux1);
  a  = 16'h0;
  b  = 16'h1;
  c  = 16'h2;
  d  = 16'h3;
  e  = 16'h4;
  f  = 16'h5;
  g  = 16'h6;
  h  = 16'h7;
  sel = 0;
end

always #50 begin
  sel=sel+1;
end

initial #500 $finish;
//
endmodule