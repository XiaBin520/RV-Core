circuit EXStage :
  module ALU :
    input clock : Clock
    input reset : Reset
    output io : { ID : { flip ALUOP : UInt<4>, flip Src1 : UInt<64>, flip Src2 : UInt<64>}, MEM : { ALUData : UInt<64>}}

    node shamt = bits(io.ID.Src2, 5, 0) @[EXStage.scala 50:27]
    wire out : UInt<64>
    out <= UInt<64>("h0")
    node _T = eq(UInt<4>("h0"), io.ID.ALUOP) @[EXStage.scala 53:15]
    when _T : @[EXStage.scala 53:15]
      node _out_T = add(io.ID.Src1, io.ID.Src2) @[EXStage.scala 54:36]
      node _out_T_1 = tail(_out_T, 1) @[EXStage.scala 54:36]
      out <= _out_T_1 @[EXStage.scala 54:28]
    else :
      node _T_1 = eq(UInt<4>("h1"), io.ID.ALUOP) @[EXStage.scala 53:15]
      when _T_1 : @[EXStage.scala 53:15]
        node _out_T_2 = sub(io.ID.Src1, io.ID.Src2) @[EXStage.scala 55:36]
        node _out_T_3 = tail(_out_T_2, 1) @[EXStage.scala 55:36]
        out <= _out_T_3 @[EXStage.scala 55:28]
      else :
        node _T_2 = eq(UInt<4>("h2"), io.ID.ALUOP) @[EXStage.scala 53:15]
        when _T_2 : @[EXStage.scala 53:15]
          node _out_T_4 = asSInt(io.ID.Src1) @[EXStage.scala 56:37]
          node _out_T_5 = asSInt(io.ID.Src2) @[EXStage.scala 56:51]
          node _out_T_6 = lt(_out_T_4, _out_T_5) @[EXStage.scala 56:44]
          out <= _out_T_6 @[EXStage.scala 56:28]
        else :
          node _T_3 = eq(UInt<4>("h3"), io.ID.ALUOP) @[EXStage.scala 53:15]
          when _T_3 : @[EXStage.scala 53:15]
            node _out_T_7 = lt(io.ID.Src1, io.ID.Src2) @[EXStage.scala 57:36]
            out <= _out_T_7 @[EXStage.scala 57:28]
          else :
            node _T_4 = eq(UInt<4>("h4"), io.ID.ALUOP) @[EXStage.scala 53:15]
            when _T_4 : @[EXStage.scala 53:15]
              node _out_T_8 = xor(io.ID.Src1, io.ID.Src2) @[EXStage.scala 58:36]
              out <= _out_T_8 @[EXStage.scala 58:28]
            else :
              node _T_5 = eq(UInt<4>("h5"), io.ID.ALUOP) @[EXStage.scala 53:15]
              when _T_5 : @[EXStage.scala 53:15]
                node _out_T_9 = or(io.ID.Src1, io.ID.Src2) @[EXStage.scala 59:36]
                out <= _out_T_9 @[EXStage.scala 59:28]
              else :
                node _T_6 = eq(UInt<4>("h6"), io.ID.ALUOP) @[EXStage.scala 53:15]
                when _T_6 : @[EXStage.scala 53:15]
                  node _out_T_10 = and(io.ID.Src1, io.ID.Src2) @[EXStage.scala 60:36]
                  out <= _out_T_10 @[EXStage.scala 60:28]
                else :
                  node _T_7 = eq(UInt<4>("h7"), io.ID.ALUOP) @[EXStage.scala 53:15]
                  when _T_7 : @[EXStage.scala 53:15]
                    node _out_T_11 = dshl(io.ID.Src1, shamt) @[EXStage.scala 61:36]
                    out <= _out_T_11 @[EXStage.scala 61:28]
                  else :
                    node _T_8 = eq(UInt<4>("h8"), io.ID.ALUOP) @[EXStage.scala 53:15]
                    when _T_8 : @[EXStage.scala 53:15]
                      node _out_T_12 = dshr(io.ID.Src1, shamt) @[EXStage.scala 62:36]
                      out <= _out_T_12 @[EXStage.scala 62:28]
                    else :
                      node _T_9 = eq(UInt<4>("h9"), io.ID.ALUOP) @[EXStage.scala 53:15]
                      when _T_9 : @[EXStage.scala 53:15]
                        node _out_T_13 = asSInt(io.ID.Src1) @[EXStage.scala 63:37]
                        node _out_T_14 = dshr(_out_T_13, shamt) @[EXStage.scala 63:44]
                        node _out_T_15 = asUInt(_out_T_14) @[EXStage.scala 63:54]
                        out <= _out_T_15 @[EXStage.scala 63:28]
    io.MEM.ALUData <= out @[EXStage.scala 66:20]

  module WordALU :
    input clock : Clock
    input reset : Reset
    output io : { ID : { flip Src1 : UInt<64>, flip Src2 : UInt<64>, flip WordALUOP : UInt<3>}, MEM : { WordALUOut : UInt<64>}}

    node Src1W = bits(io.ID.Src1, 31, 0) @[EXStage.scala 107:26]
    node shamt = bits(io.ID.Src2, 4, 0) @[EXStage.scala 108:26]
    wire outDW : UInt<64>
    outDW <= UInt<64>("h0")
    wire outW : UInt<32>
    outW <= UInt<32>("h0")
    wire out : UInt<64>
    out <= UInt<64>("h0")
    node _T = eq(UInt<3>("h1"), io.ID.WordALUOP) @[EXStage.scala 115:20]
    when _T : @[EXStage.scala 115:20]
      node _outDW_T = add(io.ID.Src1, io.ID.Src2) @[EXStage.scala 116:35]
      node _outDW_T_1 = tail(_outDW_T, 1) @[EXStage.scala 116:35]
      outDW <= _outDW_T_1 @[EXStage.scala 116:27]
    else :
      node _T_1 = eq(UInt<3>("h2"), io.ID.WordALUOP) @[EXStage.scala 115:20]
      when _T_1 : @[EXStage.scala 115:20]
        node _outDW_T_2 = sub(io.ID.Src1, io.ID.Src2) @[EXStage.scala 117:35]
        node _outDW_T_3 = tail(_outDW_T_2, 1) @[EXStage.scala 117:35]
        outDW <= _outDW_T_3 @[EXStage.scala 117:27]
      else :
        node _T_2 = eq(UInt<3>("h3"), io.ID.WordALUOP) @[EXStage.scala 115:20]
        when _T_2 : @[EXStage.scala 115:20]
          node _outDW_T_4 = dshl(io.ID.Src1, shamt) @[EXStage.scala 118:37]
          outDW <= _outDW_T_4 @[EXStage.scala 118:27]
        else :
          node _T_3 = eq(UInt<3>("h4"), io.ID.WordALUOP) @[EXStage.scala 115:20]
          when _T_3 : @[EXStage.scala 115:20]
            node _outW_T = dshr(Src1W, shamt) @[EXStage.scala 119:37]
            outW <= _outW_T @[EXStage.scala 119:27]
          else :
            node _T_4 = eq(UInt<3>("h5"), io.ID.WordALUOP) @[EXStage.scala 115:20]
            when _T_4 : @[EXStage.scala 115:20]
              node _outW_T_1 = dshr(Src1W, shamt) @[EXStage.scala 120:37]
              outW <= _outW_T_1 @[EXStage.scala 120:27]
    node _T_5 = eq(UInt<3>("h1"), io.ID.WordALUOP) @[EXStage.scala 123:20]
    when _T_5 : @[EXStage.scala 123:20]
      node _out_T = bits(outDW, 31, 31) @[EXStage.scala 124:47]
      node _out_T_1 = bits(_out_T, 0, 0) @[Bitwise.scala 74:15]
      node _out_T_2 = mux(_out_T_1, UInt<32>("hffffffff"), UInt<32>("h0")) @[Bitwise.scala 74:12]
      node _out_T_3 = bits(outDW, 31, 0) @[EXStage.scala 124:61]
      node _out_T_4 = cat(_out_T_2, _out_T_3) @[Cat.scala 31:58]
      out <= _out_T_4 @[EXStage.scala 124:25]
    else :
      node _T_6 = eq(UInt<3>("h2"), io.ID.WordALUOP) @[EXStage.scala 123:20]
      when _T_6 : @[EXStage.scala 123:20]
        node _out_T_5 = bits(outDW, 31, 31) @[EXStage.scala 125:47]
        node _out_T_6 = bits(_out_T_5, 0, 0) @[Bitwise.scala 74:15]
        node _out_T_7 = mux(_out_T_6, UInt<32>("hffffffff"), UInt<32>("h0")) @[Bitwise.scala 74:12]
        node _out_T_8 = bits(outDW, 31, 0) @[EXStage.scala 125:61]
        node _out_T_9 = cat(_out_T_7, _out_T_8) @[Cat.scala 31:58]
        out <= _out_T_9 @[EXStage.scala 125:25]
      else :
        node _T_7 = eq(UInt<3>("h3"), io.ID.WordALUOP) @[EXStage.scala 123:20]
        when _T_7 : @[EXStage.scala 123:20]
          node _out_T_10 = bits(outDW, 31, 31) @[EXStage.scala 126:47]
          node _out_T_11 = bits(_out_T_10, 0, 0) @[Bitwise.scala 74:15]
          node _out_T_12 = mux(_out_T_11, UInt<32>("hffffffff"), UInt<32>("h0")) @[Bitwise.scala 74:12]
          node _out_T_13 = bits(outDW, 31, 0) @[EXStage.scala 126:61]
          node _out_T_14 = cat(_out_T_12, _out_T_13) @[Cat.scala 31:58]
          out <= _out_T_14 @[EXStage.scala 126:25]
        else :
          node _T_8 = eq(UInt<3>("h4"), io.ID.WordALUOP) @[EXStage.scala 123:20]
          when _T_8 : @[EXStage.scala 123:20]
            node _out_T_15 = bits(outDW, 31, 31) @[EXStage.scala 127:47]
            node _out_T_16 = bits(_out_T_15, 0, 0) @[Bitwise.scala 74:15]
            node _out_T_17 = mux(_out_T_16, UInt<32>("hffffffff"), UInt<32>("h0")) @[Bitwise.scala 74:12]
            node _out_T_18 = bits(outW, 31, 0) @[EXStage.scala 127:60]
            node _out_T_19 = cat(_out_T_17, _out_T_18) @[Cat.scala 31:58]
            out <= _out_T_19 @[EXStage.scala 127:25]
          else :
            node _T_9 = eq(UInt<3>("h5"), io.ID.WordALUOP) @[EXStage.scala 123:20]
            when _T_9 : @[EXStage.scala 123:20]
              node _out_T_20 = bits(outDW, 31, 31) @[EXStage.scala 128:47]
              node _out_T_21 = bits(_out_T_20, 0, 0) @[Bitwise.scala 74:15]
              node _out_T_22 = mux(_out_T_21, UInt<32>("hffffffff"), UInt<32>("h0")) @[Bitwise.scala 74:12]
              node _out_T_23 = bits(outW, 31, 0) @[EXStage.scala 128:60]
              node _out_T_24 = cat(_out_T_22, _out_T_23) @[Cat.scala 31:58]
              out <= _out_T_24 @[EXStage.scala 128:25]
    io.MEM.WordALUOut <= out @[EXStage.scala 131:21]

  module EXStage :
    input clock : Clock
    input reset : UInt<1>
    output io : { ID : { flip ID_A : { ALUOP : UInt<4>, ALUSrc1Ctrl : UInt<3>, ALUSrc2Ctrl : UInt<3>, WordALUEn : UInt<1>, WordALUOP : UInt<3>}, flip ID_B : { PC : UInt<32>, Imm : UInt<64>, RData1 : UInt<64>, RData2 : UInt<64>}}, MEM : { ALUData : UInt<64>}}

    inst ALU of ALU @[EXStage.scala 160:23]
    ALU.clock <= clock
    ALU.reset <= reset
    inst WordALU of WordALU @[EXStage.scala 161:23]
    WordALU.clock <= clock
    WordALU.reset <= reset
    wire Src1 : UInt<64>
    Src1 <= UInt<64>("h0")
    wire Src2 : UInt<64>
    Src2 <= UInt<64>("h0")
    node _PC_T = mux(UInt<1>("h0"), UInt<32>("hffffffff"), UInt<32>("h0")) @[Bitwise.scala 74:12]
    node PC = cat(_PC_T, io.ID.ID_B.PC) @[Cat.scala 31:58]
    node _T = eq(UInt<2>("h1"), io.ID.ID_A.ALUSrc1Ctrl) @[EXStage.scala 182:22]
    when _T : @[EXStage.scala 182:22]
      Src1 <= UInt<1>("h0") @[EXStage.scala 183:22]
    else :
      node _T_1 = eq(UInt<2>("h2"), io.ID.ID_A.ALUSrc1Ctrl) @[EXStage.scala 182:22]
      when _T_1 : @[EXStage.scala 182:22]
        Src1 <= PC @[EXStage.scala 184:22]
      else :
        node _T_2 = eq(UInt<2>("h3"), io.ID.ID_A.ALUSrc1Ctrl) @[EXStage.scala 182:22]
        when _T_2 : @[EXStage.scala 182:22]
          Src1 <= io.ID.ID_B.RData1 @[EXStage.scala 185:22]
    node _T_3 = eq(UInt<3>("h1"), io.ID.ID_A.ALUSrc2Ctrl) @[EXStage.scala 187:22]
    when _T_3 : @[EXStage.scala 187:22]
      Src2 <= io.ID.ID_B.Imm @[EXStage.scala 188:22]
    else :
      node _T_4 = eq(UInt<3>("h2"), io.ID.ID_A.ALUSrc2Ctrl) @[EXStage.scala 187:22]
      when _T_4 : @[EXStage.scala 187:22]
        Src2 <= io.ID.ID_B.RData2 @[EXStage.scala 189:22]
      else :
        node _T_5 = eq(UInt<3>("h3"), io.ID.ID_A.ALUSrc2Ctrl) @[EXStage.scala 187:22]
        when _T_5 : @[EXStage.scala 187:22]
          Src2 <= UInt<3>("h4") @[EXStage.scala 190:22]
    ALU.io.ID.ALUOP <= io.ID.ID_A.ALUOP @[EXStage.scala 194:19]
    ALU.io.ID.Src1 <= Src1 @[EXStage.scala 195:19]
    ALU.io.ID.Src2 <= Src2 @[EXStage.scala 196:19]
    WordALU.io.ID.WordALUOP <= io.ID.ID_A.WordALUOP @[EXStage.scala 198:27]
    WordALU.io.ID.Src1 <= Src1 @[EXStage.scala 199:27]
    WordALU.io.ID.Src2 <= Src2 @[EXStage.scala 200:27]
    when io.ID.ID_A.WordALUEn : @[EXStage.scala 202:18]
      io.MEM.ALUData <= WordALU.io.MEM.WordALUOut @[EXStage.scala 203:20]
    else :
      io.MEM.ALUData <= ALU.io.MEM.ALUData @[EXStage.scala 206:20]

