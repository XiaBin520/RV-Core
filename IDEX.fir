circuit IDEX :
  module IDEX :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip Flush : UInt<1>, flip Hold : UInt<1>, ID : { flip ID_A : { ALUOP : UInt<4>, ALUSrc1Ctrl : UInt<3>, ALUSrc2Ctrl : UInt<3>, WordALUEn : UInt<1>, WordALUOP : UInt<3>}, flip ID_B : { MEMREn : UInt<1>, MEMRCtrl : UInt<3>, MEMWEn : UInt<1>, MEMWCtrl : UInt<3>}, flip ID_C : { RegWEn : UInt<1>, RegWSrc : UInt<2>, Rd : UInt<5>}, flip ID_D : { PC : UInt<32>, Imm : UInt<64>, RData1 : UInt<64>, RData2 : UInt<64>}}, EX : { EX_A : { ALUOP : UInt<4>, ALUSrc1Ctrl : UInt<3>, ALUSrc2Ctrl : UInt<3>, WordALUEn : UInt<1>, WordALUOP : UInt<3>}, EX_B : { MEMREn : UInt<1>, MEMRCtrl : UInt<3>, MEMWEn : UInt<1>, MEMWCtrl : UInt<3>}, EX_C : { RegWEn : UInt<1>, RegWSrc : UInt<2>, Rd : UInt<5>}, EX_D : { PC : UInt<32>, Imm : UInt<64>, RData1 : UInt<64>, RData2 : UInt<64>}}}

    reg ALUOPReg : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[ID_EX.scala 34:31]
    reg ALUSrc1CtrlReg : UInt<3>, clock with :
      reset => (reset, UInt<3>("h0")) @[ID_EX.scala 35:31]
    reg ALUSrc2CtrlReg : UInt<3>, clock with :
      reset => (reset, UInt<3>("h0")) @[ID_EX.scala 36:31]
    reg WordALUEnReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[ID_EX.scala 37:31]
    reg WordALUOPReg : UInt<3>, clock with :
      reset => (reset, UInt<3>("h0")) @[ID_EX.scala 38:31]
    reg MEMREnReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[ID_EX.scala 40:28]
    reg MEMRCtrlReg : UInt<3>, clock with :
      reset => (reset, UInt<3>("h0")) @[ID_EX.scala 41:28]
    reg MEMWEnReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[ID_EX.scala 42:28]
    reg MEMWCtrlReg : UInt<3>, clock with :
      reset => (reset, UInt<3>("h0")) @[ID_EX.scala 43:28]
    reg RegWEnReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[ID_EX.scala 45:27]
    reg RegWSrcReg : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[ID_EX.scala 46:27]
    reg RdReg : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[ID_EX.scala 47:27]
    reg PCReg : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[ID_EX.scala 49:26]
    reg ImmReg : UInt<64>, clock with :
      reset => (reset, UInt<64>("h0")) @[ID_EX.scala 50:26]
    reg RData1Reg : UInt<64>, clock with :
      reset => (reset, UInt<64>("h0")) @[ID_EX.scala 51:26]
    reg RData2Reg : UInt<64>, clock with :
      reset => (reset, UInt<64>("h0")) @[ID_EX.scala 52:26]
    when io.Flush : @[ID_EX.scala 55:17]
      MEMREnReg <= UInt<1>("h0") @[ID_EX.scala 56:15]
      MEMWEnReg <= UInt<1>("h0") @[ID_EX.scala 57:15]
      RegWEnReg <= UInt<1>("h0") @[ID_EX.scala 58:15]
    else :
      node _T = eq(io.Hold, UInt<1>("h0")) @[ID_EX.scala 60:13]
      when _T : @[ID_EX.scala 60:22]
        ALUOPReg <= io.ID.ID_A.ALUOP @[ID_EX.scala 61:20]
        ALUSrc1CtrlReg <= io.ID.ID_A.ALUSrc1Ctrl @[ID_EX.scala 62:20]
        ALUSrc2CtrlReg <= io.ID.ID_A.ALUSrc2Ctrl @[ID_EX.scala 63:20]
        WordALUEnReg <= io.ID.ID_A.WordALUEn @[ID_EX.scala 64:20]
        WordALUOPReg <= io.ID.ID_A.WordALUOP @[ID_EX.scala 65:20]
        MEMREnReg <= io.ID.ID_B.MEMREn @[ID_EX.scala 67:17]
        MEMRCtrlReg <= io.ID.ID_B.MEMRCtrl @[ID_EX.scala 68:17]
        MEMWEnReg <= io.ID.ID_B.MEMWEn @[ID_EX.scala 69:17]
        MEMWCtrlReg <= io.ID.ID_B.MEMWCtrl @[ID_EX.scala 70:17]
        RegWEnReg <= io.ID.ID_C.RegWEn @[ID_EX.scala 72:16]
        RegWSrcReg <= io.ID.ID_C.RegWSrc @[ID_EX.scala 73:16]
        RdReg <= io.ID.ID_C.Rd @[ID_EX.scala 74:16]
        PCReg <= io.ID.ID_D.PC @[ID_EX.scala 76:15]
        ImmReg <= io.ID.ID_D.Imm @[ID_EX.scala 77:15]
        RData1Reg <= io.ID.ID_D.RData1 @[ID_EX.scala 78:15]
        RData2Reg <= io.ID.ID_D.RData2 @[ID_EX.scala 79:15]
    io.EX.EX_A.ALUOP <= ALUOPReg @[ID_EX.scala 84:26]
    io.EX.EX_A.ALUSrc1Ctrl <= ALUSrc1CtrlReg @[ID_EX.scala 85:26]
    io.EX.EX_A.ALUSrc2Ctrl <= ALUSrc2CtrlReg @[ID_EX.scala 86:26]
    io.EX.EX_A.WordALUEn <= WordALUEnReg @[ID_EX.scala 87:26]
    io.EX.EX_A.WordALUOP <= WordALUOPReg @[ID_EX.scala 88:26]
    io.EX.EX_B.MEMREn <= MEMREnReg @[ID_EX.scala 90:23]
    io.EX.EX_B.MEMRCtrl <= MEMRCtrlReg @[ID_EX.scala 91:23]
    io.EX.EX_B.MEMWEn <= MEMWEnReg @[ID_EX.scala 92:23]
    io.EX.EX_B.MEMWCtrl <= MEMWCtrlReg @[ID_EX.scala 93:23]
    io.EX.EX_C.RegWEn <= RegWEnReg @[ID_EX.scala 95:22]
    io.EX.EX_C.RegWSrc <= RegWSrcReg @[ID_EX.scala 96:22]
    io.EX.EX_C.Rd <= RdReg @[ID_EX.scala 97:22]
    io.EX.EX_D.PC <= PCReg @[ID_EX.scala 99:22]
    io.EX.EX_D.Imm <= ImmReg @[ID_EX.scala 100:22]
    io.EX.EX_D.RData1 <= RData1Reg @[ID_EX.scala 101:22]
    io.EX.EX_D.RData2 <= RData2Reg @[ID_EX.scala 102:22]

