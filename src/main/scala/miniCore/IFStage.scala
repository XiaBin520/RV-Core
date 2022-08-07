package miniCore

import chisel3._
import chisel3.util._



class IFStage_MEM_IO extends Bundle{
  val PC    = Output(UInt(32.W))
  val Instr = Input(UInt(32.W))
}

class IFStage_PC_IO extends Bundle{
  val PC = Input(UInt(32.W))
}

class IFStage_ID_IO extends Bundle{
  val Instr = Output(UInt(32.W))
}

class IFStage_IO extends Bundle{
  val PC  = new IFStage_PC_IO()
  val MEM = new IFStage_MEM_IO()
  val ID  = new IFStage_ID_IO()
}



class IFStage extends Module {
  val io = IO(new IFStage_IO())

  io.MEM.PC   := io.PC.PC
  io.ID.Instr := io.MEM.Instr
}


object IFStage extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(new IFStage())
}