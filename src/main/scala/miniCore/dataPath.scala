package miniCore

import chisel3._
import chisel3.util._

class dataPathIO extends Bundle{
  val rs1REn_ID   = Input(Bool())
  val rs2REn_ID   = Input(Bool())
  val rs1Num_ID   = Input(UInt(5.W))
  val rs2Num_ID   = Input(UInt(5.W))
  val rdWEn_EX    = Input(Bool())
  val rdNum_EX    = Input(UInt(5.W))
  val rdWEn_MEM   = Input(Bool())
  val rdNum_MEM   = Input(UInt(5.W))
  val rdWEn_WB    = Input(Bool())
  val rdNum_WB    = Input(UInt(5.W))
  val rs1DataCtrl = Output(UInt(2.W))
  val rs2DataCtrl = Output(UInt(2.W))
}

class dataPath extends Module{
  val io = IO(new dataPathIO())
  val rs1REn_ID   = io.rs1REn_ID
  val rs2REn_ID   = io.rs2REn_ID
  val rs1Num_ID   = io.rs1Num_ID
  val rs2Num_ID   = io.rs2Num_ID
  val rdWEn_EX    = io.rdWEn_EX
  val rdNum_EX    = io.rdNum_EX
  val rdWEn_MEM   = io.rdWEn_MEM
  val rdNum_MEM   = io.rdNum_MEM
  val rdWEn_WB    = io.rdWEn_WB
  val rdNum_WB    = io.rdNum_WB

  val regFile :: exData :: memData :: wbData :: Nil = Enum(4)
  val rs1DataCtrl = WireDefault(0.U(2.W))
  val rs2DataCtrl = WireDefault(0.U(2.W))

  when(rs1REn_ID && rdWEn_EX && rs1Num_ID === rdNum_EX && rdNum_EX =/= 0.U){
    rs1DataCtrl := exData
  }
  .elsewhen(rs1REn_ID && rdWEn_MEM && rs1Num_ID === rdNum_MEM && rdNum_MEM =/= 0.U){
    rs1DataCtrl := memData
  }
  .elsewhen(rs1REn_ID && rdWEn_WB && rs1Num_ID === rdNum_WB && rdNum_WB =/= 0.U){
    rs1DataCtrl := wbData
  }


  when(rs2REn_ID && rdWEn_EX && rs2Num_ID === rdNum_EX && rdNum_EX =/= 0.U){
    rs2DataCtrl := exData
  }
  .elsewhen(rs2REn_ID && rdWEn_MEM && rs2Num_ID === rdNum_MEM && rdNum_MEM =/= 0.U){
    rs2DataCtrl := memData
  }
  .elsewhen(rs2REn_ID && rdWEn_WB && rs2Num_ID === rdNum_WB && rdNum_WB =/= 0.U){
    rs2DataCtrl := wbData
  }

  io.rs1DataCtrl := rs1DataCtrl
  io.rs2DataCtrl := rs2DataCtrl
}


object dataPath extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(new dataPath())
}
