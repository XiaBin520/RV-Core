module ALU(
  input  [3:0]  io_ID_ALUOP,
  input  [63:0] io_ID_Src1,
  input  [63:0] io_ID_Src2,
  output [63:0] io_MEM_ALUData
);
  wire [5:0] shamt = io_ID_Src2[5:0]; // @[EXStage.scala 50:27]
  wire [63:0] _out_T_1 = io_ID_Src1 + io_ID_Src2; // @[EXStage.scala 54:36]
  wire [63:0] _out_T_3 = io_ID_Src1 - io_ID_Src2; // @[EXStage.scala 55:36]
  wire [63:0] _out_T_4 = io_ID_Src1; // @[EXStage.scala 56:37]
  wire [63:0] _out_T_5 = io_ID_Src2; // @[EXStage.scala 56:51]
  wire [63:0] _out_T_8 = io_ID_Src1 ^ io_ID_Src2; // @[EXStage.scala 58:36]
  wire [63:0] _out_T_9 = io_ID_Src1 | io_ID_Src2; // @[EXStage.scala 59:36]
  wire [63:0] _out_T_10 = io_ID_Src1 & io_ID_Src2; // @[EXStage.scala 60:36]
  wire [126:0] _GEN_10 = {{63'd0}, io_ID_Src1}; // @[EXStage.scala 61:36]
  wire [126:0] _out_T_11 = _GEN_10 << shamt; // @[EXStage.scala 61:36]
  wire [63:0] _out_T_12 = io_ID_Src1 >> shamt; // @[EXStage.scala 62:36]
  wire [63:0] _out_T_15 = $signed(io_ID_Src1) >>> shamt; // @[EXStage.scala 63:54]
  wire [63:0] _GEN_0 = 4'h9 == io_ID_ALUOP ? _out_T_15 : 64'h0; // @[EXStage.scala 53:15 63:28]
  wire [63:0] _GEN_1 = 4'h8 == io_ID_ALUOP ? _out_T_12 : _GEN_0; // @[EXStage.scala 53:15 62:28]
  wire [126:0] _GEN_2 = 4'h7 == io_ID_ALUOP ? _out_T_11 : {{63'd0}, _GEN_1}; // @[EXStage.scala 53:15 61:28]
  wire [126:0] _GEN_3 = 4'h6 == io_ID_ALUOP ? {{63'd0}, _out_T_10} : _GEN_2; // @[EXStage.scala 53:15 60:28]
  wire [126:0] _GEN_4 = 4'h5 == io_ID_ALUOP ? {{63'd0}, _out_T_9} : _GEN_3; // @[EXStage.scala 53:15 59:28]
  wire [126:0] _GEN_5 = 4'h4 == io_ID_ALUOP ? {{63'd0}, _out_T_8} : _GEN_4; // @[EXStage.scala 53:15 58:28]
  wire [126:0] _GEN_6 = 4'h3 == io_ID_ALUOP ? {{126'd0}, io_ID_Src1 < io_ID_Src2} : _GEN_5; // @[EXStage.scala 53:15 57:28]
  wire [126:0] _GEN_7 = 4'h2 == io_ID_ALUOP ? {{126'd0}, $signed(_out_T_4) < $signed(_out_T_5)} : _GEN_6; // @[EXStage.scala 53:15 56:28]
  wire [126:0] _GEN_8 = 4'h1 == io_ID_ALUOP ? {{63'd0}, _out_T_3} : _GEN_7; // @[EXStage.scala 53:15 55:28]
  wire [126:0] _GEN_9 = 4'h0 == io_ID_ALUOP ? {{63'd0}, _out_T_1} : _GEN_8; // @[EXStage.scala 53:15 54:28]
  assign io_MEM_ALUData = _GEN_9[63:0]; // @[EXStage.scala 66:20]
endmodule
module WordALU(
  input  [63:0] io_ID_Src1,
  input  [63:0] io_ID_Src2,
  input  [2:0]  io_ID_WordALUOP,
  output [63:0] io_MEM_WordALUOut
);
  wire [31:0] Src1W = io_ID_Src1[31:0]; // @[EXStage.scala 107:26]
  wire [4:0] shamt = io_ID_Src2[4:0]; // @[EXStage.scala 108:26]
  wire  _T = 3'h1 == io_ID_WordALUOP; // @[EXStage.scala 115:20]
  wire [63:0] _outDW_T_1 = io_ID_Src1 + io_ID_Src2; // @[EXStage.scala 116:35]
  wire  _T_1 = 3'h2 == io_ID_WordALUOP; // @[EXStage.scala 115:20]
  wire [63:0] _outDW_T_3 = io_ID_Src1 - io_ID_Src2; // @[EXStage.scala 117:35]
  wire  _T_2 = 3'h3 == io_ID_WordALUOP; // @[EXStage.scala 115:20]
  wire [94:0] _GEN_7 = {{31'd0}, io_ID_Src1}; // @[EXStage.scala 118:37]
  wire [94:0] _outDW_T_4 = _GEN_7 << shamt; // @[EXStage.scala 118:37]
  wire  _T_3 = 3'h4 == io_ID_WordALUOP; // @[EXStage.scala 115:20]
  wire [31:0] _outW_T = Src1W >> shamt; // @[EXStage.scala 119:37]
  wire  _T_4 = 3'h5 == io_ID_WordALUOP; // @[EXStage.scala 115:20]
  wire [31:0] _GEN_0 = 3'h5 == io_ID_WordALUOP ? _outW_T : 32'h0; // @[EXStage.scala 115:20 120:27]
  wire [31:0] _GEN_1 = 3'h4 == io_ID_WordALUOP ? _outW_T : _GEN_0; // @[EXStage.scala 115:20 119:27]
  wire [94:0] _GEN_2 = 3'h3 == io_ID_WordALUOP ? _outDW_T_4 : 95'h0; // @[EXStage.scala 115:20 118:27]
  wire [31:0] _GEN_3 = 3'h3 == io_ID_WordALUOP ? 32'h0 : _GEN_1; // @[EXStage.scala 115:20]
  wire [94:0] _GEN_4 = 3'h2 == io_ID_WordALUOP ? {{31'd0}, _outDW_T_3} : _GEN_2; // @[EXStage.scala 115:20 117:27]
  wire [31:0] _GEN_5 = 3'h2 == io_ID_WordALUOP ? 32'h0 : _GEN_3; // @[EXStage.scala 115:20]
  wire [94:0] _GEN_6 = 3'h1 == io_ID_WordALUOP ? {{31'd0}, _outDW_T_1} : _GEN_4; // @[EXStage.scala 115:20 116:27]
  wire [31:0] outW = 3'h1 == io_ID_WordALUOP ? 32'h0 : _GEN_5; // @[EXStage.scala 115:20]
  wire [63:0] outDW = _GEN_6[63:0];
  wire [31:0] _out_T_2 = outDW[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 74:12]
  wire [63:0] _out_T_4 = {_out_T_2,outDW[31:0]}; // @[Cat.scala 31:58]
  wire [63:0] _out_T_19 = {_out_T_2,outW}; // @[Cat.scala 31:58]
  wire [63:0] _GEN_8 = _T_4 ? _out_T_19 : 64'h0; // @[EXStage.scala 123:20 128:25]
  wire [63:0] _GEN_9 = _T_3 ? _out_T_19 : _GEN_8; // @[EXStage.scala 123:20 127:25]
  wire [63:0] _GEN_10 = _T_2 ? _out_T_4 : _GEN_9; // @[EXStage.scala 123:20 126:25]
  wire [63:0] _GEN_11 = _T_1 ? _out_T_4 : _GEN_10; // @[EXStage.scala 123:20 125:25]
  assign io_MEM_WordALUOut = _T ? _out_T_4 : _GEN_11; // @[EXStage.scala 123:20 124:25]
endmodule
module EXStage(
  input         clock,
  input         reset,
  input  [3:0]  io_ID_ID_A_ALUOP,
  input  [2:0]  io_ID_ID_A_ALUSrc1Ctrl,
  input  [2:0]  io_ID_ID_A_ALUSrc2Ctrl,
  input         io_ID_ID_A_WordALUEn,
  input  [2:0]  io_ID_ID_A_WordALUOP,
  input  [31:0] io_ID_ID_B_PC,
  input  [63:0] io_ID_ID_B_Imm,
  input  [63:0] io_ID_ID_B_RData1,
  input  [63:0] io_ID_ID_B_RData2,
  output [63:0] io_MEM_ALUData
);
  wire [3:0] ALU_io_ID_ALUOP; // @[EXStage.scala 160:23]
  wire [63:0] ALU_io_ID_Src1; // @[EXStage.scala 160:23]
  wire [63:0] ALU_io_ID_Src2; // @[EXStage.scala 160:23]
  wire [63:0] ALU_io_MEM_ALUData; // @[EXStage.scala 160:23]
  wire [63:0] WordALU_io_ID_Src1; // @[EXStage.scala 161:23]
  wire [63:0] WordALU_io_ID_Src2; // @[EXStage.scala 161:23]
  wire [2:0] WordALU_io_ID_WordALUOP; // @[EXStage.scala 161:23]
  wire [63:0] WordALU_io_MEM_WordALUOut; // @[EXStage.scala 161:23]
  wire [63:0] PC = {32'h0,io_ID_ID_B_PC}; // @[Cat.scala 31:58]
  wire [63:0] _GEN_0 = 3'h3 == io_ID_ID_A_ALUSrc1Ctrl ? io_ID_ID_B_RData1 : 64'h0; // @[EXStage.scala 182:22 185:22]
  wire [63:0] _GEN_1 = 3'h2 == io_ID_ID_A_ALUSrc1Ctrl ? PC : _GEN_0; // @[EXStage.scala 182:22 184:22]
  wire [63:0] _GEN_3 = 3'h3 == io_ID_ID_A_ALUSrc2Ctrl ? 64'h4 : 64'h0; // @[EXStage.scala 187:22 190:22]
  wire [63:0] _GEN_4 = 3'h2 == io_ID_ID_A_ALUSrc2Ctrl ? io_ID_ID_B_RData2 : _GEN_3; // @[EXStage.scala 187:22 189:22]
  ALU ALU ( // @[EXStage.scala 160:23]
    .io_ID_ALUOP(ALU_io_ID_ALUOP),
    .io_ID_Src1(ALU_io_ID_Src1),
    .io_ID_Src2(ALU_io_ID_Src2),
    .io_MEM_ALUData(ALU_io_MEM_ALUData)
  );
  WordALU WordALU ( // @[EXStage.scala 161:23]
    .io_ID_Src1(WordALU_io_ID_Src1),
    .io_ID_Src2(WordALU_io_ID_Src2),
    .io_ID_WordALUOP(WordALU_io_ID_WordALUOP),
    .io_MEM_WordALUOut(WordALU_io_MEM_WordALUOut)
  );
  assign io_MEM_ALUData = io_ID_ID_A_WordALUEn ? WordALU_io_MEM_WordALUOut : ALU_io_MEM_ALUData; // @[EXStage.scala 202:18 203:20 206:20]
  assign ALU_io_ID_ALUOP = io_ID_ID_A_ALUOP; // @[EXStage.scala 194:19]
  assign ALU_io_ID_Src1 = 3'h1 == io_ID_ID_A_ALUSrc1Ctrl ? 64'h0 : _GEN_1; // @[EXStage.scala 182:22 183:22]
  assign ALU_io_ID_Src2 = 3'h1 == io_ID_ID_A_ALUSrc2Ctrl ? io_ID_ID_B_Imm : _GEN_4; // @[EXStage.scala 187:22 188:22]
  assign WordALU_io_ID_Src1 = 3'h1 == io_ID_ID_A_ALUSrc1Ctrl ? 64'h0 : _GEN_1; // @[EXStage.scala 182:22 183:22]
  assign WordALU_io_ID_Src2 = 3'h1 == io_ID_ID_A_ALUSrc2Ctrl ? io_ID_ID_B_Imm : _GEN_4; // @[EXStage.scala 187:22 188:22]
  assign WordALU_io_ID_WordALUOP = io_ID_ID_A_WordALUOP; // @[EXStage.scala 198:27]
endmodule
