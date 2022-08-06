package miniCore

import chisel3._
import chisel3.util._


class instrReadIO extends Bundle{
  // Core signal
  val instrAddrCore       = Input(UInt(32.W))
  val instrCore           = Output(UInt(32.W))
  // Memory signal
  val instrReadEnMem      = Output(Bool())
  val instrAddrMem        = Output(UInt(32.W))
  val readInstrByteMem    = Output(UInt(2.W))
  val instrValidMem       = Input(Bool())
  val instrMem            = Input(UInt(32.W))
  // Main Ctrl
  val instrReadEnCtrl     = Input(Bool())
  val instrReadFinishCtrl = Output(Bool())

}

class instrRead extends Module{
  val io = IO(new instrReadIO())

  val instrAddrCore   = io.instrAddrCore
  val instrValidMem   = io.instrValidMem
  val instrMem        = io.instrMem
  val instrReadEnCtrl = io.instrReadEnCtrl


  val idle :: sendState :: waitState :: finishState :: Nil = Enum(4)
  val stateReg = RegInit(idle)
  val instrReg = RegInit("h0000_0013".U(32.W))
  
  switch(stateReg){
    is(idle){
      when(instrReadEnCtrl){
        stateReg := sendState
      }
    }
    is(sendState){
      stateReg := waitState
    }
    is(waitState){
      when(instrValidMem){
        stateReg := finishState
        instrReg := instrMem
      }
    }
    is(finishState){
      stateReg := idle
    }
  }

  io.instrReadEnMem      := (stateReg === sendState)
  io.instrReadFinishCtrl := (stateReg === finishState)



  io.instrCore := instrReg
  io.instrAddrMem := instrAddrCore
  val oneByte :: twoByte :: fourByte :: eightByte :: Nil = Enum(4)
  io.readInstrByteMem := fourByte
}



object insterRead extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(new instrRead())
}






