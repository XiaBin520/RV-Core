package miniCore

import chisel3._
import chisel3.util._


class EXMEM_EX_IOA extends Bundle{
  val EX_A = Flipped(new Decoder_EX_IOB())
  val EX_B = Flipped(new Decoder_EX_IOC())
}

class EXMEM_EX_IOB extends Bundle{
  val RData2  = Input(UInt(64.W))
  val ALUData = Input(UInt(64.W))
}

class EXMEM_MEM_IOA extends Bundle{
  val MEM_A = new Decoder_EX_IOB()
  val MEM_B = new Decoder_EX_IOC()
}

class EXMEM_MEM_IOB extends Bundle{
  val RData2  = Output(UInt(32.W))
  val ALUData = Output(UInt(64.W))
}


class EXMEM_IO extends Bundle{
  val Hold  = Input(Bool())
  val EX_A  = new EXMEM_EX_IOA()
  val EX_B  = new EXMEM_EX_IOB()
  val MEM_A = new EXMEM_MEM_IOA()
  val MEM_B = new EXMEM_MEM_IOB()
}

class EXMEM extends Module{
  val io = IO(new EXMEM_IO)

  val Hold = io.Hold

  val MEMREnReg   = RegInit(false.B)
  val MEMRCtrlReg = RegInit(0.U(3.W))
  val MEMWEnReg   = RegInit(false.B)
  val MEMWCtrlReg = RegInit(0.U(3.W))

  val RegWEnReg  = RegInit(false.B)
  val RegWSrcReg = RegInit(0.U(2.W))
  val RdReg      = RegInit(0.U(2.W))

  val RData2Reg  = RegInit(0.U(64.W))
  val ALUDataReg = RegInit(0.U(64.W))
  
  when(!Hold){
    MEMREnReg   := io.EX_A.EX_A.MEMREn
    MEMRCtrlReg := io.EX_A.EX_A.MEMRCtrl
    MEMWEnReg   := io.EX_A.EX_A.MEMWEn
    MEMWCtrlReg := io.EX_A.EX_A.MEMWCtrl

    RegWEnReg  := io.EX_A.EX_B.RegWEn
    RegWSrcReg := io.EX_A.EX_B.RegWSrc
    RdReg      := io.EX_A.EX_B.Rd

    RData2Reg  := io.EX_B.RData2
    ALUDataReg := io.EX_B.ALUData
  }


  io.MEM_A.MEM_A.MEMREn   := MEMREnReg
  io.MEM_A.MEM_A.MEMRCtrl := MEMRCtrlReg
  io.MEM_A.MEM_A.MEMWEn   := MEMWEnReg
  io.MEM_A.MEM_A.MEMWCtrl := MEMWCtrlReg

  io.MEM_A.MEM_B.RegWEn  := RegWEnReg
  io.MEM_A.MEM_B.RegWSrc := RegWSrcReg
  io.MEM_A.MEM_B.Rd      := RdReg

  io.MEM_B.RData2  := RData2Reg
  io.MEM_B.ALUData := ALUDataReg
}



object EXMEM extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(new EXMEM())
}

