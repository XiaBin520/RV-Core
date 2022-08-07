package miniCore

import chisel3._
import chisel3.util._


class WordALU_ID_IO extends Bundle{
  val Src1      = Input(UInt(64.W))
  val Src2      = Input(UInt(64.W))
  val WordALUOP = Input(UInt(3.W))
}

class WordALU_MEM_IO extends Bundle{
  val WordALUOut = Output(UInt(64.W))
}

class WordALU_IO extends Bundle{
  val ID  = new WordALU_ID_IO()
  val MEM = new WordALU_MEM_IO()
}





class WordALU  extends Module{
  val io = IO(new WordALU_IO())

  val opWNone :: opWAdd :: opWSub :: opWLShift :: opWURShift :: opWSRShift :: Nil = Enum(6)

  val Src1   = io.ID.Src1
  val Src2   = io.ID.Src2
  val WordALUOP = io.ID.WordALUOP
  
  val Src1W  = io.ID.Src1(31, 0)
  val shamt  = io.ID.Src2(4,  0)

  val outDW  = WireDefault(0.U(64.W))
  val outW   = WireDefault(0.U(32.W))
  val out    = WireDefault(0.U(64.W))


  switch(WordALUOP){
    is(opWAdd)     {outDW := Src1 + Src2}
    is(opWSub)     {outDW := Src1 - Src2}
    is(opWLShift)  {outDW := Src1   << shamt}
    is(opWURShift) {outW  := Src1W  >> shamt}
    is(opWSRShift) {outW  := (Src1W >> shamt).asUInt}
  }

  switch(WordALUOP){
    is(opWAdd)     {out := Cat( Fill(32, outDW(31)),   outDW(31, 0) ) }
    is(opWSub)     {out := Cat( Fill(32, outDW(31)),   outDW(31, 0) ) }
    is(opWLShift)  {out := Cat( Fill(32, outDW(31)),   outDW(31, 0) ) }
    is(opWURShift) {out := Cat( Fill(32, outDW(31)),   outW(31, 0)  ) }
    is(opWSRShift) {out := Cat( Fill(32, outDW(31)),   outW(31, 0)  ) }
  }

  io.MEM.WordALUOut := out
}



object WordALU extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(new WordALU())
}