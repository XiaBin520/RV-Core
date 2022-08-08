
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

class ALU_DATAIN_IO extends Bundle{
  val Data1 = Input(UInt(64.W))
  val Data2 = Input(UInt(64.W))
}

class ALU_CTRL_IO extends Bundle{
  val ALUOP = Input(UInt(4.W))
}

class ALU_DATAOUT_IO extends Bundle{
  val ALUData = Output(UInt(64.W))
}




class ALU_IO extends Bundle{
  val DATAIN  = new ALU_DATAIN_IO()
  val CTRL    = new ALU_CTRL_IO()
  val DATAOUT = new ALU_DATAOUT_IO()
}




class ALU extends RawModule{
    val io = IO(new ALU_IO())

    val opAdd :: opSub :: opSLess :: opULess :: opXor :: opOr :: opAnd :: opLShift :: opURShift :: opSRShift :: Nil = Enum(10)

    val Data1   = io.DATAIN.Data1
    val Data2   = io.DATAIN.Data2
    val ALUOP   = io.CTRL.ALUOP
    val shamt   = io.DATAIN.Data2(5, 0)
    val ALUData = WireDefault(0.U(64.W))

    switch(ALUOP){
        is(opAdd)     {ALUData := Data1 + Data2}
        is(opSub)     {ALUData := Data1 - Data2}
        is(opSLess)   {ALUData := (Data1.asSInt < Data2.asSInt).asUInt}
        is(opULess)   {ALUData := Data1 < Data2}
        is(opXor)     {ALUData := Data1 ^ Data2}
        is(opOr)      {ALUData := Data1 | Data2}
        is(opAnd)     {ALUData := Data1 & Data2}
        is(opLShift)  {ALUData := Data1 << shamt}
        is(opURShift) {ALUData := Data1 >> shamt}
        is(opSRShift) {ALUData := (Data1.asSInt >> shamt).asUInt}
    } 

    io.DATAOUT.ALUData := ALUData
}




object ALU extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(new ALU())
}