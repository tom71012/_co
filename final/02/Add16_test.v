`include "02gates.v"

module main;
reg[0:15] a, b;
wire[0:15] out;

Add16 g(a, b, out);

initial 

begin
  $monitor("a=%b   b=%b   out=%b", a, b, out);
  a = 0;
  b = 0;
end

initial #0 begin
  a = 16'b0000000000000000;
  b = 16'b0000000000000000;
end

initial #50 begin
  a = 16'b0000000000000000;
  b = 16'b1111111111111111;
end

initial #100 begin
  a = 16'b1111111111111111;
  b = 16'b1111111111111111;
end

initial #150 begin
  a = 16'b1010101010101010;
  b = 16'b0101010101010101;
end

initial #200 begin
  a = 16'b0011110011000011;
  b = 16'b0000111111110000;
end

initial #250 begin
  a = 16'b0001001000110100;
  b = 16'b1001100001110110;
end

initial #300 $finish;

endmodule