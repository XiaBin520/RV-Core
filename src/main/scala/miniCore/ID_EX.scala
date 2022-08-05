package miniCore

import chisel3._
import chisel3.util._


class ID_EXIO extends Bundle{
  val flush  = Input(Bool())
  val hold   = Input(Bool())
  // Decoder
  val aluOPIn       = Input(UInt(4.W))
  val aluSrc1CtrlIn = Input(UInt(3.W))
  val aluSrc2CtrlIn = Input(UInt(3.W))
  val aluWEnIn      = Input(Bool())
  val aluWOPIn      = Input(UInt(3.W))
  val memREnIn      = Input(Bool())
  val memRCtrlIn    = Input(UInt(3.W))
  val memWEnIn      = Input(Bool())
  val memWCtrlIn    = Input(UInt(3.W))
  val regWEnIn      = Input(Bool())
  val regWSrcIn     = Input(UInt(2.W))
  val rdIn          = Input(UInt(5.W))
  val rs1REnIn      = Input(Bool())
  val rs2REnIn      = Input(Bool())
  val rs1In         = Input(UInt(5.W))
  val rs2In         = Input(UInt(5.W))

  val aluOPOut       = Output(UInt(4.W))
  val aluSrc1CtrlOut = Output(UInt(3.W))
  val aluSrc2CtrlOut = Output(UInt(3.W))
  val aluWEnOut      = Output(Bool())
  val aluWOPOut      = Output(UInt(3.W))
  val memREnOut      = Output(Bool())
  val memRCtrlOut    = Output(UInt(3.W))
  val memWEnOut      = Output(Bool())
  val memWCtrlOut    = Output(UInt(3.W))
  val regWEnOut      = Output(Bool())
  val regWSrcOut     = Output(UInt(2.W))
  val rdOut          = Output(UInt(5.W))
  val rs1REnOut      = Output(Bool())
  val rs2REnOut      = Output(Bool())
  val rs1Out         = Output(UInt(5.W))
  val rs2Out         = Output(UInt(5.W))
  // regFile
  val rData1In       = Input(UInt(64.W))
  val rData2In       = Input(UInt(64.W))
  val rData1Out      = Output(UInt(64.W))
  val rData2Out      = Output(UInt(64.W))
  // immSext
  val imm64In        = Input(UInt(64.W))
  val imm64Out       = Output(UInt(64.W))
}





class ID_EX extends Module {
  val io = IO(new ID_EXIO())

  val flush         = io.flush
  val hold          = io.hold
  // Decoder
  val aluOPIn       = io.aluOPIn
  val aluSrc1CtrlIn = io.aluSrc1CtrlIn
  val aluSrc2CtrlIn = io.aluSrc2CtrlIn
  val aluWEnIn      = io.aluWEnIn
  val aluWOPIn      = io.aluWOPIn
  val memREnIn      = io.memREnIn
  val memRCtrlIn    = io.memRCtrlIn
  val memWEnIn      = io.memWEnIn
  val memWCtrlIn    = io.memWCtrlIn
  val regWEnIn      = io.regWEnIn
  val regWSrcIn     = io.regWSrcIn
  val rdIn          = io.rdIn
  val rs1REnIn      = io.rs1REnIn
  val rs2REnIn      = io.rs2REnIn
  val rs1In         = io.rs1In
  val rs2In         = io.rs2In
  // regFile
  val rData1In      = io.rData1In 
  val rData2In      = io.rData2In
  // immSext
  val imm64In       = io.imm64In

  // Decoder
  val aluOPReg       = RegInit(0.U(4.W))
  val aluSrc1CtrlReg = RegInit(0.U(3.W))
  val aluSrc2CtrlReg = RegInit(0.U(3.W))
  val aluWEnReg      = RegInit(false.B)
  val aluWOPReg      = RegInit(0.U(3.W))
  val memREnReg      = RegInit(false.B)
  val memRCtrlReg    = RegInit(0.U(3.W))
  val memWEnReg      = RegInit(false.B)
  val memWCtrlReg    = RegInit(0.U(3.W))
  val regWEnReg      = RegInit(false.B)
  val regWSrcReg     = RegInit(0.U(2.W))
  val rdReg          = RegInit(0.U(5.W))
  val rs1REnReg      = RegInit(false.B)
  val rs2REnReg      = RegInit(false.B)
  val rs1Reg         = RegInit(0.U(5.W))
  val rs2Reg         = RegInit(0.U(5.W))
  // regFile
  val rData1Reg       = RegInit(0.U(64.W))
  val rData2Reg       = RegInit(0.U(64.W))
  // immSext
  val imm64Reg        = RegInit(0.U(64.W))

  when(flush){
    aluWEnReg      := false.B
    memREnReg      := false.B
    memWEnReg      := false.B
    regWEnReg      := false.B
    rs1REnReg      := false.B
    rs2REnReg      := false.B
  }
  .elsewhen(!hold){
    // Decoder
    aluOPReg       := aluOPIn
    aluSrc1CtrlReg := aluSrc1CtrlIn
    aluSrc2CtrlReg := aluSrc2CtrlIn
    aluWEnReg      := aluWEnIn
    aluWOPReg      := aluWOPIn
    memREnReg      := memREnIn
    memRCtrlReg    := memRCtrlIn
    memWEnReg      := memWEnIn
    memWCtrlReg    := memWCtrlIn
    regWEnReg      := regWEnIn
    regWSrcReg     := regWSrcIn
    rdReg          := rdIn
    rs1REnReg      := rs1REnIn
    rs2REnReg      := rs2REnIn
    rs1Reg         := rs1In
    rs2Reg         := rs2In
    // regFile
    rData1Reg       := rData1In
    rData2Reg       := rData2In
    // immSext
    imm64Reg        := imm64In
  }

  // Decoder
  io.aluOPOut       := aluOPReg
  io.aluSrc1CtrlOut := aluSrc1CtrlReg
  io.aluSrc2CtrlOut := aluSrc2CtrlReg
  io.aluWEnOut      := aluWEnReg
  io.aluWOPOut      := aluWOPReg
  io.memREnOut      := memREnReg
  io.memRCtrlOut    := memRCtrlReg
  io.memWEnOut      := memWEnReg
  io.memWCtrlOut    := memWCtrlReg
  io.regWEnOut      := regWEnReg
  io.regWSrcOut     := regWSrcReg
  io.rdOut          := rdReg
  io.rs1REnOut      := rs1REnReg
  io.rs2REnOut      := rs2REnReg
  io.rs1Out         := rs1Reg
  io.rs2Out         := rs2Reg
  // regFile
  io.rData1Out       := rData1Reg
  io.rData2Out       := rData2Reg
  // immSext
  io.imm64Out        := imm64Reg
}



object ID_EX extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(new ID_EX())
}


