package miniCore


import chisel3._
import chisel3.util._


class MEM_WBIO extends Bundle{
  val hold   = Input(Bool())

  val regWEnIn     = Input(Bool())
  val regWSrcIn    = Input(UInt(2.W))
  val rdIn         = Input(UInt(5.W))
  val regWEnOut    = Output(Bool())
  val regWSrcOut   = Output(UInt(2.W))
  val rdOut        = Output(UInt(5.W))

  val aluDataIn    = Input(UInt(64.W))
  val aluDataOut   = Output(UInt(64.W))
  val memDataIn    = Input(UInt(64.W))
  val memDataOut   = Output(UInt(64.W))
}



class MEM_WB extends Module{
  val io = IO(new MEM_WBIO())

  val hold       = io.hold
  val regWEnIn   = io.regWEnIn
  val regWSrcIn  = io.regWSrcIn
  val rdIn       = io.rdIn
  val aluDataIn  = io.aluDataIn
  val memDataIn  = io.memDataIn


  val regWEnReg     = RegInit(false.B)
  val regWSrcReg    = RegInit(0.U(2.W))
  val rdReg         = RegInit(0.U(5.W))
  val aluDataReg    = RegInit(0.U(64.W))
  val memDataReg    = RegInit(0.U(64.W))

  when(!hold){
    regWEnReg     := regWEnIn
    regWSrcReg    := regWSrcIn
    rdReg         := rdIn
    aluDataReg    := aluDataIn
    memDataReg    := memDataIn
  }
  
  io.regWEnOut    := regWEnReg
  io.regWSrcOut   := regWSrcReg
  io.rdOut        := rdReg
  io.aluDataOut   := aluDataReg
  io.memDataOut   := memDataReg

}




object MEM_WB extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(new MEM_WB())
}
