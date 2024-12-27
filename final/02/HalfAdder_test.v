`include "02gates.v"

module main;
reg a, b;
wire sum, carry;

HalfAdder g1(a, b, sum, carry);

initial 

begin
  $monitor("INa=%d Inb=%d sum=%d carry=%d", a, b, sum, carry);
  a = 0;
  b = 0;
end

always #50 begin
  b++;
end

always #100 begin
  a++;
end

initial #150 $finish(0);
endmodule