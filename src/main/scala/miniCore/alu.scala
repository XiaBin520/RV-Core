package miniCore

import chisel3._
import chisel3.util._



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
  val ALUOut = Output(UInt(64.W))
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

    io.MEM.ALUOut := out
}


object ALU extends App {
    (new chisel3.stage.ChiselStage).emitVerilog(new ALU())
}