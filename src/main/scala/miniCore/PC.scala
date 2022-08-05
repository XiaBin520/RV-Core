package miniCore

import chisel3._
import chisel3.util._


class PCIO extends Bundle{
  val hold  = Input(Bool())
  val PCIn  = Input(UInt(32.W))
  val PCOut = Output(UInt(32.W))
}

class PC extends Module{
  val io = IO(new PCIO())

  val hold  = io.hold
  val PCIn  = io.PCIn
  val PCReg = RegInit("h8000_0000".U(32.W))

  when(!hold) {PCReg := PCIn}
  io.PCOut := PCReg
}



object PC extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(new PC())
}





