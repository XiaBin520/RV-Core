
import chisel3._
import chisel3.util._

/***
ImmCtrl     --> ImmSext Ctrl
JumpCtrl    --> branch and jump Ctrl

ALUOP       --> ALU Ctrl
ALUData1Ctrl --> ALU source 1 Ctrl
ALUData2Ctrl --> ALU source 2 Ctrl
WordALUEn      --> ALUW output
WordALUOP      --> ALUW Ctrl

REn      --> memory read enable signal
RCtrl    --> memory read size(byte) and modle
WEn      --> memory write enable signal
WCtrl    --> memory write size(byte) and modle

WEn      --> register write enable signal
Rd       --> register file rd

Rs1        --> rs1 register
Rs2        --> rs2 register
Rs1En      --> read rs1 register Enable
Rs2En      --> read rs2 rregister Enable

----> key ctrl signal: MEMREn, MEMWEn, RegWEn, Rs1En, Rs2En
***/

class Decoder_INSTRIN_IO extends Bundle{
  val Instr = Input(UInt(32.W))
}

class Decoder_IMMCTRL_IO extends Bundle{
  val ImmCtrl  = Output(UInt(3.W))
}

class Decoder_JUMPCTRL_IO extends Bundle{
  val JumpCtrl = Output(UInt(4.W))
}

class Decoder_ALUCTRL_IO extends Bundle{
  val ALUOP        = Output(UInt(4.W))
  val ALUData1Ctrl = Output(UInt(3.W))
  val ALUData2Ctrl = Output(UInt(3.W))
  val WordALUEn    = Output(Bool())
  val WordALUOP    = Output(UInt(3.W))
}

class Decoder_MEMCTRL_IO extends Bundle{
  val REn   = Output(Bool())
  val RCtrl = Output(UInt(3.W))
  val WEn   = Output(Bool())
  val WCtrl = Output(UInt(3.W))
}

class Decoder_REGWRITE_IO extends Bundle{
  val WEn = Output(Bool())
  val Rd  = Output(UInt(5.W))
}

class Decoder_REGREAD_IOA extends Bundle{
  val Rs1    = Output(UInt(5.W))
  val Rs2    = Output(UInt(5.W))
}

class Decoder_REGREAD_IOB extends Bundle{
  val Rs1En = Output(Bool())
  val Rs2En = Output(Bool())
}




class Decoder_IO extends Bundle{
  val INSTRIN   = new Decoder_INSTRIN_IO()
  val IMMCTRL   = new Decoder_IMMCTRL_IO()
  val JUMPCTRL  = new Decoder_JUMPCTRL_IO()
  val ALUCTRL   = new Decoder_ALUCTRL_IO()
  val MEMCTRL   = new Decoder_MEMCTRL_IO()
  val REGWRITE  = new Decoder_REGWRITE_IO()
  val REGREAD_A = new Decoder_REGREAD_IOA()
  val REGREAD_B = new Decoder_REGREAD_IOB()
}




class Decoder extends RawModule{
  val io = IO(new Decoder_IO())

  val Opcode = io.INSTRIN.Instr(6, 0)
  val Rd     = io.INSTRIN.Instr(11, 7)
  val Funct3 = io.INSTRIN.Instr(14, 12)
  val Rs1    = io.INSTRIN.Instr(19, 15)
  val Rs2    = io.INSTRIN.Instr(24, 20)
  val Funct7 = io.INSTRIN.Instr(31, 25)


  val immR :: immI :: immS :: immB :: immU :: immJ :: immCSRI :: Nil = Enum(7)
  val ImmCtrl = WireDefault(immR)

  val noneCtrl :: equal :: notEqual  :: sLess   :: sMoreThan :: uLess :: uMoreThan :: jalCtrl :: jalrCtrl :: Nil = Enum(9)
  val JumpCtrl = WireDefault(noneCtrl)
  
  val opAdd :: opSub :: opSLess :: opULess :: opXor :: opOr :: opAnd :: opLShift :: opURShift :: opSRShift :: Nil = Enum(10)
  val ALUOP = WireDefault(opAdd)

  val s1None :: s1Zero :: s1PC  :: s1Rs1  ::          Nil = Enum(4)
  val s2None :: s2Imm  :: s2Rs2 :: s2Four :: s2CSR :: Nil = Enum(5)
  val ALUData1Ctrl = WireDefault(s1None)
  val ALUData2Ctrl = WireDefault(s2None)

  val opWordNone :: opWordAdd :: opWordSub :: opWordLShift :: opWordURShift :: opWordSRShift :: Nil = Enum(6)
  val WordALUEn = WireDefault(false.B)
  val WordALUOP = WireDefault(opWordNone)

  val noneMemR :: memRSOne :: memRSTwo :: memRSFour :: memRUOne :: memRUTwo :: memRUFour :: memREight :: Nil = Enum(8)
  val MEMREn   = WireDefault(false.B)
  val MEMRCtrl = WireDefault(noneMemR)

  val noneMemW :: memWOne :: memWTwo :: memWFour :: memWEight :: Nil = Enum(5)
  val MEMWEn   = WireDefault(false.B)
  val MEMWCtrl = WireDefault(noneMemW)

  val RegWEn = WireDefault(false.B)

  val Rs1En = WireDefault(false.B)
  val Rs2En = WireDefault(false.B)


  switch(Opcode){
    // LUI   = BitPat("b?????????????????????????0110111")
    is("b0110111".U){
      ImmCtrl      := immU
      ALUOP        := opAdd
      ALUData1Ctrl := s1Zero
      ALUData2Ctrl := s2Imm
      RegWEn       := true.B
    }
    // AUIPC = BitPat("b?????????????????????????0010111")
    is("b0010111".U){
      ImmCtrl     := immU
      ALUOP       := opAdd
      ALUData1Ctrl := s1PC
      ALUData2Ctrl := s2Imm
      RegWEn      := true.B
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
      Rs1En   := true.B
      Rs2En   := true.B
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
      ALUData1Ctrl := s1Rs1
      ALUData2Ctrl := s2Imm
      MEMREn := true.B
      RegWEn := true.B
      Rs1En  := true.B
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
      ALUOP        := opAdd
      ALUData1Ctrl := s1Rs1
      ALUData2Ctrl := s2Imm
      MEMWEn := true.B
      Rs1En  := true.B
      Rs2En  := true.B
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
      ALUData1Ctrl := s1Rs1
      ALUData2Ctrl := s2Imm
      RegWEn := true.B
      Rs1En  := true.B
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
      ALUData1Ctrl := s1Rs1
      ALUData2Ctrl := s2Imm
      RegWEn    := true.B
      Rs1En     := true.B
      WordALUEn := true.B
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
      ALUData1Ctrl := s1Rs1
      ALUData2Ctrl := s2Rs2
      RegWEn := true.B
      Rs1En  := true.B
      Rs2En  := true.B
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
      ALUData1Ctrl := s1Rs1
      ALUData2Ctrl := s2Rs2
      RegWEn := true.B
      Rs1En  := true.B
      Rs2En  := true.B
      WordALUEn := true.B
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
      ALUOP        := opAdd
      ALUData1Ctrl := s1PC
      ALUData2Ctrl := s2Four
      RegWEn := true.B
    }
    is("b1100111".U){
      ImmCtrl     := immI
      JumpCtrl    := jalrCtrl
      ALUOP        := opAdd
      ALUData1Ctrl := s1PC
      ALUData2Ctrl := s2Four
      RegWEn := true.B
      Rs1En  := true.B
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


  io.IMMCTRL.ImmCtrl := ImmCtrl

  io.JUMPCTRL.JumpCtrl := JumpCtrl

  io.ALUCTRL.ALUOP        := ALUOP
  io.ALUCTRL.ALUData1Ctrl := ALUData1Ctrl
  io.ALUCTRL.ALUData2Ctrl := ALUData2Ctrl
  io.ALUCTRL.WordALUEn    := WordALUEn
  io.ALUCTRL.WordALUOP    := WordALUOP

  io.MEMCTRL.REn   := MEMREn
  io.MEMCTRL.RCtrl := MEMRCtrl
  io.MEMCTRL.WEn   := MEMWEn
  io.MEMCTRL.WCtrl := MEMWCtrl

  io.REGWRITE.WEn := RegWEn
  io.REGWRITE.Rd  := Rd

  io.REGREAD_A.Rs1 := Rs1
  io.REGREAD_A.Rs2 := Rs2

  io.REGREAD_B.Rs1En := Rs1En
  io.REGREAD_B.Rs2En := Rs2En
}





object Decoder extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(new Decoder())
}
