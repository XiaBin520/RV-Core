module dataRead(
  input         clock,
  input         reset,
  input  [31:0] io_dataAddrCore,
  input  [2:0]  io_dataByteCore,
  output [63:0] io_dataCore,
  output        io_dataReadEnMem,
  output [31:0] io_dataAddrMem,
  output [1:0]  io_readDataByteMem,
  input         io_dataValidMem,
  input  [63:0] io_dataMem,
  input         io_dataReadEnCtrl,
  output        io_dataReadFinishCtrl
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] stateReg; // @[dataReadFSM.scala 35:25]
  reg [63:0] dataReg; // @[dataReadFSM.scala 36:25]
  wire [1:0] _GEN_1 = io_dataValidMem ? 2'h3 : stateReg; // @[dataReadFSM.scala 48:25 49:18 35:25]
  wire [63:0] _GEN_2 = io_dataValidMem ? io_dataMem : dataReg; // @[dataReadFSM.scala 48:25 50:18 36:25]
  wire [1:0] _GEN_3 = 2'h3 == stateReg ? 2'h0 : stateReg; // @[dataReadFSM.scala 38:19 54:16 35:25]
  wire [1:0] _GEN_10 = io_dataByteCore == 3'h3 | io_dataByteCore == 3'h6 ? 2'h2 : 2'h3; // @[dataReadFSM.scala 72:70 73:24 76:24]
  wire [1:0] _GEN_11 = io_dataByteCore == 3'h2 | io_dataByteCore == 3'h5 ? 2'h1 : _GEN_10; // @[dataReadFSM.scala 69:68 70:24]
  assign io_dataCore = dataReg; // @[dataReadFSM.scala 62:15]
  assign io_dataReadEnMem = stateReg == 2'h1; // @[dataReadFSM.scala 59:38]
  assign io_dataAddrMem = io_dataAddrCore; // @[dataReadFSM.scala 63:18]
  assign io_readDataByteMem = io_dataByteCore == 3'h1 | io_dataByteCore == 3'h4 ? 2'h0 : _GEN_11; // @[dataReadFSM.scala 66:63 67:24]
  assign io_dataReadFinishCtrl = stateReg == 2'h3; // @[dataReadFSM.scala 60:38]
  always @(posedge clock) begin
    if (reset) begin // @[dataReadFSM.scala 35:25]
      stateReg <= 2'h0; // @[dataReadFSM.scala 35:25]
    end else if (2'h0 == stateReg) begin // @[dataReadFSM.scala 38:19]
      if (io_dataReadEnCtrl) begin // @[dataReadFSM.scala 40:27]
        stateReg <= 2'h1; // @[dataReadFSM.scala 41:18]
      end
    end else if (2'h1 == stateReg) begin // @[dataReadFSM.scala 38:19]
      stateReg <= 2'h2; // @[dataReadFSM.scala 45:16]
    end else if (2'h2 == stateReg) begin // @[dataReadFSM.scala 38:19]
      stateReg <= _GEN_1;
    end else begin
      stateReg <= _GEN_3;
    end
    if (reset) begin // @[dataReadFSM.scala 36:25]
      dataReg <= 64'h0; // @[dataReadFSM.scala 36:25]
    end else if (!(2'h0 == stateReg)) begin // @[dataReadFSM.scala 38:19]
      if (!(2'h1 == stateReg)) begin // @[dataReadFSM.scala 38:19]
        if (2'h2 == stateReg) begin // @[dataReadFSM.scala 38:19]
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
