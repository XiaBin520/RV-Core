
import chisel3._
import chisel3.util._



/***************************************
*   Transfer Module
***************************************/

class Transfer_DATAIN_IO extends Bundle{
  val PC     = Input(UInt(32.W))
  val Imm    = Input(UInt(64.W))
  val RData1 = Input(UInt(64.W))
  val RData2 = Input(UInt(64.W))
}

class Transfer_CTRL_IO extends Bundle{
  val JumpCtrl = Input(UInt(4.W))
}

class Transfer_DATAOUT_IO extends Bundle{
  val PC = Output(UInt(32.W))
}

class Transfer_CTRLOUT_IO extends Bundle{
  val JumpEn = Output(Bool())
}




class Transfer_IO extends Bundle{
  val DATAIN  = new Transfer_DATAIN_IO()
  val CTRL    = new Transfer_CTRL_IO()
  val DATAOUT = new Transfer_DATAOUT_IO()
  val CTRLOUT = new Transfer_CTRLOUT_IO()
}




class Transfer extends RawModule{
  val io = IO(new Transfer_IO())

  val noneCtrl :: equal :: notEqual  :: sLess   :: sMoreThan :: uLess :: uMoreThan :: jalCtrl :: jalrCtrl :: Nil = Enum(9)

  val JumpCtrl  = io.CTRL.JumpCtrl

  val PC        = io.DATAIN.PC
  val Imm       = io.DATAIN.Imm
  val RData132  = io.DATAIN.RData1(31, 0)
  val RData1    = io.DATAIN.RData1
  val RData2    = io.DATAIN.RData2

  val PCADDImm     = WireDefault(0.U(32.W))
  val RData1ADDImm = WireDefault(0.U(32.W))
  val PCADD4       = WireDefault(0.U(32.W))

  val nextPC       = WireDefault(0.U(32.W))


  PCADDImm  := PC + Imm
  RData1ADDImm := (RData132 + Imm) & "hfffffffe".U
  PCADD4    := PC + 4.U
  
  nextPC       :=  PCADD4
  io.CTRLOUT.JumpEn :=  false.B
  switch(JumpCtrl){
    is(equal){ 
      when(RData1 === RData2){
        io.CTRLOUT.JumpEn := true.B
        nextPC := PCADDImm
      }
    }
    is(notEqual){
      when(RData1 =/= RData2){
        io.CTRLOUT.JumpEn := true.B
        nextPC := PCADDImm
      }
    }
    is(sLess){
      when(RData1.asSInt < RData2.asSInt){
        io.CTRLOUT.JumpEn := true.B
        nextPC := PCADDImm
      }
    }
    is(sMoreThan){
      when(RData1.asSInt >= RData2.asSInt){
        io.CTRLOUT.JumpEn := true.B
        nextPC := PCADDImm
      }
    }
    is(uLess){
      when(RData1 < RData2){
        io.CTRLOUT.JumpEn := true.B
        nextPC := PCADDImm
      }
    }
    is(uMoreThan){
      when(RData1 >= RData2){
        io.CTRLOUT.JumpEn := true.B
        nextPC := PCADDImm
      }
    }
    is(jalCtrl){
      io.CTRLOUT.JumpEn := true.B
      nextPC := PCADDImm
    }
    is(jalrCtrl){
      io.CTRLOUT.JumpEn := true.B
      nextPC := RData1ADDImm
    }
  }
  io.DATAOUT.PC := nextPC  
}




object Transfer extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(new Transfer())
}
