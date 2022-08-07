package miniCore

import chisel3._
import chisel3.util._

class DataPath_ID_IOA extends Bundle{
  val Rs1REn = Input(Bool())
  val Rs2REn = Input(Bool())
  val Rs1    = Input(UInt(5.W))
  val Rs2    = Input(UInt(5.W))
}

class DataPath_ID_IOB extends Bundle{
  val Rs1Ctrl = Output(UInt(2.W))
  val Rs2Ctrl = Output(UInt(2.W))
}

class DataPath_MEM_IO extends Bundle{
  val RegWEn  = Input(Bool())
  val RegWSrc = Input(UInt(2.W))
  val Rd      = Input(UInt(5.W))
}

class DataPath_WB_IO extends Bundle{
  val RegWEn = Input(Bool())
  val Rd     = Input(UInt(5.W))
}


class DataPath_IO extends Bundle{
  val ID_A = new DataPath_ID_IOA()
  val ID_B = new DataPath_ID_IOB()
  val MEM  = new DataPath_MEM_IO()
  val WB   = new DataPath_WB_IO()
}

class DataPath extends Module{
  val io = IO(new DataPath_IO())

  val noneSrc  :: aluSrc  :: memSrc :: Nil = Enum(3)
  val noneData :: memData :: wbData :: Nil = Enum(3)

  when(io.MEM.RegWEn && io.MEM.RegWSrc === aluSrc && io.MEM.Rd =/= 0.U && io.ID_A.Rs1REn && io.ID_A.Rs1 === io.MEM.Rd){
    io.ID_B.Rs1Ctrl := memData
  }
  .elsewhen(io.WB.RegWEn && io.WB.Rd =/= 0.U && io.ID_A.Rs1REn && io.ID_A.Rs1 === io.WB.Rd){
    io.ID_B.Rs1Ctrl := wbData
  }
  .otherwise{
    io.ID_B.Rs1Ctrl := noneData
  }


  when(io.MEM.RegWEn && io.MEM.RegWSrc === aluSrc && io.MEM.Rd =/= 0.U && io.ID_A.Rs2REn && io.ID_A.Rs2 === io.MEM.Rd){
    io.ID_B.Rs2Ctrl := memData
  }
  .elsewhen(io.WB.RegWEn && io.WB.Rd =/= 0.U && io.ID_A.Rs2REn && io.ID_A.Rs2 === io.WB.Rd){
    io.ID_B.Rs2Ctrl := wbData
  }
  .otherwise{
    io.ID_B.Rs2Ctrl := noneData
  }

}




object DataPath extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(new DataPath())
}
