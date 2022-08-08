circuit IDStage :
  module Decoder :
    input clock : Clock
    input reset : Reset
    output io : { IF : { flip Instr : UInt<32>}, ID : { ImmCtrl : UInt<3>, JumpCtrl : UInt<4>}, EX_A : { ALUOP : UInt<4>, ALUSrc1Ctrl : UInt<3>, ALUSrc2Ctrl : UInt<3>, WordALUEn : UInt<1>, WordALUOP : UInt<3>}, EX_B : { MEMREn : UInt<1>, MEMRCtrl : UInt<3>, MEMWEn : UInt<1>, MEMWCtrl : UInt<3>}, EX_C : { RegWEn : UInt<1>, RegWSrc : UInt<2>, Rd : UInt<5>}, EX_D : { Rs1REn : UInt<1>, Rs2REn : UInt<1>, Rs1 : UInt<5>, Rs2 : UInt<5>}}

    node Opcode = bits(io.IF.Instr, 6, 0) @[IDStage.scala 85:27]
    node Rd = bits(io.IF.Instr, 11, 7) @[IDStage.scala 86:27]
    node Funct3 = bits(io.IF.Instr, 14, 12) @[IDStage.scala 87:27]
    node Rs1 = bits(io.IF.Instr, 19, 15) @[IDStage.scala 88:27]
    node Rs2 = bits(io.IF.Instr, 24, 20) @[IDStage.scala 89:27]
    node Funct7 = bits(io.IF.Instr, 31, 25) @[IDStage.scala 90:27]
    wire ImmCtrl : UInt<3>
    ImmCtrl <= UInt<3>("h0")
    wire JumpCtrl : UInt<4>
    JumpCtrl <= UInt<4>("h0")
    wire ALUOP : UInt<4>
    ALUOP <= UInt<4>("h0")
    wire ALUSrc1Ctrl : UInt<2>
    ALUSrc1Ctrl <= UInt<2>("h0")
    wire ALUSrc2Ctrl : UInt<3>
    ALUSrc2Ctrl <= UInt<3>("h0")
    wire WordALUEn : UInt<1>
    WordALUEn <= UInt<1>("h0")
    wire WordALUOP : UInt<3>
    WordALUOP <= UInt<3>("h0")
    wire MEMREn : UInt<1>
    MEMREn <= UInt<1>("h0")
    wire MEMRCtrl : UInt<3>
    MEMRCtrl <= UInt<3>("h0")
    wire MEMWEn : UInt<1>
    MEMWEn <= UInt<1>("h0")
    wire MEMWCtrl : UInt<3>
    MEMWCtrl <= UInt<3>("h0")
    wire RegWEn : UInt<1>
    RegWEn <= UInt<1>("h0")
    wire RegWSrc : UInt<2>
    RegWSrc <= UInt<2>("h0")
    wire Rs1REn : UInt<1>
    Rs1REn <= UInt<1>("h0")
    wire Rs2REn : UInt<1>
    Rs2REn <= UInt<1>("h0")
    node _T = eq(UInt<6>("h37"), Opcode) @[IDStage.scala 128:17]
    when _T : @[IDStage.scala 128:17]
      ImmCtrl <= UInt<3>("h4") @[IDStage.scala 131:19]
      ALUOP <= UInt<4>("h0") @[IDStage.scala 132:19]
      ALUSrc1Ctrl <= UInt<2>("h1") @[IDStage.scala 133:19]
      ALUSrc2Ctrl <= UInt<3>("h1") @[IDStage.scala 134:19]
      RegWEn <= UInt<1>("h1") @[IDStage.scala 135:19]
      RegWSrc <= UInt<2>("h1") @[IDStage.scala 136:19]
    else :
      node _T_1 = eq(UInt<5>("h17"), Opcode) @[IDStage.scala 128:17]
      when _T_1 : @[IDStage.scala 128:17]
        ImmCtrl <= UInt<3>("h4") @[IDStage.scala 140:19]
        ALUOP <= UInt<4>("h0") @[IDStage.scala 141:19]
        ALUSrc1Ctrl <= UInt<2>("h2") @[IDStage.scala 142:19]
        ALUSrc2Ctrl <= UInt<3>("h1") @[IDStage.scala 143:19]
        RegWEn <= UInt<1>("h1") @[IDStage.scala 144:19]
        RegWSrc <= UInt<2>("h1") @[IDStage.scala 145:19]
      else :
        node _T_2 = eq(UInt<7>("h63"), Opcode) @[IDStage.scala 128:17]
        when _T_2 : @[IDStage.scala 128:17]
          ImmCtrl <= UInt<3>("h3") @[IDStage.scala 155:15]
          Rs1REn <= UInt<1>("h1") @[IDStage.scala 156:15]
          Rs2REn <= UInt<1>("h1") @[IDStage.scala 157:15]
          node _T_3 = eq(UInt<1>("h0"), Funct3) @[IDStage.scala 158:21]
          when _T_3 : @[IDStage.scala 158:21]
            JumpCtrl <= UInt<4>("h1") @[IDStage.scala 159:32]
          else :
            node _T_4 = eq(UInt<1>("h1"), Funct3) @[IDStage.scala 158:21]
            when _T_4 : @[IDStage.scala 158:21]
              JumpCtrl <= UInt<4>("h2") @[IDStage.scala 160:32]
            else :
              node _T_5 = eq(UInt<3>("h4"), Funct3) @[IDStage.scala 158:21]
              when _T_5 : @[IDStage.scala 158:21]
                JumpCtrl <= UInt<4>("h3") @[IDStage.scala 161:32]
              else :
                node _T_6 = eq(UInt<3>("h5"), Funct3) @[IDStage.scala 158:21]
                when _T_6 : @[IDStage.scala 158:21]
                  JumpCtrl <= UInt<4>("h4") @[IDStage.scala 162:32]
                else :
                  node _T_7 = eq(UInt<3>("h6"), Funct3) @[IDStage.scala 158:21]
                  when _T_7 : @[IDStage.scala 158:21]
                    JumpCtrl <= UInt<4>("h5") @[IDStage.scala 163:32]
                  else :
                    node _T_8 = eq(UInt<3>("h7"), Funct3) @[IDStage.scala 158:21]
                    when _T_8 : @[IDStage.scala 158:21]
                      JumpCtrl <= UInt<4>("h6") @[IDStage.scala 164:32]
        else :
          node _T_9 = eq(UInt<2>("h3"), Opcode) @[IDStage.scala 128:17]
          when _T_9 : @[IDStage.scala 128:17]
            ImmCtrl <= UInt<3>("h1") @[IDStage.scala 176:19]
            ALUOP <= UInt<4>("h0") @[IDStage.scala 177:19]
            ALUSrc1Ctrl <= UInt<2>("h3") @[IDStage.scala 178:19]
            ALUSrc2Ctrl <= UInt<3>("h1") @[IDStage.scala 179:19]
            MEMREn <= UInt<1>("h1") @[IDStage.scala 180:19]
            RegWEn <= UInt<1>("h1") @[IDStage.scala 181:19]
            RegWSrc <= UInt<2>("h2") @[IDStage.scala 182:19]
            Rs1REn <= UInt<1>("h1") @[IDStage.scala 183:19]
            node _T_10 = eq(UInt<1>("h0"), Funct3) @[IDStage.scala 184:21]
            when _T_10 : @[IDStage.scala 184:21]
              MEMRCtrl <= UInt<3>("h1") @[IDStage.scala 185:32]
            else :
              node _T_11 = eq(UInt<1>("h1"), Funct3) @[IDStage.scala 184:21]
              when _T_11 : @[IDStage.scala 184:21]
                MEMRCtrl <= UInt<3>("h2") @[IDStage.scala 186:32]
              else :
                node _T_12 = eq(UInt<2>("h2"), Funct3) @[IDStage.scala 184:21]
                when _T_12 : @[IDStage.scala 184:21]
                  MEMRCtrl <= UInt<3>("h3") @[IDStage.scala 187:32]
                else :
                  node _T_13 = eq(UInt<2>("h3"), Funct3) @[IDStage.scala 184:21]
                  when _T_13 : @[IDStage.scala 184:21]
                    MEMRCtrl <= UInt<3>("h7") @[IDStage.scala 188:32]
                  else :
                    node _T_14 = eq(UInt<3>("h4"), Funct3) @[IDStage.scala 184:21]
                    when _T_14 : @[IDStage.scala 184:21]
                      MEMRCtrl <= UInt<3>("h4") @[IDStage.scala 189:32]
                    else :
                      node _T_15 = eq(UInt<3>("h5"), Funct3) @[IDStage.scala 184:21]
                      when _T_15 : @[IDStage.scala 184:21]
                        MEMRCtrl <= UInt<3>("h5") @[IDStage.scala 190:32]
                      else :
                        node _T_16 = eq(UInt<3>("h6"), Funct3) @[IDStage.scala 184:21]
                        when _T_16 : @[IDStage.scala 184:21]
                          MEMRCtrl <= UInt<3>("h6") @[IDStage.scala 191:32]
          else :
            node _T_17 = eq(UInt<6>("h23"), Opcode) @[IDStage.scala 128:17]
            when _T_17 : @[IDStage.scala 128:17]
              ImmCtrl <= UInt<3>("h2") @[IDStage.scala 200:19]
              ALUOP <= UInt<4>("h0") @[IDStage.scala 201:19]
              ALUSrc1Ctrl <= UInt<2>("h3") @[IDStage.scala 202:19]
              ALUSrc2Ctrl <= UInt<3>("h1") @[IDStage.scala 203:19]
              MEMWEn <= UInt<1>("h1") @[IDStage.scala 204:19]
              Rs1REn <= UInt<1>("h1") @[IDStage.scala 205:19]
              node _T_18 = eq(UInt<1>("h0"), Funct3) @[IDStage.scala 206:21]
              when _T_18 : @[IDStage.scala 206:21]
                MEMWCtrl <= UInt<3>("h1") @[IDStage.scala 207:32]
              else :
                node _T_19 = eq(UInt<1>("h1"), Funct3) @[IDStage.scala 206:21]
                when _T_19 : @[IDStage.scala 206:21]
                  MEMWCtrl <= UInt<3>("h2") @[IDStage.scala 208:32]
                else :
                  node _T_20 = eq(UInt<2>("h2"), Funct3) @[IDStage.scala 206:21]
                  when _T_20 : @[IDStage.scala 206:21]
                    MEMWCtrl <= UInt<3>("h3") @[IDStage.scala 209:32]
                  else :
                    node _T_21 = eq(UInt<2>("h3"), Funct3) @[IDStage.scala 206:21]
                    when _T_21 : @[IDStage.scala 206:21]
                      MEMWCtrl <= UInt<3>("h4") @[IDStage.scala 210:32]
            else :
              node _T_22 = eq(UInt<5>("h13"), Opcode) @[IDStage.scala 128:17]
              when _T_22 : @[IDStage.scala 128:17]
                ImmCtrl <= UInt<3>("h1") @[IDStage.scala 225:19]
                ALUSrc1Ctrl <= UInt<2>("h3") @[IDStage.scala 226:19]
                ALUSrc2Ctrl <= UInt<3>("h1") @[IDStage.scala 227:19]
                RegWEn <= UInt<1>("h1") @[IDStage.scala 228:19]
                RegWSrc <= UInt<2>("h1") @[IDStage.scala 229:19]
                Rs1REn <= UInt<1>("h1") @[IDStage.scala 230:19]
                node _T_23 = eq(UInt<1>("h0"), Funct3) @[IDStage.scala 231:21]
                when _T_23 : @[IDStage.scala 231:21]
                  ALUOP <= UInt<4>("h0") @[IDStage.scala 232:29]
                else :
                  node _T_24 = eq(UInt<2>("h2"), Funct3) @[IDStage.scala 231:21]
                  when _T_24 : @[IDStage.scala 231:21]
                    ALUOP <= UInt<4>("h2") @[IDStage.scala 233:29]
                  else :
                    node _T_25 = eq(UInt<2>("h3"), Funct3) @[IDStage.scala 231:21]
                    when _T_25 : @[IDStage.scala 231:21]
                      ALUOP <= UInt<4>("h3") @[IDStage.scala 234:29]
                    else :
                      node _T_26 = eq(UInt<3>("h4"), Funct3) @[IDStage.scala 231:21]
                      when _T_26 : @[IDStage.scala 231:21]
                        ALUOP <= UInt<4>("h4") @[IDStage.scala 235:29]
                      else :
                        node _T_27 = eq(UInt<3>("h6"), Funct3) @[IDStage.scala 231:21]
                        when _T_27 : @[IDStage.scala 231:21]
                          ALUOP <= UInt<4>("h5") @[IDStage.scala 236:29]
                        else :
                          node _T_28 = eq(UInt<3>("h7"), Funct3) @[IDStage.scala 231:21]
                          when _T_28 : @[IDStage.scala 231:21]
                            ALUOP <= UInt<4>("h6") @[IDStage.scala 237:29]
                          else :
                            node _T_29 = eq(UInt<1>("h1"), Funct3) @[IDStage.scala 231:21]
                            when _T_29 : @[IDStage.scala 231:21]
                              node _T_30 = and(Funct7, UInt<7>("h7e")) @[IDStage.scala 238:36]
                              node _T_31 = eq(UInt<1>("h0"), _T_30) @[IDStage.scala 238:36]
                              when _T_31 : @[IDStage.scala 238:60]
                                ALUOP <= UInt<4>("h7") @[IDStage.scala 238:67]
                            else :
                              node _T_32 = eq(UInt<3>("h5"), Funct3) @[IDStage.scala 231:21]
                              when _T_32 : @[IDStage.scala 231:21]
                                node _T_33 = and(Funct7, UInt<7>("h7e")) @[IDStage.scala 239:36]
                                node _T_34 = eq(UInt<1>("h0"), _T_33) @[IDStage.scala 239:36]
                                when _T_34 : @[IDStage.scala 239:60]
                                  ALUOP <= UInt<4>("h8") @[IDStage.scala 239:67]
                                else :
                                  node _T_35 = and(Funct7, UInt<7>("h7e")) @[IDStage.scala 240:36]
                                  node _T_36 = eq(UInt<6>("h20"), _T_35) @[IDStage.scala 240:36]
                                  when _T_36 : @[IDStage.scala 240:60]
                                    ALUOP <= UInt<4>("h9") @[IDStage.scala 240:67]
              else :
                node _T_37 = eq(UInt<5>("h1b"), Opcode) @[IDStage.scala 128:17]
                when _T_37 : @[IDStage.scala 128:17]
                  ImmCtrl <= UInt<3>("h1") @[IDStage.scala 251:19]
                  ALUSrc1Ctrl <= UInt<2>("h3") @[IDStage.scala 252:19]
                  ALUSrc2Ctrl <= UInt<3>("h1") @[IDStage.scala 253:19]
                  RegWEn <= UInt<1>("h1") @[IDStage.scala 254:19]
                  RegWSrc <= UInt<2>("h1") @[IDStage.scala 255:19]
                  Rs1REn <= UInt<1>("h1") @[IDStage.scala 256:19]
                  WordALUEn <= UInt<1>("h1") @[IDStage.scala 257:19]
                  node _T_38 = eq(UInt<1>("h0"), Funct3) @[IDStage.scala 258:21]
                  when _T_38 : @[IDStage.scala 258:21]
                    WordALUOP <= UInt<3>("h1") @[IDStage.scala 259:33]
                  else :
                    node _T_39 = eq(UInt<1>("h1"), Funct3) @[IDStage.scala 258:21]
                    when _T_39 : @[IDStage.scala 258:21]
                      WordALUOP <= UInt<3>("h3") @[IDStage.scala 260:33]
                    else :
                      node _T_40 = eq(UInt<3>("h5"), Funct3) @[IDStage.scala 258:21]
                      when _T_40 : @[IDStage.scala 258:21]
                        node _T_41 = eq(Funct7, UInt<1>("h0")) @[IDStage.scala 261:35]
                        when _T_41 : @[IDStage.scala 261:53]
                          WordALUOP <= UInt<3>("h4") @[IDStage.scala 261:64]
                        else :
                          node _T_42 = eq(Funct7, UInt<6>("h20")) @[IDStage.scala 262:35]
                          when _T_42 : @[IDStage.scala 262:53]
                            WordALUOP <= UInt<3>("h5") @[IDStage.scala 262:64]
                else :
                  node _T_43 = eq(UInt<6>("h33"), Opcode) @[IDStage.scala 128:17]
                  when _T_43 : @[IDStage.scala 128:17]
                    ALUSrc1Ctrl <= UInt<2>("h3") @[IDStage.scala 279:19]
                    ALUSrc2Ctrl <= UInt<3>("h2") @[IDStage.scala 280:19]
                    RegWEn <= UInt<1>("h1") @[IDStage.scala 281:19]
                    RegWSrc <= UInt<2>("h1") @[IDStage.scala 282:19]
                    Rs1REn <= UInt<1>("h1") @[IDStage.scala 283:19]
                    Rs2REn <= UInt<1>("h1") @[IDStage.scala 284:19]
                    node _T_44 = eq(UInt<1>("h0"), Funct7) @[IDStage.scala 285:21]
                    when _T_44 : @[IDStage.scala 285:21]
                      node _T_45 = eq(UInt<1>("h0"), Funct3) @[IDStage.scala 287:25]
                      when _T_45 : @[IDStage.scala 287:25]
                        ALUOP <= UInt<4>("h0") @[IDStage.scala 288:33]
                      else :
                        node _T_46 = eq(UInt<1>("h1"), Funct3) @[IDStage.scala 287:25]
                        when _T_46 : @[IDStage.scala 287:25]
                          ALUOP <= UInt<4>("h7") @[IDStage.scala 289:33]
                        else :
                          node _T_47 = eq(UInt<2>("h2"), Funct3) @[IDStage.scala 287:25]
                          when _T_47 : @[IDStage.scala 287:25]
                            ALUOP <= UInt<4>("h2") @[IDStage.scala 290:33]
                          else :
                            node _T_48 = eq(UInt<2>("h3"), Funct3) @[IDStage.scala 287:25]
                            when _T_48 : @[IDStage.scala 287:25]
                              ALUOP <= UInt<4>("h3") @[IDStage.scala 291:33]
                            else :
                              node _T_49 = eq(UInt<3>("h4"), Funct3) @[IDStage.scala 287:25]
                              when _T_49 : @[IDStage.scala 287:25]
                                ALUOP <= UInt<4>("h4") @[IDStage.scala 292:33]
                              else :
                                node _T_50 = eq(UInt<3>("h5"), Funct3) @[IDStage.scala 287:25]
                                when _T_50 : @[IDStage.scala 287:25]
                                  ALUOP <= UInt<4>("h8") @[IDStage.scala 293:33]
                                else :
                                  node _T_51 = eq(UInt<3>("h6"), Funct3) @[IDStage.scala 287:25]
                                  when _T_51 : @[IDStage.scala 287:25]
                                    ALUOP <= UInt<4>("h5") @[IDStage.scala 294:33]
                                  else :
                                    node _T_52 = eq(UInt<3>("h7"), Funct3) @[IDStage.scala 287:25]
                                    when _T_52 : @[IDStage.scala 287:25]
                                      ALUOP <= UInt<4>("h6") @[IDStage.scala 295:33]
                    else :
                      node _T_53 = eq(UInt<6>("h20"), Funct7) @[IDStage.scala 285:21]
                      when _T_53 : @[IDStage.scala 285:21]
                        node _T_54 = eq(UInt<1>("h0"), Funct3) @[IDStage.scala 299:25]
                        when _T_54 : @[IDStage.scala 299:25]
                          ALUOP <= UInt<4>("h1") @[IDStage.scala 300:33]
                        else :
                          node _T_55 = eq(UInt<3>("h5"), Funct3) @[IDStage.scala 299:25]
                          when _T_55 : @[IDStage.scala 299:25]
                            ALUOP <= UInt<4>("h9") @[IDStage.scala 301:33]
                  else :
                    node _T_56 = eq(UInt<6>("h3b"), Opcode) @[IDStage.scala 128:17]
                    when _T_56 : @[IDStage.scala 128:17]
                      ALUSrc1Ctrl <= UInt<2>("h3") @[IDStage.scala 313:19]
                      ALUSrc2Ctrl <= UInt<3>("h2") @[IDStage.scala 314:19]
                      RegWEn <= UInt<1>("h1") @[IDStage.scala 315:19]
                      RegWSrc <= UInt<2>("h1") @[IDStage.scala 316:19]
                      Rs1REn <= UInt<1>("h1") @[IDStage.scala 317:19]
                      Rs2REn <= UInt<1>("h1") @[IDStage.scala 318:19]
                      WordALUEn <= UInt<1>("h1") @[IDStage.scala 319:19]
                      node _T_57 = eq(UInt<1>("h0"), Funct3) @[IDStage.scala 320:21]
                      when _T_57 : @[IDStage.scala 320:21]
                        node _T_58 = eq(UInt<1>("h0"), Funct7) @[IDStage.scala 322:25]
                        when _T_58 : @[IDStage.scala 322:25]
                          WordALUOP <= UInt<3>("h1") @[IDStage.scala 323:41]
                        else :
                          node _T_59 = eq(UInt<6>("h20"), Funct7) @[IDStage.scala 322:25]
                          when _T_59 : @[IDStage.scala 322:25]
                            WordALUOP <= UInt<3>("h2") @[IDStage.scala 324:41]
                      else :
                        node _T_60 = eq(UInt<1>("h1"), Funct3) @[IDStage.scala 320:21]
                        when _T_60 : @[IDStage.scala 320:21]
                          node _T_61 = eq(UInt<1>("h0"), Funct7) @[IDStage.scala 328:25]
                          when _T_61 : @[IDStage.scala 328:25]
                            WordALUOP <= UInt<3>("h3") @[IDStage.scala 329:41]
                        else :
                          node _T_62 = eq(UInt<3>("h5"), Funct3) @[IDStage.scala 320:21]
                          when _T_62 : @[IDStage.scala 320:21]
                            node _T_63 = eq(UInt<1>("h0"), Funct7) @[IDStage.scala 333:25]
                            when _T_63 : @[IDStage.scala 333:25]
                              WordALUOP <= UInt<3>("h4") @[IDStage.scala 334:41]
                            else :
                              node _T_64 = eq(UInt<6>("h20"), Funct7) @[IDStage.scala 333:25]
                              when _T_64 : @[IDStage.scala 333:25]
                                WordALUOP <= UInt<3>("h5") @[IDStage.scala 335:41]
                    else :
                      node _T_65 = eq(UInt<7>("h6f"), Opcode) @[IDStage.scala 128:17]
                      when _T_65 : @[IDStage.scala 128:17]
                        ImmCtrl <= UInt<3>("h5") @[IDStage.scala 347:19]
                        JumpCtrl <= UInt<4>("h7") @[IDStage.scala 348:19]
                        ALUOP <= UInt<4>("h0") @[IDStage.scala 349:19]
                        ALUSrc1Ctrl <= UInt<2>("h2") @[IDStage.scala 350:19]
                        ALUSrc2Ctrl <= UInt<3>("h3") @[IDStage.scala 351:19]
                        RegWEn <= UInt<1>("h1") @[IDStage.scala 352:19]
                        RegWSrc <= UInt<2>("h1") @[IDStage.scala 353:19]
                      else :
                        node _T_66 = eq(UInt<7>("h67"), Opcode) @[IDStage.scala 128:17]
                        when _T_66 : @[IDStage.scala 128:17]
                          ImmCtrl <= UInt<3>("h1") @[IDStage.scala 356:19]
                          JumpCtrl <= UInt<4>("h8") @[IDStage.scala 357:19]
                          ALUOP <= UInt<4>("h0") @[IDStage.scala 358:19]
                          ALUSrc1Ctrl <= UInt<2>("h2") @[IDStage.scala 359:19]
                          ALUSrc2Ctrl <= UInt<3>("h3") @[IDStage.scala 360:19]
                          RegWEn <= UInt<1>("h1") @[IDStage.scala 361:19]
                          RegWSrc <= UInt<2>("h1") @[IDStage.scala 362:19]
                          Rs1REn <= UInt<1>("h1") @[IDStage.scala 363:19]
    io.ID.ImmCtrl <= ImmCtrl @[IDStage.scala 417:23]
    io.ID.JumpCtrl <= JumpCtrl @[IDStage.scala 418:23]
    io.EX_A.ALUOP <= ALUOP @[IDStage.scala 420:23]
    io.EX_A.ALUSrc1Ctrl <= ALUSrc1Ctrl @[IDStage.scala 421:23]
    io.EX_A.ALUSrc2Ctrl <= ALUSrc2Ctrl @[IDStage.scala 422:23]
    io.EX_A.WordALUEn <= WordALUEn @[IDStage.scala 423:23]
    io.EX_A.WordALUOP <= WordALUOP @[IDStage.scala 424:23]
    io.EX_B.MEMREn <= MEMREn @[IDStage.scala 426:23]
    io.EX_B.MEMRCtrl <= MEMRCtrl @[IDStage.scala 427:23]
    io.EX_B.MEMWEn <= MEMWEn @[IDStage.scala 428:23]
    io.EX_B.MEMWCtrl <= MEMWCtrl @[IDStage.scala 429:23]
    io.EX_C.RegWEn <= RegWEn @[IDStage.scala 431:23]
    io.EX_C.RegWSrc <= RegWSrc @[IDStage.scala 432:23]
    io.EX_C.Rd <= Rd @[IDStage.scala 433:23]
    io.EX_D.Rs1REn <= Rs1REn @[IDStage.scala 435:23]
    io.EX_D.Rs2REn <= Rs2REn @[IDStage.scala 436:23]
    io.EX_D.Rs1 <= Rs1 @[IDStage.scala 437:23]
    io.EX_D.Rs2 <= Rs2 @[IDStage.scala 438:23]

  module RegFile :
    input clock : Clock
    input reset : Reset
    output io : { ID : { flip Rs1 : UInt<5>, flip Rs2 : UInt<5>}, WB : { flip RegWEn : UInt<1>, flip WData : UInt<64>, flip Rd : UInt<5>}, EX : { RData1 : UInt<64>, RData2 : UInt<64>}}

    wire RData1 : UInt<64>
    RData1 <= UInt<64>("h0")
    wire RData2 : UInt<64>
    RData2 <= UInt<64>("h0")
    wire _gprFile_WIRE : UInt<64>[32] @[IDStage.scala 484:33]
    _gprFile_WIRE[0] <= UInt<64>("h0") @[IDStage.scala 484:33]
    _gprFile_WIRE[1] <= UInt<64>("h0") @[IDStage.scala 484:33]
    _gprFile_WIRE[2] <= UInt<64>("h0") @[IDStage.scala 484:33]
    _gprFile_WIRE[3] <= UInt<64>("h0") @[IDStage.scala 484:33]
    _gprFile_WIRE[4] <= UInt<64>("h0") @[IDStage.scala 484:33]
    _gprFile_WIRE[5] <= UInt<64>("h0") @[IDStage.scala 484:33]
    _gprFile_WIRE[6] <= UInt<64>("h0") @[IDStage.scala 484:33]
    _gprFile_WIRE[7] <= UInt<64>("h0") @[IDStage.scala 484:33]
    _gprFile_WIRE[8] <= UInt<64>("h0") @[IDStage.scala 484:33]
    _gprFile_WIRE[9] <= UInt<64>("h0") @[IDStage.scala 484:33]
    _gprFile_WIRE[10] <= UInt<64>("h0") @[IDStage.scala 484:33]
    _gprFile_WIRE[11] <= UInt<64>("h0") @[IDStage.scala 484:33]
    _gprFile_WIRE[12] <= UInt<64>("h0") @[IDStage.scala 484:33]
    _gprFile_WIRE[13] <= UInt<64>("h0") @[IDStage.scala 484:33]
    _gprFile_WIRE[14] <= UInt<64>("h0") @[IDStage.scala 484:33]
    _gprFile_WIRE[15] <= UInt<64>("h0") @[IDStage.scala 484:33]
    _gprFile_WIRE[16] <= UInt<64>("h0") @[IDStage.scala 484:33]
    _gprFile_WIRE[17] <= UInt<64>("h0") @[IDStage.scala 484:33]
    _gprFile_WIRE[18] <= UInt<64>("h0") @[IDStage.scala 484:33]
    _gprFile_WIRE[19] <= UInt<64>("h0") @[IDStage.scala 484:33]
    _gprFile_WIRE[20] <= UInt<64>("h0") @[IDStage.scala 484:33]
    _gprFile_WIRE[21] <= UInt<64>("h0") @[IDStage.scala 484:33]
    _gprFile_WIRE[22] <= UInt<64>("h0") @[IDStage.scala 484:33]
    _gprFile_WIRE[23] <= UInt<64>("h0") @[IDStage.scala 484:33]
    _gprFile_WIRE[24] <= UInt<64>("h0") @[IDStage.scala 484:33]
    _gprFile_WIRE[25] <= UInt<64>("h0") @[IDStage.scala 484:33]
    _gprFile_WIRE[26] <= UInt<64>("h0") @[IDStage.scala 484:33]
    _gprFile_WIRE[27] <= UInt<64>("h0") @[IDStage.scala 484:33]
    _gprFile_WIRE[28] <= UInt<64>("h0") @[IDStage.scala 484:33]
    _gprFile_WIRE[29] <= UInt<64>("h0") @[IDStage.scala 484:33]
    _gprFile_WIRE[30] <= UInt<64>("h0") @[IDStage.scala 484:33]
    _gprFile_WIRE[31] <= UInt<64>("h0") @[IDStage.scala 484:33]
    reg gprFile : UInt<64>[32], clock with :
      reset => (reset, _gprFile_WIRE) @[IDStage.scala 484:24]
    RData1 <= gprFile[io.ID.Rs1] @[IDStage.scala 485:10]
    RData2 <= gprFile[io.ID.Rs2] @[IDStage.scala 486:10]
    node _T = eq(io.ID.Rs1, io.WB.Rd) @[IDStage.scala 487:12]
    node _T_1 = and(_T, io.WB.RegWEn) @[IDStage.scala 487:19]
    node _T_2 = neq(io.WB.Rd, UInt<1>("h0")) @[IDStage.scala 487:32]
    node _T_3 = and(_T_1, _T_2) @[IDStage.scala 487:26]
    when _T_3 : @[IDStage.scala 487:40]
      RData1 <= io.WB.WData @[IDStage.scala 487:49]
    node _T_4 = eq(io.ID.Rs2, io.WB.Rd) @[IDStage.scala 488:12]
    node _T_5 = and(_T_4, io.WB.RegWEn) @[IDStage.scala 488:19]
    node _T_6 = neq(io.WB.Rd, UInt<1>("h0")) @[IDStage.scala 488:32]
    node _T_7 = and(_T_5, _T_6) @[IDStage.scala 488:26]
    when _T_7 : @[IDStage.scala 488:40]
      RData2 <= io.WB.WData @[IDStage.scala 488:49]
    when io.WB.RegWEn : @[IDStage.scala 489:12]
      gprFile[io.WB.Rd] <= io.WB.WData @[IDStage.scala 489:26]
    gprFile[0] <= UInt<64>("h0") @[IDStage.scala 490:14]
    io.EX.RData1 <= RData1 @[IDStage.scala 492:16]
    io.EX.RData2 <= RData2 @[IDStage.scala 493:16]

  module ImmSext :
    input clock : Clock
    input reset : Reset
    output io : { flip i31To7 : UInt<25>, flip immCtrl : UInt<3>, imm64 : UInt<64>}

    wire out : UInt<64>
    out <= UInt<64>("h0")
    node _T = eq(UInt<3>("h1"), io.immCtrl) @[IDStage.scala 524:20]
    when _T : @[IDStage.scala 524:20]
      node _out_T = bits(io.i31To7, 24, 24) @[IDStage.scala 525:52]
      node _out_T_1 = bits(_out_T, 0, 0) @[Bitwise.scala 74:15]
      node _out_T_2 = mux(_out_T_1, UInt<52>("hfffffffffffff"), UInt<52>("h0")) @[Bitwise.scala 74:12]
      node _out_T_3 = bits(io.i31To7, 24, 13) @[IDStage.scala 525:68]
      node _out_T_4 = cat(_out_T_2, _out_T_3) @[Cat.scala 31:58]
      out <= _out_T_4 @[IDStage.scala 525:27]
    else :
      node _T_1 = eq(UInt<3>("h2"), io.immCtrl) @[IDStage.scala 524:20]
      when _T_1 : @[IDStage.scala 524:20]
        node _out_T_5 = bits(io.i31To7, 24, 24) @[IDStage.scala 526:52]
        node _out_T_6 = bits(_out_T_5, 0, 0) @[Bitwise.scala 74:15]
        node _out_T_7 = mux(_out_T_6, UInt<52>("hfffffffffffff"), UInt<52>("h0")) @[Bitwise.scala 74:12]
        node _out_T_8 = bits(io.i31To7, 24, 18) @[IDStage.scala 526:68]
        node _out_T_9 = bits(io.i31To7, 4, 0) @[IDStage.scala 526:89]
        node out_hi = cat(_out_T_7, _out_T_8) @[Cat.scala 31:58]
        node _out_T_10 = cat(out_hi, _out_T_9) @[Cat.scala 31:58]
        out <= _out_T_10 @[IDStage.scala 526:27]
      else :
        node _T_2 = eq(UInt<3>("h3"), io.immCtrl) @[IDStage.scala 524:20]
        when _T_2 : @[IDStage.scala 524:20]
          node _out_T_11 = bits(io.i31To7, 24, 24) @[IDStage.scala 527:52]
          node _out_T_12 = bits(_out_T_11, 0, 0) @[Bitwise.scala 74:15]
          node _out_T_13 = mux(_out_T_12, UInt<51>("h7ffffffffffff"), UInt<51>("h0")) @[Bitwise.scala 74:12]
          node _out_T_14 = bits(io.i31To7, 24, 24) @[IDStage.scala 527:68]
          node _out_T_15 = bits(io.i31To7, 0, 0) @[IDStage.scala 527:83]
          node _out_T_16 = bits(io.i31To7, 23, 18) @[IDStage.scala 527:96]
          node _out_T_17 = bits(io.i31To7, 4, 1) @[IDStage.scala 527:116]
          node out_lo_hi = cat(_out_T_16, _out_T_17) @[Cat.scala 31:58]
          node out_lo = cat(out_lo_hi, UInt<1>("h0")) @[Cat.scala 31:58]
          node out_hi_hi = cat(_out_T_13, _out_T_14) @[Cat.scala 31:58]
          node out_hi_1 = cat(out_hi_hi, _out_T_15) @[Cat.scala 31:58]
          node _out_T_18 = cat(out_hi_1, out_lo) @[Cat.scala 31:58]
          out <= _out_T_18 @[IDStage.scala 527:27]
        else :
          node _T_3 = eq(UInt<3>("h4"), io.immCtrl) @[IDStage.scala 524:20]
          when _T_3 : @[IDStage.scala 524:20]
            node _out_T_19 = bits(io.i31To7, 24, 24) @[IDStage.scala 528:52]
            node _out_T_20 = bits(_out_T_19, 0, 0) @[Bitwise.scala 74:15]
            node _out_T_21 = mux(_out_T_20, UInt<32>("hffffffff"), UInt<32>("h0")) @[Bitwise.scala 74:12]
            node _out_T_22 = bits(io.i31To7, 24, 5) @[IDStage.scala 528:67]
            node out_hi_2 = cat(_out_T_21, _out_T_22) @[Cat.scala 31:58]
            node _out_T_23 = cat(out_hi_2, UInt<12>("h0")) @[Cat.scala 31:58]
            out <= _out_T_23 @[IDStage.scala 528:27]
          else :
            node _T_4 = eq(UInt<3>("h5"), io.immCtrl) @[IDStage.scala 524:20]
            when _T_4 : @[IDStage.scala 524:20]
              node _out_T_24 = bits(io.i31To7, 24, 24) @[IDStage.scala 529:52]
              node _out_T_25 = bits(_out_T_24, 0, 0) @[Bitwise.scala 74:15]
              node _out_T_26 = mux(_out_T_25, UInt<43>("h7ffffffffff"), UInt<43>("h0")) @[Bitwise.scala 74:12]
              node _out_T_27 = bits(io.i31To7, 24, 24) @[IDStage.scala 529:67]
              node _out_T_28 = bits(io.i31To7, 12, 5) @[IDStage.scala 529:81]
              node _out_T_29 = bits(io.i31To7, 13, 13) @[IDStage.scala 529:101]
              node _out_T_30 = bits(io.i31To7, 23, 14) @[IDStage.scala 529:115]
              node out_lo_hi_1 = cat(_out_T_29, _out_T_30) @[Cat.scala 31:58]
              node out_lo_1 = cat(out_lo_hi_1, UInt<1>("h0")) @[Cat.scala 31:58]
              node out_hi_hi_1 = cat(_out_T_26, _out_T_27) @[Cat.scala 31:58]
              node out_hi_3 = cat(out_hi_hi_1, _out_T_28) @[Cat.scala 31:58]
              node _out_T_31 = cat(out_hi_3, out_lo_1) @[Cat.scala 31:58]
              out <= _out_T_31 @[IDStage.scala 529:27]
            else :
              node _T_5 = eq(UInt<3>("h6"), io.immCtrl) @[IDStage.scala 524:20]
              when _T_5 : @[IDStage.scala 524:20]
                node _out_T_32 = mux(UInt<1>("h0"), UInt<59>("h7ffffffffffffff"), UInt<59>("h0")) @[Bitwise.scala 74:12]
                node _out_T_33 = bits(io.i31To7, 12, 8) @[IDStage.scala 530:62]
                node _out_T_34 = cat(_out_T_32, _out_T_33) @[Cat.scala 31:58]
                out <= _out_T_34 @[IDStage.scala 530:27]
    io.imm64 <= out @[IDStage.scala 532:14]

  module Transfer :
    input clock : Clock
    input reset : Reset
    output io : { ID_A : { flip JumpCtrl : UInt<4>}, ID_B : { flip PC : UInt<32>, flip Imm : UInt<64>, flip Rs1Data : UInt<64>, flip Rs2Data : UInt<64>}, PC : { JumpEn : UInt<1>, PC : UInt<32>}}

    node Rs1Data32 = bits(io.ID_B.Rs1Data, 31, 0) @[IDStage.scala 573:34]
    wire PCADDImm : UInt<32>
    PCADDImm <= UInt<32>("h0")
    wire Rs1ADDImm : UInt<32>
    Rs1ADDImm <= UInt<32>("h0")
    wire PCADD4 : UInt<32>
    PCADD4 <= UInt<32>("h0")
    wire nextPC : UInt<32>
    nextPC <= UInt<32>("h0")
    node _PCADDImm_T = add(io.ID_B.PC, io.ID_B.Imm) @[IDStage.scala 582:19]
    node _PCADDImm_T_1 = tail(_PCADDImm_T, 1) @[IDStage.scala 582:19]
    PCADDImm <= _PCADDImm_T_1 @[IDStage.scala 582:13]
    node _Rs1ADDImm_T = add(Rs1Data32, io.ID_B.Imm) @[IDStage.scala 583:27]
    node _Rs1ADDImm_T_1 = tail(_Rs1ADDImm_T, 1) @[IDStage.scala 583:27]
    node _Rs1ADDImm_T_2 = and(_Rs1ADDImm_T_1, UInt<32>("hfffffffe")) @[IDStage.scala 583:34]
    Rs1ADDImm <= _Rs1ADDImm_T_2 @[IDStage.scala 583:13]
    node _PCADD4_T = add(io.ID_B.PC, UInt<3>("h4")) @[IDStage.scala 584:19]
    node _PCADD4_T_1 = tail(_PCADD4_T, 1) @[IDStage.scala 584:19]
    PCADD4 <= _PCADD4_T_1 @[IDStage.scala 584:13]
    nextPC <= PCADD4 @[IDStage.scala 586:16]
    io.PC.JumpEn <= UInt<1>("h0") @[IDStage.scala 587:16]
    node _T = eq(UInt<4>("h1"), io.ID_A.JumpCtrl) @[IDStage.scala 588:19]
    when _T : @[IDStage.scala 588:19]
      node _T_1 = eq(io.ID_B.Rs1Data, io.ID_B.Rs2Data) @[IDStage.scala 590:20]
      when _T_1 : @[IDStage.scala 590:32]
        io.PC.JumpEn <= UInt<1>("h1") @[IDStage.scala 591:22]
        nextPC <= PCADDImm @[IDStage.scala 592:16]
    else :
      node _T_2 = eq(UInt<4>("h2"), io.ID_A.JumpCtrl) @[IDStage.scala 588:19]
      when _T_2 : @[IDStage.scala 588:19]
        node _T_3 = neq(io.ID_B.Rs1Data, io.ID_B.Rs2Data) @[IDStage.scala 596:20]
        when _T_3 : @[IDStage.scala 596:32]
          io.PC.JumpEn <= UInt<1>("h1") @[IDStage.scala 597:22]
          nextPC <= PCADDImm @[IDStage.scala 598:16]
      else :
        node _T_4 = eq(UInt<4>("h3"), io.ID_A.JumpCtrl) @[IDStage.scala 588:19]
        when _T_4 : @[IDStage.scala 588:19]
          node _T_5 = asSInt(io.ID_B.Rs1Data) @[IDStage.scala 602:20]
          node _T_6 = asSInt(io.ID_B.Rs2Data) @[IDStage.scala 602:37]
          node _T_7 = lt(_T_5, _T_6) @[IDStage.scala 602:27]
          when _T_7 : @[IDStage.scala 602:44]
            io.PC.JumpEn <= UInt<1>("h1") @[IDStage.scala 603:22]
            nextPC <= PCADDImm @[IDStage.scala 604:16]
        else :
          node _T_8 = eq(UInt<4>("h4"), io.ID_A.JumpCtrl) @[IDStage.scala 588:19]
          when _T_8 : @[IDStage.scala 588:19]
            node _T_9 = asSInt(io.ID_B.Rs1Data) @[IDStage.scala 608:20]
            node _T_10 = asSInt(io.ID_B.Rs2Data) @[IDStage.scala 608:38]
            node _T_11 = geq(_T_9, _T_10) @[IDStage.scala 608:27]
            when _T_11 : @[IDStage.scala 608:45]
              io.PC.JumpEn <= UInt<1>("h1") @[IDStage.scala 609:22]
              nextPC <= PCADDImm @[IDStage.scala 610:16]
          else :
            node _T_12 = eq(UInt<4>("h5"), io.ID_A.JumpCtrl) @[IDStage.scala 588:19]
            when _T_12 : @[IDStage.scala 588:19]
              node _T_13 = lt(io.ID_B.Rs1Data, io.ID_B.Rs2Data) @[IDStage.scala 614:20]
              when _T_13 : @[IDStage.scala 614:30]
                io.PC.JumpEn <= UInt<1>("h1") @[IDStage.scala 615:22]
                nextPC <= PCADDImm @[IDStage.scala 616:16]
            else :
              node _T_14 = eq(UInt<4>("h6"), io.ID_A.JumpCtrl) @[IDStage.scala 588:19]
              when _T_14 : @[IDStage.scala 588:19]
                node _T_15 = geq(io.ID_B.Rs1Data, io.ID_B.Rs2Data) @[IDStage.scala 620:20]
                when _T_15 : @[IDStage.scala 620:31]
                  io.PC.JumpEn <= UInt<1>("h1") @[IDStage.scala 621:22]
                  nextPC <= PCADDImm @[IDStage.scala 622:16]
              else :
                node _T_16 = eq(UInt<4>("h7"), io.ID_A.JumpCtrl) @[IDStage.scala 588:19]
                when _T_16 : @[IDStage.scala 588:19]
                  io.PC.JumpEn <= UInt<1>("h1") @[IDStage.scala 626:20]
                  nextPC <= PCADDImm @[IDStage.scala 627:14]
                else :
                  node _T_17 = eq(UInt<4>("h8"), io.ID_A.JumpCtrl) @[IDStage.scala 588:19]
                  when _T_17 : @[IDStage.scala 588:19]
                    io.PC.JumpEn <= UInt<1>("h1") @[IDStage.scala 630:20]
                    nextPC <= Rs1ADDImm @[IDStage.scala 631:14]
    io.PC.PC <= nextPC @[IDStage.scala 634:12]

  module IDStage :
    input clock : Clock
    input reset : UInt<1>
    output io : { IF : { flip Instr : UInt<32>, flip PC : UInt<32>}, EX_A : { ALUOP : UInt<4>, ALUSrc1Ctrl : UInt<3>, ALUSrc2Ctrl : UInt<3>, WordALUEn : UInt<1>, WordALUOP : UInt<3>}, EX_B : { MEMREn : UInt<1>, MEMRCtrl : UInt<3>, MEMWEn : UInt<1>, MEMWCtrl : UInt<3>}, EX_C : { RegWEn : UInt<1>, RegWSrc : UInt<2>, Rd : UInt<5>}, EX_D : { Rs1REn : UInt<1>, Rs2REn : UInt<1>, Rs1 : UInt<5>, Rs2 : UInt<5>}, EX_E : { PC : UInt<32>, Imm : UInt<64>, RData1 : UInt<64>, RData2 : UInt<64>}, WB : { flip RegWEn : UInt<1>, flip WData : UInt<64>, flip Rd : UInt<5>}, PC : { PC : UInt<32>}, HAZARD : { JumpEn : UInt<1>}, DATAPATH : { flip Rs1Ctrl : UInt<2>, flip Rs2Ctrl : UInt<2>, flip MEMData : UInt<64>, flip WBData : UInt<64>}}

    inst Decoder of Decoder @[IDStage.scala 693:24]
    Decoder.clock <= clock
    Decoder.reset <= reset
    inst RegFile of RegFile @[IDStage.scala 694:24]
    RegFile.clock <= clock
    RegFile.reset <= reset
    inst ImmSext of ImmSext @[IDStage.scala 695:24]
    ImmSext.clock <= clock
    ImmSext.reset <= reset
    inst Transfer of Transfer @[IDStage.scala 696:24]
    Transfer.clock <= clock
    Transfer.reset <= reset
    Decoder.io.IF.Instr <= io.IF.Instr @[IDStage.scala 699:23]
    io.EX_A.WordALUOP <= Decoder.io.EX_A.WordALUOP @[IDStage.scala 700:19]
    io.EX_A.WordALUEn <= Decoder.io.EX_A.WordALUEn @[IDStage.scala 700:19]
    io.EX_A.ALUSrc2Ctrl <= Decoder.io.EX_A.ALUSrc2Ctrl @[IDStage.scala 700:19]
    io.EX_A.ALUSrc1Ctrl <= Decoder.io.EX_A.ALUSrc1Ctrl @[IDStage.scala 700:19]
    io.EX_A.ALUOP <= Decoder.io.EX_A.ALUOP @[IDStage.scala 700:19]
    io.EX_B.MEMWCtrl <= Decoder.io.EX_B.MEMWCtrl @[IDStage.scala 701:19]
    io.EX_B.MEMWEn <= Decoder.io.EX_B.MEMWEn @[IDStage.scala 701:19]
    io.EX_B.MEMRCtrl <= Decoder.io.EX_B.MEMRCtrl @[IDStage.scala 701:19]
    io.EX_B.MEMREn <= Decoder.io.EX_B.MEMREn @[IDStage.scala 701:19]
    io.EX_C.Rd <= Decoder.io.EX_C.Rd @[IDStage.scala 702:19]
    io.EX_C.RegWSrc <= Decoder.io.EX_C.RegWSrc @[IDStage.scala 702:19]
    io.EX_C.RegWEn <= Decoder.io.EX_C.RegWEn @[IDStage.scala 702:19]
    io.EX_D.Rs2 <= Decoder.io.EX_D.Rs2 @[IDStage.scala 703:19]
    io.EX_D.Rs1 <= Decoder.io.EX_D.Rs1 @[IDStage.scala 703:19]
    io.EX_D.Rs2REn <= Decoder.io.EX_D.Rs2REn @[IDStage.scala 703:19]
    io.EX_D.Rs1REn <= Decoder.io.EX_D.Rs1REn @[IDStage.scala 703:19]
    node Rs1 = bits(io.IF.Instr, 19, 15) @[IDStage.scala 706:24]
    node Rs2 = bits(io.IF.Instr, 24, 20) @[IDStage.scala 707:24]
    RegFile.io.ID.Rs1 <= Rs1 @[IDStage.scala 708:21]
    RegFile.io.ID.Rs2 <= Rs2 @[IDStage.scala 709:21]
    RegFile.io.WB.Rd <= io.WB.Rd @[IDStage.scala 710:9]
    RegFile.io.WB.WData <= io.WB.WData @[IDStage.scala 710:9]
    RegFile.io.WB.RegWEn <= io.WB.RegWEn @[IDStage.scala 710:9]
    node Imm31To7 = bits(io.IF.Instr, 31, 7) @[IDStage.scala 715:29]
    ImmSext.io.i31To7 <= Imm31To7 @[IDStage.scala 716:22]
    ImmSext.io.immCtrl <= Decoder.io.ID.ImmCtrl @[IDStage.scala 717:22]
    io.EX_E.Imm <= ImmSext.io.imm64 @[IDStage.scala 718:15]
    wire RData1 : UInt<64>
    RData1 <= UInt<64>("h0")
    wire RData2 : UInt<64>
    RData2 <= UInt<64>("h0")
    node _T = eq(io.DATAPATH.Rs1Ctrl, UInt<2>("h1")) @[IDStage.scala 726:28]
    when _T : @[IDStage.scala 726:41]
      RData1 <= io.DATAPATH.MEMData @[IDStage.scala 726:50]
    else :
      node _T_1 = eq(io.DATAPATH.Rs1Ctrl, UInt<2>("h2")) @[IDStage.scala 727:33]
      when _T_1 : @[IDStage.scala 727:45]
        RData1 <= io.DATAPATH.WBData @[IDStage.scala 727:53]
      else :
        RData1 <= RegFile.io.EX.RData1 @[IDStage.scala 728:22]
    node _T_2 = eq(io.DATAPATH.Rs2Ctrl, UInt<2>("h1")) @[IDStage.scala 729:28]
    when _T_2 : @[IDStage.scala 729:41]
      RData2 <= io.DATAPATH.MEMData @[IDStage.scala 729:50]
    else :
      node _T_3 = eq(io.DATAPATH.Rs2Ctrl, UInt<2>("h2")) @[IDStage.scala 730:33]
      when _T_3 : @[IDStage.scala 730:45]
        RData2 <= io.DATAPATH.WBData @[IDStage.scala 730:53]
      else :
        RData2 <= RegFile.io.EX.RData2 @[IDStage.scala 731:22]
    io.EX_E.PC <= io.IF.PC @[IDStage.scala 733:18]
    io.EX_E.RData1 <= RData1 @[IDStage.scala 734:18]
    io.EX_E.RData2 <= RData2 @[IDStage.scala 735:18]
    Transfer.io.ID_A.JumpCtrl <= Decoder.io.ID.JumpCtrl @[IDStage.scala 740:29]
    Transfer.io.ID_B.PC <= io.IF.PC @[IDStage.scala 741:29]
    Transfer.io.ID_B.Imm <= ImmSext.io.imm64 @[IDStage.scala 742:29]
    Transfer.io.ID_B.Rs1Data <= RData1 @[IDStage.scala 743:29]
    Transfer.io.ID_B.Rs2Data <= RData2 @[IDStage.scala 744:29]
    io.HAZARD.JumpEn <= Transfer.io.PC.JumpEn @[IDStage.scala 745:20]
    io.PC.PC <= Transfer.io.PC.PC @[IDStage.scala 746:20]

