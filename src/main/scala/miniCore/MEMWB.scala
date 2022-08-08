package miniCore

import chisel3._
import chisel3.util._

class MEMWB_MEM_IO extends Bundle{
  val MEM  = Flipped(new Decoder_EX_IOC())
  val Data = Input(UInt(64.W))
}

class MEMWB_WB_IO extends Bundle{
  val WB   = new Decoder_EX_IOC()
  val Data = Output(UInt(64.W))
}

class MEMWB_IO extends Bundle{
  val Hold = Input(Bool())
  val MEM  = new MEMWB_MEM_IO()
  val WB   = new MEMWB_WB_IO()
  
}

class MEMWB extends Module{
  val io = IO(new MEMWB_IO())

  val RegWEnReg = RegInit(false.B)
  val RdReg     = RegInit(0.U(5.W))
  val DataReg   = RegInit(0.U(64.W))

  when(!io.Hold){
    RegWEnReg := io.MEM.MEM.RegWEn
    RdReg     := io.MEM.MEM.Rd
    DataReg   := io.MEM.Data
  }

  io.WB.WB.RegWEn := RegWEnReg
  io.WB.WB.Rd     := RdReg
  io.WB.Data      := DataReg
}


object MEMWB extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(new MEMWB())
}

