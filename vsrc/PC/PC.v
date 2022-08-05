module PC(
  input         clock,
  input         reset,
  input         io_flush,
  input         io_hold,
  input  [31:0] io_PCIn,
  output [31:0] io_PCOut
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] PCReg; // @[PC.scala 20:22]
  assign io_PCOut = PCReg; // @[PC.scala 26:12]
  always @(posedge clock) begin
    if (reset) begin // @[PC.scala 20:22]
      PCReg <= 32'h80000000; // @[PC.scala 20:22]
    end else if (io_flush) begin // @[PC.scala 22:18]
      PCReg <= 32'h80000000; // @[PC.scala 22:26]
    end else if (!(io_hold)) begin // @[PC.scala 23:19]
      PCReg <= io_PCIn; // @[PC.scala 24:26]
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
  PCReg = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
