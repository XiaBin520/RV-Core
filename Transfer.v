module Transfer(
  input  [31:0] io_DATAIN_PC,
  input  [63:0] io_DATAIN_Imm,
  input  [63:0] io_DATAIN_RData1,
  input  [63:0] io_DATAIN_RData2,
  input  [3:0]  io_CTRL_JumpCtrl,
  output [31:0] io_DATAOUT_PC,
  output        io_CTRLOUT_JumpEn
);
  wire [31:0] RData132 = io_DATAIN_RData1[31:0]; // @[Transfer.scala 52:35]
  wire [63:0] _GEN_28 = {{32'd0}, io_DATAIN_PC}; // @[Transfer.scala 63:19]
  wire [63:0] _PCADDImm_T_1 = _GEN_28 + io_DATAIN_Imm; // @[Transfer.scala 63:19]
  wire [63:0] _GEN_29 = {{32'd0}, RData132}; // @[Transfer.scala 64:29]
  wire [63:0] _RData1ADDImm_T_1 = _GEN_29 + io_DATAIN_Imm; // @[Transfer.scala 64:29]
  wire [63:0] _RData1ADDImm_T_2 = _RData1ADDImm_T_1 & 64'hfffffffe; // @[Transfer.scala 64:36]
  wire [31:0] PCADD4 = io_DATAIN_PC + 32'h4; // @[Transfer.scala 65:19]
  wire  _T_1 = io_DATAIN_RData1 == io_DATAIN_RData2; // @[Transfer.scala 71:19]
  wire [31:0] PCADDImm = _PCADDImm_T_1[31:0];
  wire [31:0] _GEN_1 = io_DATAIN_RData1 == io_DATAIN_RData2 ? PCADDImm : PCADD4; // @[Transfer.scala 67:16 71:30 73:16]
  wire  _T_3 = io_DATAIN_RData1 != io_DATAIN_RData2; // @[Transfer.scala 77:19]
  wire [31:0] _GEN_3 = io_DATAIN_RData1 != io_DATAIN_RData2 ? PCADDImm : PCADD4; // @[Transfer.scala 67:16 77:30 79:16]
  wire  _T_7 = $signed(io_DATAIN_RData1) < $signed(io_DATAIN_RData2); // @[Transfer.scala 83:26]
  wire [31:0] _GEN_5 = $signed(io_DATAIN_RData1) < $signed(io_DATAIN_RData2) ? PCADDImm : PCADD4; // @[Transfer.scala 67:16 83:42 85:16]
  wire  _T_11 = $signed(io_DATAIN_RData1) >= $signed(io_DATAIN_RData2); // @[Transfer.scala 89:26]
  wire [31:0] _GEN_7 = $signed(io_DATAIN_RData1) >= $signed(io_DATAIN_RData2) ? PCADDImm : PCADD4; // @[Transfer.scala 67:16 89:43 91:16]
  wire  _T_13 = io_DATAIN_RData1 < io_DATAIN_RData2; // @[Transfer.scala 95:19]
  wire [31:0] _GEN_9 = io_DATAIN_RData1 < io_DATAIN_RData2 ? PCADDImm : PCADD4; // @[Transfer.scala 67:16 95:28 97:16]
  wire  _T_15 = io_DATAIN_RData1 >= io_DATAIN_RData2; // @[Transfer.scala 101:19]
  wire [31:0] _GEN_11 = io_DATAIN_RData1 >= io_DATAIN_RData2 ? PCADDImm : PCADD4; // @[Transfer.scala 101:29 103:16 67:16]
  wire [31:0] RData1ADDImm = _RData1ADDImm_T_2[31:0];
  wire [31:0] _GEN_13 = 4'h8 == io_CTRL_JumpCtrl ? RData1ADDImm : PCADD4; // @[Transfer.scala 112:14 67:16 69:19]
  wire  _GEN_14 = 4'h7 == io_CTRL_JumpCtrl | 4'h8 == io_CTRL_JumpCtrl; // @[Transfer.scala 69:19 107:25]
  wire [31:0] _GEN_15 = 4'h7 == io_CTRL_JumpCtrl ? PCADDImm : _GEN_13; // @[Transfer.scala 108:14 69:19]
  wire  _GEN_16 = 4'h6 == io_CTRL_JumpCtrl ? _T_15 : _GEN_14; // @[Transfer.scala 69:19]
  wire [31:0] _GEN_17 = 4'h6 == io_CTRL_JumpCtrl ? _GEN_11 : _GEN_15; // @[Transfer.scala 69:19]
  wire  _GEN_18 = 4'h5 == io_CTRL_JumpCtrl ? _T_13 : _GEN_16; // @[Transfer.scala 69:19]
  wire [31:0] _GEN_19 = 4'h5 == io_CTRL_JumpCtrl ? _GEN_9 : _GEN_17; // @[Transfer.scala 69:19]
  wire  _GEN_20 = 4'h4 == io_CTRL_JumpCtrl ? _T_11 : _GEN_18; // @[Transfer.scala 69:19]
  wire [31:0] _GEN_21 = 4'h4 == io_CTRL_JumpCtrl ? _GEN_7 : _GEN_19; // @[Transfer.scala 69:19]
  wire  _GEN_22 = 4'h3 == io_CTRL_JumpCtrl ? _T_7 : _GEN_20; // @[Transfer.scala 69:19]
  wire [31:0] _GEN_23 = 4'h3 == io_CTRL_JumpCtrl ? _GEN_5 : _GEN_21; // @[Transfer.scala 69:19]
  wire  _GEN_24 = 4'h2 == io_CTRL_JumpCtrl ? _T_3 : _GEN_22; // @[Transfer.scala 69:19]
  wire [31:0] _GEN_25 = 4'h2 == io_CTRL_JumpCtrl ? _GEN_3 : _GEN_23; // @[Transfer.scala 69:19]
  assign io_DATAOUT_PC = 4'h1 == io_CTRL_JumpCtrl ? _GEN_1 : _GEN_25; // @[Transfer.scala 69:19]
  assign io_CTRLOUT_JumpEn = 4'h1 == io_CTRL_JumpCtrl ? _T_1 : _GEN_24; // @[Transfer.scala 69:19]
endmodule
