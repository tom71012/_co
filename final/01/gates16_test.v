`include "gates16.v"

module main;
reg[0:15] a, b;
wire[0:15] Nota, aAndb, aOrb;

Not16  g1(a, Nota);
And16  g2(a, b, aAndb);
Or16   g3(a, b, aOrb);

initial
//註解範圍複製:https://gitlab.com/cccnqu111/co/-/blob/master/verilog/02-nand2tetris/gate16_test.v
begin
  $monitor("a  =%b\nb  =%b\nnot=%b\nand=%b\nor =%b", a, b, Nota, aAndb, aOrb);
  a  = 16'b0011;
  b  = 16'b0101;
  $finish;
end
//
endmodule