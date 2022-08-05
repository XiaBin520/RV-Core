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

class aluIO extends Bundle{
  val aluOP = Input(UInt(4.W))
  val aluSrc1 = Input(UInt(64.W))
  val aluSrc2 = Input(UInt(64.W))
  val aluOut = Output(UInt(64.W))
}



class alu extends Module {
    val io = IO(new aluIO())


    val opAdd :: opSub :: opSLess :: opULess :: opXor :: opOr :: opAnd :: opLShift :: opURShift :: opSRShift :: Nil = Enum(10)


    val op       = io.aluOP
    val src1     = io.aluSrc1
    val src2     = io.aluSrc2
    val shiftNum = io.aluSrc2(5, 0)
    val out      = WireDefault(0.U(64.W))


    switch(op){
        is(opAdd)     {out := src1 + src2}
        is(opSub)     {out := src1 - src2}
        is(opSLess)   {out := (src1.asSInt < src2.asSInt).asUInt}
        is(opULess)   {out := src1 < src2}
        is(opXor)     {out := src1 ^ src2}
        is(opOr)      {out := src1 | src2}
        is(opAnd)     {out := src1 & src2}
        is(opLShift)  {out := src1 << shiftNum}
        is(opURShift) {out := src1 >> shiftNum}
        is(opSRShift) {out := (src1.asSInt >> shiftNum).asUInt}
    } 

    io.aluOut := out
}


object alu extends App {
    (new chisel3.stage.ChiselStage).emitVerilog(new alu())
}