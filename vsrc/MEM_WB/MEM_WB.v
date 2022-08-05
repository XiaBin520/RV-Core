module MEM_WB(
  input         clock,
  input         reset,
  input         io_flush,
  input         io_hold,
  input         io_regWEnIn,
  input  [1:0]  io_regWSrcIn,
  input  [4:0]  io_rdIn,
  output        io_regWEnOut,
  output [1:0]  io_regWSrcOut,
  output [4:0]  io_rdOut,
  input  [63:0] io_aluDataIn,
  output [63:0] io_aluDataOut,
  input  [63:0] io_memDataIn,
  output [63:0] io_memDataOut
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg  regWEnReg; // @[MEM_WB.scala 39:30]
  reg [1:0] regWSrcReg; // @[MEM_WB.scala 40:30]
  reg [4:0] rdReg; // @[MEM_WB.scala 41:30]
  reg [63:0] aluDataReg; // @[MEM_WB.scala 42:30]
  reg [63:0] memDataReg; // @[MEM_WB.scala 43:30]
  assign io_regWEnOut = regWEnReg; // @[MEM_WB.scala 63:19]
  assign io_regWSrcOut = regWSrcReg; // @[MEM_WB.scala 64:19]
  assign io_rdOut = rdReg; // @[MEM_WB.scala 65:19]
  assign io_aluDataOut = aluDataReg; // @[MEM_WB.scala 66:19]
  assign io_memDataOut = memDataReg; // @[MEM_WB.scala 67:19]
  always @(posedge clock) begin
    if (reset) begin // @[MEM_WB.scala 39:30]
      regWEnReg <= 1'h0; // @[MEM_WB.scala 39:30]
    end else if (io_flush) begin // @[MEM_WB.scala 45:14]
      regWEnReg <= 1'h0; // @[MEM_WB.scala 46:15]
    end else if (!(io_hold)) begin // @[MEM_WB.scala 48:18]
      regWEnReg <= io_regWEnIn; // @[MEM_WB.scala 56:19]
    end
    if (reset) begin // @[MEM_WB.scala 40:30]
      regWSrcReg <= 2'h0; // @[MEM_WB.scala 40:30]
    end else if (!(io_flush)) begin // @[MEM_WB.scala 45:14]
      if (!(io_hold)) begin // @[MEM_WB.scala 48:18]
        regWSrcReg <= io_regWSrcIn; // @[MEM_WB.scala 57:19]
      end
    end
    if (reset) begin // @[MEM_WB.scala 41:30]
      rdReg <= 5'h0; // @[MEM_WB.scala 41:30]
    end else if (!(io_flush)) begin // @[MEM_WB.scala 45:14]
      if (!(io_hold)) begin // @[MEM_WB.scala 48:18]
        rdReg <= io_rdIn; // @[MEM_WB.scala 58:19]
      end
    end
    if (reset) begin // @[MEM_WB.scala 42:30]
      aluDataReg <= 64'h0; // @[MEM_WB.scala 42:30]
    end else if (!(io_flush)) begin // @[MEM_WB.scala 45:14]
      if (!(io_hold)) begin // @[MEM_WB.scala 48:18]
        aluDataReg <= io_aluDataIn; // @[MEM_WB.scala 59:19]
      end
    end
    if (reset) begin // @[MEM_WB.scala 43:30]
      memDataReg <= 64'h0; // @[MEM_WB.scala 43:30]
    end else if (!(io_flush)) begin // @[MEM_WB.scala 45:14]
      if (!(io_hold)) begin // @[MEM_WB.scala 48:18]
        memDataReg <= io_memDataIn; // @[MEM_WB.scala 60:19]
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
  regWEnReg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  regWSrcReg = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  rdReg = _RAND_2[4:0];
  _RAND_3 = {2{`RANDOM}};
  aluDataReg = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  memDataReg = _RAND_4[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
