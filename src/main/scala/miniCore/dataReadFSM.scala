package miniCore

import chisel3._
import chisel3.util._


class dataReadIO extends Bundle{
  // Core signal
  val dataAddrCore       = Input(UInt(32.W))
  val dataByteCore       = Input(UInt(3.W))
  val dataCore           = Output(UInt(64.W))
  // Memory signal
  val dataReadEnMem      = Output(Bool())
  val dataAddrMem        = Output(UInt(32.W))
  val readDataByteMem    = Output(UInt(2.W))
  val dataValidMem       = Input(Bool())
  val dataMem            = Input(UInt(64.W))
  // Main Ctrl
  val dataReadEnCtrl     = Input(Bool())
  val dataReadFinishCtrl = Output(Bool())

}


class dataRead extends Module{
  val io = IO(new dataReadIO())
  
  val dataAddrCore       = io.dataAddrCore
  val dataByteCore       = io.dataByteCore
  val dataValidMem       = io.dataValidMem
  val dataMem            = io.dataMem
  val dataReadEnCtrl     = io.dataReadEnCtrl

  val idle :: sendState :: waitState :: finishState :: Nil = Enum(4)
  val stateReg = RegInit(idle)
  val dataReg  = RegInit(0.U(64.W))

  switch(stateReg){
    is(idle){
      when(dataReadEnCtrl){
        stateReg := sendState
      }
    }
    is(sendState){
      stateReg := waitState
    }
    is(waitState){
      when(dataValidMem){
        stateReg := finishState
        dataReg  := dataMem
      }
    }
    is(finishState){
      stateReg := idle
    }
  }


  io.dataReadEnMem      := (stateReg === sendState)
  io.dataReadFinishCtrl := (stateReg === finishState)

  io.dataCore := dataReg
  io.dataAddrMem := dataAddrCore
  val noneMemR :: memRSOne :: memRSTwo :: memRSFour :: memRUOne :: memRUTwo :: memRUFour :: memREight :: Nil = Enum(8)
  val oneByte :: twoByte :: fourByte :: eightByte :: Nil = Enum(4)
  when(dataByteCore === memRSOne || dataByteCore === memRUOne){
    io.readDataByteMem := oneByte
  }
  .elsewhen(dataByteCore === memRSTwo || dataByteCore === memRUTwo){
    io.readDataByteMem := twoByte
  }
  .elsewhen(dataByteCore === memRSFour || dataByteCore === memRUFour){
    io.readDataByteMem := fourByte
  }
  .otherwise{
    io.readDataByteMem := eightByte
  }


}



object dataRead extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(new dataRead())
}
