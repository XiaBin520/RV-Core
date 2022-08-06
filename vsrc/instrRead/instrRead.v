module instrRead(
  input         clock,
  input         reset,
  input  [31:0] io_instrAddrCore,
  output [31:0] io_instrCore,
  output        io_instrReadEnMEM,
  output [31:0] io_instrAddrMem,
  output [1:0]  io_readInstrByteMEM,
  input         io_instrValidMem,
  input  [31:0] io_instrMEM,
  input         io_instrReadEnCtrl,
  output        io_instrReadFinishCtrl
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] stateReg; // @[instrReadFSM.scala 33:25]
  wire [1:0] _GEN_1 = io_instrValidMem ? 2'h3 : stateReg; // @[instrReadFSM.scala 46:26 47:18 33:25]
  wire [1:0] _GEN_2 = 2'h3 == stateReg ? 2'h0 : stateReg; // @[instrReadFSM.scala 36:19 51:16 33:25]
  assign io_instrCore = 32'h13; // @[instrReadFSM.scala 60:16]
  assign io_instrReadEnMEM = stateReg == 2'h1; // @[instrReadFSM.scala 56:39]
  assign io_instrAddrMem = io_instrAddrCore; // @[instrReadFSM.scala 61:19]
  assign io_readInstrByteMEM = 2'h2; // @[instrReadFSM.scala 63:23]
  assign io_instrReadFinishCtrl = stateReg == 2'h3; // @[instrReadFSM.scala 57:39]
  always @(posedge clock) begin
    if (reset) begin // @[instrReadFSM.scala 33:25]
      stateReg <= 2'h0; // @[instrReadFSM.scala 33:25]
    end else if (2'h0 == stateReg) begin // @[instrReadFSM.scala 36:19]
      if (io_instrReadEnCtrl) begin // @[instrReadFSM.scala 38:28]
        stateReg <= 2'h1; // @[instrReadFSM.scala 39:18]
      end
    end else if (2'h1 == stateReg) begin // @[instrReadFSM.scala 36:19]
      stateReg <= 2'h2; // @[instrReadFSM.scala 43:16]
    end else if (2'h2 == stateReg) begin // @[instrReadFSM.scala 36:19]
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
