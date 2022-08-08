module WordALU(
  input  [63:0] io_DATAIN_Data1,
  input  [63:0] io_DATAIN_Data2,
  input  [2:0]  io_CTRL_WordALUOP,
  output [63:0] io_DATAOUT_WordALUData
);
  wire [31:0] Data1W = io_DATAIN_Data1[31:0]; // @[WordALU.scala 42:31]
  wire [4:0] shamt = io_DATAIN_Data2[4:0]; // @[WordALU.scala 43:31]
  wire  _T = 3'h1 == io_CTRL_WordALUOP; // @[WordALU.scala 48:20]
  wire [63:0] _DataDW_T_1 = io_DATAIN_Data1 + io_DATAIN_Data2; // @[WordALU.scala 49:38]
  wire  _T_1 = 3'h2 == io_CTRL_WordALUOP; // @[WordALU.scala 48:20]
  wire [63:0] _DataDW_T_3 = io_DATAIN_Data1 - io_DATAIN_Data2; // @[WordALU.scala 50:38]
  wire  _T_2 = 3'h3 == io_CTRL_WordALUOP; // @[WordALU.scala 48:20]
  wire [94:0] _GEN_7 = {{31'd0}, io_DATAIN_Data1}; // @[WordALU.scala 51:39]
  wire [94:0] _DataDW_T_4 = _GEN_7 << shamt; // @[WordALU.scala 51:39]
  wire  _T_3 = 3'h4 == io_CTRL_WordALUOP; // @[WordALU.scala 48:20]
  wire [31:0] _DataW_T = Data1W >> shamt; // @[WordALU.scala 52:39]
  wire  _T_4 = 3'h5 == io_CTRL_WordALUOP; // @[WordALU.scala 48:20]
  wire [31:0] _GEN_0 = 3'h5 == io_CTRL_WordALUOP ? _DataW_T : 32'h0; // @[WordALU.scala 48:20 53:28]
  wire [31:0] _GEN_1 = 3'h4 == io_CTRL_WordALUOP ? _DataW_T : _GEN_0; // @[WordALU.scala 48:20 52:28]
  wire [94:0] _GEN_2 = 3'h3 == io_CTRL_WordALUOP ? _DataDW_T_4 : 95'h0; // @[WordALU.scala 48:20 51:28]
  wire [31:0] _GEN_3 = 3'h3 == io_CTRL_WordALUOP ? 32'h0 : _GEN_1; // @[WordALU.scala 48:20]
  wire [94:0] _GEN_4 = 3'h2 == io_CTRL_WordALUOP ? {{31'd0}, _DataDW_T_3} : _GEN_2; // @[WordALU.scala 48:20 50:28]
  wire [31:0] _GEN_5 = 3'h2 == io_CTRL_WordALUOP ? 32'h0 : _GEN_3; // @[WordALU.scala 48:20]
  wire [94:0] _GEN_6 = 3'h1 == io_CTRL_WordALUOP ? {{31'd0}, _DataDW_T_1} : _GEN_4; // @[WordALU.scala 48:20 49:28]
  wire [31:0] DataW = 3'h1 == io_CTRL_WordALUOP ? 32'h0 : _GEN_5; // @[WordALU.scala 48:20]
  wire [63:0] DataDW = _GEN_6[63:0];
  wire [31:0] _WordALUData_T_2 = DataDW[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 74:12]
  wire [63:0] _WordALUData_T_4 = {_WordALUData_T_2,DataDW[31:0]}; // @[Cat.scala 31:58]
  wire [31:0] _WordALUData_T_17 = DataW[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 74:12]
  wire [63:0] _WordALUData_T_19 = {_WordALUData_T_17,DataW}; // @[Cat.scala 31:58]
  wire [63:0] _GEN_8 = _T_4 ? _WordALUData_T_19 : 64'h0; // @[WordALU.scala 59:20 64:33]
  wire [63:0] _GEN_9 = _T_3 ? _WordALUData_T_19 : _GEN_8; // @[WordALU.scala 59:20 63:33]
  wire [63:0] _GEN_10 = _T_2 ? _WordALUData_T_4 : _GEN_9; // @[WordALU.scala 59:20 62:33]
  wire [63:0] _GEN_11 = _T_1 ? _WordALUData_T_4 : _GEN_10; // @[WordALU.scala 59:20 61:33]
  assign io_DATAOUT_WordALUData = _T ? _WordALUData_T_4 : _GEN_11; // @[WordALU.scala 59:20 60:33]
endmodule
