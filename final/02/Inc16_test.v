`include "02gates.v"

module main;
reg[0:15] in;
wire[0:15] out;

Inc16 g1(in, out);

initial 
begin
    $monitor("in=%b   out=%b", in, out);
    in = 0;
end

initial #0 begin
  in = 16'b0000000000000000;
end

initial #50 begin
  in = 16'b1111111111111111;
end

initial #100 begin
  in = 16'b0000000000000101;
end

initial #150 begin
  in = 16'b1111111111111011;
end

initial #200 $finish;

endmodule