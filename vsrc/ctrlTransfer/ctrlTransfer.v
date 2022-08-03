module ctrlTransfer(
  input         clock,
  input         reset,
  input  [3:0]  io_ctrlModel,
  input  [31:0] io_prePC,
  input  [63:0] io_imm,
  input  [63:0] io_rs1Data,
  input  [63:0] io_rs2Data,
  output [31:0] io_nextPC
);
  wire [31:0] rs1Data32 = io_rs1Data[31:0]; // @[ctrlTransfer.scala 21:29]
  wire [63:0] _GEN_14 = {{32'd0}, io_prePC}; // @[ctrlTransfer.scala 30:22]
  wire [63:0] _pcADDimm_T_1 = _GEN_14 + io_imm; // @[ctrlTransfer.scala 30:22]
  wire [63:0] _GEN_15 = {{32'd0}, rs1Data32}; // @[ctrlTransfer.scala 31:27]
  wire [63:0] _rs1ADDimm_T_1 = _GEN_15 + io_imm; // @[ctrlTransfer.scala 31:27]
  wire [63:0] _rs1ADDimm_T_2 = _rs1ADDimm_T_1 & 64'hfffffffe; // @[ctrlTransfer.scala 31:34]
  wire [31:0] pcADD4 = io_prePC + 32'h4; // @[ctrlTransfer.scala 32:22]
  wire [31:0] pcADDimm = _pcADDimm_T_1[31:0];
  wire [31:0] _GEN_0 = io_rs1Data == io_rs2Data ? pcADDimm : pcADD4; // @[ctrlTransfer.scala 34:13 37:{33,41}]
  wire [31:0] _GEN_1 = io_rs1Data != io_rs2Data ? pcADDimm : pcADD4; // @[ctrlTransfer.scala 34:13 40:{33,41}]
  wire [31:0] _GEN_2 = $signed(io_rs1Data) < $signed(io_rs2Data) ? pcADDimm : pcADD4; // @[ctrlTransfer.scala 34:13 43:{45,53}]
  wire [31:0] _GEN_3 = $signed(io_rs1Data) >= $signed(io_rs2Data) ? pcADDimm : pcADD4; // @[ctrlTransfer.scala 34:13 46:{46,54}]
  wire [31:0] _GEN_4 = io_rs1Data < io_rs2Data ? pcADDimm : pcADD4; // @[ctrlTransfer.scala 34:13 49:{31,39}]
  wire [31:0] _GEN_5 = io_rs1Data >= io_rs2Data ? pcADDimm : pcADD4; // @[ctrlTransfer.scala 34:13 52:{32,40}]
  wire [31:0] rs1ADDimm = _rs1ADDimm_T_2[31:0];
  wire [31:0] _GEN_6 = 4'h8 == io_ctrlModel ? rs1ADDimm : pcADD4; // @[ctrlTransfer.scala 34:13 35:20 58:14]
  wire [31:0] _GEN_7 = 4'h7 == io_ctrlModel ? pcADDimm : _GEN_6; // @[ctrlTransfer.scala 35:20 55:14]
  wire [31:0] _GEN_8 = 4'h6 == io_ctrlModel ? _GEN_5 : _GEN_7; // @[ctrlTransfer.scala 35:20]
  wire [31:0] _GEN_9 = 4'h5 == io_ctrlModel ? _GEN_4 : _GEN_8; // @[ctrlTransfer.scala 35:20]
  wire [31:0] _GEN_10 = 4'h4 == io_ctrlModel ? _GEN_3 : _GEN_9; // @[ctrlTransfer.scala 35:20]
  wire [31:0] _GEN_11 = 4'h3 == io_ctrlModel ? _GEN_2 : _GEN_10; // @[ctrlTransfer.scala 35:20]
  wire [31:0] _GEN_12 = 4'h2 == io_ctrlModel ? _GEN_1 : _GEN_11; // @[ctrlTransfer.scala 35:20]
  assign io_nextPC = 4'h1 == io_ctrlModel ? _GEN_0 : _GEN_12; // @[ctrlTransfer.scala 35:20]
endmodule
