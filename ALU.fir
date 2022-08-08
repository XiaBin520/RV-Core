circuit ALU :
  module ALU :
    output io : { DATAIN : { flip Data1 : UInt<64>, flip Data2 : UInt<64>}, CTRL : { flip ALUOP : UInt<4>}, DATAOUT : { ALUData : UInt<64>}}

    node shamt = bits(io.DATAIN.Data2, 5, 0) @[ALU.scala 58:34]
    wire ALUData : UInt<64>
    ALUData <= UInt<64>("h0")
    node _T = eq(UInt<4>("h0"), io.CTRL.ALUOP) @[ALU.scala 61:18]
    when _T : @[ALU.scala 61:18]
      node _ALUData_T = add(io.DATAIN.Data1, io.DATAIN.Data2) @[ALU.scala 62:41]
      node _ALUData_T_1 = tail(_ALUData_T, 1) @[ALU.scala 62:41]
      ALUData <= _ALUData_T_1 @[ALU.scala 62:32]
    else :
      node _T_1 = eq(UInt<4>("h1"), io.CTRL.ALUOP) @[ALU.scala 61:18]
      when _T_1 : @[ALU.scala 61:18]
        node _ALUData_T_2 = sub(io.DATAIN.Data1, io.DATAIN.Data2) @[ALU.scala 63:41]
        node _ALUData_T_3 = tail(_ALUData_T_2, 1) @[ALU.scala 63:41]
        ALUData <= _ALUData_T_3 @[ALU.scala 63:32]
      else :
        node _T_2 = eq(UInt<4>("h2"), io.CTRL.ALUOP) @[ALU.scala 61:18]
        when _T_2 : @[ALU.scala 61:18]
          node _ALUData_T_4 = asSInt(io.DATAIN.Data1) @[ALU.scala 64:42]
          node _ALUData_T_5 = asSInt(io.DATAIN.Data2) @[ALU.scala 64:57]
          node _ALUData_T_6 = lt(_ALUData_T_4, _ALUData_T_5) @[ALU.scala 64:49]
          ALUData <= _ALUData_T_6 @[ALU.scala 64:32]
        else :
          node _T_3 = eq(UInt<4>("h3"), io.CTRL.ALUOP) @[ALU.scala 61:18]
          when _T_3 : @[ALU.scala 61:18]
            node _ALUData_T_7 = lt(io.DATAIN.Data1, io.DATAIN.Data2) @[ALU.scala 65:41]
            ALUData <= _ALUData_T_7 @[ALU.scala 65:32]
          else :
            node _T_4 = eq(UInt<4>("h4"), io.CTRL.ALUOP) @[ALU.scala 61:18]
            when _T_4 : @[ALU.scala 61:18]
              node _ALUData_T_8 = xor(io.DATAIN.Data1, io.DATAIN.Data2) @[ALU.scala 66:41]
              ALUData <= _ALUData_T_8 @[ALU.scala 66:32]
            else :
              node _T_5 = eq(UInt<4>("h5"), io.CTRL.ALUOP) @[ALU.scala 61:18]
              when _T_5 : @[ALU.scala 61:18]
                node _ALUData_T_9 = or(io.DATAIN.Data1, io.DATAIN.Data2) @[ALU.scala 67:41]
                ALUData <= _ALUData_T_9 @[ALU.scala 67:32]
              else :
                node _T_6 = eq(UInt<4>("h6"), io.CTRL.ALUOP) @[ALU.scala 61:18]
                when _T_6 : @[ALU.scala 61:18]
                  node _ALUData_T_10 = and(io.DATAIN.Data1, io.DATAIN.Data2) @[ALU.scala 68:41]
                  ALUData <= _ALUData_T_10 @[ALU.scala 68:32]
                else :
                  node _T_7 = eq(UInt<4>("h7"), io.CTRL.ALUOP) @[ALU.scala 61:18]
                  when _T_7 : @[ALU.scala 61:18]
                    node _ALUData_T_11 = dshl(io.DATAIN.Data1, shamt) @[ALU.scala 69:41]
                    ALUData <= _ALUData_T_11 @[ALU.scala 69:32]
                  else :
                    node _T_8 = eq(UInt<4>("h8"), io.CTRL.ALUOP) @[ALU.scala 61:18]
                    when _T_8 : @[ALU.scala 61:18]
                      node _ALUData_T_12 = dshr(io.DATAIN.Data1, shamt) @[ALU.scala 70:41]
                      ALUData <= _ALUData_T_12 @[ALU.scala 70:32]
                    else :
                      node _T_9 = eq(UInt<4>("h9"), io.CTRL.ALUOP) @[ALU.scala 61:18]
                      when _T_9 : @[ALU.scala 61:18]
                        node _ALUData_T_13 = asSInt(io.DATAIN.Data1) @[ALU.scala 71:42]
                        node _ALUData_T_14 = dshr(_ALUData_T_13, shamt) @[ALU.scala 71:49]
                        node _ALUData_T_15 = asUInt(_ALUData_T_14) @[ALU.scala 71:59]
                        ALUData <= _ALUData_T_15 @[ALU.scala 71:32]
    io.DATAOUT.ALUData <= ALUData @[ALU.scala 74:24]

