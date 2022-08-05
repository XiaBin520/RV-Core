package miniCore

import chisel3._
import chisel3.util._

class aluWIO extends Bundle{
  val src1     = Input(UInt(64.W))
  val src2     = Input(UInt(64.W))
  val aluWOP   = Input(UInt(3.W))
  val aluWOut  = Output(UInt(64.W))
}





class aluW  extends Module{
  val io = IO(new aluWIO())

  val opWNone :: opWAdd :: opWSub :: opWLShift :: opWURShift :: opWSRShift :: Nil = Enum(6)

  val src1   = io.src1
  val src2   = io.src2
  val aluWOP = io.aluWOP
  val src1W  = io.src1(31, 0)
  val shamt  = io.src2(4,  0)
  val outDW  = WireDefault(0.U(64.W))
  val outW   = WireDefault(0.U(32.W))
  val out    = WireDefault(0.U(64.W))


  switch(aluWOP){
    is(opWAdd)     {outDW := src1 + src2}
    is(opWSub)     {outDW := src1 - src2}
    is(opWLShift)  {outDW := src1 << shamt}
    is(opWURShift) {outW  := src1W >> shamt}
    is(opWSRShift) {outW  := (src1W >> shamt).asUInt}
  }

  switch(aluWOP){
    is(opWAdd)     {out := Cat( Fill(32, outDW(31)),   outDW(31, 0) ) }
    is(opWSub)     {out := Cat( Fill(32, outDW(31)),   outDW(31, 0) ) }
    is(opWLShift)  {out := Cat( Fill(32, outDW(31)),   outDW(31, 0) ) }
    is(opWURShift) {out := Cat( Fill(32, outDW(31)),   outW(31, 0)  ) }
    is(opWSRShift) {out := Cat( Fill(32, outDW(31)),   outW(31, 0)  ) }
  }

  io.aluWOut := out
}



object aluW extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(new aluW())
}