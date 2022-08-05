package miniCore

import chisel3._
import chisel3.util._


class EX_MEMIO extends Bundle{
  val hold   = Input(Bool())

  val memREnIn      = Input(Bool())
  val memRCtrlIn    = Input(UInt(3.W))
  val memWEnIn      = Input(Bool())
  val memWCtrlIn    = Input(UInt(3.W))
  val regWEnIn      = Input(Bool())
  val regWSrcIn     = Input(UInt(2.W))
  val rdIn          = Input(UInt(5.W))
  val rs2REnIn      = Input(Bool())
  val rs2In         = Input(UInt(5.W))
  val memREnOut      = Output(Bool())
  val memRCtrlOut    = Output(UInt(3.W))
  val memWEnOut      = Output(Bool())
  val memWCtrlOut    = Output(UInt(3.W))
  val regWEnOut      = Output(Bool())
  val regWSrcOut     = Output(UInt(2.W))
  val rdOut          = Output(UInt(5.W))
  val rs2REnOut      = Output(Bool())
  val rs2Out         = Output(UInt(5.W))

  val rData2In       = Input(UInt(64.W))
  val rData2Out      = Output(UInt(64.W))

  val aluDataIn      = Input(UInt(64.W))
  val aluDataOut     = Output(UInt(64.W))
}





class EX_MEM extends Module {
  val io = IO(new EX_MEMIO())

  val hold          = io.hold

  val memREnIn      = io.memREnIn
  val memRCtrlIn    = io.memRCtrlIn
  val memWEnIn      = io.memWEnIn
  val memWCtrlIn    = io.memWCtrlIn
  val regWEnIn      = io.regWEnIn
  val regWSrcIn     = io.regWSrcIn
  val rdIn          = io.rdIn
  val rs2REnIn      = io.rs2REnIn
  val rs2In         = io.rs2In

  val rData2In      = io.rData2In
  val aluDataIn     = io.aluDataIn



  val memREnReg     = RegInit(false.B)
  val memRCtrlReg   = RegInit(0.U(3.W))
  val memWEnReg     = RegInit(false.B)
  val memWCtrlReg   = RegInit(0.U(3.W))
  val regWEnReg     = RegInit(false.B)
  val regWSrcReg    = RegInit(0.U(2.W))
  val rdReg         = RegInit(0.U(5.W))
  val rs2REnReg     = RegInit(false.B)
  val rs2Reg        = RegInit(0.U(5.W))

  val rData2Reg     = RegInit(0.U(64.W))
  val aluDataReg    = RegInit(0.U(64.W))

  when(!hold){
    memREnReg     := memREnIn
    memRCtrlReg   := memRCtrlIn
    memWEnReg     := memWEnIn
    memWCtrlReg   := memWCtrlIn
    regWEnReg     := regWEnIn
    regWSrcReg    := regWSrcIn
    rdReg         := rdIn
    rs2REnReg     := rs2REnIn
    rs2Reg        := rs2In

    rData2Reg     := rData2In
    aluDataReg    := aluDataIn
  }

  io.memREnOut    := memREnReg
  io.memRCtrlOut  := memRCtrlReg
  io.memWEnOut    := memWEnReg
  io.memWCtrlOut  := memWCtrlReg
  io.regWEnOut    := regWEnReg
  io.regWSrcOut   := regWSrcReg
  io.rdOut        := rdReg
  io.rs2REnOut    := rs2REnReg
  io.rs2Out       := rs2Reg

  io.rData2Out    := rData2Reg
  io.aluDataOut   := aluDataReg
}



object EX_MEM extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(new EX_MEM())
}


