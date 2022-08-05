module EX_MEM(
  input         clock,
  input         reset,
  input         io_flush,
  input         io_hold,
  input         io_memREnIn,
  input  [2:0]  io_memRCtrlIn,
  input         io_memWEnIn,
  input  [2:0]  io_memWCtrlIn,
  input         io_regWEnIn,
  input  [1:0]  io_regWSrcIn,
  input  [4:0]  io_rdIn,
  input         io_rs2REnIn,
  input  [4:0]  io_rs2In,
  output        io_memREnOut,
  output [2:0]  io_memRCtrlOut,
  output        io_memWEnOut,
  output [2:0]  io_memWCtrlOut,
  output        io_regWEnOut,
  output [1:0]  io_regWSrcOut,
  output [4:0]  io_rdOut,
  output        io_rs2REnOut,
  output [4:0]  io_rs2Out,
  input  [63:0] io_rData2In,
  output [63:0] io_rData2Out,
  input  [63:0] io_aluDataIn,
  output [63:0] io_aluDataOut
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
  reg [63:0] _RAND_9;
  reg [63:0] _RAND_10;
`endif // RANDOMIZE_REG_INIT
  reg  memREnReg; // @[EX_MEM.scala 60:30]
  reg [2:0] memRCtrlReg; // @[EX_MEM.scala 61:30]
  reg  memWEnReg; // @[EX_MEM.scala 62:30]
  reg [2:0] memWCtrlReg; // @[EX_MEM.scala 63:30]
  reg  regWEnReg; // @[EX_MEM.scala 64:30]
  reg [1:0] regWSrcReg; // @[EX_MEM.scala 65:30]
  reg [4:0] rdReg; // @[EX_MEM.scala 66:30]
  reg  rs2REnReg; // @[EX_MEM.scala 67:30]
  reg [4:0] rs2Reg; // @[EX_MEM.scala 68:30]
  reg [63:0] rData2Reg; // @[EX_MEM.scala 70:31]
  reg [63:0] aluDataReg; // @[EX_MEM.scala 72:31]
  assign io_memREnOut = memREnReg; // @[EX_MEM.scala 111:19]
  assign io_memRCtrlOut = memRCtrlReg; // @[EX_MEM.scala 112:19]
  assign io_memWEnOut = memWEnReg; // @[EX_MEM.scala 113:19]
  assign io_memWCtrlOut = memWCtrlReg; // @[EX_MEM.scala 114:19]
  assign io_regWEnOut = regWEnReg; // @[EX_MEM.scala 115:19]
  assign io_regWSrcOut = regWSrcReg; // @[EX_MEM.scala 116:19]
  assign io_rdOut = rdReg; // @[EX_MEM.scala 117:19]
  assign io_rs2REnOut = rs2REnReg; // @[EX_MEM.scala 118:19]
  assign io_rs2Out = rs2Reg; // @[EX_MEM.scala 119:19]
  assign io_rData2Out = rData2Reg; // @[EX_MEM.scala 121:19]
  assign io_aluDataOut = aluDataReg; // @[EX_MEM.scala 122:19]
  always @(posedge clock) begin
    if (reset) begin // @[EX_MEM.scala 60:30]
      memREnReg <= 1'h0; // @[EX_MEM.scala 60:30]
    end else if (io_flush) begin // @[EX_MEM.scala 76:14]
      memREnReg <= 1'h0; // @[EX_MEM.scala 77:16]
    end else if (!(io_hold)) begin // @[EX_MEM.scala 82:18]
      memREnReg <= io_memREnIn; // @[EX_MEM.scala 97:19]
    end
    if (reset) begin // @[EX_MEM.scala 61:30]
      memRCtrlReg <= 3'h0; // @[EX_MEM.scala 61:30]
    end else if (!(io_flush)) begin // @[EX_MEM.scala 76:14]
      if (!(io_hold)) begin // @[EX_MEM.scala 82:18]
        memRCtrlReg <= io_memRCtrlIn; // @[EX_MEM.scala 98:19]
      end
    end
    if (reset) begin // @[EX_MEM.scala 62:30]
      memWEnReg <= 1'h0; // @[EX_MEM.scala 62:30]
    end else if (io_flush) begin // @[EX_MEM.scala 76:14]
      memWEnReg <= 1'h0; // @[EX_MEM.scala 78:16]
    end else if (!(io_hold)) begin // @[EX_MEM.scala 82:18]
      memWEnReg <= io_memWEnIn; // @[EX_MEM.scala 99:19]
    end
    if (reset) begin // @[EX_MEM.scala 63:30]
      memWCtrlReg <= 3'h0; // @[EX_MEM.scala 63:30]
    end else if (!(io_flush)) begin // @[EX_MEM.scala 76:14]
      if (!(io_hold)) begin // @[EX_MEM.scala 82:18]
        memWCtrlReg <= io_memWCtrlIn; // @[EX_MEM.scala 100:19]
      end
    end
    if (reset) begin // @[EX_MEM.scala 64:30]
      regWEnReg <= 1'h0; // @[EX_MEM.scala 64:30]
    end else if (io_flush) begin // @[EX_MEM.scala 76:14]
      regWEnReg <= 1'h0; // @[EX_MEM.scala 79:16]
    end else if (!(io_hold)) begin // @[EX_MEM.scala 82:18]
      regWEnReg <= io_regWEnIn; // @[EX_MEM.scala 101:19]
    end
    if (reset) begin // @[EX_MEM.scala 65:30]
      regWSrcReg <= 2'h0; // @[EX_MEM.scala 65:30]
    end else if (!(io_flush)) begin // @[EX_MEM.scala 76:14]
      if (!(io_hold)) begin // @[EX_MEM.scala 82:18]
        regWSrcReg <= io_regWSrcIn; // @[EX_MEM.scala 102:19]
      end
    end
    if (reset) begin // @[EX_MEM.scala 66:30]
      rdReg <= 5'h0; // @[EX_MEM.scala 66:30]
    end else if (!(io_flush)) begin // @[EX_MEM.scala 76:14]
      if (!(io_hold)) begin // @[EX_MEM.scala 82:18]
        rdReg <= io_rdIn; // @[EX_MEM.scala 103:19]
      end
    end
    if (reset) begin // @[EX_MEM.scala 67:30]
      rs2REnReg <= 1'h0; // @[EX_MEM.scala 67:30]
    end else if (io_flush) begin // @[EX_MEM.scala 76:14]
      rs2REnReg <= 1'h0; // @[EX_MEM.scala 80:16]
    end else if (!(io_hold)) begin // @[EX_MEM.scala 82:18]
      rs2REnReg <= io_rs2REnIn; // @[EX_MEM.scala 104:19]
    end
    if (reset) begin // @[EX_MEM.scala 68:30]
      rs2Reg <= 5'h0; // @[EX_MEM.scala 68:30]
    end else if (!(io_flush)) begin // @[EX_MEM.scala 76:14]
      if (!(io_hold)) begin // @[EX_MEM.scala 82:18]
        rs2Reg <= io_rs2In; // @[EX_MEM.scala 105:19]
      end
    end
    if (reset) begin // @[EX_MEM.scala 70:31]
      rData2Reg <= 64'h0; // @[EX_MEM.scala 70:31]
    end else if (!(io_flush)) begin // @[EX_MEM.scala 76:14]
      if (!(io_hold)) begin // @[EX_MEM.scala 82:18]
        rData2Reg <= io_rData2In; // @[EX_MEM.scala 107:19]
      end
    end
    if (reset) begin // @[EX_MEM.scala 72:31]
      aluDataReg <= 64'h0; // @[EX_MEM.scala 72:31]
    end else if (!(io_flush)) begin // @[EX_MEM.scala 76:14]
      if (!(io_hold)) begin // @[EX_MEM.scala 82:18]
        aluDataReg <= io_aluDataIn; // @[EX_MEM.scala 108:19]
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
  memREnReg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  memRCtrlReg = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  memWEnReg = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  memWCtrlReg = _RAND_3[2:0];
  _RAND_4 = {1{`RANDOM}};
  regWEnReg = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  regWSrcReg = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  rdReg = _RAND_6[4:0];
  _RAND_7 = {1{`RANDOM}};
  rs2REnReg = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  rs2Reg = _RAND_8[4:0];
  _RAND_9 = {2{`RANDOM}};
  rData2Reg = _RAND_9[63:0];
  _RAND_10 = {2{`RANDOM}};
  aluDataReg = _RAND_10[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
