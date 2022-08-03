module immSext(
  input         clock,
  input         reset,
  input  [24:0] io_i32To7,
  input  [2:0]  io_immCtrl,
  output [63:0] io_imm64
);
  wire [51:0] _out_T_2 = io_i32To7[24] ? 52'hfffffffffffff : 52'h0; // @[Bitwise.scala 74:12]
  wire [63:0] _out_T_4 = {_out_T_2,io_i32To7[24:13]}; // @[Cat.scala 31:58]
  wire [63:0] _out_T_10 = {_out_T_2,io_i32To7[24:18],io_i32To7[4:0]}; // @[Cat.scala 31:58]
  wire [50:0] _out_T_13 = io_i32To7[24] ? 51'h7ffffffffffff : 51'h0; // @[Bitwise.scala 74:12]
  wire [63:0] _out_T_18 = {_out_T_13,io_i32To7[24],io_i32To7[0],io_i32To7[23:18],io_i32To7[4:1],1'h0}; // @[Cat.scala 31:58]
  wire [31:0] _out_T_21 = io_i32To7[24] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 74:12]
  wire [63:0] _out_T_23 = {_out_T_21,io_i32To7[24:5],12'h0}; // @[Cat.scala 31:58]
  wire [42:0] _out_T_26 = io_i32To7[24] ? 43'h7ffffffffff : 43'h0; // @[Bitwise.scala 74:12]
  wire [63:0] _out_T_31 = {_out_T_26,io_i32To7[24],io_i32To7[12:5],io_i32To7[13],io_i32To7[23:14],1'h0}; // @[Cat.scala 31:58]
  wire [63:0] _out_T_34 = {59'h0,io_i32To7[12:8]}; // @[Cat.scala 31:58]
  wire [63:0] _GEN_0 = 3'h6 == io_immCtrl ? _out_T_34 : 64'h0; // @[immSext.scala 20:20 37:17]
  wire [63:0] _GEN_1 = 3'h5 == io_immCtrl ? _out_T_31 : _GEN_0; // @[immSext.scala 20:20 34:17]
  wire [63:0] _GEN_2 = 3'h4 == io_immCtrl ? _out_T_23 : _GEN_1; // @[immSext.scala 20:20 31:17]
  wire [63:0] _GEN_3 = 3'h3 == io_immCtrl ? _out_T_18 : _GEN_2; // @[immSext.scala 20:20 28:17]
  wire [63:0] _GEN_4 = 3'h2 == io_immCtrl ? _out_T_10 : _GEN_3; // @[immSext.scala 20:20 25:17]
  assign io_imm64 = 3'h1 == io_immCtrl ? _out_T_4 : _GEN_4; // @[immSext.scala 20:20 22:17]
endmodule
