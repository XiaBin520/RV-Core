package miniCore

import chisel3._
import chisel3.util._


class dataWriteIO extends Bundle{
  // Core signal
  val dataAddrCore        = Input(UInt(32.W))
  val dataByteCore        = Input(UInt(3.W))
  val dataCore            = Input(UInt(64.W))
  // Memory signal
  val dataWriteEnMem      = Output(Bool())
  val dataAddrMem         = Output(UInt(32.W))
  val writeDataByteMem    = Output(UInt(2.W))
  val dataMem             = Output(UInt(64.W))
  val dataWriteFinishMem  = Input(Bool())
  // Main Ctrl
  val dataWriteEnCtrl     = Input(Bool())
  val dataWriteFinishCtrl = Output(Bool())
}


class dataWrite extends Module{
  val io = IO(new dataWriteIO())

  val dataAddrCore        = io.dataAddrCore
  val dataByteCore        = io.dataByteCore
  val dataCore            = io.dataCore
  val dataWriteFinishMem  = io.dataWriteFinishMem
  val dataWriteEnCtrl     = io.dataWriteEnCtrl

  val idle :: sendState :: waitState :: finishState :: Nil = Enum(4)
  val stateReg = RegInit(idle)
  
  switch(stateReg){
    is(idle){
      when(dataWriteEnCtrl){
        stateReg := sendState
      }
    }
    is(sendState){
      stateReg := waitState
    }
    is(waitState){
      when(dataWriteFinishMem){
        stateReg := finishState
      }
    }
    is(finishState){
      stateReg := idle
    }
  }

  io.dataWriteEnMem      := (stateReg === sendState)
  io.dataWriteFinishCtrl := (stateReg === finishState)
  io.dataAddrMem         := dataAddrCore
  io.dataMem             := dataCore
  val noneMemW :: memWOne :: memWTwo :: memWFour :: memWEight :: Nil = Enum(5)
  val oneByte :: twoByte :: fourByte :: eightByte :: Nil = Enum(4)
  when(dataByteCore === memWOne){
    io.writeDataByteMem := oneByte
  }
  .elsewhen(dataByteCore === memWTwo){
    io.writeDataByteMem := twoByte
  }
  .elsewhen(dataByteCore === memWFour){
    io.writeDataByteMem := memWFour
  }
  .otherwise{
    io.writeDataByteMem := memWEight
  }


}




object dataWrite extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(new dataWrite())
}


