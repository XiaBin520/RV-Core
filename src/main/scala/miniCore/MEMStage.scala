package miniCore

import chisel3._
import chisel3.util._


class MEMStage_MEM_IOA extends Bundle{
  val REn   = Output(Bool())
  val RSize = Output(UInt(3.W))
  val RAddr = Output(UInt(32.W))
  val RData = Input(UInt(64.W))
}

class MEMStage_MEM_IOB extends Bundle{
  val WEn   = Output(Bool())
  val WSize = Output(UInt(3.W))
  val WAddr = Output(UInt(32.W))
  val WData = Output(UInt(64.W))
}

class MEMStage_WB_IO extends Bundle{
  val DATA = Output(UInt(64.W))
}

class MEMStage_IO extends Bundle{
  val EX_A      = Flipped(new Decoder_EX_IOB())
  val EX_B      = new EXMEM_EX_IOB()
  val MEM_READ  = new MEMStage_MEM_IOA()
  val MEM_WRITE = new MEMStage_MEM_IOB()
  val WB        = new MEMStage_WB_IO()
}


class MEMStage extends RawModule{
  val io = IO(new MEMStage_IO())

  val REn   = io.EX_A.MEMREn
  val RSize = io.EX_A.MEMRCtrl
  val RAddr = io.EX_B.ALUData(31, 0)
  val RData = io.MEM_READ.RData

  val WEn   = io.EX_A.MEMWEn
  val WSize = io.EX_A.MEMRCtrl
  val WAddr = io.EX_B.ALUData(31, 0)
  val WData = io.EX_B.RData2


  val noneMemR :: memRSOne :: memRSTwo :: memRSFour :: memRUOne :: memRUTwo :: memRUFour :: memREight :: Nil = Enum(8)
  val Data = WireDefault(0.U(64.W))
  Data := io.EX_B.ALUData
  when(REn){
    switch(RSize){
      is(memRSOne)  {Data := Cat(  Fill(64-1*8, RData(7)),   RData(7, 0))}
      is(memRSTwo)  {Data := Cat(  Fill(64-2*8, RData(15)),  RData(15, 0))}
      is(memRSFour) {Data := Cat(  Fill(64-4*8, RData(31)),  RData(31, 0))}
      is(memRUOne)  {Data := Cat(  Fill(64-1*8, "b0".U),     RData(7, 0))}
      is(memRUTwo)  {Data := Cat(  Fill(64-2*8, "b0".U),     RData(15, 0))}
      is(memRUFour) {Data := Cat(  Fill(64-4*8, "b0".U),     RData(31, 0))}
      is(memREight) {Data := RData}
    }
  }


  io.MEM_READ.REn   := REn
  io.MEM_READ.RSize := RSize
  io.MEM_READ.RAddr := RAddr

  io.MEM_WRITE.WEn   := WEn
  io.MEM_WRITE.WSize := WSize
  io.MEM_WRITE.WAddr := WAddr
  io.MEM_WRITE.WData := WData

  io.WB.DATA := Data
}



object MEMStage extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(new MEMStage())
}





