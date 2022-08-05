module ID_EX(
  input         clock,
  input         reset,
  input         io_flush,
  input         io_hold,
  input  [3:0]  io_aluOPIn,
  input  [2:0]  io_aluSrc1CtrlIn,
  input  [2:0]  io_aluSrc2CtrlIn,
  input         io_aluWEnIn,
  input  [2:0]  io_aluWOPIn,
  input         io_memREnIn,
  input  [2:0]  io_memRCtrlIn,
  input         io_memWEnIn,
  input  [2:0]  io_memWCtrlIn,
  input         io_regWEnIn,
  input  [1:0]  io_regWSrcIn,
  input  [4:0]  io_rdIn,
  input         io_rs1REnIn,
  input         io_rs2REnIn,
  input  [4:0]  io_rs1In,
  input  [4:0]  io_rs2In,
  output [3:0]  io_aluOPOut,
  output [2:0]  io_aluSrc1CtrlOut,
  output [2:0]  io_aluSrc2CtrlOut,
  output        io_aluWEnOut,
  output [2:0]  io_aluWOPOut,
  output        io_memREnOut,
  output [2:0]  io_memRCtrlOut,
  output        io_memWEnOut,
  output [2:0]  io_memWCtrlOut,
  output        io_regWEnOut,
  output [1:0]  io_regWSrcOut,
  output [4:0]  io_rdOut,
  output        io_rs1REnOut,
  output        io_rs2REnOut,
  output [4:0]  io_rs1Out,
  output [4:0]  io_rs2Out,
  input  [63:0] io_rData1In,
  input  [63:0] io_rData2In,
  output [63:0] io_rData1Out,
  output [63:0] io_rData2Out,
  input  [63:0] io_imm64In,
  output [63:0] io_imm64Out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [63:0] _RAND_16;
  reg [63:0] _RAND_17;
  reg [63:0] _RAND_18;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] aluOPReg; // @[ID_EX.scala 87:31]
  reg [2:0] aluSrc1CtrlReg; // @[ID_EX.scala 88:31]
  reg [2:0] aluSrc2CtrlReg; // @[ID_EX.scala 89:31]
  reg  aluWEnReg; // @[ID_EX.scala 90:31]
  reg [2:0] aluWOPReg; // @[ID_EX.scala 91:31]
  reg  memREnReg; // @[ID_EX.scala 92:31]
  reg [2:0] memRCtrlReg; // @[ID_EX.scala 93:31]
  reg  memWEnReg; // @[ID_EX.scala 94:31]
  reg [2:0] memWCtrlReg; // @[ID_EX.scala 95:31]
  reg  regWEnReg; // @[ID_EX.scala 96:31]
  reg [1:0] regWSrcReg; // @[ID_EX.scala 97:31]
  reg [4:0] rdReg; // @[ID_EX.scala 98:31]
  reg  rs1REnReg; // @[ID_EX.scala 99:31]
  reg  rs2REnReg; // @[ID_EX.scala 100:31]
  reg [4:0] rs1Reg; // @[ID_EX.scala 101:31]
  reg [4:0] rs2Reg; // @[ID_EX.scala 102:31]
  reg [63:0] rData1Reg; // @[ID_EX.scala 104:32]
  reg [63:0] rData2Reg; // @[ID_EX.scala 105:32]
  reg [63:0] imm64Reg; // @[ID_EX.scala 107:32]
  assign io_aluOPOut = aluOPReg; // @[ID_EX.scala 167:21]
  assign io_aluSrc1CtrlOut = aluSrc1CtrlReg; // @[ID_EX.scala 168:21]
  assign io_aluSrc2CtrlOut = aluSrc2CtrlReg; // @[ID_EX.scala 169:21]
  assign io_aluWEnOut = aluWEnReg; // @[ID_EX.scala 170:21]
  assign io_aluWOPOut = aluWOPReg; // @[ID_EX.scala 171:21]
  assign io_memREnOut = memREnReg; // @[ID_EX.scala 172:21]
  assign io_memRCtrlOut = memRCtrlReg; // @[ID_EX.scala 173:21]
  assign io_memWEnOut = memWEnReg; // @[ID_EX.scala 174:21]
  assign io_memWCtrlOut = memWCtrlReg; // @[ID_EX.scala 175:21]
  assign io_regWEnOut = regWEnReg; // @[ID_EX.scala 176:21]
  assign io_regWSrcOut = regWSrcReg; // @[ID_EX.scala 177:21]
  assign io_rdOut = rdReg; // @[ID_EX.scala 178:21]
  assign io_rs1REnOut = rs1REnReg; // @[ID_EX.scala 179:21]
  assign io_rs2REnOut = rs2REnReg; // @[ID_EX.scala 180:21]
  assign io_rs1Out = rs1Reg; // @[ID_EX.scala 181:21]
  assign io_rs2Out = rs2Reg; // @[ID_EX.scala 182:21]
  assign io_rData1Out = rData1Reg; // @[ID_EX.scala 184:22]
  assign io_rData2Out = rData2Reg; // @[ID_EX.scala 185:22]
  assign io_imm64Out = imm64Reg; // @[ID_EX.scala 187:22]
  always @(posedge clock) begin
    if (reset) begin // @[ID_EX.scala 87:31]
      aluOPReg <= 4'h0; // @[ID_EX.scala 87:31]
    end else if (!(io_flush)) begin // @[ID_EX.scala 109:14]
      if (!(io_hold)) begin // @[ID_EX.scala 117:18]
        aluOPReg <= io_aluOPIn; // @[ID_EX.scala 143:20]
      end
    end
    if (reset) begin // @[ID_EX.scala 88:31]
      aluSrc1CtrlReg <= 3'h0; // @[ID_EX.scala 88:31]
    end else if (!(io_flush)) begin // @[ID_EX.scala 109:14]
      if (!(io_hold)) begin // @[ID_EX.scala 117:18]
        aluSrc1CtrlReg <= io_aluSrc1CtrlIn; // @[ID_EX.scala 144:20]
      end
    end
    if (reset) begin // @[ID_EX.scala 89:31]
      aluSrc2CtrlReg <= 3'h0; // @[ID_EX.scala 89:31]
    end else if (!(io_flush)) begin // @[ID_EX.scala 109:14]
      if (!(io_hold)) begin // @[ID_EX.scala 117:18]
        aluSrc2CtrlReg <= io_aluSrc2CtrlIn; // @[ID_EX.scala 145:20]
      end
    end
    if (reset) begin // @[ID_EX.scala 90:31]
      aluWEnReg <= 1'h0; // @[ID_EX.scala 90:31]
    end else if (io_flush) begin // @[ID_EX.scala 109:14]
      aluWEnReg <= 1'h0; // @[ID_EX.scala 110:20]
    end else if (!(io_hold)) begin // @[ID_EX.scala 117:18]
      aluWEnReg <= io_aluWEnIn; // @[ID_EX.scala 146:20]
    end
    if (reset) begin // @[ID_EX.scala 91:31]
      aluWOPReg <= 3'h0; // @[ID_EX.scala 91:31]
    end else if (!(io_flush)) begin // @[ID_EX.scala 109:14]
      if (!(io_hold)) begin // @[ID_EX.scala 117:18]
        aluWOPReg <= io_aluWOPIn; // @[ID_EX.scala 147:20]
      end
    end
    if (reset) begin // @[ID_EX.scala 92:31]
      memREnReg <= 1'h0; // @[ID_EX.scala 92:31]
    end else if (io_flush) begin // @[ID_EX.scala 109:14]
      memREnReg <= 1'h0; // @[ID_EX.scala 111:20]
    end else if (!(io_hold)) begin // @[ID_EX.scala 117:18]
      memREnReg <= io_memREnIn; // @[ID_EX.scala 148:20]
    end
    if (reset) begin // @[ID_EX.scala 93:31]
      memRCtrlReg <= 3'h0; // @[ID_EX.scala 93:31]
    end else if (!(io_flush)) begin // @[ID_EX.scala 109:14]
      if (!(io_hold)) begin // @[ID_EX.scala 117:18]
        memRCtrlReg <= io_memRCtrlIn; // @[ID_EX.scala 149:20]
      end
    end
    if (reset) begin // @[ID_EX.scala 94:31]
      memWEnReg <= 1'h0; // @[ID_EX.scala 94:31]
    end else if (io_flush) begin // @[ID_EX.scala 109:14]
      memWEnReg <= 1'h0; // @[ID_EX.scala 112:20]
    end else if (!(io_hold)) begin // @[ID_EX.scala 117:18]
      memWEnReg <= io_memWEnIn; // @[ID_EX.scala 150:20]
    end
    if (reset) begin // @[ID_EX.scala 95:31]
      memWCtrlReg <= 3'h0; // @[ID_EX.scala 95:31]
    end else if (!(io_flush)) begin // @[ID_EX.scala 109:14]
      if (!(io_hold)) begin // @[ID_EX.scala 117:18]
        memWCtrlReg <= io_memWCtrlIn; // @[ID_EX.scala 151:20]
      end
    end
    if (reset) begin // @[ID_EX.scala 96:31]
      regWEnReg <= 1'h0; // @[ID_EX.scala 96:31]
    end else if (!(io_flush)) begin // @[ID_EX.scala 109:14]
      if (!(io_hold)) begin // @[ID_EX.scala 117:18]
        regWEnReg <= io_regWEnIn; // @[ID_EX.scala 152:20]
      end
    end
    if (reset) begin // @[ID_EX.scala 97:31]
      regWSrcReg <= 2'h0; // @[ID_EX.scala 97:31]
    end else if (!(io_flush)) begin // @[ID_EX.scala 109:14]
      if (!(io_hold)) begin // @[ID_EX.scala 117:18]
        regWSrcReg <= io_regWSrcIn; // @[ID_EX.scala 153:20]
      end
    end
    if (reset) begin // @[ID_EX.scala 98:31]
      rdReg <= 5'h0; // @[ID_EX.scala 98:31]
    end else if (!(io_flush)) begin // @[ID_EX.scala 109:14]
      if (!(io_hold)) begin // @[ID_EX.scala 117:18]
        rdReg <= io_rdIn; // @[ID_EX.scala 154:20]
      end
    end
    if (reset) begin // @[ID_EX.scala 99:31]
      rs1REnReg <= 1'h0; // @[ID_EX.scala 99:31]
    end else if (!(io_flush)) begin // @[ID_EX.scala 109:14]
      if (!(io_hold)) begin // @[ID_EX.scala 117:18]
        rs1REnReg <= io_rs1REnIn; // @[ID_EX.scala 155:20]
      end
    end
    if (reset) begin // @[ID_EX.scala 100:31]
      rs2REnReg <= 1'h0; // @[ID_EX.scala 100:31]
    end else if (!(io_flush)) begin // @[ID_EX.scala 109:14]
      if (!(io_hold)) begin // @[ID_EX.scala 117:18]
        rs2REnReg <= io_rs2REnIn; // @[ID_EX.scala 156:20]
      end
    end
    if (reset) begin // @[ID_EX.scala 101:31]
      rs1Reg <= 5'h0; // @[ID_EX.scala 101:31]
    end else if (!(io_flush)) begin // @[ID_EX.scala 109:14]
      if (!(io_hold)) begin // @[ID_EX.scala 117:18]
        rs1Reg <= io_rs1In; // @[ID_EX.scala 157:20]
      end
    end
    if (reset) begin // @[ID_EX.scala 102:31]
      rs2Reg <= 5'h0; // @[ID_EX.scala 102:31]
    end else if (!(io_flush)) begin // @[ID_EX.scala 109:14]
      if (!(io_hold)) begin // @[ID_EX.scala 117:18]
        rs2Reg <= io_rs2In; // @[ID_EX.scala 158:20]
      end
    end
    if (reset) begin // @[ID_EX.scala 104:32]
      rData1Reg <= 64'h0; // @[ID_EX.scala 104:32]
    end else if (!(io_flush)) begin // @[ID_EX.scala 109:14]
      if (!(io_hold)) begin // @[ID_EX.scala 117:18]
        rData1Reg <= io_rData1In; // @[ID_EX.scala 160:21]
      end
    end
    if (reset) begin // @[ID_EX.scala 105:32]
      rData2Reg <= 64'h0; // @[ID_EX.scala 105:32]
    end else if (!(io_flush)) begin // @[ID_EX.scala 109:14]
      if (!(io_hold)) begin // @[ID_EX.scala 117:18]
        rData2Reg <= io_rData2In; // @[ID_EX.scala 161:21]
      end
    end
    if (reset) begin // @[ID_EX.scala 107:32]
      imm64Reg <= 64'h0; // @[ID_EX.scala 107:32]
    end else if (!(io_flush)) begin // @[ID_EX.scala 109:14]
      if (!(io_hold)) begin // @[ID_EX.scala 117:18]
        imm64Reg <= io_imm64In; // @[ID_EX.scala 163:21]
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
  aluOPReg = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  aluSrc1CtrlReg = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  aluSrc2CtrlReg = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  aluWEnReg = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  aluWOPReg = _RAND_4[2:0];
  _RAND_5 = {1{`RANDOM}};
  memREnReg = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  memRCtrlReg = _RAND_6[2:0];
  _RAND_7 = {1{`RANDOM}};
  memWEnReg = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  memWCtrlReg = _RAND_8[2:0];
  _RAND_9 = {1{`RANDOM}};
  regWEnReg = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  regWSrcReg = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  rdReg = _RAND_11[4:0];
  _RAND_12 = {1{`RANDOM}};
  rs1REnReg = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  rs2REnReg = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  rs1Reg = _RAND_14[4:0];
  _RAND_15 = {1{`RANDOM}};
  rs2Reg = _RAND_15[4:0];
  _RAND_16 = {2{`RANDOM}};
  rData1Reg = _RAND_16[63:0];
  _RAND_17 = {2{`RANDOM}};
  rData2Reg = _RAND_17[63:0];
  _RAND_18 = {2{`RANDOM}};
  imm64Reg = _RAND_18[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
