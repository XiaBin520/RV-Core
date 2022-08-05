package miniCore

import chisel3._
import chisel3.util._


class testScalaIO extends Bundle{
  val a = Output(UInt(64.W))
}

class testScala extends Module{
  val io = IO(new testScalaIO())

  val sNone :: s1 :: s2 :: s3 :: s4 :: Nil = Enum(5)
  val stateReg = RegInit(sNone)

  io.a := 0.U
  switch(stateReg){
    is(sNone){
      stateReg := s1
      io.a := 1.U
    }
    is(s1){
      stateReg := s2
      io.a := 2.U
    }
    is(s2){
      stateReg := s2
      io.a := 3.U
    }
  }

  
}



object testScala extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(new testScala())
}
