module ifStage(
  input         clock,
  input         reset,
  input  [31:0] io_inPC,
  input  [31:0] io_inInstr,
  output [31:0] io_outPC,
  output [31:0] io_outInstr
);
  assign io_outPC = io_inPC; // @[idStage.scala 13:15]
  assign io_outInstr = io_inInstr; // @[idStage.scala 14:15]
endmodule
