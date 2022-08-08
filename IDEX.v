module IDEX(
  input         clock,
  input         reset,
  input         io_Flush,
  input         io_Hold,
  input  [3:0]  io_ID_ID_A_ALUOP,
  input  [2:0]  io_ID_ID_A_ALUSrc1Ctrl,
  input  [2:0]  io_ID_ID_A_ALUSrc2Ctrl,
  input         io_ID_ID_A_WordALUEn,
  input  [2:0]  io_ID_ID_A_WordALUOP,
  input         io_ID_ID_B_MEMREn,
  input  [2:0]  io_ID_ID_B_MEMRCtrl,
  input         io_ID_ID_B_MEMWEn,
  input  [2:0]  io_ID_ID_B_MEMWCtrl,
  input         io_ID_ID_C_RegWEn,
  input  [1:0]  io_ID_ID_C_RegWSrc,
  input  [4:0]  io_ID_ID_C_Rd,
  input  [31:0] io_ID_ID_D_PC,
  input  [63:0] io_ID_ID_D_Imm,
  input  [63:0] io_ID_ID_D_RData1,
  input  [63:0] io_ID_ID_D_RData2,
  output [3:0]  io_EX_EX_A_ALUOP,
  output [2:0]  io_EX_EX_A_ALUSrc1Ctrl,
  output [2:0]  io_EX_EX_A_ALUSrc2Ctrl,
  output        io_EX_EX_A_WordALUEn,
  output [2:0]  io_EX_EX_A_WordALUOP,
  output        io_EX_EX_B_MEMREn,
  output [2:0]  io_EX_EX_B_MEMRCtrl,
  output        io_EX_EX_B_MEMWEn,
  output [2:0]  io_EX_EX_B_MEMWCtrl,
  output        io_EX_EX_C_RegWEn,
  output [1:0]  io_EX_EX_C_RegWSrc,
  output [4:0]  io_EX_EX_C_Rd,
  output [31:0] io_EX_EX_D_PC,
  output [63:0] io_EX_EX_D_Imm,
  output [63:0] io_EX_EX_D_RData1,
  output [63:0] io_EX_EX_D_RData2
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
  reg [63:0] _RAND_13;
  reg [63:0] _RAND_14;
  reg [63:0] _RAND_15;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] ALUOPReg; // @[ID_EX.scala 34:31]
  reg [2:0] ALUSrc1CtrlReg; // @[ID_EX.scala 35:31]
  reg [2:0] ALUSrc2CtrlReg; // @[ID_EX.scala 36:31]
  reg  WordALUEnReg; // @[ID_EX.scala 37:31]
  reg [2:0] WordALUOPReg; // @[ID_EX.scala 38:31]
  reg  MEMREnReg; // @[ID_EX.scala 40:28]
  reg [2:0] MEMRCtrlReg; // @[ID_EX.scala 41:28]
  reg  MEMWEnReg; // @[ID_EX.scala 42:28]
  reg [2:0] MEMWCtrlReg; // @[ID_EX.scala 43:28]
  reg  RegWEnReg; // @[ID_EX.scala 45:27]
  reg [1:0] RegWSrcReg; // @[ID_EX.scala 46:27]
  reg [1:0] RdReg; // @[ID_EX.scala 47:27]
  reg [31:0] PCReg; // @[ID_EX.scala 49:26]
  reg [63:0] ImmReg; // @[ID_EX.scala 50:26]
  reg [63:0] RData1Reg; // @[ID_EX.scala 51:26]
  reg [63:0] RData2Reg; // @[ID_EX.scala 52:26]
  wire [4:0] _GEN_11 = ~io_Hold ? io_ID_ID_C_Rd : {{3'd0}, RdReg}; // @[ID_EX.scala 60:22 74:16 47:27]
  wire [4:0] _GEN_27 = io_Flush ? {{3'd0}, RdReg} : _GEN_11; // @[ID_EX.scala 55:17 47:27]
  wire [4:0] _GEN_32 = reset ? 5'h0 : _GEN_27; // @[ID_EX.scala 47:{27,27}]
  assign io_EX_EX_A_ALUOP = ALUOPReg; // @[ID_EX.scala 84:26]
  assign io_EX_EX_A_ALUSrc1Ctrl = ALUSrc1CtrlReg; // @[ID_EX.scala 85:26]
  assign io_EX_EX_A_ALUSrc2Ctrl = ALUSrc2CtrlReg; // @[ID_EX.scala 86:26]
  assign io_EX_EX_A_WordALUEn = WordALUEnReg; // @[ID_EX.scala 87:26]
  assign io_EX_EX_A_WordALUOP = WordALUOPReg; // @[ID_EX.scala 88:26]
  assign io_EX_EX_B_MEMREn = MEMREnReg; // @[ID_EX.scala 90:23]
  assign io_EX_EX_B_MEMRCtrl = MEMRCtrlReg; // @[ID_EX.scala 91:23]
  assign io_EX_EX_B_MEMWEn = MEMWEnReg; // @[ID_EX.scala 92:23]
  assign io_EX_EX_B_MEMWCtrl = MEMWCtrlReg; // @[ID_EX.scala 93:23]
  assign io_EX_EX_C_RegWEn = RegWEnReg; // @[ID_EX.scala 95:22]
  assign io_EX_EX_C_RegWSrc = RegWSrcReg; // @[ID_EX.scala 96:22]
  assign io_EX_EX_C_Rd = {{3'd0}, RdReg}; // @[ID_EX.scala 97:22]
  assign io_EX_EX_D_PC = PCReg; // @[ID_EX.scala 99:22]
  assign io_EX_EX_D_Imm = ImmReg; // @[ID_EX.scala 100:22]
  assign io_EX_EX_D_RData1 = RData1Reg; // @[ID_EX.scala 101:22]
  assign io_EX_EX_D_RData2 = RData2Reg; // @[ID_EX.scala 102:22]
  always @(posedge clock) begin
    if (reset) begin // @[ID_EX.scala 34:31]
      ALUOPReg <= 4'h0; // @[ID_EX.scala 34:31]
    end else if (!(io_Flush)) begin // @[ID_EX.scala 55:17]
      if (~io_Hold) begin // @[ID_EX.scala 60:22]
        ALUOPReg <= io_ID_ID_A_ALUOP; // @[ID_EX.scala 61:20]
      end
    end
    if (reset) begin // @[ID_EX.scala 35:31]
      ALUSrc1CtrlReg <= 3'h0; // @[ID_EX.scala 35:31]
    end else if (!(io_Flush)) begin // @[ID_EX.scala 55:17]
      if (~io_Hold) begin // @[ID_EX.scala 60:22]
        ALUSrc1CtrlReg <= io_ID_ID_A_ALUSrc1Ctrl; // @[ID_EX.scala 62:20]
      end
    end
    if (reset) begin // @[ID_EX.scala 36:31]
      ALUSrc2CtrlReg <= 3'h0; // @[ID_EX.scala 36:31]
    end else if (!(io_Flush)) begin // @[ID_EX.scala 55:17]
      if (~io_Hold) begin // @[ID_EX.scala 60:22]
        ALUSrc2CtrlReg <= io_ID_ID_A_ALUSrc2Ctrl; // @[ID_EX.scala 63:20]
      end
    end
    if (reset) begin // @[ID_EX.scala 37:31]
      WordALUEnReg <= 1'h0; // @[ID_EX.scala 37:31]
    end else if (!(io_Flush)) begin // @[ID_EX.scala 55:17]
      if (~io_Hold) begin // @[ID_EX.scala 60:22]
        WordALUEnReg <= io_ID_ID_A_WordALUEn; // @[ID_EX.scala 64:20]
      end
    end
    if (reset) begin // @[ID_EX.scala 38:31]
      WordALUOPReg <= 3'h0; // @[ID_EX.scala 38:31]
    end else if (!(io_Flush)) begin // @[ID_EX.scala 55:17]
      if (~io_Hold) begin // @[ID_EX.scala 60:22]
        WordALUOPReg <= io_ID_ID_A_WordALUOP; // @[ID_EX.scala 65:20]
      end
    end
    if (reset) begin // @[ID_EX.scala 40:28]
      MEMREnReg <= 1'h0; // @[ID_EX.scala 40:28]
    end else if (io_Flush) begin // @[ID_EX.scala 55:17]
      MEMREnReg <= 1'h0; // @[ID_EX.scala 56:15]
    end else if (~io_Hold) begin // @[ID_EX.scala 60:22]
      MEMREnReg <= io_ID_ID_B_MEMREn; // @[ID_EX.scala 67:17]
    end
    if (reset) begin // @[ID_EX.scala 41:28]
      MEMRCtrlReg <= 3'h0; // @[ID_EX.scala 41:28]
    end else if (!(io_Flush)) begin // @[ID_EX.scala 55:17]
      if (~io_Hold) begin // @[ID_EX.scala 60:22]
        MEMRCtrlReg <= io_ID_ID_B_MEMRCtrl; // @[ID_EX.scala 68:17]
      end
    end
    if (reset) begin // @[ID_EX.scala 42:28]
      MEMWEnReg <= 1'h0; // @[ID_EX.scala 42:28]
    end else if (io_Flush) begin // @[ID_EX.scala 55:17]
      MEMWEnReg <= 1'h0; // @[ID_EX.scala 57:15]
    end else if (~io_Hold) begin // @[ID_EX.scala 60:22]
      MEMWEnReg <= io_ID_ID_B_MEMWEn; // @[ID_EX.scala 69:17]
    end
    if (reset) begin // @[ID_EX.scala 43:28]
      MEMWCtrlReg <= 3'h0; // @[ID_EX.scala 43:28]
    end else if (!(io_Flush)) begin // @[ID_EX.scala 55:17]
      if (~io_Hold) begin // @[ID_EX.scala 60:22]
        MEMWCtrlReg <= io_ID_ID_B_MEMWCtrl; // @[ID_EX.scala 70:17]
      end
    end
    if (reset) begin // @[ID_EX.scala 45:27]
      RegWEnReg <= 1'h0; // @[ID_EX.scala 45:27]
    end else if (io_Flush) begin // @[ID_EX.scala 55:17]
      RegWEnReg <= 1'h0; // @[ID_EX.scala 58:15]
    end else if (~io_Hold) begin // @[ID_EX.scala 60:22]
      RegWEnReg <= io_ID_ID_C_RegWEn; // @[ID_EX.scala 72:16]
    end
    if (reset) begin // @[ID_EX.scala 46:27]
      RegWSrcReg <= 2'h0; // @[ID_EX.scala 46:27]
    end else if (!(io_Flush)) begin // @[ID_EX.scala 55:17]
      if (~io_Hold) begin // @[ID_EX.scala 60:22]
        RegWSrcReg <= io_ID_ID_C_RegWSrc; // @[ID_EX.scala 73:16]
      end
    end
    RdReg <= _GEN_32[1:0]; // @[ID_EX.scala 47:{27,27}]
    if (reset) begin // @[ID_EX.scala 49:26]
      PCReg <= 32'h0; // @[ID_EX.scala 49:26]
    end else if (!(io_Flush)) begin // @[ID_EX.scala 55:17]
      if (~io_Hold) begin // @[ID_EX.scala 60:22]
        PCReg <= io_ID_ID_D_PC; // @[ID_EX.scala 76:15]
      end
    end
    if (reset) begin // @[ID_EX.scala 50:26]
      ImmReg <= 64'h0; // @[ID_EX.scala 50:26]
    end else if (!(io_Flush)) begin // @[ID_EX.scala 55:17]
      if (~io_Hold) begin // @[ID_EX.scala 60:22]
        ImmReg <= io_ID_ID_D_Imm; // @[ID_EX.scala 77:15]
      end
    end
    if (reset) begin // @[ID_EX.scala 51:26]
      RData1Reg <= 64'h0; // @[ID_EX.scala 51:26]
    end else if (!(io_Flush)) begin // @[ID_EX.scala 55:17]
      if (~io_Hold) begin // @[ID_EX.scala 60:22]
        RData1Reg <= io_ID_ID_D_RData1; // @[ID_EX.scala 78:15]
      end
    end
    if (reset) begin // @[ID_EX.scala 52:26]
      RData2Reg <= 64'h0; // @[ID_EX.scala 52:26]
    end else if (!(io_Flush)) begin // @[ID_EX.scala 55:17]
      if (~io_Hold) begin // @[ID_EX.scala 60:22]
        RData2Reg <= io_ID_ID_D_RData2; // @[ID_EX.scala 79:15]
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
  ALUOPReg = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  ALUSrc1CtrlReg = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  ALUSrc2CtrlReg = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  WordALUEnReg = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  WordALUOPReg = _RAND_4[2:0];
  _RAND_5 = {1{`RANDOM}};
  MEMREnReg = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  MEMRCtrlReg = _RAND_6[2:0];
  _RAND_7 = {1{`RANDOM}};
  MEMWEnReg = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  MEMWCtrlReg = _RAND_8[2:0];
  _RAND_9 = {1{`RANDOM}};
  RegWEnReg = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  RegWSrcReg = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  RdReg = _RAND_11[1:0];
  _RAND_12 = {1{`RANDOM}};
  PCReg = _RAND_12[31:0];
  _RAND_13 = {2{`RANDOM}};
  ImmReg = _RAND_13[63:0];
  _RAND_14 = {2{`RANDOM}};
  RData1Reg = _RAND_14[63:0];
  _RAND_15 = {2{`RANDOM}};
  RData2Reg = _RAND_15[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
