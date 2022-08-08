module ALU(
  input  [63:0] io_DATAIN_Data1,
  input  [63:0] io_DATAIN_Data2,
  input  [3:0]  io_CTRL_ALUOP,
  output [63:0] io_DATAOUT_ALUData
);
  wire [5:0] shamt = io_DATAIN_Data2[5:0]; // @[ALU.scala 58:34]
  wire [63:0] _ALUData_T_1 = io_DATAIN_Data1 + io_DATAIN_Data2; // @[ALU.scala 62:41]
  wire [63:0] _ALUData_T_3 = io_DATAIN_Data1 - io_DATAIN_Data2; // @[ALU.scala 63:41]
  wire [63:0] _ALUData_T_4 = io_DATAIN_Data1; // @[ALU.scala 64:42]
  wire [63:0] _ALUData_T_5 = io_DATAIN_Data2; // @[ALU.scala 64:57]
  wire [63:0] _ALUData_T_8 = io_DATAIN_Data1 ^ io_DATAIN_Data2; // @[ALU.scala 66:41]
  wire [63:0] _ALUData_T_9 = io_DATAIN_Data1 | io_DATAIN_Data2; // @[ALU.scala 67:41]
  wire [63:0] _ALUData_T_10 = io_DATAIN_Data1 & io_DATAIN_Data2; // @[ALU.scala 68:41]
  wire [126:0] _GEN_10 = {{63'd0}, io_DATAIN_Data1}; // @[ALU.scala 69:41]
  wire [126:0] _ALUData_T_11 = _GEN_10 << shamt; // @[ALU.scala 69:41]
  wire [63:0] _ALUData_T_12 = io_DATAIN_Data1 >> shamt; // @[ALU.scala 70:41]
  wire [63:0] _ALUData_T_15 = $signed(io_DATAIN_Data1) >>> shamt; // @[ALU.scala 71:59]
  wire [63:0] _GEN_0 = 4'h9 == io_CTRL_ALUOP ? _ALUData_T_15 : 64'h0; // @[ALU.scala 61:18 71:32]
  wire [63:0] _GEN_1 = 4'h8 == io_CTRL_ALUOP ? _ALUData_T_12 : _GEN_0; // @[ALU.scala 61:18 70:32]
  wire [126:0] _GEN_2 = 4'h7 == io_CTRL_ALUOP ? _ALUData_T_11 : {{63'd0}, _GEN_1}; // @[ALU.scala 61:18 69:32]
  wire [126:0] _GEN_3 = 4'h6 == io_CTRL_ALUOP ? {{63'd0}, _ALUData_T_10} : _GEN_2; // @[ALU.scala 61:18 68:32]
  wire [126:0] _GEN_4 = 4'h5 == io_CTRL_ALUOP ? {{63'd0}, _ALUData_T_9} : _GEN_3; // @[ALU.scala 61:18 67:32]
  wire [126:0] _GEN_5 = 4'h4 == io_CTRL_ALUOP ? {{63'd0}, _ALUData_T_8} : _GEN_4; // @[ALU.scala 61:18 66:32]
  wire [126:0] _GEN_6 = 4'h3 == io_CTRL_ALUOP ? {{126'd0}, io_DATAIN_Data1 < io_DATAIN_Data2} : _GEN_5; // @[ALU.scala 61:18 65:32]
  wire [126:0] _GEN_7 = 4'h2 == io_CTRL_ALUOP ? {{126'd0}, $signed(_ALUData_T_4) < $signed(_ALUData_T_5)} : _GEN_6; // @[ALU.scala 61:18 64:32]
  wire [126:0] _GEN_8 = 4'h1 == io_CTRL_ALUOP ? {{63'd0}, _ALUData_T_3} : _GEN_7; // @[ALU.scala 61:18 63:32]
  wire [126:0] _GEN_9 = 4'h0 == io_CTRL_ALUOP ? {{63'd0}, _ALUData_T_1} : _GEN_8; // @[ALU.scala 61:18 62:32]
  assign io_DATAOUT_ALUData = _GEN_9[63:0]; // @[ALU.scala 74:24]
endmodule
