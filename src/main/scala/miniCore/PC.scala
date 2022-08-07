package miniCore

import chisel3._
import chisel3.util._


class PC_IO extends Bundle{
  val Hold  = Input(Bool())
  val PCIn  = Input(UInt(32.W))
  val PCOut = Output(UInt(32.W))
}

class PC extends Module{
  val io = IO(new PC_IO())

  val Hold  = io.Hold
  val PCIn  = io.PCIn
  val PCReg = RegInit("h8000_0000".U(32.W))

  when(!Hold) {PCReg := PCIn}
  io.PCOut := PCReg
}



object PC extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(new PC())
}





