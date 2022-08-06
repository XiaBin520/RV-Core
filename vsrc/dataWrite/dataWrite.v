module dataWrite(
  input         clock,
  input         reset,
  input  [31:0] io_dataAddrCore,
  input  [2:0]  io_dataByteCore,
  input  [63:0] io_dataCore,
  output        io_dataWriteEnMem,
  output [31:0] io_dataAddrMem,
  output [1:0]  io_writeDataByteMem,
  output [63:0] io_dataMem,
  input         io_dataWriteFinishMem,
  input         io_dataWriteEnCtrl,
  output        io_dataWriteFinishCtrl
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] stateReg; // @[dataWriteFSM.scala 34:25]
  wire [1:0] _GEN_1 = io_dataWriteFinishMem ? 2'h3 : stateReg; // @[dataWriteFSM.scala 46:31 47:18 34:25]
  wire [1:0] _GEN_2 = 2'h3 == stateReg ? 2'h0 : stateReg; // @[dataWriteFSM.scala 36:19 51:16 34:25]
  wire [2:0] _GEN_6 = io_dataByteCore == 3'h3 ? 3'h3 : 3'h4; // @[dataWriteFSM.scala 67:39 68:25 71:25]
  wire [2:0] _GEN_7 = io_dataByteCore == 3'h2 ? 3'h1 : _GEN_6; // @[dataWriteFSM.scala 64:38 65:25]
  wire [2:0] _GEN_8 = io_dataByteCore == 3'h1 ? 3'h0 : _GEN_7; // @[dataWriteFSM.scala 61:33 62:25]
  assign io_dataWriteEnMem = stateReg == 2'h1; // @[dataWriteFSM.scala 55:39]
  assign io_dataAddrMem = io_dataAddrCore; // @[dataWriteFSM.scala 57:26]
  assign io_writeDataByteMem = _GEN_8[1:0];
  assign io_dataMem = io_dataCore; // @[dataWriteFSM.scala 58:26]
  assign io_dataWriteFinishCtrl = stateReg == 2'h3; // @[dataWriteFSM.scala 56:39]
  always @(posedge clock) begin
    if (reset) begin // @[dataWriteFSM.scala 34:25]
      stateReg <= 2'h0; // @[dataWriteFSM.scala 34:25]
    end else if (2'h0 == stateReg) begin // @[dataWriteFSM.scala 36:19]
      if (io_dataWriteEnCtrl) begin // @[dataWriteFSM.scala 38:28]
        stateReg <= 2'h1; // @[dataWriteFSM.scala 39:18]
      end
    end else if (2'h1 == stateReg) begin // @[dataWriteFSM.scala 36:19]
      stateReg <= 2'h2; // @[dataWriteFSM.scala 43:16]
    end else if (2'h2 == stateReg) begin // @[dataWriteFSM.scala 36:19]
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
