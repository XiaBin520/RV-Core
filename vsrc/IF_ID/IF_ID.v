module IF_ID(
  input         clock,
  input         reset,
  input         io_flush,
  input         io_hold,
  input  [31:0] io_inInstr,
  input  [31:0] io_inPC,
  output [31:0] io_outInstr,
  output [31:0] io_outPC
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] instrReg; // @[IF_ID.scala 26:25]
  reg [31:0] pcReg; // @[IF_ID.scala 27:25]
  assign io_outInstr = instrReg; // @[IF_ID.scala 42:15]
  assign io_outPC = pcReg; // @[IF_ID.scala 43:15]
  always @(posedge clock) begin
    if (reset) begin // @[IF_ID.scala 26:25]
      instrReg <= 32'h13; // @[IF_ID.scala 26:25]
    end else if (io_flush) begin // @[IF_ID.scala 29:14]
      instrReg <= 32'h13; // @[IF_ID.scala 30:14]
    end else if (!(io_hold)) begin // @[IF_ID.scala 33:18]
      instrReg <= io_inInstr; // @[IF_ID.scala 38:14]
    end
    if (reset) begin // @[IF_ID.scala 27:25]
      pcReg <= 32'h80000000; // @[IF_ID.scala 27:25]
    end else if (io_flush) begin // @[IF_ID.scala 29:14]
      pcReg <= 32'h80000000; // @[IF_ID.scala 31:14]
    end else if (!(io_hold)) begin // @[IF_ID.scala 33:18]
      pcReg <= io_inPC; // @[IF_ID.scala 39:14]
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
  instrReg = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  pcReg = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
