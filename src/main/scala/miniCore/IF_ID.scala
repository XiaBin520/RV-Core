package miniCore

import chisel3._
import chisel3.util._


class IF_IDIO extends Bundle{
  val flush    = Input(Bool())
  val hold     = Input(Bool())
  val instrIn  = Input(UInt(32.W))
  val pcIn     = Input(UInt(32.W))
  val instrOut = Output(UInt(32.W))
  val pcOut    = Output(UInt(32.W))
}


class IF_ID extends Module{
  val io = IO(new IF_IDIO())

  val flush   = io.flush
  val hold    = io.hold
  val instrIn = io.instrIn
  val pcIn    = io.pcIn

  val instrReg = RegInit("h0000_0013".U(32.W))
  val    pcReg = RegInit("h8000_0000".U(32.W))

  when(flush){
    instrReg := "h0000_0013".U
    pcReg    := "h8000_0000".U
  }
  .elsewhen(!hold){
    instrReg := instrIn
    pcReg    := pcIn
  }

  io.instrOut := instrReg
  io.pcOut    := pcReg
}


object IF_ID extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(new IF_ID())
}