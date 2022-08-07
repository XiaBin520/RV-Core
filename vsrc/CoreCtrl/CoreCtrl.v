module IReadFSM(
  input         clock,
  input         reset,
  input  [31:0] io_CORE_pc,
  output [31:0] io_CORE_instr,
  output        io_MEM_A_En,
  output [31:0] io_MEM_A_Addr,
  input         io_MEM_B_DataValid,
  input  [31:0] io_MEM_B_Data,
  input         io_CTRL_Start,
  output        io_CTRL_Done
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] stateReg; // @[mainCtrl.scala 61:25]
  reg [31:0] instrReg; // @[mainCtrl.scala 62:25]
  wire [1:0] _GEN_1 = io_MEM_B_DataValid ? 2'h3 : stateReg; // @[mainCtrl.scala 74:22 75:18 61:25]
  wire [31:0] _GEN_2 = io_MEM_B_DataValid ? io_MEM_B_Data : instrReg; // @[mainCtrl.scala 74:22 76:18 62:25]
  wire [1:0] _GEN_3 = 2'h3 == stateReg ? 2'h0 : stateReg; // @[mainCtrl.scala 64:19 80:16 61:25]
  assign io_CORE_instr = instrReg; // @[mainCtrl.scala 87:18]
  assign io_MEM_A_En = stateReg == 2'h1; // @[mainCtrl.scala 84:29]
  assign io_MEM_A_Addr = io_CORE_pc; // @[mainCtrl.scala 88:18]
  assign io_CTRL_Done = stateReg == 2'h3; // @[mainCtrl.scala 85:29]
  always @(posedge clock) begin
    if (reset) begin // @[mainCtrl.scala 61:25]
      stateReg <= 2'h0; // @[mainCtrl.scala 61:25]
    end else if (2'h0 == stateReg) begin // @[mainCtrl.scala 64:19]
      if (io_CTRL_Start) begin // @[mainCtrl.scala 66:18]
        stateReg <= 2'h1; // @[mainCtrl.scala 67:18]
      end
    end else if (2'h1 == stateReg) begin // @[mainCtrl.scala 64:19]
      stateReg <= 2'h2; // @[mainCtrl.scala 71:16]
    end else if (2'h2 == stateReg) begin // @[mainCtrl.scala 64:19]
      stateReg <= _GEN_1;
    end else begin
      stateReg <= _GEN_3;
    end
    if (reset) begin // @[mainCtrl.scala 62:25]
      instrReg <= 32'h13; // @[mainCtrl.scala 62:25]
    end else if (!(2'h0 == stateReg)) begin // @[mainCtrl.scala 64:19]
      if (!(2'h1 == stateReg)) begin // @[mainCtrl.scala 64:19]
        if (2'h2 == stateReg) begin // @[mainCtrl.scala 64:19]
          instrReg <= _GEN_2;
        end
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  stateReg = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  instrReg = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module DReadFSM(
  input         clock,
  input         reset,
  input  [31:0] io_CORE_Addr,
  input  [2:0]  io_CORE_Size,
  output [63:0] io_CORE_Data,
  output        io_MEM_En,
  output [31:0] io_MEM_Addr,
  output [1:0]  io_MEM_Size,
  input         io_MEM_DataValid,
  input  [63:0] io_MEM_Data,
  input         io_CTRL_Start,
  output        io_CTRL_Done
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] stateReg; // @[mainCtrl.scala 140:25]
  reg [63:0] dataReg; // @[mainCtrl.scala 141:25]
  wire [1:0] _GEN_1 = io_MEM_DataValid ? 2'h3 : stateReg; // @[mainCtrl.scala 153:22 154:18 140:25]
  wire [63:0] _GEN_2 = io_MEM_DataValid ? io_MEM_Data : dataReg; // @[mainCtrl.scala 153:22 155:18 141:25]
  wire [1:0] _GEN_3 = 2'h3 == stateReg ? 2'h0 : stateReg; // @[mainCtrl.scala 143:19 159:16 140:25]
  wire [1:0] _GEN_10 = io_CORE_Size == 3'h3 | io_CORE_Size == 3'h6 ? 2'h2 : 2'h3; // @[mainCtrl.scala 176:54 177:17 180:17]
  wire [1:0] _GEN_11 = io_CORE_Size == 3'h2 | io_CORE_Size == 3'h5 ? 2'h1 : _GEN_10; // @[mainCtrl.scala 173:52 174:17]
  assign io_CORE_Data = dataReg; // @[mainCtrl.scala 166:16]
  assign io_MEM_En = stateReg == 2'h1; // @[mainCtrl.scala 163:29]
  assign io_MEM_Addr = io_CORE_Addr; // @[mainCtrl.scala 167:16]
  assign io_MEM_Size = io_CORE_Size == 3'h1 | io_CORE_Size == 3'h4 ? 2'h0 : _GEN_11; // @[mainCtrl.scala 170:47 171:17]
  assign io_CTRL_Done = stateReg == 2'h3; // @[mainCtrl.scala 164:29]
  always @(posedge clock) begin
    if (reset) begin // @[mainCtrl.scala 140:25]
      stateReg <= 2'h0; // @[mainCtrl.scala 140:25]
    end else if (2'h0 == stateReg) begin // @[mainCtrl.scala 143:19]
      if (io_CTRL_Start) begin // @[mainCtrl.scala 145:18]
        stateReg <= 2'h1; // @[mainCtrl.scala 146:18]
      end
    end else if (2'h1 == stateReg) begin // @[mainCtrl.scala 143:19]
      stateReg <= 2'h2; // @[mainCtrl.scala 150:16]
    end else if (2'h2 == stateReg) begin // @[mainCtrl.scala 143:19]
      stateReg <= _GEN_1;
    end else begin
      stateReg <= _GEN_3;
    end
    if (reset) begin // @[mainCtrl.scala 141:25]
      dataReg <= 64'h0; // @[mainCtrl.scala 141:25]
    end else if (!(2'h0 == stateReg)) begin // @[mainCtrl.scala 143:19]
      if (!(2'h1 == stateReg)) begin // @[mainCtrl.scala 143:19]
        if (2'h2 == stateReg) begin // @[mainCtrl.scala 143:19]
          dataReg <= _GEN_2;
        end
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  stateReg = _RAND_0[1:0];
  _RAND_1 = {2{`RANDOM}};
  dataReg = _RAND_1[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module DWriteFSM(
  input         clock,
  input         reset,
  input  [31:0] io_CORE_Addr,
  input  [2:0]  io_CORE_Size,
  input  [63:0] io_CORE_Data,
  output        io_MEM_En,
  output [31:0] io_MEM_Addr,
  output [1:0]  io_MEM_Size,
  output [63:0] io_MEM_Data,
  input         io_MEM_Done,
  input         io_CTRL_Start,
  output        io_CTRL_Done
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] stateReg; // @[mainCtrl.scala 236:25]
  wire [1:0] _GEN_1 = io_MEM_Done ? 2'h3 : stateReg; // @[mainCtrl.scala 248:17 249:18 236:25]
  wire [1:0] _GEN_2 = 2'h3 == stateReg ? 2'h0 : stateReg; // @[mainCtrl.scala 238:19 253:16 236:25]
  wire [2:0] _GEN_6 = io_CORE_Size == 3'h3 ? 3'h3 : 3'h4; // @[mainCtrl.scala 270:31 271:17 274:17]
  wire [2:0] _GEN_7 = io_CORE_Size == 3'h2 ? 3'h1 : _GEN_6; // @[mainCtrl.scala 267:30 268:17]
  wire [2:0] _GEN_8 = io_CORE_Size == 3'h1 ? 3'h0 : _GEN_7; // @[mainCtrl.scala 264:25 265:17]
  assign io_MEM_En = stateReg == 2'h1; // @[mainCtrl.scala 257:29]
  assign io_MEM_Addr = io_CORE_Addr; // @[mainCtrl.scala 259:16]
  assign io_MEM_Size = _GEN_8[1:0];
  assign io_MEM_Data = io_CORE_Data; // @[mainCtrl.scala 260:16]
  assign io_CTRL_Done = stateReg == 2'h3; // @[mainCtrl.scala 258:29]
  always @(posedge clock) begin
    if (reset) begin // @[mainCtrl.scala 236:25]
      stateReg <= 2'h0; // @[mainCtrl.scala 236:25]
    end else if (2'h0 == stateReg) begin // @[mainCtrl.scala 238:19]
      if (io_CTRL_Start) begin // @[mainCtrl.scala 240:18]
        stateReg <= 2'h1; // @[mainCtrl.scala 241:18]
      end
    end else if (2'h1 == stateReg) begin // @[mainCtrl.scala 238:19]
      stateReg <= 2'h2; // @[mainCtrl.scala 245:16]
    end else if (2'h2 == stateReg) begin // @[mainCtrl.scala 238:19]
      stateReg <= _GEN_1;
    end else begin
      stateReg <= _GEN_2;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  stateReg = _RAND_0[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module HazardCheck(
  input        io_IDStage_Rs1En,
  input        io_IDStage_Rs2En,
  input  [4:0] io_IDStage_Rs1,
  input  [4:0] io_IDStage_Rs2,
  input        io_IDStage_jumpEn,
  input        io_EXStage_En,
  input  [4:0] io_EXStage_Rd,
  input        io_MEMStage_En,
  input  [4:0] io_MEMStage_Rd,
  input  [1:0] io_MEMStage_Src,
  output       io_CTRL_HazardEn_EXID,
  output       io_CTRL_HazardEn_MEMID,
  output       io_CTRL_HazardEn_JUMP
);
  wire  _T_5 = io_IDStage_Rs2En & io_IDStage_Rs2 == io_EXStage_Rd; // @[mainCtrl.scala 337:32]
  wire  _GEN_1 = io_IDStage_Rs1En & io_IDStage_Rs1 == io_EXStage_Rd | _T_5; // @[mainCtrl.scala 334:63 335:21]
  wire  _T_13 = io_MEMStage_En & io_IDStage_Rs2 == io_MEMStage_Rd; // @[mainCtrl.scala 348:30]
  wire  _GEN_4 = io_IDStage_Rs1En & io_IDStage_Rs1 == io_MEMStage_Rd | _T_13; // @[mainCtrl.scala 345:64 346:22]
  assign io_CTRL_HazardEn_EXID = io_EXStage_En & io_EXStage_Rd != 5'h0 & _GEN_1; // @[mainCtrl.scala 333:47]
  assign io_CTRL_HazardEn_MEMID = io_MEMStage_En & io_MEMStage_Rd != 5'h0 & io_MEMStage_Src == 2'h2 & _GEN_4; // @[mainCtrl.scala 344:79]
  assign io_CTRL_HazardEn_JUMP = io_IDStage_jumpEn; // @[mainCtrl.scala 358:26]
endmodule
module MainCtrlFSM(
  input   clock,
  input   reset,
  input   io_CORE_A_REn,
  input   io_CORE_A_WEn,
  output  io_CORE_B_HoldPC,
  output  io_CORE_B_HoldIFID,
  output  io_CORE_B_HoldIDEX,
  output  io_CORE_B_HoldEXMEM,
  output  io_CORE_B_HoldMEMWB,
  output  io_CORE_B_FlushIFID,
  output  io_CORE_B_FLUSHIDEX,
  output  io_IREAD_Start,
  input   io_IREAD_Done,
  output  io_DREAD_Start,
  input   io_DREAD_Done,
  output  io_DWRITE_Start,
  input   io_DWRITE_Done,
  input   io_HazardCheck_HazardEn_EXID,
  input   io_HazardCheck_HazardEn_MEMID,
  input   io_HazardCheck_HazardEn_JUMP
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] stateReg; // @[mainCtrl.scala 403:25]
  wire [3:0] _GEN_0 = io_CORE_A_WEn ? 4'h5 : 4'h7; // @[mainCtrl.scala 411:{34,45} 412:45]
  wire [3:0] _GEN_1 = io_CORE_A_REn ? 4'h3 : _GEN_0; // @[mainCtrl.scala 410:{34,45}]
  wire [3:0] _GEN_2 = io_IREAD_Done ? _GEN_1 : stateReg; // @[mainCtrl.scala 403:25 409:26]
  wire [3:0] _GEN_3 = io_DREAD_Done ? 4'h7 : stateReg; // @[mainCtrl.scala 403:25 418:{26,37}]
  wire [3:0] _GEN_4 = io_DWRITE_Done ? 4'h7 : stateReg; // @[mainCtrl.scala 403:25 423:{27,37}]
  wire [3:0] _GEN_5 = io_HazardCheck_HazardEn_JUMP ? 4'ha : 4'hb; // @[mainCtrl.scala 429:{48,59} 430:59]
  wire [3:0] _GEN_6 = io_HazardCheck_HazardEn_MEMID ? 4'h9 : _GEN_5; // @[mainCtrl.scala 428:{48,59}]
  wire [3:0] _GEN_7 = io_HazardCheck_HazardEn_EXID ? 4'h8 : _GEN_6; // @[mainCtrl.scala 427:{48,59}]
  wire [3:0] _GEN_8 = 4'hb == stateReg ? 4'h1 : stateReg; // @[mainCtrl.scala 404:19 403:25 435:34]
  wire [3:0] _GEN_9 = 4'ha == stateReg ? 4'h1 : _GEN_8; // @[mainCtrl.scala 404:19 434:34]
  wire [3:0] _GEN_10 = 4'h9 == stateReg ? 4'h1 : _GEN_9; // @[mainCtrl.scala 404:19 433:34]
  wire [3:0] _GEN_11 = 4'h8 == stateReg ? 4'h1 : _GEN_10; // @[mainCtrl.scala 404:19 432:34]
  wire [3:0] _GEN_12 = 4'h7 == stateReg ? _GEN_7 : _GEN_11; // @[mainCtrl.scala 404:19]
  wire [3:0] _GEN_13 = 4'h6 == stateReg ? _GEN_4 : _GEN_12; // @[mainCtrl.scala 404:19]
  wire [3:0] _GEN_14 = 4'h5 == stateReg ? 4'h6 : _GEN_13; // @[mainCtrl.scala 404:19 421:28]
  wire [3:0] _GEN_15 = 4'h4 == stateReg ? _GEN_3 : _GEN_14; // @[mainCtrl.scala 404:19]
  wire [3:0] _GEN_16 = 4'h3 == stateReg ? 4'h4 : _GEN_15; // @[mainCtrl.scala 404:19 416:28]
  wire  _T_13 = stateReg == 4'h9; // @[mainCtrl.scala 457:22]
  wire  _T_14 = stateReg == 4'ha; // @[mainCtrl.scala 463:22]
  wire  _GEN_20 = stateReg == 4'hb ? 1'h0 : 1'h1; // @[mainCtrl.scala 471:39 472:15]
  wire  _GEN_21 = stateReg == 4'ha ? 1'h0 : _GEN_20; // @[mainCtrl.scala 463:39 464:15]
  wire  _GEN_23 = stateReg == 4'h9 ? 1'h0 : _GEN_21; // @[mainCtrl.scala 457:40 458:15]
  wire  _GEN_25 = stateReg == 4'h9 | _GEN_21; // @[mainCtrl.scala 457:40]
  wire  _GEN_26 = stateReg == 4'h9 ? 1'h0 : _T_14; // @[mainCtrl.scala 457:40]
  assign io_CORE_B_HoldPC = stateReg == 4'h8 | _GEN_25; // @[mainCtrl.scala 451:34]
  assign io_CORE_B_HoldIFID = stateReg == 4'h8 | _GEN_25; // @[mainCtrl.scala 451:34]
  assign io_CORE_B_HoldIDEX = stateReg == 4'h8 ? 1'h0 : _GEN_23; // @[mainCtrl.scala 451:34 452:15]
  assign io_CORE_B_HoldEXMEM = stateReg == 4'h8 ? 1'h0 : _GEN_23; // @[mainCtrl.scala 451:34 452:15]
  assign io_CORE_B_HoldMEMWB = stateReg == 4'h8 ? 1'h0 : _GEN_23; // @[mainCtrl.scala 451:34 452:15]
  assign io_CORE_B_FlushIFID = stateReg == 4'h8 ? 1'h0 : _GEN_26; // @[mainCtrl.scala 451:34]
  assign io_CORE_B_FLUSHIDEX = stateReg == 4'h8 | _T_13; // @[mainCtrl.scala 451:34 455:15]
  assign io_IREAD_Start = stateReg == 4'h1; // @[mainCtrl.scala 439:32]
  assign io_DREAD_Start = stateReg == 4'h3; // @[mainCtrl.scala 440:32]
  assign io_DWRITE_Start = stateReg == 4'h5; // @[mainCtrl.scala 441:32]
  always @(posedge clock) begin
    if (reset) begin // @[mainCtrl.scala 403:25]
      stateReg <= 4'h0; // @[mainCtrl.scala 403:25]
    end else if (4'h0 == stateReg) begin // @[mainCtrl.scala 404:19]
      stateReg <= 4'h1; // @[mainCtrl.scala 405:28]
    end else if (4'h1 == stateReg) begin // @[mainCtrl.scala 404:19]
      stateReg <= 4'h2; // @[mainCtrl.scala 407:28]
    end else if (4'h2 == stateReg) begin // @[mainCtrl.scala 404:19]
      stateReg <= _GEN_2;
    end else begin
      stateReg <= _GEN_16;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  stateReg = _RAND_0[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module CoreCtrl(
  input         clock,
  input         reset,
  input  [31:0] io_CORE_A_IREAD_pc,
  output [31:0] io_CORE_A_IREAD_instr,
  input  [31:0] io_CORE_A_DREAD_Addr,
  input  [2:0]  io_CORE_A_DREAD_Size,
  output [63:0] io_CORE_A_DREAD_Data,
  input  [31:0] io_CORE_A_DWRITE_Addr,
  input  [2:0]  io_CORE_A_DWRITE_Size,
  input  [63:0] io_CORE_A_DWRITE_Data,
  input         io_CORE_A_WRCTRL_REn,
  input         io_CORE_A_WRCTRL_WEn,
  input         io_CORE_B_IDStage_Rs1En,
  input         io_CORE_B_IDStage_Rs2En,
  input  [4:0]  io_CORE_B_IDStage_Rs1,
  input  [4:0]  io_CORE_B_IDStage_Rs2,
  input         io_CORE_B_IDStage_jumpEn,
  input         io_CORE_B_EXStage_En,
  input  [4:0]  io_CORE_B_EXStage_Rd,
  input         io_CORE_B_MEMStage_En,
  input  [4:0]  io_CORE_B_MEMStage_Rd,
  input  [1:0]  io_CORE_B_MEMStage_Src,
  output        io_CORE_B_CORECTRL_HoldPC,
  output        io_CORE_B_CORECTRL_HoldIFID,
  output        io_CORE_B_CORECTRL_HoldIDEX,
  output        io_CORE_B_CORECTRL_HoldEXMEM,
  output        io_CORE_B_CORECTRL_HoldMEMWB,
  output        io_CORE_B_CORECTRL_FlushIFID,
  output        io_CORE_B_CORECTRL_FLUSHIDEX,
  output        io_MEM_IREAD_A_En,
  output [31:0] io_MEM_IREAD_A_Addr,
  output [1:0]  io_MEM_IREAD_A_Size,
  input         io_MEM_IREAD_B_DataValid,
  input  [31:0] io_MEM_IREAD_B_Data,
  output        io_MEM_DREAD_En,
  output [31:0] io_MEM_DREAD_Addr,
  output [1:0]  io_MEM_DREAD_Size,
  input         io_MEM_DREAD_DataValid,
  input  [63:0] io_MEM_DREAD_Data,
  output        io_MEM_DWRITE_En,
  output [31:0] io_MEM_DWRITE_Addr,
  output [1:0]  io_MEM_DWRITE_Size,
  output [63:0] io_MEM_DWRITE_Data,
  input         io_MEM_DWRITE_Done
);
  wire  IREAD_clock; // @[mainCtrl.scala 536:24]
  wire  IREAD_reset; // @[mainCtrl.scala 536:24]
  wire [31:0] IREAD_io_CORE_pc; // @[mainCtrl.scala 536:24]
  wire [31:0] IREAD_io_CORE_instr; // @[mainCtrl.scala 536:24]
  wire  IREAD_io_MEM_A_En; // @[mainCtrl.scala 536:24]
  wire [31:0] IREAD_io_MEM_A_Addr; // @[mainCtrl.scala 536:24]
  wire  IREAD_io_MEM_B_DataValid; // @[mainCtrl.scala 536:24]
  wire [31:0] IREAD_io_MEM_B_Data; // @[mainCtrl.scala 536:24]
  wire  IREAD_io_CTRL_Start; // @[mainCtrl.scala 536:24]
  wire  IREAD_io_CTRL_Done; // @[mainCtrl.scala 536:24]
  wire  DREAD_clock; // @[mainCtrl.scala 537:24]
  wire  DREAD_reset; // @[mainCtrl.scala 537:24]
  wire [31:0] DREAD_io_CORE_Addr; // @[mainCtrl.scala 537:24]
  wire [2:0] DREAD_io_CORE_Size; // @[mainCtrl.scala 537:24]
  wire [63:0] DREAD_io_CORE_Data; // @[mainCtrl.scala 537:24]
  wire  DREAD_io_MEM_En; // @[mainCtrl.scala 537:24]
  wire [31:0] DREAD_io_MEM_Addr; // @[mainCtrl.scala 537:24]
  wire [1:0] DREAD_io_MEM_Size; // @[mainCtrl.scala 537:24]
  wire  DREAD_io_MEM_DataValid; // @[mainCtrl.scala 537:24]
  wire [63:0] DREAD_io_MEM_Data; // @[mainCtrl.scala 537:24]
  wire  DREAD_io_CTRL_Start; // @[mainCtrl.scala 537:24]
  wire  DREAD_io_CTRL_Done; // @[mainCtrl.scala 537:24]
  wire  DWRITE_clock; // @[mainCtrl.scala 538:24]
  wire  DWRITE_reset; // @[mainCtrl.scala 538:24]
  wire [31:0] DWRITE_io_CORE_Addr; // @[mainCtrl.scala 538:24]
  wire [2:0] DWRITE_io_CORE_Size; // @[mainCtrl.scala 538:24]
  wire [63:0] DWRITE_io_CORE_Data; // @[mainCtrl.scala 538:24]
  wire  DWRITE_io_MEM_En; // @[mainCtrl.scala 538:24]
  wire [31:0] DWRITE_io_MEM_Addr; // @[mainCtrl.scala 538:24]
  wire [1:0] DWRITE_io_MEM_Size; // @[mainCtrl.scala 538:24]
  wire [63:0] DWRITE_io_MEM_Data; // @[mainCtrl.scala 538:24]
  wire  DWRITE_io_MEM_Done; // @[mainCtrl.scala 538:24]
  wire  DWRITE_io_CTRL_Start; // @[mainCtrl.scala 538:24]
  wire  DWRITE_io_CTRL_Done; // @[mainCtrl.scala 538:24]
  wire  HAZARD_io_IDStage_Rs1En; // @[mainCtrl.scala 539:24]
  wire  HAZARD_io_IDStage_Rs2En; // @[mainCtrl.scala 539:24]
  wire [4:0] HAZARD_io_IDStage_Rs1; // @[mainCtrl.scala 539:24]
  wire [4:0] HAZARD_io_IDStage_Rs2; // @[mainCtrl.scala 539:24]
  wire  HAZARD_io_IDStage_jumpEn; // @[mainCtrl.scala 539:24]
  wire  HAZARD_io_EXStage_En; // @[mainCtrl.scala 539:24]
  wire [4:0] HAZARD_io_EXStage_Rd; // @[mainCtrl.scala 539:24]
  wire  HAZARD_io_MEMStage_En; // @[mainCtrl.scala 539:24]
  wire [4:0] HAZARD_io_MEMStage_Rd; // @[mainCtrl.scala 539:24]
  wire [1:0] HAZARD_io_MEMStage_Src; // @[mainCtrl.scala 539:24]
  wire  HAZARD_io_CTRL_HazardEn_EXID; // @[mainCtrl.scala 539:24]
  wire  HAZARD_io_CTRL_HazardEn_MEMID; // @[mainCtrl.scala 539:24]
  wire  HAZARD_io_CTRL_HazardEn_JUMP; // @[mainCtrl.scala 539:24]
  wire  MAINCTRL_clock; // @[mainCtrl.scala 540:24]
  wire  MAINCTRL_reset; // @[mainCtrl.scala 540:24]
  wire  MAINCTRL_io_CORE_A_REn; // @[mainCtrl.scala 540:24]
  wire  MAINCTRL_io_CORE_A_WEn; // @[mainCtrl.scala 540:24]
  wire  MAINCTRL_io_CORE_B_HoldPC; // @[mainCtrl.scala 540:24]
  wire  MAINCTRL_io_CORE_B_HoldIFID; // @[mainCtrl.scala 540:24]
  wire  MAINCTRL_io_CORE_B_HoldIDEX; // @[mainCtrl.scala 540:24]
  wire  MAINCTRL_io_CORE_B_HoldEXMEM; // @[mainCtrl.scala 540:24]
  wire  MAINCTRL_io_CORE_B_HoldMEMWB; // @[mainCtrl.scala 540:24]
  wire  MAINCTRL_io_CORE_B_FlushIFID; // @[mainCtrl.scala 540:24]
  wire  MAINCTRL_io_CORE_B_FLUSHIDEX; // @[mainCtrl.scala 540:24]
  wire  MAINCTRL_io_IREAD_Start; // @[mainCtrl.scala 540:24]
  wire  MAINCTRL_io_IREAD_Done; // @[mainCtrl.scala 540:24]
  wire  MAINCTRL_io_DREAD_Start; // @[mainCtrl.scala 540:24]
  wire  MAINCTRL_io_DREAD_Done; // @[mainCtrl.scala 540:24]
  wire  MAINCTRL_io_DWRITE_Start; // @[mainCtrl.scala 540:24]
  wire  MAINCTRL_io_DWRITE_Done; // @[mainCtrl.scala 540:24]
  wire  MAINCTRL_io_HazardCheck_HazardEn_EXID; // @[mainCtrl.scala 540:24]
  wire  MAINCTRL_io_HazardCheck_HazardEn_MEMID; // @[mainCtrl.scala 540:24]
  wire  MAINCTRL_io_HazardCheck_HazardEn_JUMP; // @[mainCtrl.scala 540:24]
  IReadFSM IREAD ( // @[mainCtrl.scala 536:24]
    .clock(IREAD_clock),
    .reset(IREAD_reset),
    .io_CORE_pc(IREAD_io_CORE_pc),
    .io_CORE_instr(IREAD_io_CORE_instr),
    .io_MEM_A_En(IREAD_io_MEM_A_En),
    .io_MEM_A_Addr(IREAD_io_MEM_A_Addr),
    .io_MEM_B_DataValid(IREAD_io_MEM_B_DataValid),
    .io_MEM_B_Data(IREAD_io_MEM_B_Data),
    .io_CTRL_Start(IREAD_io_CTRL_Start),
    .io_CTRL_Done(IREAD_io_CTRL_Done)
  );
  DReadFSM DREAD ( // @[mainCtrl.scala 537:24]
    .clock(DREAD_clock),
    .reset(DREAD_reset),
    .io_CORE_Addr(DREAD_io_CORE_Addr),
    .io_CORE_Size(DREAD_io_CORE_Size),
    .io_CORE_Data(DREAD_io_CORE_Data),
    .io_MEM_En(DREAD_io_MEM_En),
    .io_MEM_Addr(DREAD_io_MEM_Addr),
    .io_MEM_Size(DREAD_io_MEM_Size),
    .io_MEM_DataValid(DREAD_io_MEM_DataValid),
    .io_MEM_Data(DREAD_io_MEM_Data),
    .io_CTRL_Start(DREAD_io_CTRL_Start),
    .io_CTRL_Done(DREAD_io_CTRL_Done)
  );
  DWriteFSM DWRITE ( // @[mainCtrl.scala 538:24]
    .clock(DWRITE_clock),
    .reset(DWRITE_reset),
    .io_CORE_Addr(DWRITE_io_CORE_Addr),
    .io_CORE_Size(DWRITE_io_CORE_Size),
    .io_CORE_Data(DWRITE_io_CORE_Data),
    .io_MEM_En(DWRITE_io_MEM_En),
    .io_MEM_Addr(DWRITE_io_MEM_Addr),
    .io_MEM_Size(DWRITE_io_MEM_Size),
    .io_MEM_Data(DWRITE_io_MEM_Data),
    .io_MEM_Done(DWRITE_io_MEM_Done),
    .io_CTRL_Start(DWRITE_io_CTRL_Start),
    .io_CTRL_Done(DWRITE_io_CTRL_Done)
  );
  HazardCheck HAZARD ( // @[mainCtrl.scala 539:24]
    .io_IDStage_Rs1En(HAZARD_io_IDStage_Rs1En),
    .io_IDStage_Rs2En(HAZARD_io_IDStage_Rs2En),
    .io_IDStage_Rs1(HAZARD_io_IDStage_Rs1),
    .io_IDStage_Rs2(HAZARD_io_IDStage_Rs2),
    .io_IDStage_jumpEn(HAZARD_io_IDStage_jumpEn),
    .io_EXStage_En(HAZARD_io_EXStage_En),
    .io_EXStage_Rd(HAZARD_io_EXStage_Rd),
    .io_MEMStage_En(HAZARD_io_MEMStage_En),
    .io_MEMStage_Rd(HAZARD_io_MEMStage_Rd),
    .io_MEMStage_Src(HAZARD_io_MEMStage_Src),
    .io_CTRL_HazardEn_EXID(HAZARD_io_CTRL_HazardEn_EXID),
    .io_CTRL_HazardEn_MEMID(HAZARD_io_CTRL_HazardEn_MEMID),
    .io_CTRL_HazardEn_JUMP(HAZARD_io_CTRL_HazardEn_JUMP)
  );
  MainCtrlFSM MAINCTRL ( // @[mainCtrl.scala 540:24]
    .clock(MAINCTRL_clock),
    .reset(MAINCTRL_reset),
    .io_CORE_A_REn(MAINCTRL_io_CORE_A_REn),
    .io_CORE_A_WEn(MAINCTRL_io_CORE_A_WEn),
    .io_CORE_B_HoldPC(MAINCTRL_io_CORE_B_HoldPC),
    .io_CORE_B_HoldIFID(MAINCTRL_io_CORE_B_HoldIFID),
    .io_CORE_B_HoldIDEX(MAINCTRL_io_CORE_B_HoldIDEX),
    .io_CORE_B_HoldEXMEM(MAINCTRL_io_CORE_B_HoldEXMEM),
    .io_CORE_B_HoldMEMWB(MAINCTRL_io_CORE_B_HoldMEMWB),
    .io_CORE_B_FlushIFID(MAINCTRL_io_CORE_B_FlushIFID),
    .io_CORE_B_FLUSHIDEX(MAINCTRL_io_CORE_B_FLUSHIDEX),
    .io_IREAD_Start(MAINCTRL_io_IREAD_Start),
    .io_IREAD_Done(MAINCTRL_io_IREAD_Done),
    .io_DREAD_Start(MAINCTRL_io_DREAD_Start),
    .io_DREAD_Done(MAINCTRL_io_DREAD_Done),
    .io_DWRITE_Start(MAINCTRL_io_DWRITE_Start),
    .io_DWRITE_Done(MAINCTRL_io_DWRITE_Done),
    .io_HazardCheck_HazardEn_EXID(MAINCTRL_io_HazardCheck_HazardEn_EXID),
    .io_HazardCheck_HazardEn_MEMID(MAINCTRL_io_HazardCheck_HazardEn_MEMID),
    .io_HazardCheck_HazardEn_JUMP(MAINCTRL_io_HazardCheck_HazardEn_JUMP)
  );
  assign io_CORE_A_IREAD_instr = IREAD_io_CORE_instr; // @[mainCtrl.scala 543:18]
  assign io_CORE_A_DREAD_Data = DREAD_io_CORE_Data; // @[mainCtrl.scala 548:17]
  assign io_CORE_B_CORECTRL_HoldPC = MAINCTRL_io_CORE_B_HoldPC; // @[mainCtrl.scala 562:22]
  assign io_CORE_B_CORECTRL_HoldIFID = MAINCTRL_io_CORE_B_HoldIFID; // @[mainCtrl.scala 562:22]
  assign io_CORE_B_CORECTRL_HoldIDEX = MAINCTRL_io_CORE_B_HoldIDEX; // @[mainCtrl.scala 562:22]
  assign io_CORE_B_CORECTRL_HoldEXMEM = MAINCTRL_io_CORE_B_HoldEXMEM; // @[mainCtrl.scala 562:22]
  assign io_CORE_B_CORECTRL_HoldMEMWB = MAINCTRL_io_CORE_B_HoldMEMWB; // @[mainCtrl.scala 562:22]
  assign io_CORE_B_CORECTRL_FlushIFID = MAINCTRL_io_CORE_B_FlushIFID; // @[mainCtrl.scala 562:22]
  assign io_CORE_B_CORECTRL_FLUSHIDEX = MAINCTRL_io_CORE_B_FLUSHIDEX; // @[mainCtrl.scala 562:22]
  assign io_MEM_IREAD_A_En = IREAD_io_MEM_A_En; // @[mainCtrl.scala 544:18]
  assign io_MEM_IREAD_A_Addr = IREAD_io_MEM_A_Addr; // @[mainCtrl.scala 544:18]
  assign io_MEM_IREAD_A_Size = 2'h2; // @[mainCtrl.scala 544:18]
  assign io_MEM_DREAD_En = DREAD_io_MEM_En; // @[mainCtrl.scala 549:17]
  assign io_MEM_DREAD_Addr = DREAD_io_MEM_Addr; // @[mainCtrl.scala 549:17]
  assign io_MEM_DREAD_Size = DREAD_io_MEM_Size; // @[mainCtrl.scala 549:17]
  assign io_MEM_DWRITE_En = DWRITE_io_MEM_En; // @[mainCtrl.scala 553:18]
  assign io_MEM_DWRITE_Addr = DWRITE_io_MEM_Addr; // @[mainCtrl.scala 553:18]
  assign io_MEM_DWRITE_Size = DWRITE_io_MEM_Size; // @[mainCtrl.scala 553:18]
  assign io_MEM_DWRITE_Data = DWRITE_io_MEM_Data; // @[mainCtrl.scala 553:18]
  assign IREAD_clock = clock;
  assign IREAD_reset = reset;
  assign IREAD_io_CORE_pc = io_CORE_A_IREAD_pc; // @[mainCtrl.scala 543:18]
  assign IREAD_io_MEM_B_DataValid = io_MEM_IREAD_B_DataValid; // @[mainCtrl.scala 545:18]
  assign IREAD_io_MEM_B_Data = io_MEM_IREAD_B_Data; // @[mainCtrl.scala 545:18]
  assign IREAD_io_CTRL_Start = MAINCTRL_io_IREAD_Start; // @[mainCtrl.scala 546:18]
  assign DREAD_clock = clock;
  assign DREAD_reset = reset;
  assign DREAD_io_CORE_Addr = io_CORE_A_DREAD_Addr; // @[mainCtrl.scala 548:17]
  assign DREAD_io_CORE_Size = io_CORE_A_DREAD_Size; // @[mainCtrl.scala 548:17]
  assign DREAD_io_MEM_DataValid = io_MEM_DREAD_DataValid; // @[mainCtrl.scala 549:17]
  assign DREAD_io_MEM_Data = io_MEM_DREAD_Data; // @[mainCtrl.scala 549:17]
  assign DREAD_io_CTRL_Start = MAINCTRL_io_DREAD_Start; // @[mainCtrl.scala 550:17]
  assign DWRITE_clock = clock;
  assign DWRITE_reset = reset;
  assign DWRITE_io_CORE_Addr = io_CORE_A_DWRITE_Addr; // @[mainCtrl.scala 552:18]
  assign DWRITE_io_CORE_Size = io_CORE_A_DWRITE_Size; // @[mainCtrl.scala 552:18]
  assign DWRITE_io_CORE_Data = io_CORE_A_DWRITE_Data; // @[mainCtrl.scala 552:18]
  assign DWRITE_io_MEM_Done = io_MEM_DWRITE_Done; // @[mainCtrl.scala 553:18]
  assign DWRITE_io_CTRL_Start = MAINCTRL_io_DWRITE_Start; // @[mainCtrl.scala 554:18]
  assign HAZARD_io_IDStage_Rs1En = io_CORE_B_IDStage_Rs1En; // @[mainCtrl.scala 556:22]
  assign HAZARD_io_IDStage_Rs2En = io_CORE_B_IDStage_Rs2En; // @[mainCtrl.scala 556:22]
  assign HAZARD_io_IDStage_Rs1 = io_CORE_B_IDStage_Rs1; // @[mainCtrl.scala 556:22]
  assign HAZARD_io_IDStage_Rs2 = io_CORE_B_IDStage_Rs2; // @[mainCtrl.scala 556:22]
  assign HAZARD_io_IDStage_jumpEn = io_CORE_B_IDStage_jumpEn; // @[mainCtrl.scala 556:22]
  assign HAZARD_io_EXStage_En = io_CORE_B_EXStage_En; // @[mainCtrl.scala 557:22]
  assign HAZARD_io_EXStage_Rd = io_CORE_B_EXStage_Rd; // @[mainCtrl.scala 557:22]
  assign HAZARD_io_MEMStage_En = io_CORE_B_MEMStage_En; // @[mainCtrl.scala 558:22]
  assign HAZARD_io_MEMStage_Rd = io_CORE_B_MEMStage_Rd; // @[mainCtrl.scala 558:22]
  assign HAZARD_io_MEMStage_Src = io_CORE_B_MEMStage_Src; // @[mainCtrl.scala 558:22]
  assign MAINCTRL_clock = clock;
  assign MAINCTRL_reset = reset;
  assign MAINCTRL_io_CORE_A_REn = io_CORE_A_WRCTRL_REn; // @[mainCtrl.scala 561:22]
  assign MAINCTRL_io_CORE_A_WEn = io_CORE_A_WRCTRL_WEn; // @[mainCtrl.scala 561:22]
  assign MAINCTRL_io_IREAD_Done = IREAD_io_CTRL_Done; // @[mainCtrl.scala 546:18]
  assign MAINCTRL_io_DREAD_Done = DREAD_io_CTRL_Done; // @[mainCtrl.scala 550:17]
  assign MAINCTRL_io_DWRITE_Done = DWRITE_io_CTRL_Done; // @[mainCtrl.scala 554:18]
  assign MAINCTRL_io_HazardCheck_HazardEn_EXID = HAZARD_io_CTRL_HazardEn_EXID; // @[mainCtrl.scala 559:22]
  assign MAINCTRL_io_HazardCheck_HazardEn_MEMID = HAZARD_io_CTRL_HazardEn_MEMID; // @[mainCtrl.scala 559:22]
  assign MAINCTRL_io_HazardCheck_HazardEn_JUMP = HAZARD_io_CTRL_HazardEn_JUMP; // @[mainCtrl.scala 559:22]
endmodule
