module ImmSext(
  input  [24:0] io_DATAIN_Imm31To7,
  input  [2:0]  io_CTRL_ImmCtrl,
  output [63:0] io_DATAOUT_Imm
);
  wire [51:0] _Imm_T_2 = io_DATAIN_Imm31To7[24] ? 52'hfffffffffffff : 52'h0; // @[Bitwise.scala 74:12]
  wire [63:0] _Imm_T_4 = {_Imm_T_2,io_DATAIN_Imm31To7[24:13]}; // @[Cat.scala 31:58]
  wire [63:0] _Imm_T_10 = {_Imm_T_2,io_DATAIN_Imm31To7[24:18],io_DATAIN_Imm31To7[4:0]}; // @[Cat.scala 31:58]
  wire [50:0] _Imm_T_13 = io_DATAIN_Imm31To7[24] ? 51'h7ffffffffffff : 51'h0; // @[Bitwise.scala 74:12]
  wire [63:0] _Imm_T_18 = {_Imm_T_13,io_DATAIN_Imm31To7[24],io_DATAIN_Imm31To7[0],io_DATAIN_Imm31To7[23:18],
    io_DATAIN_Imm31To7[4:1],1'h0}; // @[Cat.scala 31:58]
  wire [31:0] _Imm_T_21 = io_DATAIN_Imm31To7[24] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 74:12]
  wire [63:0] _Imm_T_23 = {_Imm_T_21,io_DATAIN_Imm31To7[24:5],12'h0}; // @[Cat.scala 31:58]
  wire [42:0] _Imm_T_26 = io_DATAIN_Imm31To7[24] ? 43'h7ffffffffff : 43'h0; // @[Bitwise.scala 74:12]
  wire [63:0] _Imm_T_31 = {_Imm_T_26,io_DATAIN_Imm31To7[24],io_DATAIN_Imm31To7[12:5],io_DATAIN_Imm31To7[13],
    io_DATAIN_Imm31To7[23:14],1'h0}; // @[Cat.scala 31:58]
  wire [63:0] _Imm_T_34 = {59'h0,io_DATAIN_Imm31To7[12:8]}; // @[Cat.scala 31:58]
  wire [63:0] _GEN_0 = 3'h6 == io_CTRL_ImmCtrl ? _Imm_T_34 : 64'h0; // @[ImmSext.scala 43:20 49:27]
  wire [63:0] _GEN_1 = 3'h5 == io_CTRL_ImmCtrl ? _Imm_T_31 : _GEN_0; // @[ImmSext.scala 43:20 48:27]
  wire [63:0] _GEN_2 = 3'h4 == io_CTRL_ImmCtrl ? _Imm_T_23 : _GEN_1; // @[ImmSext.scala 43:20 47:27]
  wire [63:0] _GEN_3 = 3'h3 == io_CTRL_ImmCtrl ? _Imm_T_18 : _GEN_2; // @[ImmSext.scala 43:20 46:27]
  wire [63:0] _GEN_4 = 3'h2 == io_CTRL_ImmCtrl ? _Imm_T_10 : _GEN_3; // @[ImmSext.scala 43:20 45:27]
  assign io_DATAOUT_Imm = 3'h1 == io_CTRL_ImmCtrl ? _Imm_T_4 : _GEN_4; // @[ImmSext.scala 43:20 44:27]
endmodule
