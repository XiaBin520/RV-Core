package miniCore

import chisel3._
import chisel3.util._


class ifStageIO extends Bundle{
  val inPC     = Input(UInt(32.W))
  val inInstr  = Input(UInt(32.W)) // from I-Mem
  val outPC    = Output(UInt(32.W))
  val outInstr = Output(UInt(32.W))
}



class ifStage extends Module {
  val io = IO(new ifStageIO())

  io.outPC    := io.inPC
  io.outInstr := io.inInstr
}


object ifStage extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(new ifStage())
}