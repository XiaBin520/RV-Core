module aluW(
  input         clock,
  input         reset,
  input  [63:0] io_src1,
  input  [63:0] io_src2,
  input  [2:0]  io_aluWOP,
  output [63:0] io_aluWOut
);
  wire [31:0] src1W = io_src1[31:0]; // @[aluW.scala 18:23]
  wire [4:0] shamt = io_src2[4:0]; // @[aluW.scala 19:23]
  wire  _T = 3'h1 == io_aluWOP; // @[aluW.scala 25:17]
  wire [63:0] _outDW_T_1 = io_src1 + io_src2; // @[aluW.scala 26:35]
  wire  _T_1 = 3'h2 == io_aluWOP; // @[aluW.scala 25:17]
  wire [63:0] _outDW_T_3 = io_src1 - io_src2; // @[aluW.scala 27:35]
  wire  _T_2 = 3'h3 == io_aluWOP; // @[aluW.scala 25:17]
  wire [94:0] _GEN_7 = {{31'd0}, io_src1}; // @[aluW.scala 28:35]
  wire [94:0] _outDW_T_4 = _GEN_7 << shamt; // @[aluW.scala 28:35]
  wire  _T_3 = 3'h4 == io_aluWOP; // @[aluW.scala 25:17]
  wire [31:0] _outW_T = src1W >> shamt; // @[aluW.scala 29:36]
  wire  _T_4 = 3'h5 == io_aluWOP; // @[aluW.scala 25:17]
  wire [31:0] _GEN_0 = 3'h5 == io_aluWOP ? _outW_T : 32'h0; // @[aluW.scala 25:17 30:27]
  wire [31:0] _GEN_1 = 3'h4 == io_aluWOP ? _outW_T : _GEN_0; // @[aluW.scala 25:17 29:27]
  wire [94:0] _GEN_2 = 3'h3 == io_aluWOP ? _outDW_T_4 : 95'h0; // @[aluW.scala 25:17 28:27]
  wire [31:0] _GEN_3 = 3'h3 == io_aluWOP ? 32'h0 : _GEN_1; // @[aluW.scala 25:17]
  wire [94:0] _GEN_4 = 3'h2 == io_aluWOP ? {{31'd0}, _outDW_T_3} : _GEN_2; // @[aluW.scala 25:17 27:27]
  wire [31:0] _GEN_5 = 3'h2 == io_aluWOP ? 32'h0 : _GEN_3; // @[aluW.scala 25:17]
  wire [94:0] _GEN_6 = 3'h1 == io_aluWOP ? {{31'd0}, _outDW_T_1} : _GEN_4; // @[aluW.scala 25:17 26:27]
  wire [31:0] outW = 3'h1 == io_aluWOP ? 32'h0 : _GEN_5; // @[aluW.scala 25:17]
  wire [63:0] outDW = _GEN_6[63:0];
  wire [31:0] _out_T_2 = outDW[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 74:12]
  wire [63:0] _out_T_4 = {_out_T_2,outDW[31:0]}; // @[Cat.scala 31:58]
  wire [63:0] _out_T_19 = {_out_T_2,outW}; // @[Cat.scala 31:58]
  wire [63:0] _GEN_8 = _T_4 ? _out_T_19 : 64'h0; // @[aluW.scala 33:17 38:25]
  wire [63:0] _GEN_9 = _T_3 ? _out_T_19 : _GEN_8; // @[aluW.scala 33:17 37:25]
  wire [63:0] _GEN_10 = _T_2 ? _out_T_4 : _GEN_9; // @[aluW.scala 33:17 36:25]
  wire [63:0] _GEN_11 = _T_1 ? _out_T_4 : _GEN_10; // @[aluW.scala 33:17 35:25]
  assign io_aluWOut = _T ? _out_T_4 : _GEN_11; // @[aluW.scala 33:17 34:25]
endmodule
