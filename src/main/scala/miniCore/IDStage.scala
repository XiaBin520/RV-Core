package miniCore

import chisel3._
import chisel3.util._

/***
ImmCtrl     --> ImmSext Ctrl
JumpCtrl   --> branch and jump Ctrl
ALUOP       --> ALU Ctrl
ALUSrc1Ctrl --> ALU source 1 Ctrl
ALUSrc2Ctrl --> ALU source 2 Ctrl
WordALUEn      --> ALUW output
WordALUOP      --> ALUW Ctrl
MEMREn      --> memory read enable signal
MEMRCtrl    --> memory read size(byte) and modle
MEMWEn      --> memory write enable signal
MEMWCtrl    --> memory write size(byte) and modle
RegWEn      --> register write enable signal
RegWSrc     --> register write data source from
Rd         --> register file rd
Rs1REn      --> read rs1 register Enable
Rs2REn      --> read rs2 rregister Enable
Rs1         --> rs1 register
Rs2         --> rs2 register

----> key ctrl signal: MEMREn, MEMWEn, RegWEn, Rs1REn, Rs2REn
***/
class Decoder_IF_IO extends Bundle{
  val Instr = Input(UInt(32.W))
}

class Decoder_ID_IO extends Bundle{
  val ImmCtrl  = Output(UInt(3.W))
  val JumpCtrl = Output(UInt(4.W))
}

class Decoder_EX_IOA extends Bundle{
  val ALUOP       = Output(UInt(4.W))
  val ALUSrc1Ctrl = Output(UInt(3.W))
  val ALUSrc2Ctrl = Output(UInt(3.W))
  val WordALUEn   = Output(Bool())
  val WordALUOP   = Output(UInt(3.W))
}

class Decoder_EX_IOB extends Bundle{
  val MEMREn   = Output(Bool())
  val MEMRCtrl = Output(UInt(3.W))
  val MEMWEn   = Output(Bool())
  val MEMWCtrl = Output(UInt(3.W))
}


class Decoder_EX_IOC extends Bundle{
  val RegWEn      = Output(Bool())
  val RegWSrc     = Output(UInt(2.W))
  val Rd          = Output(UInt(5.W))
}


class Decoder_EX_IOD extends Bundle{
  val Rs1REn = Output(Bool())
  val Rs2REn = Output(Bool())
  val Rs1    = Output(UInt(5.W))
  val Rs2    = Output(UInt(5.W))
}



class Decoder_IO extends Bundle{
  val IF   = new Decoder_IF_IO()
  val ID   = new Decoder_ID_IO()
  val EX_A = new Decoder_EX_IOA()
  val EX_B = new Decoder_EX_IOB()
  val EX_C = new Decoder_EX_IOC()
  val EX_D = new Decoder_EX_IOD()
}




class Decoder extends Module{
  val io = IO(new Decoder_IO())


  val Opcode = io.IF.Instr(6, 0)
  val Rd     = io.IF.Instr(11, 7)
  val Funct3 = io.IF.Instr(14, 12)
  val Rs1    = io.IF.Instr(19, 15)
  val Rs2    = io.IF.Instr(24, 20)
  val Funct7 = io.IF.Instr(31, 25)


  





  val immR :: immI :: immS :: immB :: immU :: immJ :: immCSRI :: Nil = Enum(7)
  val ImmCtrl = WireDefault(immR)

  val noneCtrl :: equal :: notEqual  :: sLess   :: sMoreThan :: uLess :: uMoreThan :: jalCtrl :: jalrCtrl :: Nil = Enum(9)
  val JumpCtrl = WireDefault(noneCtrl)
  
  val opAdd :: opSub :: opSLess :: opULess :: opXor :: opOr :: opAnd :: opLShift :: opURShift :: opSRShift :: Nil = Enum(10)
  val ALUOP = WireDefault(opAdd)

  val s1None :: s1Zero :: s1PC  :: s1Rs1  ::          Nil = Enum(4)
  val s2None :: s2Imm  :: s2Rs2 :: s2Four :: s2CSR :: Nil = Enum(5)
  val ALUSrc1Ctrl = WireDefault(s1None)
  val ALUSrc2Ctrl = WireDefault(s2None)

  val opWordNone :: opWordAdd :: opWordSub :: opWordLShift :: opWordURShift :: opWordSRShift :: Nil = Enum(6)
  val WordALUEn = WireDefault(false.B)
  val WordALUOP = WireDefault(opWordNone)

  val noneMemR :: memRSOne :: memRSTwo :: memRSFour :: memRUOne :: memRUTwo :: memRUFour :: memREight :: Nil = Enum(8)
  val MEMREn      = WireDefault(false.B)
  val MEMRCtrl    = WireDefault(noneMemR)

  val noneMemW :: memWOne :: memWTwo :: memWFour :: memWEight :: Nil = Enum(5)
  val MEMWEn      = WireDefault(false.B)
  val MEMWCtrl    = WireDefault(noneMemW)

  val RegWEn      = WireDefault(false.B)
  val noneSrc :: aluSrc :: memSrc :: Nil = Enum(3)
  val RegWSrc     = WireDefault(noneSrc)


  val Rs1REn      = WireDefault(false.B)
  val Rs2REn      = WireDefault(false.B)


  switch(Opcode){
    // LUI   = BitPat("b?????????????????????????0110111")
    is("b0110111".U){
      ImmCtrl     := immU
      ALUOP       := opAdd
      ALUSrc1Ctrl := s1Zero
      ALUSrc2Ctrl := s2Imm
      RegWEn      := true.B
      RegWSrc     := aluSrc     
    }
    // AUIPC = BitPat("b?????????????????????????0010111")
    is("b0010111".U){
      ImmCtrl     := immU
      ALUOP       := opAdd
      ALUSrc1Ctrl := s1PC
      ALUSrc2Ctrl := s2Imm
      RegWEn      := true.B
      RegWSrc     := aluSrc
    }
    // Branches
    // BEQ  = BitPat("b?????????????????000?????1100011")
    // BNE  = BitPat("b?????????????????001?????1100011")
    // BLT  = BitPat("b?????????????????100?????1100011")
    // BGE  = BitPat("b?????????????????101?????1100011")
    // BLTU = BitPat("b?????????????????110?????1100011")
    // BGEU = BitPat("b?????????????????111?????1100011")
    is("b1100011".U){
      ImmCtrl := immB
      Rs1REn  := true.B
      Rs2REn  := true.B
      switch(Funct3){
        is("b000".U) {JumpCtrl := equal}
        is("b001".U) {JumpCtrl := notEqual}
        is("b100".U) {JumpCtrl := sLess}
        is("b101".U) {JumpCtrl := sMoreThan}
        is("b110".U) {JumpCtrl := uLess}
        is("b111".U) {JumpCtrl := uMoreThan}
      }
    }
    // Loads
    // LB  = BitPat("b?????????????????000?????0000011")
    // LH  = BitPat("b?????????????????001?????0000011")
    // LW  = BitPat("b?????????????????010?????0000011")
    // LD  = BitPat("b?????????????????011?????0000011")
    // LBU = BitPat("b?????????????????100?????0000011")
    // LHU = BitPat("b?????????????????101?????0000011")
    // LWU = BitPat("b?????????????????110?????0000011")
    is("b0000011".U){
      ImmCtrl     := immI
      ALUOP       := opAdd
      ALUSrc1Ctrl := s1Rs1
      ALUSrc2Ctrl := s2Imm
      MEMREn      := true.B
      RegWEn      := true.B
      RegWSrc     := memSrc
      Rs1REn      := true.B
      switch(Funct3){
        is("b000".U) {MEMRCtrl := memRSOne}
        is("b001".U) {MEMRCtrl := memRSTwo}
        is("b010".U) {MEMRCtrl := memRSFour}
        is("b011".U) {MEMRCtrl := memREight}
        is("b100".U) {MEMRCtrl := memRUOne}
        is("b101".U) {MEMRCtrl := memRUTwo}
        is("b110".U) {MEMRCtrl := memRUFour}
      }
    }
    // Stores
    // SB = BitPat("b?????????????????000?????0100011")
    // SH = BitPat("b?????????????????001?????0100011")
    // SW = BitPat("b?????????????????010?????0100011")
    // SD = BitPat("b?????????????????011?????0100011")
    is("b0100011".U){
      ImmCtrl     := immS
      ALUOP       := opAdd
      ALUSrc1Ctrl := s1Rs1
      ALUSrc2Ctrl := s2Imm
      MEMWEn      := true.B
      Rs1REn      := true.B
      switch(Funct3){
        is("b000".U) {MEMWCtrl := memWOne}
        is("b001".U) {MEMWCtrl := memWTwo}
        is("b010".U) {MEMWCtrl := memWFour}
        is("b011".U) {MEMWCtrl := memWEight} 
      }
    }

    // rs1 op imm
    // ADDI  = BitPat("b?????????????????000?????0010011")
    // SLTI  = BitPat("b?????????????????010?????0010011")
    // SLTIU = BitPat("b?????????????????011?????0010011")
    // XORI  = BitPat("b?????????????????100?????0010011")
    // ORI   = BitPat("b?????????????????110?????0010011")
    // ANDI  = BitPat("b?????????????????111?????0010011")
    // SLLI  = BitPat("b000000???????????001?????0010011")
    // SRLI  = BitPat("b000000???????????101?????0010011")
    // SRAI  = BitPat("b010000???????????101?????0010011")
    is("b0010011".U){
      ImmCtrl     := immI
      ALUSrc1Ctrl := s1Rs1
      ALUSrc2Ctrl := s2Imm
      RegWEn      := true.B
      RegWSrc     := aluSrc
      Rs1REn      := true.B
      switch(Funct3){
        is("b000".U) {ALUOP := opAdd}
        is("b010".U) {ALUOP := opSLess}
        is("b011".U) {ALUOP := opULess}
        is("b100".U) {ALUOP := opXor}
        is("b110".U) {ALUOP := opOr}
        is("b111".U) {ALUOP := opAnd}
        is("b001".U) { when(Funct7 === BitPat("b000000?")) {ALUOP := opLShift}}
        is("b101".U) { when(Funct7 === BitPat("b000000?")) {ALUOP := opURShift}
                  .elsewhen(Funct7 === BitPat("b010000?")) {ALUOP := opSRShift}}
      }

    }



    // ADDIW = BitPat("b?????????????????000?????0011011")
    // SLLIW = BitPat("b0000000??????????001?????0011011")
    // SRLIW = BitPat("b0000000??????????101?????0011011")
    // SRAIW = BitPat("b0100000??????????101?????0011011")
    is("b0011011".U){
      ImmCtrl     := immI
      ALUSrc1Ctrl := s1Rs1
      ALUSrc2Ctrl := s2Imm
      RegWEn      := true.B
      RegWSrc     := aluSrc
      Rs1REn      := true.B
      switch(Funct3){
        is("b000".U) {WordALUOP := opWordAdd}
        is("b001".U) {WordALUOP := opWordLShift}
        is("b101".U) {when(Funct7 === "b0000000".U) {WordALUOP := opWordURShift}
                 .elsewhen(Funct7 === "b0100000".U) {WordALUOP := opWordSRShift}}
      }

    }

    // rs1 op rs2
    // ADD  = BitPat("b0000000??????????000?????0110011")
    // SUB  = BitPat("b0100000??????????000?????0110011")
    // SLL  = BitPat("b0000000??????????001?????0110011")
    // SLT  = BitPat("b0000000??????????010?????0110011")
    // SLTU = BitPat("b0000000??????????011?????0110011")
    // XOR  = BitPat("b0000000??????????100?????0110011")
    // SRL  = BitPat("b0000000??????????101?????0110011")
    // SRA  = BitPat("b0100000??????????101?????0110011")
    // OR   = BitPat("b0000000??????????110?????0110011")
    // AND  = BitPat("b0000000??????????111?????0110011")
    is("b0110011".U){
      ALUSrc1Ctrl := s1Rs1
      ALUSrc2Ctrl := s2Rs2
      RegWEn      := true.B
      RegWSrc     := aluSrc
      Rs1REn      := true.B
      Rs2REn      := true.B
      switch(Funct7){
        is("b0000000".U) {
          switch(Funct3){
            is("b000".U) {ALUOP := opAdd}
            is("b001".U) {ALUOP := opLShift}
            is("b010".U) {ALUOP := opSLess}
            is("b011".U) {ALUOP := opULess}
            is("b100".U) {ALUOP := opXor}
            is("b101".U) {ALUOP := opURShift}
            is("b110".U) {ALUOP := opOr}
            is("b111".U) {ALUOP := opAnd}
          }
        }
        is("b0100000".U) {
          switch(Funct3){
            is("b000".U) {ALUOP := opSub}
            is("b101".U) {ALUOP := opSRShift}
          }
        }
      }
    }

    // ADDW  = BitPat("b0000000??????????000?????0111011")
    // SUBW  = BitPat("b0100000??????????000?????0111011")
    // SLLW  = BitPat("b0000000??????????001?????0111011")
    // SRLW  = BitPat("b0000000??????????101?????0111011")
    // SRAW  = BitPat("b0100000??????????101?????0111011")
    is("b0111011".U){
      ALUSrc1Ctrl := s1Rs1
      ALUSrc2Ctrl := s2Rs2
      RegWEn      := true.B
      RegWSrc     := aluSrc
      Rs1REn      := true.B
      Rs2REn      := true.B
      WordALUEn   := true.B
      switch(Funct3){
        is("b000".U){
          switch(Funct7){
            is("b0000000".U) {WordALUOP := opWordAdd}
            is("b0100000".U) {WordALUOP := opWordSub}
          }
        }
        is("b001".U){
          switch(Funct7){
            is("b0000000".U) {WordALUOP := opWordLShift}
          }
        }
        is("b101".U){
          switch(Funct7){
            is("b0000000".U) {WordALUOP := opWordURShift}
            is("b0100000".U) {WordALUOP := opWordSRShift}
          }
        }
      }
    }

    

    // Jump & Link
    // JAL  = BitPat("b?????????????????????????1101111")
    // JALR = BitPat("b?????????????????000?????1100111")
    is("b1101111".U){
      ImmCtrl     := immJ
      JumpCtrl    := jalCtrl
      ALUOP       := opAdd
      ALUSrc1Ctrl := s1PC
      ALUSrc2Ctrl := s2Four
      RegWEn      := true.B
      RegWSrc     := aluSrc
    }
    is("b1100111".U){
      ImmCtrl     := immI
      JumpCtrl    := jalrCtrl
      ALUOP       := opAdd
      ALUSrc1Ctrl := s1PC
      ALUSrc2Ctrl := s2Four
      RegWEn      := true.B
      RegWSrc     := aluSrc
      Rs1REn      := true.B
    }


    // CSR Access
    // CSRRW  = BitPat("b?????????????????001?????1110011")
    // CSRRS  = BitPat("b?????????????????010?????1110011")
    // CSRRC  = BitPat("b?????????????????011?????1110011")
    // CSRRWI = BitPat("b?????????????????101?????1110011")
    // CSRRSI = BitPat("b?????????????????110?????1110011")
    // CSRRCI = BitPat("b?????????????????111?????1110011")
    // is("b1110011"){

    // }


    // MUL    = BitPat("b0000001??????????000?????0110011")
    // MULH   = BitPat("b0000001??????????001?????0110011")
    // MULHSU = BitPat("b0000001??????????010?????0110011")
    // MULHU  = BitPat("b0000001??????????011?????0110011")
    // DIV    = BitPat("b0000001??????????100?????0110011")
    // DIVU   = BitPat("b0000001??????????101?????0110011")
    // REM    = BitPat("b0000001??????????110?????0110011")
    // REMU   = BitPat("b0000001??????????111?????0110011")
    // is("b0110011"){

    // }

    // MULW   = BitPat("b0000001??????????000?????0111011")
    // DIVW   = BitPat("b0000001??????????100?????0111011")
    // DIVUW  = BitPat("b0000001??????????101?????0111011")
    // REMW   = BitPat("b0000001??????????110?????0111011")
    // REMUW  = BitPat("b0000001??????????111?????0111011")
    // is("b0111011"){
      
    // }


    // FENCE  = BitPat("b0000????????00000000000000001111")
    // FENCEI = BitPat("b00000000000000000001000000001111")
    // is("b0001111"){

    // }


    // ECALL  = BitPat("b00000000000000000000000001110011")
    // EBREAK = BitPat("b00000000000100000000000001110011")
    // is("b1110011"){

    // }

  }


  io.ID.ImmCtrl       := ImmCtrl
  io.ID.JumpCtrl      := JumpCtrl

  io.EX_A.ALUOP       := ALUOP
  io.EX_A.ALUSrc1Ctrl := ALUSrc1Ctrl
  io.EX_A.ALUSrc2Ctrl := ALUSrc2Ctrl
  io.EX_A.WordALUEn   := WordALUEn
  io.EX_A.WordALUOP   := WordALUOP

  io.EX_B.MEMREn      := MEMREn
  io.EX_B.MEMRCtrl    := MEMRCtrl
  io.EX_B.MEMWEn      := MEMWEn
  io.EX_B.MEMWCtrl    := MEMWCtrl

  io.EX_C.RegWEn      := RegWEn
  io.EX_C.RegWSrc     := RegWSrc
  io.EX_C.Rd          := Rd

  io.EX_D.Rs1REn      := Rs1REn
  io.EX_D.Rs2REn      := Rs2REn
  io.EX_D.Rs1         := Rs1
  io.EX_D.Rs2         := Rs2
}




/*******************************
*   Register file
*******************************/

class RegFile_ID_IO extends Bundle{
  val Rs1    = Input(UInt(5.W))
  val Rs2    = Input(UInt(5.W))
}

class RegFile_WB_IO extends Bundle{
  val RegWEn = Input(Bool())
  val WData  = Input(UInt(64.W))
  val Rd     = Input(UInt(5.W))
}

class RegFile_EX_IO extends Bundle{
  val RData1 = Output(UInt(64.W))
  val RData2 = Output(UInt(64.W))
}


class RegFile_IO extends Bundle{
  val ID = new RegFile_ID_IO()
  val WB = new RegFile_WB_IO()
  val EX = new RegFile_EX_IO()
}



class RegFile extends Module {
  val io = IO(new RegFile_IO())

  val Rs1    = io.ID.Rs1
  val Rs2    = io.ID.Rs2
  val Rd     = io.WB.Rd
  val WData  = io.WB.WData
  val WEn    = io.WB.RegWEn
  val RData1 = WireDefault(0.U(64.W))
  val RData2 = WireDefault(0.U(64.W))

  val gprFile = RegInit( VecInit(  Seq.fill(32)(0.U(64.W))  ) )
  RData1 := gprFile(Rs1)
  RData2 := gprFile(Rs2)
  when(Rs1 === Rd && WEn && Rd =/= 0.U){ RData1 := WData}
  when(Rs2 === Rd && WEn && Rd =/= 0.U){ RData2 := WData}
  when(WEn){ gprFile(Rd) := WData}
  gprFile(0) := 0.U(64.W)

  io.EX.RData1 := RData1
  io.EX.RData2 := RData2
}







/***************************************
*   Imm Sext Module
***************************************/

class ImmSext_IO extends Bundle{
  val i31To7  = Input(UInt(25.W))
  val immCtrl = Input(UInt(3.W))
  val imm64   = Output(UInt(64.W))
}



class ImmSext extends Module {
    val io = IO(new ImmSext_IO())

    val immR :: immI :: immS :: immB :: immU :: immJ :: immCSRI :: Nil = Enum(7)

    val i31To7  = io.i31To7
    val immCtrl = io.immCtrl
    val out     = WireDefault(0.U(64.W))


    switch(immCtrl){
        is(immI)    { out := Cat(Fill(64-12, i31To7(31-7)),  i31To7(31-7, 20-7))}
        is(immS)    { out := Cat(Fill(64-12, i31To7(31-7)),  i31To7(31-7, 25-7),  i31To7(11-7, 7-7))}
        is(immB)    { out := Cat(Fill(64-13, i31To7(31-7)),  i31To7(31-7),  i31To7(7-7), i31To7(30-7, 25-7), i31To7(11-7, 8-7), 0.U(1.W))}
        is(immU)    { out := Cat(Fill(64-32, i31To7(31-7)), i31To7(31-7, 12-7), 0.U(12.W))}
        is(immJ)    { out := Cat(Fill(64-21, i31To7(31-7)), i31To7(31-7), i31To7(19-7, 12-7), i31To7(20-7), i31To7(30-7, 21-7), 0.U(1.W))}
        is(immCSRI) { out := Cat(Fill(64-5, 0.U(1.W)), i31To7(19-7, 15-7))}
    }
    io.imm64 := out
}




/***************************************
*   Transfer Module
***************************************/

class Transfer_ID_IOA extends Bundle{
  val JumpCtrl = Input(UInt(4.W))
}

class Transfer_ID_IOB extends Bundle{
  val PC      = Input(UInt(32.W))
  val Imm     = Input(UInt(64.W))
  val Rs1Data = Input(UInt(64.W))
  val Rs2Data = Input(UInt(64.W)) 
}

class Transfer_PC_IO extends Bundle{
  val JumpEn = Output(Bool())
  val PC     = Output(UInt(32.W))
}

class Transfer_IO extends Bundle{
  val ID_A = new Transfer_ID_IOA()
  val ID_B = new Transfer_ID_IOB()
  val PC   = new Transfer_PC_IO()
}


class Transfer extends Module{
  val io = IO(new Transfer_IO())

  val noneCtrl :: equal :: notEqual  :: sLess   :: sMoreThan :: uLess :: uMoreThan :: jalCtrl :: jalrCtrl :: Nil = Enum(9)

  val JumpCtrl  = io.ID_A.JumpCtrl
  val PC        = io.ID_B.PC
  val Imm       = io.ID_B.Imm
  val Rs1Data32 = io.ID_B.Rs1Data(31, 0)
  val Rs1Data   = io.ID_B.Rs1Data
  val Rs2Data   = io.ID_B.Rs2Data
  val PCADDImm  = WireDefault(0.U(32.W))
  val Rs1ADDImm = WireDefault(0.U(32.W))
  val PCADD4    = WireDefault(0.U(32.W))
  val nextPC    = WireDefault(0.U(32.W))


  PCADDImm  := PC + Imm
  Rs1ADDImm := (Rs1Data32 + Imm) & "hfffffffe".U
  PCADD4    := PC + 4.U
  
  nextPC       :=  PCADD4
  io.PC.JumpEn :=  false.B
  switch(JumpCtrl){
    is(equal){ 
      when(Rs1Data === Rs2Data){
        io.PC.JumpEn := true.B
        nextPC := PCADDImm
      }
    }
    is(notEqual){
      when(Rs1Data =/= Rs2Data){
        io.PC.JumpEn := true.B
        nextPC := PCADDImm
      }
    }
    is(sLess){
      when(Rs1Data.asSInt < Rs2Data.asSInt){
        io.PC.JumpEn := true.B
        nextPC := PCADDImm
      }
    }
    is(sMoreThan){
      when(Rs1Data.asSInt >= Rs2Data.asSInt){
        io.PC.JumpEn := true.B
        nextPC := PCADDImm
      }
    }
    is(uLess){
      when(Rs1Data < Rs2Data){
        io.PC.JumpEn := true.B
        nextPC := PCADDImm
      }
    }
    is(uMoreThan){
      when(Rs1Data >= Rs2Data){
        io.PC.JumpEn := true.B
        nextPC := PCADDImm
      }
    }
    is(jalCtrl){
      io.PC.JumpEn := true.B
      nextPC := PCADDImm
    }
    is(jalrCtrl){
      io.PC.JumpEn := true.B
      nextPC := Rs1ADDImm
    }
  }
  io.PC.PC := nextPC  
}







/***************************************
*   ID stage Module
***************************************/

class IDStage_IF_IO extends Bundle{
  val Instr = Input(UInt(32.W))
  val PC    = Input(UInt(32.W))
}

class IDStage_PC_IO extends Bundle{
  val PC = Output(UInt(32.W))
}

class IDStage_HAZARD_IO extends Bundle{
  val JumpEn = Output(Bool())
}

class IDStage_EX_IO extends Bundle{
  val PC     = Output(UInt(32.W))
  val Imm    = Output(UInt(64.W))
  val RData1 = Output(UInt(64.W))
  val RData2 = Output(UInt(64.W))
}

class IDStage_DATAPATH_IO extends Bundle{
  val Rs1Ctrl = Input(UInt(2.W))
  val Rs2Ctrl = Input(UInt(2.W))
  val MEMData = Input(UInt(64.W))
  val WBData  = Input(UInt(64.W))
}


class IDStage_IO extends Bundle{
  val IF       = new IDStage_IF_IO()
  val EX_A     = new Decoder_EX_IOA()
  val EX_B     = new Decoder_EX_IOB()
  val EX_C     = new Decoder_EX_IOC()
  val EX_D     = new Decoder_EX_IOD()
  val EX_E     = new IDStage_EX_IO()
  val WB       = new RegFile_WB_IO()
  val PC       = new IDStage_PC_IO()
  val HAZARD   = new IDStage_HAZARD_IO()
  val DATAPATH = new IDStage_DATAPATH_IO()
}



class IDStage extends Module{
  val io = IO(new IDStage_IO())

  val Decoder  = Module(new Decoder())
  val RegFile  = Module(new RegFile())
  val ImmSext  = Module(new ImmSext())
  val Transfer = Module(new Transfer())

 
  Decoder.io.IF.Instr := io.IF.Instr
  Decoder.io.EX_A <> io.EX_A
  Decoder.io.EX_B <> io.EX_B
  Decoder.io.EX_C <> io.EX_C
  Decoder.io.EX_D <> io.EX_D


  val Rs1 = io.IF.Instr(19, 15)
  val Rs2 = io.IF.Instr(24, 20)
  RegFile.io.ID.Rs1 := Rs1
  RegFile.io.ID.Rs2 := Rs2
  io.WB <> RegFile.io.WB
  val RegData1 = RegFile.io.EX.RData1
  val RegData2 = RegFile.io.EX.RData2


  val Imm31To7 = io.IF.Instr(31, 7)
  ImmSext.io.i31To7  := Imm31To7
  ImmSext.io.immCtrl := Decoder.io.ID.ImmCtrl
  io.EX_E.Imm := ImmSext.io.imm64



  val noneData :: memData :: wbData :: Nil = Enum(3)
  val RData1 = WireDefault(0.U(64.W))
  val RData2 = WireDefault(0.U(64.W))

  when(io.DATAPATH.Rs1Ctrl === memData) { RData1 := io.DATAPATH.MEMData}
  .elsewhen(io.DATAPATH.Rs1Ctrl === wbData) {RData1 := io.DATAPATH.WBData}
  .otherwise {RData1 := RegData1}
  when(io.DATAPATH.Rs2Ctrl === memData) { RData2 := io.DATAPATH.MEMData}
  .elsewhen(io.DATAPATH.Rs2Ctrl === wbData) {RData2 := io.DATAPATH.WBData}
  .otherwise {RData2 := RegData2}

  io.EX_E.PC := io.IF.PC
  io.EX_E.RData1 := RData1
  io.EX_E.RData2 := RData2




  Transfer.io.ID_A.JumpCtrl := Decoder.io.ID.JumpCtrl
  Transfer.io.ID_B.PC       := io.IF.PC
  Transfer.io.ID_B.Imm      := ImmSext.io.imm64
  Transfer.io.ID_B.Rs1Data  := RData1
  Transfer.io.ID_B.Rs2Data  := RData2
  io.HAZARD.JumpEn := Transfer.io.PC.JumpEn
  io.PC.PC         := Transfer.io.PC.PC
}




object IDStage extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(new IDStage())
}
