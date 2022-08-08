circuit Transfer :
  module Transfer :
    output io : { DATAIN : { flip PC : UInt<32>, flip Imm : UInt<64>, flip RData1 : UInt<64>, flip RData2 : UInt<64>}, CTRL : { flip JumpCtrl : UInt<4>}, DATAOUT : { PC : UInt<32>}, CTRLOUT : { JumpEn : UInt<1>}}

    node RData132 = bits(io.DATAIN.RData1, 31, 0) @[Transfer.scala 52:35]
    wire PCADDImm : UInt<32>
    PCADDImm <= UInt<32>("h0")
    wire RData1ADDImm : UInt<32>
    RData1ADDImm <= UInt<32>("h0")
    wire PCADD4 : UInt<32>
    PCADD4 <= UInt<32>("h0")
    wire nextPC : UInt<32>
    nextPC <= UInt<32>("h0")
    node _PCADDImm_T = add(io.DATAIN.PC, io.DATAIN.Imm) @[Transfer.scala 63:19]
    node _PCADDImm_T_1 = tail(_PCADDImm_T, 1) @[Transfer.scala 63:19]
    PCADDImm <= _PCADDImm_T_1 @[Transfer.scala 63:13]
    node _RData1ADDImm_T = add(RData132, io.DATAIN.Imm) @[Transfer.scala 64:29]
    node _RData1ADDImm_T_1 = tail(_RData1ADDImm_T, 1) @[Transfer.scala 64:29]
    node _RData1ADDImm_T_2 = and(_RData1ADDImm_T_1, UInt<32>("hfffffffe")) @[Transfer.scala 64:36]
    RData1ADDImm <= _RData1ADDImm_T_2 @[Transfer.scala 64:16]
    node _PCADD4_T = add(io.DATAIN.PC, UInt<3>("h4")) @[Transfer.scala 65:19]
    node _PCADD4_T_1 = tail(_PCADD4_T, 1) @[Transfer.scala 65:19]
    PCADD4 <= _PCADD4_T_1 @[Transfer.scala 65:13]
    nextPC <= PCADD4 @[Transfer.scala 67:16]
    io.CTRLOUT.JumpEn <= UInt<1>("h0") @[Transfer.scala 68:21]
    node _T = eq(UInt<4>("h1"), io.CTRL.JumpCtrl) @[Transfer.scala 69:19]
    when _T : @[Transfer.scala 69:19]
      node _T_1 = eq(io.DATAIN.RData1, io.DATAIN.RData2) @[Transfer.scala 71:19]
      when _T_1 : @[Transfer.scala 71:30]
        io.CTRLOUT.JumpEn <= UInt<1>("h1") @[Transfer.scala 72:27]
        nextPC <= PCADDImm @[Transfer.scala 73:16]
    else :
      node _T_2 = eq(UInt<4>("h2"), io.CTRL.JumpCtrl) @[Transfer.scala 69:19]
      when _T_2 : @[Transfer.scala 69:19]
        node _T_3 = neq(io.DATAIN.RData1, io.DATAIN.RData2) @[Transfer.scala 77:19]
        when _T_3 : @[Transfer.scala 77:30]
          io.CTRLOUT.JumpEn <= UInt<1>("h1") @[Transfer.scala 78:27]
          nextPC <= PCADDImm @[Transfer.scala 79:16]
      else :
        node _T_4 = eq(UInt<4>("h3"), io.CTRL.JumpCtrl) @[Transfer.scala 69:19]
        when _T_4 : @[Transfer.scala 69:19]
          node _T_5 = asSInt(io.DATAIN.RData1) @[Transfer.scala 83:19]
          node _T_6 = asSInt(io.DATAIN.RData2) @[Transfer.scala 83:35]
          node _T_7 = lt(_T_5, _T_6) @[Transfer.scala 83:26]
          when _T_7 : @[Transfer.scala 83:42]
            io.CTRLOUT.JumpEn <= UInt<1>("h1") @[Transfer.scala 84:27]
            nextPC <= PCADDImm @[Transfer.scala 85:16]
        else :
          node _T_8 = eq(UInt<4>("h4"), io.CTRL.JumpCtrl) @[Transfer.scala 69:19]
          when _T_8 : @[Transfer.scala 69:19]
            node _T_9 = asSInt(io.DATAIN.RData1) @[Transfer.scala 89:19]
            node _T_10 = asSInt(io.DATAIN.RData2) @[Transfer.scala 89:36]
            node _T_11 = geq(_T_9, _T_10) @[Transfer.scala 89:26]
            when _T_11 : @[Transfer.scala 89:43]
              io.CTRLOUT.JumpEn <= UInt<1>("h1") @[Transfer.scala 90:27]
              nextPC <= PCADDImm @[Transfer.scala 91:16]
          else :
            node _T_12 = eq(UInt<4>("h5"), io.CTRL.JumpCtrl) @[Transfer.scala 69:19]
            when _T_12 : @[Transfer.scala 69:19]
              node _T_13 = lt(io.DATAIN.RData1, io.DATAIN.RData2) @[Transfer.scala 95:19]
              when _T_13 : @[Transfer.scala 95:28]
                io.CTRLOUT.JumpEn <= UInt<1>("h1") @[Transfer.scala 96:27]
                nextPC <= PCADDImm @[Transfer.scala 97:16]
            else :
              node _T_14 = eq(UInt<4>("h6"), io.CTRL.JumpCtrl) @[Transfer.scala 69:19]
              when _T_14 : @[Transfer.scala 69:19]
                node _T_15 = geq(io.DATAIN.RData1, io.DATAIN.RData2) @[Transfer.scala 101:19]
                when _T_15 : @[Transfer.scala 101:29]
                  io.CTRLOUT.JumpEn <= UInt<1>("h1") @[Transfer.scala 102:27]
                  nextPC <= PCADDImm @[Transfer.scala 103:16]
              else :
                node _T_16 = eq(UInt<4>("h7"), io.CTRL.JumpCtrl) @[Transfer.scala 69:19]
                when _T_16 : @[Transfer.scala 69:19]
                  io.CTRLOUT.JumpEn <= UInt<1>("h1") @[Transfer.scala 107:25]
                  nextPC <= PCADDImm @[Transfer.scala 108:14]
                else :
                  node _T_17 = eq(UInt<4>("h8"), io.CTRL.JumpCtrl) @[Transfer.scala 69:19]
                  when _T_17 : @[Transfer.scala 69:19]
                    io.CTRLOUT.JumpEn <= UInt<1>("h1") @[Transfer.scala 111:25]
                    nextPC <= RData1ADDImm @[Transfer.scala 112:14]
    io.DATAOUT.PC <= nextPC @[Transfer.scala 115:17]

