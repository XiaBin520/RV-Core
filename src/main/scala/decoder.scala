
import chisel3._
import chisel3.util._

/***
immCtrl     --> immmSext Ctrl
ctrlModel   --> branch and jump Ctrl
aluOP       --> alu Ctrl
aluSrc1Ctrl --> alu source 1 Ctrl
aluSrc2Ctrl --> alu source 2 Ctrl
aluSextByte --> alu output size(Byte)
memREn      --> memory read enable signal
memRCtrl    --> memory read size(byte) and modle
memWEn      --> memory write enable signal
memWCtrl    --> memory write size(byte) and modle
regWEn      --> register write enable signal
regWSrc     --> register write data source from
rd          --> register file rd
rs1REn      --> read rs1 register Enable
rs2REn      --> read rs2 rregister Enable
rs1         --> rs1 register
rs2         --> rs2 register

----> key ctrl signal: memREn, memWEn, regWEn, rs1REn, rs2REn
***/

class decoder extends Module{
  val io = IO(new Bundle{
    val instr       = Input(UInt(32.W))
    val immCtrl     = Output(UInt(3.W))
    val ctrlModel   = Output(UInt(4.W))
    val aluOP       = Output(UInt(4.W))
    val aluSrc1Ctrl = Output(UInt(3.W))
    val aluSrc2Ctrl = Output(UInt(3.W))
    val aluSextByte = Output(UInt(3.W))
    val memREn      = Output(Bool())
    val memRCtrl    = Output(UInt(3.W))
    val memWEn      = Output(Bool())
    val memWCtrl    = Output(UInt(3.W))
    val regWEn      = Output(Bool())
    val regWSrc     = Output(UInt(2.W))
    val rd          = Output(UInt(5.W))
    val rs1REn      = Output(Bool())
    val rs2REn      = Output(Bool())
    val rs1         = Output(UInt(5.W))
    val rs2         = Output(UInt(5.W))
  })


  val opcode = io.instr(6, 0)
  val rd     = io.instr(11, 7)
  val funct3 = io.instr(14, 12)
  val rs1    = io.instr(19, 15)
  val rs2    = io.instr(24, 20)
  val funct7 = io.instr(31, 25)



  val immR :: immI :: immS :: immB :: immU :: immJ :: immCSRI :: Nil = Enum(7)
  val immCtrl = WireDefault(immR)

  val noneCtrl :: equal :: notEqual  :: sLess   :: sMoreThan :: uLess :: uMoreThan :: jalCtrl :: jalrCtrl :: Nil = Enum(9)
  val ctrlModel = WireDefault(noneCtrl)
  
  val opAdd :: opSub :: opSLess :: opULess :: opXor :: opOr :: opAnd :: opLShift :: opURShift :: opSRShift :: Nil = Enum(10)
  val aluOP = WireDefault(opAdd)

  val s1None :: s1Zero :: s1PC  :: s1Rs1  ::          Nil = Enum(4)
  val s2None :: s2Imm  :: s2Rs2 :: s2Four :: s2CSR :: Nil = Enum(5)
  val aluSrc1Ctrl = WireDefault(s1None)
  val aluSrc2Ctrl = WireDefault(s2None)

  val noneByte :: oneByte :: twoByte :: fourByte :: eightByte :: Nil = Enum(5)
  val aluSextByte = WireDefault(noneByte)

  val noneMemR :: memRSOne :: memRSTwo :: memRSFour :: memRUOne :: memRUTwo :: memRUFour :: memREight :: Nil = Enum(8)
  val memREn      = WireDefault(false.B)
  val memRCtrl    = WireDefault(noneMemR)

  val noneMemW :: memWOne :: memWTwo :: memWFour :: memWEight :: Nil = Enum(5)
  val memWEn      = WireDefault(false.B)
  val memWCtrl    = WireDefault(noneMemW)

  val regWEn      = WireDefault(false.B)
  val noneSrc :: aluSrc :: memSrc :: Nil = Enum(3)
  val regWSrc     = WireDefault(noneSrc)

  val rs1REn      = WireDefault(false.B)
  val rs2REn      = WireDefault(false.B)


  switch(opcode){
    // LUI   = BitPat("b?????????????????????????0110111")
    is("b0110111".U){
      immCtrl     := immU
      aluOP       := opAdd
      aluSrc1Ctrl := s1Zero
      aluSrc2Ctrl := s2Imm
      aluSextByte := eightByte
      regWEn      := true.B
      regWSrc     := aluSrc     
    }
    // AUIPC = BitPat("b?????????????????????????0010111")
    is("b0010111".U){
      immCtrl     := immU
      aluOP       := opAdd
      aluSrc1Ctrl := s1PC
      aluSrc2Ctrl := s2Imm
      aluSextByte := eightByte
      regWEn      := true.B
      regWSrc     := aluSrc
    }
    // Branches
    // BEQ  = BitPat("b?????????????????000?????1100011")
    // BNE  = BitPat("b?????????????????001?????1100011")
    // BLT  = BitPat("b?????????????????100?????1100011")
    // BGE  = BitPat("b?????????????????101?????1100011")
    // BLTU = BitPat("b?????????????????110?????1100011")
    // BGEU = BitPat("b?????????????????111?????1100011")
    is("b1100011".U){
      immCtrl := immB
      rs1REn  := true.B
      rs2REn  := true.B
      switch(funct3){
        is("b000".U) {ctrlModel := equal}
        is("b001".U) {ctrlModel := notEqual}
        is("b100".U) {ctrlModel := sLess}
        is("b101".U) {ctrlModel := sMoreThan}
        is("b110".U) {ctrlModel := uLess}
        is("b111".U) {ctrlModel := uMoreThan}
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
      immCtrl     := immI
      aluOP       := opAdd
      aluSrc1Ctrl := s1Rs1
      aluSrc2Ctrl := s2Imm
      aluSextByte := eightByte
      memREn      := true.B
      regWEn      := true.B
      regWSrc     := memSrc
      rs1REn      := true.B
      switch(funct3){
        is("b000".U) {memRCtrl := memRSOne}
        is("b001".U) {memRCtrl := memRSTwo}
        is("b010".U) {memRCtrl := memRSFour}
        is("b011".U) {memRCtrl := memREight}
        is("b100".U) {memRCtrl := memRUOne}
        is("b101".U) {memRCtrl := memRUTwo}
        is("b110".U) {memRCtrl := memRUFour}
      }
    }
    // Stores
    // SB = BitPat("b?????????????????000?????0100011")
    // SH = BitPat("b?????????????????001?????0100011")
    // SW = BitPat("b?????????????????010?????0100011")
    // SD = BitPat("b?????????????????011?????0100011")
    is("b0100011".U){
      immCtrl     := immS
      aluOP       := opAdd
      aluSrc1Ctrl := s1Rs1
      aluSrc2Ctrl := s2Imm
      aluSextByte := eightByte
      memWEn      := true.B
      rs1REn      := true.B
      switch(funct3){
        is("b000".U) {memWCtrl := memWOne}
        is("b001".U) {memWCtrl := memWTwo}
        is("b010".U) {memWCtrl := memWFour}
        is("b011".U) {memWCtrl := memWEight} 
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
      immCtrl     := immI
      aluSrc1Ctrl := s1Rs1
      aluSrc2Ctrl := s2Imm
      aluSextByte := eightByte
      regWEn      := true.B
      regWSrc     := aluSrc
      rs1REn      := true.B
      switch(funct3){
        is("b000".U) {aluOP := opAdd}
        is("b010".U) {aluOP := opSLess}
        is("b011".U) {aluOP := opULess}
        is("b100".U) {aluOP := opXor}
        is("b110".U) {aluOP := opOr}
        is("b111".U) {aluOP := opAnd}
        is("b001".U) {
          when(funct7 === BitPat("b000000?")) {
                      aluOP := opLShift
          }
        }
        is("b101".U) {
          when(funct7 === BitPat("b000000?")) {
                      aluOP := opURShift
          }
          .elsewhen(funct7 === BitPat("b010000?")) {
                      aluOP := opSRShift
          }
        }
      }

    }



    // ADDIW = BitPat("b?????????????????000?????0011011")
    // SLLIW = BitPat("b0000000??????????001?????0011011")
    // SRLIW = BitPat("b0000000??????????101?????0011011")
    // SRAIW = BitPat("b0100000??????????101?????0011011")
    is("b0011011".U){
      immCtrl := immI
      aluSrc1Ctrl := s1Rs1
      aluSrc2Ctrl := s2Imm
      aluSextByte := fourByte
      regWEn := true.B
      regWSrc := aluSrc
      rs1REn := true.B
      switch(funct3){
        is("b000".U) {aluOP := opAdd}
        is("b001".U) {aluOP := opLShift}
        is("b101".U) {
          when(funct7 === "b0000000".U) {
                      aluOP := opURShift
          }
          .elsewhen(funct7 === "b0100000".U) {
                      aluOP := opSRShift
          }
        }
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
      aluSrc1Ctrl := s1Rs1
      aluSrc2Ctrl := s2Rs2
      aluSextByte := eightByte
      regWEn := true.B
      regWSrc := aluSrc
      rs1REn := true.B
      rs2REn := true.B
      switch(funct7){
        is("b0000000".U) {
          switch(funct3){
            is("b000".U) {aluOP := opAdd}
            is("b001".U) {aluOP := opLShift}
            is("b010".U) {aluOP := opSLess}
            is("b011".U) {aluOP := opULess}
            is("b100".U) {aluOP := opXor}
            is("b101".U) {aluOP := opURShift}
            is("b110".U) {aluOP := opOr}
            is("b111".U) {aluOP := opAnd}
          }
        }
        is("b0100000".U) {
          switch(funct3){
            is("b000".U) {aluOP := opSub}
            is("b101".U) {aluOP := opSRShift}
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
      aluSrc1Ctrl := s1Rs1
      aluSrc2Ctrl := s2Rs2
      aluSextByte := fourByte
      regWEn := true.B
      regWSrc := aluSrc
      rs1REn := true.B
      rs2REn := true.B
      switch(funct3){
        is("b000".U){
          switch(funct7){
            is("b0000000".U) {aluOP := opAdd}
            is("b0100000".U) {aluOP := opSub}
          }
        }
        is("b001".U){
          switch(funct7){
            is("b0000000".U) {aluOP := opLShift}
          }
        }
        is("b101".U){
          switch(funct7){
            is("b0000000".U) {aluOP := opURShift}
            is("b0100000".U) {aluOP := opSRShift}
          }
        }
      }
    }

    

    // Jump & Link
    // JAL  = BitPat("b?????????????????????????1101111")
    // JALR = BitPat("b?????????????????000?????1100111")
    is("b1101111".U){
      immCtrl     := immJ
      ctrlModel   := jalCtrl
      aluOP       := opAdd
      aluSrc1Ctrl := s1PC
      aluSrc2Ctrl := s2Four
      aluSextByte := eightByte
      regWEn      := true.B
      regWSrc     := aluSrc
    }
    is("b1100111".U){
      immCtrl     := immI
      ctrlModel   := jalrCtrl
      aluOP       := opAdd
      aluSrc1Ctrl := s1PC
      aluSrc2Ctrl := s2Four
      aluSextByte := eightByte
      regWEn      := true.B
      regWSrc     := aluSrc
      rs1REn      := true.B
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

    io.immCtrl     := immCtrl
    io.ctrlModel   := ctrlModel
    io.aluOP       := aluOP
    io.aluSrc1Ctrl := aluSrc1Ctrl
    io.aluSrc2Ctrl := aluSrc2Ctrl
    io.aluSextByte := aluSextByte
    io.memREn      := memREn
    io.memRCtrl    := memRCtrl
    io.memWEn      := memWEn
    io.memWCtrl    := memWCtrl
    io.regWEn      := regWEn
    io.regWSrc     := regWSrc
    io.rd          := rd
    io.rs1REn      := rs2REn
    io.rs2REn      := rs2REn
    io.rs1         := rs1
    io.rs2         := rs2
}



object decoder extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(new decoder())
}