`include "02gates.v"

module main;
reg a, b, c;
wire sum, carry;

FullAdder g1(a, b, c, sum, carry);

initial 

begin
  $monitor("INa=%d INb=%d INc=%d sum=%d carry=%d", a, b, c, sum, carry);
  a = 0;
  b = 0;
  c = 0;
end

always #50 begin
  c++;
end

always #100 begin
  b++;
end

always #200 begin
  a++;
end

initial #350 $finish(0);

endmodule