package miniCore


import chisel3._
import chisel3.util._

class IDEX_ID_IO extends Bundle{
  val ID_A = Flipped(new Decoder_EX_IOA())
  val ID_B = Flipped(new Decoder_EX_IOB())
  val ID_C = Flipped(new Decoder_EX_IOC())
  val ID_D = Flipped(new IDStage_EX_IO())
}

class IDEX_EX_IO extends Bundle{
  val EX_A = new Decoder_EX_IOA()
  val EX_B = new Decoder_EX_IOB()
  val EX_C = new Decoder_EX_IOC()
  val EX_D = new IDStage_EX_IO()
}



class IDEX_IO extends Bundle{
  val Flush = Input(Bool())
  val Hold  = Input(Bool())
  val ID    = new IDEX_ID_IO()
  val EX    = new IDEX_EX_IO()
}


class IDEX extends Module{
  val io = IO(new IDEX_IO())

  val ALUOPReg       = RegInit(0.U(4.W))
  val ALUSrc1CtrlReg = RegInit(0.U(3.W))
  val ALUSrc2CtrlReg = RegInit(0.U(3.W))
  val WordALUEnReg   = RegInit(false.B)
  val WordALUOPReg   = RegInit(0.U(3.W))

  val MEMREnReg   = RegInit(false.B)
  val MEMRCtrlReg = RegInit(0.U(3.W))
  val MEMWEnReg   = RegInit(false.B)
  val MEMWCtrlReg = RegInit(0.U(3.W))

  val RegWEnReg  = RegInit(false.B)
  val RegWSrcReg = RegInit(0.U(2.W))
  val RdReg      = RegInit(0.U(2.W))
  
  val PCReg     = RegInit(0.U(32.W))
  val ImmReg    = RegInit(0.U(64.W))
  val RData1Reg = RegInit(0.U(64.W))
  val RData2Reg = RegInit(0.U(64.W))


  when(io.Flush){
    MEMREnReg := false.B
    MEMWEnReg := false.B
    RegWEnReg := false.B
  }
  .elsewhen(!io.Hold){
    ALUOPReg       := io.ID.ID_A.ALUOP
    ALUSrc1CtrlReg := io.ID.ID_A.ALUSrc1Ctrl
    ALUSrc2CtrlReg := io.ID.ID_A.ALUSrc2Ctrl
    WordALUEnReg   := io.ID.ID_A.WordALUEn
    WordALUOPReg   := io.ID.ID_A.WordALUOP

    MEMREnReg   := io.ID.ID_B.MEMREn
    MEMRCtrlReg := io.ID.ID_B.MEMRCtrl
    MEMWEnReg   := io.ID.ID_B.MEMWEn
    MEMWCtrlReg := io.ID.ID_B.MEMWCtrl

    RegWEnReg  := io.ID.ID_C.RegWEn
    RegWSrcReg := io.ID.ID_C.RegWSrc
    RdReg      := io.ID.ID_C.Rd

    PCReg     := io.ID.ID_D.PC
    ImmReg    := io.ID.ID_D.Imm
    RData1Reg := io.ID.ID_D.RData1
    RData2Reg := io.ID.ID_D.RData2
  }



  io.EX.EX_A.ALUOP       := ALUOPReg           
  io.EX.EX_A.ALUSrc1Ctrl := ALUSrc1CtrlReg     
  io.EX.EX_A.ALUSrc2Ctrl := ALUSrc2CtrlReg     
  io.EX.EX_A.WordALUEn   := WordALUEnReg       
  io.EX.EX_A.WordALUOP   := WordALUOPReg       

  io.EX.EX_B.MEMREn   := MEMREnReg       
  io.EX.EX_B.MEMRCtrl := MEMRCtrlReg     
  io.EX.EX_B.MEMWEn   := MEMWEnReg       
  io.EX.EX_B.MEMWCtrl := MEMWCtrlReg     

  io.EX.EX_C.RegWEn  := RegWEnReg      
  io.EX.EX_C.RegWSrc := RegWSrcReg     
  io.EX.EX_C.Rd      := RdReg          

  io.EX.EX_D.PC      := PCReg         
  io.EX.EX_D.Imm     := ImmReg        
  io.EX.EX_D.RData1  := RData1Reg     
  io.EX.EX_D.RData2  := RData2Reg 
}


object IDEX extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(new IDEX())
}

