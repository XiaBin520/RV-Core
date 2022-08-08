circuit ALU :
  module ALU :
    output io : { ID : { flip ALUOP : UInt<4>, flip Src1 : UInt<64>, flip Src2 : UInt<64>}, MEM : { ALUOut : UInt<64>}}

    node shamt = bits(io.ID.Src2, 5, 0) @[alu.scala 46:27]
    wire out : UInt<64>
    out <= UInt<64>("h0")
    node _T = eq(UInt<4>("h0"), io.ID.ALUOP) @[alu.scala 49:15]
    when _T : @[alu.scala 49:15]
      node _out_T = add(io.ID.Src1, io.ID.Src2) @[alu.scala 50:36]
      node _out_T_1 = tail(_out_T, 1) @[alu.scala 50:36]
      out <= _out_T_1 @[alu.scala 50:28]
    else :
      node _T_1 = eq(UInt<4>("h1"), io.ID.ALUOP) @[alu.scala 49:15]
      when _T_1 : @[alu.scala 49:15]
        node _out_T_2 = sub(io.ID.Src1, io.ID.Src2) @[alu.scala 51:36]
        node _out_T_3 = tail(_out_T_2, 1) @[alu.scala 51:36]
        out <= _out_T_3 @[alu.scala 51:28]
      else :
        node _T_2 = eq(UInt<4>("h2"), io.ID.ALUOP) @[alu.scala 49:15]
        when _T_2 : @[alu.scala 49:15]
          node _out_T_4 = asSInt(io.ID.Src1) @[alu.scala 52:37]
          node _out_T_5 = asSInt(io.ID.Src2) @[alu.scala 52:51]
          node _out_T_6 = lt(_out_T_4, _out_T_5) @[alu.scala 52:44]
          out <= _out_T_6 @[alu.scala 52:28]
        else :
          node _T_3 = eq(UInt<4>("h3"), io.ID.ALUOP) @[alu.scala 49:15]
          when _T_3 : @[alu.scala 49:15]
            node _out_T_7 = lt(io.ID.Src1, io.ID.Src2) @[alu.scala 53:36]
            out <= _out_T_7 @[alu.scala 53:28]
          else :
            node _T_4 = eq(UInt<4>("h4"), io.ID.ALUOP) @[alu.scala 49:15]
            when _T_4 : @[alu.scala 49:15]
              node _out_T_8 = xor(io.ID.Src1, io.ID.Src2) @[alu.scala 54:36]
              out <= _out_T_8 @[alu.scala 54:28]
            else :
              node _T_5 = eq(UInt<4>("h5"), io.ID.ALUOP) @[alu.scala 49:15]
              when _T_5 : @[alu.scala 49:15]
                node _out_T_9 = or(io.ID.Src1, io.ID.Src2) @[alu.scala 55:36]
                out <= _out_T_9 @[alu.scala 55:28]
              else :
                node _T_6 = eq(UInt<4>("h6"), io.ID.ALUOP) @[alu.scala 49:15]
                when _T_6 : @[alu.scala 49:15]
                  node _out_T_10 = and(io.ID.Src1, io.ID.Src2) @[alu.scala 56:36]
                  out <= _out_T_10 @[alu.scala 56:28]
                else :
                  node _T_7 = eq(UInt<4>("h7"), io.ID.ALUOP) @[alu.scala 49:15]
                  when _T_7 : @[alu.scala 49:15]
                    node _out_T_11 = dshl(io.ID.Src1, shamt) @[alu.scala 57:36]
                    out <= _out_T_11 @[alu.scala 57:28]
                  else :
                    node _T_8 = eq(UInt<4>("h8"), io.ID.ALUOP) @[alu.scala 49:15]
                    when _T_8 : @[alu.scala 49:15]
                      node _out_T_12 = dshr(io.ID.Src1, shamt) @[alu.scala 58:36]
                      out <= _out_T_12 @[alu.scala 58:28]
                    else :
                      node _T_9 = eq(UInt<4>("h9"), io.ID.ALUOP) @[alu.scala 49:15]
                      when _T_9 : @[alu.scala 49:15]
                        node _out_T_13 = asSInt(io.ID.Src1) @[alu.scala 59:37]
                        node _out_T_14 = dshr(_out_T_13, shamt) @[alu.scala 59:44]
                        node _out_T_15 = asUInt(_out_T_14) @[alu.scala 59:54]
                        out <= _out_T_15 @[alu.scala 59:28]
    io.MEM.ALUOut <= out @[alu.scala 62:19]

