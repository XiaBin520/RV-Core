module ctrlCore(
  input         clock,
  input         reset,
  input         io_wEnData,
  input  [2:0]  io_wCtrlData,
  input  [31:0] io_wAddrData,
  input  [63:0] io_wData,
  input         io_rEnData,
  input  [2:0]  io_rCtrlData,
  input  [31:0] io_rAddrData,
  input  [31:0] io_rAddrInstr,
  input         io_wFinish,
  input         io_rValidData,
  input  [63:0] io_rData,
  input         io_rValidInstr,
  input  [31:0] io_rInstr,
  input         io_regWEn_EX,
  input         io_rdNum_EX,
  input         io_regWEn_MEM,
  input  [1:0]  io_regWSrc_MEM,
  input  [4:0]  io_rdNum_MEM,
  input         io_rs1REn_ID,
  input         io_rs2REn_ID,
  input  [4:0]  io_rs1Num_ID,
  input  [4:0]  io_rs2Num_ID,
  input         io_jumpEn_ID,
  output        io_wEnDMem,
  output [1:0]  io_wCtrlDMem,
  output [63:0] io_wDataDMem,
  output [31:0] io_wAddrDmem,
  output        io_rEnDMem,
  output [1:0]  io_rCtrlDMem,
  output [31:0] io_rAddrDMem,
  output        io_rEnIMem,
  output [31:0] io_rAddrIMem,
  output [31:0] io_instr,
  output [63:0] io_data,
  output        io_pcHold,
  output        io_IFIDHold,
  output        io_IDEXHold,
  output        io_EXMEMHold,
  output        io_MEMWBHold,
  output        io_IFIDFlush,
  output        io_IDEXFlush
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [31:0] _RAND_8;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] stateReg; // @[ctrlCore.scala 89:27]
  reg  dataWDone; // @[ctrlCore.scala 90:27]
  reg  dataRDone; // @[ctrlCore.scala 91:27]
  reg  instrRDone; // @[ctrlCore.scala 92:27]
  wire  _T_1 = 3'h1 == stateReg; // @[ctrlCore.scala 96:19]
  wire [4:0] _GEN_60 = {{4'd0}, io_rdNum_EX}; // @[ctrlCore.scala 107:37]
  wire [2:0] _GEN_1 = io_rs2REn_ID & io_rs2Num_ID == _GEN_60 ? 3'h3 : stateReg; // @[ctrlCore.scala 110:55 111:20 89:27]
  wire [2:0] _GEN_2 = io_rs1REn_ID & io_rs1Num_ID == _GEN_60 ? 3'h3 : _GEN_1; // @[ctrlCore.scala 107:50 108:20]
  wire [2:0] _GEN_3 = io_rs2REn_ID & io_rs2Num_ID == io_rdNum_MEM ? 3'h4 : stateReg; // @[ctrlCore.scala 118:56 119:20 89:27]
  wire [2:0] _GEN_4 = io_rs1REn_ID & io_rs1Num_ID == io_rdNum_MEM ? 3'h4 : _GEN_3; // @[ctrlCore.scala 115:51 116:20]
  wire [2:0] _GEN_5 = io_jumpEn_ID ? 3'h5 : 3'h6; // @[ctrlCore.scala 122:27 123:18 126:18]
  wire [2:0] _GEN_6 = io_regWEn_MEM & io_regWSrc_MEM == 2'h2 ? _GEN_4 : _GEN_5; // @[ctrlCore.scala 114:54]
  wire [2:0] _GEN_7 = io_regWEn_EX ? _GEN_2 : _GEN_6; // @[ctrlCore.scala 106:22]
  wire  _T_15 = 3'h3 == stateReg; // @[ctrlCore.scala 96:19]
  wire  _T_16 = 3'h4 == stateReg; // @[ctrlCore.scala 96:19]
  wire  _T_17 = 3'h5 == stateReg; // @[ctrlCore.scala 96:19]
  wire  _T_18 = 3'h6 == stateReg; // @[ctrlCore.scala 96:19]
  wire [2:0] _GEN_8 = 3'h6 == stateReg ? 3'h1 : stateReg; // @[ctrlCore.scala 139:17 96:19 89:27]
  wire [2:0] _GEN_9 = 3'h5 == stateReg ? 3'h1 : _GEN_8; // @[ctrlCore.scala 136:17 96:19]
  wire [2:0] _GEN_10 = 3'h4 == stateReg ? 3'h1 : _GEN_9; // @[ctrlCore.scala 133:17 96:19]
  wire [2:0] _GEN_11 = 3'h3 == stateReg ? 3'h1 : _GEN_10; // @[ctrlCore.scala 130:17 96:19]
  reg [1:0] instrStateReg; // @[ctrlCore.scala 152:30]
  reg [31:0] instrReg; // @[ctrlCore.scala 153:30]
  wire [1:0] _GEN_16 = 2'h3 == instrStateReg ? 2'h0 : instrStateReg; // @[ctrlCore.scala 157:28 171:25 152:30]
  wire [1:0] _GEN_17 = 2'h2 == instrStateReg ? 2'h2 : _GEN_16; // @[ctrlCore.scala 157:28 168:27]
  wire  _T_28 = stateReg == 3'h4; // @[ctrlCore.scala 185:22]
  wire  _T_29 = stateReg == 3'h3 | _T_28; // @[ctrlCore.scala 184:38]
  wire  _T_30 = stateReg == 3'h5; // @[ctrlCore.scala 186:22]
  wire  _T_31 = _T_29 | _T_30; // @[ctrlCore.scala 185:38]
  wire  _T_32 = stateReg == 3'h6; // @[ctrlCore.scala 187:22]
  wire  _T_33 = _T_31 | _T_32; // @[ctrlCore.scala 186:38]
  wire  _GEN_22 = _T_33 ? 1'h0 : instrRDone; // @[ctrlCore.scala 187:30 188:16 92:27]
  wire  _GEN_23 = instrStateReg == 2'h3 | _GEN_22; // @[ctrlCore.scala 181:38 182:16]
  reg [1:0] dataRState; // @[ctrlCore.scala 203:27]
  reg [63:0] dataReg; // @[ctrlCore.scala 204:27]
  wire [1:0] _GEN_26 = 2'h3 == dataRState ? 2'h0 : dataRState; // @[ctrlCore.scala 208:25 225:24 203:27]
  wire [1:0] _GEN_27 = 2'h2 == dataRState ? 2'h2 : _GEN_26; // @[ctrlCore.scala 208:25 222:24]
  wire  _GEN_32 = _T_33 ? 1'h0 : dataRDone; // @[ctrlCore.scala 241:30 242:15 91:27]
  wire  _GEN_33 = dataRState == 2'h3 | _GEN_32; // @[ctrlCore.scala 235:35 236:15]
  wire [1:0] _GEN_34 = io_rCtrlData == 3'h3 | io_rCtrlData == 3'h6 ? 2'h2 : 2'h3; // @[ctrlCore.scala 257:64 258:18 261:18]
  wire [1:0] _GEN_35 = io_rCtrlData == 3'h2 | io_rCtrlData == 3'h5 ? 2'h1 : _GEN_34; // @[ctrlCore.scala 254:62 255:18]
  reg [1:0] dataWState; // @[ctrlCore.scala 274:27]
  wire [1:0] _GEN_39 = 2'h3 == dataWState ? 2'h0 : dataWState; // @[ctrlCore.scala 278:25 295:22 274:27]
  wire [1:0] _GEN_40 = 2'h2 == dataWState ? 2'h2 : _GEN_39; // @[ctrlCore.scala 278:25 292:22]
  wire  _GEN_44 = _T_33 ? 1'h0 : dataWDone; // @[ctrlCore.scala 307:30 308:15 90:27]
  wire  _GEN_45 = dataWState == 2'h3 | _GEN_44; // @[ctrlCore.scala 301:35 302:15]
  wire [1:0] _GEN_46 = io_wCtrlData == 3'h3 ? 2'h2 : 2'h3; // @[ctrlCore.scala 322:36 323:18 326:18]
  wire [1:0] _GEN_47 = io_wCtrlData == 3'h2 ? 2'h1 : _GEN_46; // @[ctrlCore.scala 319:35 320:18]
  wire  _GEN_49 = _T_18 ? 1'h0 : 1'h1; // @[ctrlCore.scala 342:19 364:17]
  wire  _GEN_50 = _T_17 ? 1'h0 : _GEN_49; // @[ctrlCore.scala 342:19 356:17]
  wire  _GEN_52 = _T_16 ? 1'h0 : _GEN_50; // @[ctrlCore.scala 342:19 350:17]
  wire  _GEN_55 = _T_16 ? 1'h0 : _T_17; // @[ctrlCore.scala 342:19]
  assign io_wEnDMem = dataWState == 2'h1; // @[ctrlCore.scala 312:29]
  assign io_wCtrlDMem = io_wCtrlData == 3'h1 ? 2'h0 : _GEN_47; // @[ctrlCore.scala 316:30 317:18]
  assign io_wDataDMem = io_wData; // @[ctrlCore.scala 329:16]
  assign io_wAddrDmem = io_wAddrData; // @[ctrlCore.scala 330:16]
  assign io_rEnDMem = dataRState == 2'h1; // @[ctrlCore.scala 249:29]
  assign io_rCtrlDMem = io_rCtrlData == 3'h1 | io_rCtrlData == 3'h4 ? 2'h0 : _GEN_35; // @[ctrlCore.scala 251:57 252:18]
  assign io_rAddrDMem = io_rAddrData; // @[ctrlCore.scala 264:16]
  assign io_rEnIMem = instrStateReg == 2'h1; // @[ctrlCore.scala 191:34]
  assign io_rAddrIMem = io_rAddrInstr; // @[ctrlCore.scala 192:16]
  assign io_instr = instrReg; // @[ctrlCore.scala 193:16]
  assign io_data = dataReg; // @[ctrlCore.scala 265:16]
  assign io_pcHold = _T_15 | (_T_16 | _GEN_50); // @[ctrlCore.scala 342:19]
  assign io_IFIDHold = _T_15 | (_T_16 | _GEN_50); // @[ctrlCore.scala 342:19]
  assign io_IDEXHold = _T_15 ? 1'h0 : _GEN_52; // @[ctrlCore.scala 342:19 344:17]
  assign io_EXMEMHold = _T_15 ? 1'h0 : _GEN_52; // @[ctrlCore.scala 342:19 344:17]
  assign io_MEMWBHold = _T_15 ? 1'h0 : _GEN_52; // @[ctrlCore.scala 342:19 344:17]
  assign io_IFIDFlush = _T_15 ? 1'h0 : _GEN_55; // @[ctrlCore.scala 342:19]
  assign io_IDEXFlush = _T_15 | _T_16; // @[ctrlCore.scala 342:19 345:17]
  always @(posedge clock) begin
    if (reset) begin // @[ctrlCore.scala 89:27]
      stateReg <= 3'h0; // @[ctrlCore.scala 89:27]
    end else if (3'h0 == stateReg) begin // @[ctrlCore.scala 96:19]
      stateReg <= 3'h1; // @[ctrlCore.scala 98:16]
    end else if (3'h1 == stateReg) begin // @[ctrlCore.scala 96:19]
      if (dataWDone & dataRDone & instrRDone) begin // @[ctrlCore.scala 101:49]
        stateReg <= 3'h2; // @[ctrlCore.scala 102:18]
      end
    end else if (3'h2 == stateReg) begin // @[ctrlCore.scala 96:19]
      stateReg <= _GEN_7;
    end else begin
      stateReg <= _GEN_11;
    end
    if (reset) begin // @[ctrlCore.scala 90:27]
      dataWDone <= 1'h0; // @[ctrlCore.scala 90:27]
    end else begin
      dataWDone <= _GEN_45;
    end
    if (reset) begin // @[ctrlCore.scala 91:27]
      dataRDone <= 1'h0; // @[ctrlCore.scala 91:27]
    end else begin
      dataRDone <= _GEN_33;
    end
    if (reset) begin // @[ctrlCore.scala 92:27]
      instrRDone <= 1'h0; // @[ctrlCore.scala 92:27]
    end else begin
      instrRDone <= _GEN_23;
    end
    if (reset) begin // @[ctrlCore.scala 152:30]
      instrStateReg <= 2'h0; // @[ctrlCore.scala 152:30]
    end else if (_T_1) begin // @[ctrlCore.scala 155:19]
      if (2'h0 == instrStateReg) begin // @[ctrlCore.scala 157:28]
        instrStateReg <= 2'h1; // @[ctrlCore.scala 159:25]
      end else if (2'h1 == instrStateReg) begin // @[ctrlCore.scala 157:28]
        instrStateReg <= 2'h2; // @[ctrlCore.scala 162:25]
      end else begin
        instrStateReg <= _GEN_17;
      end
    end
    if (reset) begin // @[ctrlCore.scala 153:30]
      instrReg <= 32'h13; // @[ctrlCore.scala 153:30]
    end else if (io_rValidInstr & instrStateReg == 2'h2) begin // @[ctrlCore.scala 177:51]
      instrReg <= io_rInstr; // @[ctrlCore.scala 178:14]
    end
    if (reset) begin // @[ctrlCore.scala 203:27]
      dataRState <= 2'h0; // @[ctrlCore.scala 203:27]
    end else if (_T_1) begin // @[ctrlCore.scala 206:19]
      if (2'h0 == dataRState) begin // @[ctrlCore.scala 208:25]
        dataRState <= 2'h3; // @[ctrlCore.scala 213:24]
      end else if (2'h1 == dataRState) begin // @[ctrlCore.scala 208:25]
        dataRState <= 2'h2; // @[ctrlCore.scala 216:24]
      end else begin
        dataRState <= _GEN_27;
      end
    end
    if (reset) begin // @[ctrlCore.scala 204:27]
      dataReg <= 64'h0; // @[ctrlCore.scala 204:27]
    end else if (io_rValidData & dataRState == 2'h2) begin // @[ctrlCore.scala 231:47]
      dataReg <= io_rData; // @[ctrlCore.scala 232:13]
    end
    if (reset) begin // @[ctrlCore.scala 274:27]
      dataWState <= 2'h0; // @[ctrlCore.scala 274:27]
    end else if (_T_1) begin // @[ctrlCore.scala 276:19]
      if (2'h0 == dataWState) begin // @[ctrlCore.scala 278:25]
        dataWState <= 2'h3; // @[ctrlCore.scala 283:22]
      end else if (2'h1 == dataWState) begin // @[ctrlCore.scala 278:25]
        dataWState <= 2'h2; // @[ctrlCore.scala 286:22]
      end else begin
        dataWState <= _GEN_40;
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
  stateReg = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  dataWDone = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  dataRDone = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  instrRDone = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  instrStateReg = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  instrReg = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  dataRState = _RAND_6[1:0];
  _RAND_7 = {2{`RANDOM}};
  dataReg = _RAND_7[63:0];
  _RAND_8 = {1{`RANDOM}};
  dataWState = _RAND_8[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
