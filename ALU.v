module ALU(
  input  [3:0]  io_ID_ALUOP,
  input  [63:0] io_ID_Src1,
  input  [63:0] io_ID_Src2,
  output [63:0] io_MEM_ALUOut
);
  wire [5:0] shamt = io_ID_Src2[5:0]; // @[alu.scala 46:27]
  wire [63:0] _out_T_1 = io_ID_Src1 + io_ID_Src2; // @[alu.scala 50:36]
  wire [63:0] _out_T_3 = io_ID_Src1 - io_ID_Src2; // @[alu.scala 51:36]
  wire [63:0] _out_T_4 = io_ID_Src1; // @[alu.scala 52:37]
  wire [63:0] _out_T_5 = io_ID_Src2; // @[alu.scala 52:51]
  wire [63:0] _out_T_8 = io_ID_Src1 ^ io_ID_Src2; // @[alu.scala 54:36]
  wire [63:0] _out_T_9 = io_ID_Src1 | io_ID_Src2; // @[alu.scala 55:36]
  wire [63:0] _out_T_10 = io_ID_Src1 & io_ID_Src2; // @[alu.scala 56:36]
  wire [126:0] _GEN_10 = {{63'd0}, io_ID_Src1}; // @[alu.scala 57:36]
  wire [126:0] _out_T_11 = _GEN_10 << shamt; // @[alu.scala 57:36]
  wire [63:0] _out_T_12 = io_ID_Src1 >> shamt; // @[alu.scala 58:36]
  wire [63:0] _out_T_15 = $signed(io_ID_Src1) >>> shamt; // @[alu.scala 59:54]
  wire [63:0] _GEN_0 = 4'h9 == io_ID_ALUOP ? _out_T_15 : 64'h0; // @[alu.scala 49:15 59:28]
  wire [63:0] _GEN_1 = 4'h8 == io_ID_ALUOP ? _out_T_12 : _GEN_0; // @[alu.scala 49:15 58:28]
  wire [126:0] _GEN_2 = 4'h7 == io_ID_ALUOP ? _out_T_11 : {{63'd0}, _GEN_1}; // @[alu.scala 49:15 57:28]
  wire [126:0] _GEN_3 = 4'h6 == io_ID_ALUOP ? {{63'd0}, _out_T_10} : _GEN_2; // @[alu.scala 49:15 56:28]
  wire [126:0] _GEN_4 = 4'h5 == io_ID_ALUOP ? {{63'd0}, _out_T_9} : _GEN_3; // @[alu.scala 49:15 55:28]
  wire [126:0] _GEN_5 = 4'h4 == io_ID_ALUOP ? {{63'd0}, _out_T_8} : _GEN_4; // @[alu.scala 49:15 54:28]
  wire [126:0] _GEN_6 = 4'h3 == io_ID_ALUOP ? {{126'd0}, io_ID_Src1 < io_ID_Src2} : _GEN_5; // @[alu.scala 49:15 53:28]
  wire [126:0] _GEN_7 = 4'h2 == io_ID_ALUOP ? {{126'd0}, $signed(_out_T_4) < $signed(_out_T_5)} : _GEN_6; // @[alu.scala 49:15 52:28]
  wire [126:0] _GEN_8 = 4'h1 == io_ID_ALUOP ? {{63'd0}, _out_T_3} : _GEN_7; // @[alu.scala 49:15 51:28]
  wire [126:0] _GEN_9 = 4'h0 == io_ID_ALUOP ? {{63'd0}, _out_T_1} : _GEN_8; // @[alu.scala 49:15 50:28]
  assign io_MEM_ALUOut = _GEN_9[63:0]; // @[alu.scala 62:19]
endmodule
