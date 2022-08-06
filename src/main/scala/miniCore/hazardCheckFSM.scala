package miniCore

import chisel3._
import chisel3.util._


class hazardCheckIO extends Bundle{
  // EX stage
  val regWriteEn_EX    = Input(Bool())
  val regWriteNum_EX   = Input(UInt(5.W))
  // MEM stage
  val regWriteEn_MEM   = Input(Bool())
  val regWriteNum_MEM  = Input(UInt(5.W))
  val regWriteSrc_MEM  = Input(UInt(2.W))
  // ID stage
  val regRs1ReadEn_ID  = Input(Bool())
  val regRs2ReadEn_ID  = Input(Bool())
  val regRs1Num_ID     = Input(UInt(5.W))
  val regRs2Num_ID     = Input(UInt(5.W))
  val jumpEn_ID        = Input(Bool())
  // Main ctrl
  val hazardEXIDValid  = Output(Bool())
  val hazardMEMIDValid = Output(Bool())
  val hazardJump       = Output(Bool())

}

class hazardCheck extends Module{
  val io = IO(new hazardCheckIO())

  val regWriteEn_EX     = io.regWriteEn_EX 
  val regWriteNum_EX    = io.regWriteNum_EX
  val regWriteEn_MEM    = io.regWriteEn_MEM
  val regWriteNum_MEM   = io.regWriteNum_MEM
  val regWriteSrc_MEM   = io.regWriteSrc_MEM
  val regRs1ReadEn_ID   = io.regRs1ReadEn_ID
  val regRs2ReadEn_ID   = io.regRs2ReadEn_ID
  val regRs1Num_ID      = io.regRs1Num_ID
  val regRs2Num_ID      = io.regRs2Num_ID
  val jumpEn_ID         = io.jumpEn_ID


  val hazardEXIDValid = WireDefault(false.B)
  val hazardMEMIDValid = WireDefault(false.B)
  val hazardJump = WireDefault(false.B)

  // EX-ID hazard Check
  when(regWriteEn_EX && regWriteNum_EX =/= 0.U){
    when(regRs1ReadEn_ID && regRs1Num_ID === regWriteNum_EX){
      hazardEXIDValid := true.B
    }
    .elsewhen(regRs2ReadEn_ID && regRs2Num_ID === regWriteNum_EX){
      hazardEXIDValid := true.B
    }
  }


  // MEM-ID hazard Check
  val noneSrc :: aluSrc :: memSrc :: Nil = Enum(3)
  when(regWriteEn_MEM && regWriteNum_MEM =/= 0.U && regWriteSrc_MEM === memSrc){
    when(regRs1ReadEn_ID && regRs1Num_ID === regWriteNum_MEM){
      hazardMEMIDValid := true.B
    }
    .elsewhen(regRs2ReadEn_ID && regRs2Num_ID === regWriteNum_MEM){
      hazardMEMIDValid := true.B
    }
  }


  // Jump hazard Check
  hazardJump := jumpEn_ID


  io.hazardEXIDValid  := hazardEXIDValid
  io.hazardMEMIDValid := hazardMEMIDValid
  io.hazardJump       := hazardJump
}



object hazardCheck extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(new hazardCheck())
}


