module testScala(
  input        clock,
  input        reset,
  input  [2:0] io_a,
  output [3:0] io_out
);
  wire [3:0] _GEN_0 = io_a == 3'h1 ? 4'h8 : 4'h3; // @[testScala.scala 14:18 15:9]
  assign io_out = io_a == 3'h2 ? 4'h9 : _GEN_0; // @[testScala.scala 18:18 19:9]
endmodule
