package miniCore

import chisel3._
import chisel3.util._

/***************************************
*   ALU Module
***************************************/


/***
    Named rules:  S--Signed, U--Unsigned, L--Left, R--Right

    0 --> +   --> opAdd
    1 --> -   --> opSub
    2 --> <s  --> opSLess
    3 --> <u  --> opULess
    4 --> ^   --> opXor
    5 --> |   --> opOr
    6 --> &   --> opAnd
    7 --> <<  --> opLShift
    8 --> >>u --> opURShift
    9 --> >>s --> opSRShift
***/

class ALU_ID_IO extends Bundle{
  val ALUOP = Input(UInt(4.W))
  val Src1 = Input(UInt(64.W))
  val Src2 = Input(UInt(64.W))
}

class ALU_MEM_IO extends Bundle{
  val ALUData = Output(UInt(64.W))
}

class ALU_IO extends Bundle{
    val ID  = new ALU_ID_IO()
    val MEM = new ALU_MEM_IO()
}


class ALU extends Module {
    val io = IO(new ALU_IO())

    val opAdd :: opSub :: opSLess :: opULess :: opXor :: opOr :: opAnd :: opLShift :: opURShift :: opSRShift :: Nil = Enum(10)

    val op    = io.ID.ALUOP
    val src1  = io.ID.Src1
    val src2  = io.ID.Src2
    val shamt = io.ID.Src2(5, 0)
    val out   = WireDefault(0.U(64.W))

    switch(op){
        is(opAdd)     {out := src1 + src2}
        is(opSub)     {out := src1 - src2}
        is(opSLess)   {out := (src1.asSInt < src2.asSInt).asUInt}
        is(opULess)   {out := src1 < src2}
        is(opXor)     {out := src1 ^ src2}
        is(opOr)      {out := src1 | src2}
        is(opAnd)     {out := src1 & src2}
        is(opLShift)  {out := src1 << shamt}
        is(opURShift) {out := src1 >> shamt}
        is(opSRShift) {out := (src1.asSInt >> shamt).asUInt}
    } 

    io.MEM.ALUData := out
}









/***************************************
*   ALU Module
***************************************/

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





/***************************************
*   EX Stage Module
***************************************/

class EXStage_ID_IO extends Bundle{
  val ID_A = Flipped(new Decoder_EX_IOA())
  val ID_B = Flipped(new IDStage_EX_IO())
}

class EXStage_MEM_IO extends Bundle{
  val ALUData = Output(UInt(64.W))
}

class EXStage_IO extends Bundle{
  val ID  = new EXStage_ID_IO()
  val MEM = new EXStage_MEM_IO()
}


class EXStage extends Module{
  val io = IO(new EXStage_IO())

  val ALU     = Module(new ALU())
  val WordALU = Module(new WordALU())


  val Src1 = WireDefault(0.U(64.W))
  val Src2 = WireDefault(0.U(64.W))

  val ALUOP       = io.ID.ID_A.ALUOP
  val ALUSrc1Ctrl = io.ID.ID_A.ALUSrc1Ctrl
  val ALUSrc2Ctrl = io.ID.ID_A.ALUSrc2Ctrl
  val WordALUEn   = io.ID.ID_A.WordALUEn
  val WordALUOP   = io.ID.ID_A.WordALUOP

  val PC     = Cat(Fill(32, "b0".U), io.ID.ID_B.PC)
  val Imm    = io.ID.ID_B.Imm
  val RData1 = io.ID.ID_B.RData1
  val RData2 = io.ID.ID_B.RData2


  val s1None :: s1Zero :: s1PC  :: s1Rs1  ::          Nil = Enum(4)
  val s2None :: s2Imm  :: s2Rs2 :: s2Four :: s2CSR :: Nil = Enum(5)

  switch(ALUSrc1Ctrl){
    is(s1Zero) {Src1 := 0.U}
    is(s1PC)   {Src1 := PC}
    is(s1Rs1)  {Src1 := RData1}
  }
  switch(ALUSrc2Ctrl){
    is(s2Imm)  {Src2 := Imm}
    is(s2Rs2)  {Src2 := RData2}
    is(s2Four) {Src2 := 4.U}
  }
  

  ALU.io.ID.ALUOP := ALUOP
  ALU.io.ID.Src1  := Src1
  ALU.io.ID.Src2  := Src2

  WordALU.io.ID.WordALUOP := WordALUOP
  WordALU.io.ID.Src1      := Src1
  WordALU.io.ID.Src2      := Src2

  when(WordALUEn){
    io.MEM.ALUData := WordALU.io.MEM.WordALUOut
  }
  .otherwise{
    io.MEM.ALUData := ALU.io.MEM.ALUData
  }

}



object EXStage extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(new EXStage())
}