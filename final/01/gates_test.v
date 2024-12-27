`include "gates.v"

module main;
reg a, b;
wire aNandb, Nota, aAndb, aOrb, aXorb;

Nand g1(a, b, aNandb);
Not  g2(a, Nota);
And  g3(a, b, aAndb);
Or   g4(a, b, aOrb);
Xor  g5(a, b, aXorb);

initial

begin
  $monitor("%4dns a=%d b=%d aNandb=%d Nota=%d  aAndb=%d aOrb=%d aXorb=%d", $stime, a, b, aNandb, Nota, aAndb, aOrb, aXorb);
  a  = 0;
  b  = 0;
end

always #50 begin
  a = a+1;
end

always #100 begin
  b = b+1;
end

initial #500 $finish;

endmodule