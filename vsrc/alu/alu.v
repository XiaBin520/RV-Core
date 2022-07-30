module alu(
  input         clock,
  input         reset,
  input  [3:0]  io_aluOP,
  input  [63:0] io_aluSrc1,
  input  [63:0] io_aluSrc2,
  output [63:0] io_aluOut
);
  wire [5:0] shiftNum = io_aluSrc2[5:0]; // @[alu.scala 21:30]
  wire [63:0] _out_T_1 = io_aluSrc1 + io_aluSrc2; // @[alu.scala 26:36]
  wire [63:0] _out_T_3 = io_aluSrc1 - io_aluSrc2; // @[alu.scala 27:36]
  wire [63:0] _out_T_4 = io_aluSrc1; // @[alu.scala 28:37]
  wire [63:0] _out_T_5 = io_aluSrc2; // @[alu.scala 28:51]
  wire [63:0] _out_T_8 = io_aluSrc1 ^ io_aluSrc2; // @[alu.scala 30:36]
  wire [63:0] _out_T_9 = io_aluSrc1 | io_aluSrc2; // @[alu.scala 31:36]
  wire [63:0] _out_T_10 = io_aluSrc1 & io_aluSrc2; // @[alu.scala 32:36]
  wire [126:0] _GEN_10 = {{63'd0}, io_aluSrc1}; // @[alu.scala 33:36]
  wire [126:0] _out_T_11 = _GEN_10 << shiftNum; // @[alu.scala 33:36]
  wire [63:0] _out_T_12 = io_aluSrc1 >> shiftNum; // @[alu.scala 34:36]
  wire [63:0] _out_T_15 = $signed(io_aluSrc1) >>> shiftNum; // @[alu.scala 35:57]
  wire [63:0] _GEN_0 = 4'h9 == io_aluOP ? _out_T_15 : 64'h0; // @[alu.scala 25:15 35:28]
  wire [63:0] _GEN_1 = 4'h8 == io_aluOP ? _out_T_12 : _GEN_0; // @[alu.scala 25:15 34:28]
  wire [126:0] _GEN_2 = 4'h7 == io_aluOP ? _out_T_11 : {{63'd0}, _GEN_1}; // @[alu.scala 25:15 33:28]
  wire [126:0] _GEN_3 = 4'h6 == io_aluOP ? {{63'd0}, _out_T_10} : _GEN_2; // @[alu.scala 25:15 32:28]
  wire [126:0] _GEN_4 = 4'h5 == io_aluOP ? {{63'd0}, _out_T_9} : _GEN_3; // @[alu.scala 25:15 31:28]
  wire [126:0] _GEN_5 = 4'h4 == io_aluOP ? {{63'd0}, _out_T_8} : _GEN_4; // @[alu.scala 25:15 30:28]
  wire [126:0] _GEN_6 = 4'h3 == io_aluOP ? {{126'd0}, io_aluSrc1 < io_aluSrc2} : _GEN_5; // @[alu.scala 25:15 29:28]
  wire [126:0] _GEN_7 = 4'h2 == io_aluOP ? {{126'd0}, $signed(_out_T_4) < $signed(_out_T_5)} : _GEN_6; // @[alu.scala 25:15 28:28]
  wire [126:0] _GEN_8 = 4'h1 == io_aluOP ? {{63'd0}, _out_T_3} : _GEN_7; // @[alu.scala 25:15 27:28]
  wire [126:0] _GEN_9 = 4'h0 == io_aluOP ? {{63'd0}, _out_T_1} : _GEN_8; // @[alu.scala 25:15 26:28]
  assign io_aluOut = _GEN_9[63:0]; // @[alu.scala 38:15]
endmodule
