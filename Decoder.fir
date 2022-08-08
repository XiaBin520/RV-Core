circuit Decoder :
  module Decoder :
    output io : { INSTRIN : { flip Instr : UInt<32>}, IMMCTRL : { ImmCtrl : UInt<3>}, JUMPCTRL : { JumpCtrl : UInt<4>}, ALUCTRL : { ALUOP : UInt<4>, ALUData1Ctrl : UInt<3>, ALUData2Ctrl : UInt<3>, WordALUEn : UInt<1>, WordALUOP : UInt<3>}, MEMCTRL : { REn : UInt<1>, RCtrl : UInt<3>, WEn : UInt<1>, WCtrl : UInt<3>}, REGWRITE : { WEn : UInt<1>, Rd : UInt<5>}, REGREAD_A : { Rs1 : UInt<5>, Rs2 : UInt<5>}, REGREAD_B : { Rs1En : UInt<1>, Rs2En : UInt<1>}}

    node Opcode = bits(io.INSTRIN.Instr, 6, 0) @[Decoder.scala 93:32]
    node Rd = bits(io.INSTRIN.Instr, 11, 7) @[Decoder.scala 94:32]
    node Funct3 = bits(io.INSTRIN.Instr, 14, 12) @[Decoder.scala 95:32]
    node Rs1 = bits(io.INSTRIN.Instr, 19, 15) @[Decoder.scala 96:32]
    node Rs2 = bits(io.INSTRIN.Instr, 24, 20) @[Decoder.scala 97:32]
    node Funct7 = bits(io.INSTRIN.Instr, 31, 25) @[Decoder.scala 98:32]
    wire ImmCtrl : UInt<3>
    ImmCtrl <= UInt<3>("h0")
    wire JumpCtrl : UInt<4>
    JumpCtrl <= UInt<4>("h0")
    wire ALUOP : UInt<4>
    ALUOP <= UInt<4>("h0")
    wire ALUData1Ctrl : UInt<2>
    ALUData1Ctrl <= UInt<2>("h0")
    wire ALUData2Ctrl : UInt<3>
    ALUData2Ctrl <= UInt<3>("h0")
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
    wire Rs1En : UInt<1>
    Rs1En <= UInt<1>("h0")
    wire Rs2En : UInt<1>
    Rs2En <= UInt<1>("h0")
    node _T = eq(UInt<6>("h37"), Opcode) @[Decoder.scala 133:17]
    when _T : @[Decoder.scala 133:17]
      ImmCtrl <= UInt<3>("h4") @[Decoder.scala 136:20]
      ALUOP <= UInt<4>("h0") @[Decoder.scala 137:20]
      ALUData1Ctrl <= UInt<2>("h1") @[Decoder.scala 138:20]
      ALUData2Ctrl <= UInt<3>("h1") @[Decoder.scala 139:20]
      RegWEn <= UInt<1>("h1") @[Decoder.scala 140:20]
    else :
      node _T_1 = eq(UInt<5>("h17"), Opcode) @[Decoder.scala 133:17]
      when _T_1 : @[Decoder.scala 133:17]
        ImmCtrl <= UInt<3>("h4") @[Decoder.scala 144:19]
        ALUOP <= UInt<4>("h0") @[Decoder.scala 145:19]
        ALUData1Ctrl <= UInt<2>("h2") @[Decoder.scala 146:20]
        ALUData2Ctrl <= UInt<3>("h1") @[Decoder.scala 147:20]
        RegWEn <= UInt<1>("h1") @[Decoder.scala 148:19]
      else :
        node _T_2 = eq(UInt<7>("h63"), Opcode) @[Decoder.scala 133:17]
        when _T_2 : @[Decoder.scala 133:17]
          ImmCtrl <= UInt<3>("h3") @[Decoder.scala 158:15]
          Rs1En <= UInt<1>("h1") @[Decoder.scala 159:15]
          Rs2En <= UInt<1>("h1") @[Decoder.scala 160:15]
          node _T_3 = eq(UInt<1>("h0"), Funct3) @[Decoder.scala 161:21]
          when _T_3 : @[Decoder.scala 161:21]
            JumpCtrl <= UInt<4>("h1") @[Decoder.scala 162:32]
          else :
            node _T_4 = eq(UInt<1>("h1"), Funct3) @[Decoder.scala 161:21]
            when _T_4 : @[Decoder.scala 161:21]
              JumpCtrl <= UInt<4>("h2") @[Decoder.scala 163:32]
            else :
              node _T_5 = eq(UInt<3>("h4"), Funct3) @[Decoder.scala 161:21]
              when _T_5 : @[Decoder.scala 161:21]
                JumpCtrl <= UInt<4>("h3") @[Decoder.scala 164:32]
              else :
                node _T_6 = eq(UInt<3>("h5"), Funct3) @[Decoder.scala 161:21]
                when _T_6 : @[Decoder.scala 161:21]
                  JumpCtrl <= UInt<4>("h4") @[Decoder.scala 165:32]
                else :
                  node _T_7 = eq(UInt<3>("h6"), Funct3) @[Decoder.scala 161:21]
                  when _T_7 : @[Decoder.scala 161:21]
                    JumpCtrl <= UInt<4>("h5") @[Decoder.scala 166:32]
                  else :
                    node _T_8 = eq(UInt<3>("h7"), Funct3) @[Decoder.scala 161:21]
                    when _T_8 : @[Decoder.scala 161:21]
                      JumpCtrl <= UInt<4>("h6") @[Decoder.scala 167:32]
        else :
          node _T_9 = eq(UInt<2>("h3"), Opcode) @[Decoder.scala 133:17]
          when _T_9 : @[Decoder.scala 133:17]
            ImmCtrl <= UInt<3>("h1") @[Decoder.scala 179:19]
            ALUOP <= UInt<4>("h0") @[Decoder.scala 180:19]
            ALUData1Ctrl <= UInt<2>("h3") @[Decoder.scala 181:20]
            ALUData2Ctrl <= UInt<3>("h1") @[Decoder.scala 182:20]
            MEMREn <= UInt<1>("h1") @[Decoder.scala 183:14]
            RegWEn <= UInt<1>("h1") @[Decoder.scala 184:14]
            Rs1En <= UInt<1>("h1") @[Decoder.scala 185:14]
            node _T_10 = eq(UInt<1>("h0"), Funct3) @[Decoder.scala 186:21]
            when _T_10 : @[Decoder.scala 186:21]
              MEMRCtrl <= UInt<3>("h1") @[Decoder.scala 187:32]
            else :
              node _T_11 = eq(UInt<1>("h1"), Funct3) @[Decoder.scala 186:21]
              when _T_11 : @[Decoder.scala 186:21]
                MEMRCtrl <= UInt<3>("h2") @[Decoder.scala 188:32]
              else :
                node _T_12 = eq(UInt<2>("h2"), Funct3) @[Decoder.scala 186:21]
                when _T_12 : @[Decoder.scala 186:21]
                  MEMRCtrl <= UInt<3>("h3") @[Decoder.scala 189:32]
                else :
                  node _T_13 = eq(UInt<2>("h3"), Funct3) @[Decoder.scala 186:21]
                  when _T_13 : @[Decoder.scala 186:21]
                    MEMRCtrl <= UInt<3>("h7") @[Decoder.scala 190:32]
                  else :
                    node _T_14 = eq(UInt<3>("h4"), Funct3) @[Decoder.scala 186:21]
                    when _T_14 : @[Decoder.scala 186:21]
                      MEMRCtrl <= UInt<3>("h4") @[Decoder.scala 191:32]
                    else :
                      node _T_15 = eq(UInt<3>("h5"), Funct3) @[Decoder.scala 186:21]
                      when _T_15 : @[Decoder.scala 186:21]
                        MEMRCtrl <= UInt<3>("h5") @[Decoder.scala 192:32]
                      else :
                        node _T_16 = eq(UInt<3>("h6"), Funct3) @[Decoder.scala 186:21]
                        when _T_16 : @[Decoder.scala 186:21]
                          MEMRCtrl <= UInt<3>("h6") @[Decoder.scala 193:32]
          else :
            node _T_17 = eq(UInt<6>("h23"), Opcode) @[Decoder.scala 133:17]
            when _T_17 : @[Decoder.scala 133:17]
              ImmCtrl <= UInt<3>("h2") @[Decoder.scala 202:19]
              ALUOP <= UInt<4>("h0") @[Decoder.scala 203:20]
              ALUData1Ctrl <= UInt<2>("h3") @[Decoder.scala 204:20]
              ALUData2Ctrl <= UInt<3>("h1") @[Decoder.scala 205:20]
              MEMWEn <= UInt<1>("h1") @[Decoder.scala 206:14]
              Rs1En <= UInt<1>("h1") @[Decoder.scala 207:14]
              Rs2En <= UInt<1>("h1") @[Decoder.scala 208:14]
              node _T_18 = eq(UInt<1>("h0"), Funct3) @[Decoder.scala 209:21]
              when _T_18 : @[Decoder.scala 209:21]
                MEMWCtrl <= UInt<3>("h1") @[Decoder.scala 210:32]
              else :
                node _T_19 = eq(UInt<1>("h1"), Funct3) @[Decoder.scala 209:21]
                when _T_19 : @[Decoder.scala 209:21]
                  MEMWCtrl <= UInt<3>("h2") @[Decoder.scala 211:32]
                else :
                  node _T_20 = eq(UInt<2>("h2"), Funct3) @[Decoder.scala 209:21]
                  when _T_20 : @[Decoder.scala 209:21]
                    MEMWCtrl <= UInt<3>("h3") @[Decoder.scala 212:32]
                  else :
                    node _T_21 = eq(UInt<2>("h3"), Funct3) @[Decoder.scala 209:21]
                    when _T_21 : @[Decoder.scala 209:21]
                      MEMWCtrl <= UInt<3>("h4") @[Decoder.scala 213:32]
            else :
              node _T_22 = eq(UInt<5>("h13"), Opcode) @[Decoder.scala 133:17]
              when _T_22 : @[Decoder.scala 133:17]
                ImmCtrl <= UInt<3>("h1") @[Decoder.scala 228:19]
                ALUData1Ctrl <= UInt<2>("h3") @[Decoder.scala 229:20]
                ALUData2Ctrl <= UInt<3>("h1") @[Decoder.scala 230:20]
                RegWEn <= UInt<1>("h1") @[Decoder.scala 231:14]
                Rs1En <= UInt<1>("h1") @[Decoder.scala 232:14]
                node _T_23 = eq(UInt<1>("h0"), Funct3) @[Decoder.scala 233:21]
                when _T_23 : @[Decoder.scala 233:21]
                  ALUOP <= UInt<4>("h0") @[Decoder.scala 234:29]
                else :
                  node _T_24 = eq(UInt<2>("h2"), Funct3) @[Decoder.scala 233:21]
                  when _T_24 : @[Decoder.scala 233:21]
                    ALUOP <= UInt<4>("h2") @[Decoder.scala 235:29]
                  else :
                    node _T_25 = eq(UInt<2>("h3"), Funct3) @[Decoder.scala 233:21]
                    when _T_25 : @[Decoder.scala 233:21]
                      ALUOP <= UInt<4>("h3") @[Decoder.scala 236:29]
                    else :
                      node _T_26 = eq(UInt<3>("h4"), Funct3) @[Decoder.scala 233:21]
                      when _T_26 : @[Decoder.scala 233:21]
                        ALUOP <= UInt<4>("h4") @[Decoder.scala 237:29]
                      else :
                        node _T_27 = eq(UInt<3>("h6"), Funct3) @[Decoder.scala 233:21]
                        when _T_27 : @[Decoder.scala 233:21]
                          ALUOP <= UInt<4>("h5") @[Decoder.scala 238:29]
                        else :
                          node _T_28 = eq(UInt<3>("h7"), Funct3) @[Decoder.scala 233:21]
                          when _T_28 : @[Decoder.scala 233:21]
                            ALUOP <= UInt<4>("h6") @[Decoder.scala 239:29]
                          else :
                            node _T_29 = eq(UInt<1>("h1"), Funct3) @[Decoder.scala 233:21]
                            when _T_29 : @[Decoder.scala 233:21]
                              node _T_30 = and(Funct7, UInt<7>("h7e")) @[Decoder.scala 240:36]
                              node _T_31 = eq(UInt<1>("h0"), _T_30) @[Decoder.scala 240:36]
                              when _T_31 : @[Decoder.scala 240:60]
                                ALUOP <= UInt<4>("h7") @[Decoder.scala 240:67]
                            else :
                              node _T_32 = eq(UInt<3>("h5"), Funct3) @[Decoder.scala 233:21]
                              when _T_32 : @[Decoder.scala 233:21]
                                node _T_33 = and(Funct7, UInt<7>("h7e")) @[Decoder.scala 241:36]
                                node _T_34 = eq(UInt<1>("h0"), _T_33) @[Decoder.scala 241:36]
                                when _T_34 : @[Decoder.scala 241:60]
                                  ALUOP <= UInt<4>("h8") @[Decoder.scala 241:67]
                                else :
                                  node _T_35 = and(Funct7, UInt<7>("h7e")) @[Decoder.scala 242:36]
                                  node _T_36 = eq(UInt<6>("h20"), _T_35) @[Decoder.scala 242:36]
                                  when _T_36 : @[Decoder.scala 242:60]
                                    ALUOP <= UInt<4>("h9") @[Decoder.scala 242:67]
              else :
                node _T_37 = eq(UInt<5>("h1b"), Opcode) @[Decoder.scala 133:17]
                when _T_37 : @[Decoder.scala 133:17]
                  ImmCtrl <= UInt<3>("h1") @[Decoder.scala 253:19]
                  ALUData1Ctrl <= UInt<2>("h3") @[Decoder.scala 254:20]
                  ALUData2Ctrl <= UInt<3>("h1") @[Decoder.scala 255:20]
                  RegWEn <= UInt<1>("h1") @[Decoder.scala 256:17]
                  Rs1En <= UInt<1>("h1") @[Decoder.scala 257:17]
                  WordALUEn <= UInt<1>("h1") @[Decoder.scala 258:17]
                  node _T_38 = eq(UInt<1>("h0"), Funct3) @[Decoder.scala 259:21]
                  when _T_38 : @[Decoder.scala 259:21]
                    WordALUOP <= UInt<3>("h1") @[Decoder.scala 260:33]
                  else :
                    node _T_39 = eq(UInt<1>("h1"), Funct3) @[Decoder.scala 259:21]
                    when _T_39 : @[Decoder.scala 259:21]
                      WordALUOP <= UInt<3>("h3") @[Decoder.scala 261:33]
                    else :
                      node _T_40 = eq(UInt<3>("h5"), Funct3) @[Decoder.scala 259:21]
                      when _T_40 : @[Decoder.scala 259:21]
                        node _T_41 = eq(Funct7, UInt<1>("h0")) @[Decoder.scala 262:35]
                        when _T_41 : @[Decoder.scala 262:53]
                          WordALUOP <= UInt<3>("h4") @[Decoder.scala 262:64]
                        else :
                          node _T_42 = eq(Funct7, UInt<6>("h20")) @[Decoder.scala 263:35]
                          when _T_42 : @[Decoder.scala 263:53]
                            WordALUOP <= UInt<3>("h5") @[Decoder.scala 263:64]
                else :
                  node _T_43 = eq(UInt<6>("h33"), Opcode) @[Decoder.scala 133:17]
                  when _T_43 : @[Decoder.scala 133:17]
                    ALUData1Ctrl <= UInt<2>("h3") @[Decoder.scala 280:20]
                    ALUData2Ctrl <= UInt<3>("h2") @[Decoder.scala 281:20]
                    RegWEn <= UInt<1>("h1") @[Decoder.scala 282:14]
                    Rs1En <= UInt<1>("h1") @[Decoder.scala 283:14]
                    Rs2En <= UInt<1>("h1") @[Decoder.scala 284:14]
                    node _T_44 = eq(UInt<1>("h0"), Funct7) @[Decoder.scala 285:21]
                    when _T_44 : @[Decoder.scala 285:21]
                      node _T_45 = eq(UInt<1>("h0"), Funct3) @[Decoder.scala 287:25]
                      when _T_45 : @[Decoder.scala 287:25]
                        ALUOP <= UInt<4>("h0") @[Decoder.scala 288:33]
                      else :
                        node _T_46 = eq(UInt<1>("h1"), Funct3) @[Decoder.scala 287:25]
                        when _T_46 : @[Decoder.scala 287:25]
                          ALUOP <= UInt<4>("h7") @[Decoder.scala 289:33]
                        else :
                          node _T_47 = eq(UInt<2>("h2"), Funct3) @[Decoder.scala 287:25]
                          when _T_47 : @[Decoder.scala 287:25]
                            ALUOP <= UInt<4>("h2") @[Decoder.scala 290:33]
                          else :
                            node _T_48 = eq(UInt<2>("h3"), Funct3) @[Decoder.scala 287:25]
                            when _T_48 : @[Decoder.scala 287:25]
                              ALUOP <= UInt<4>("h3") @[Decoder.scala 291:33]
                            else :
                              node _T_49 = eq(UInt<3>("h4"), Funct3) @[Decoder.scala 287:25]
                              when _T_49 : @[Decoder.scala 287:25]
                                ALUOP <= UInt<4>("h4") @[Decoder.scala 292:33]
                              else :
                                node _T_50 = eq(UInt<3>("h5"), Funct3) @[Decoder.scala 287:25]
                                when _T_50 : @[Decoder.scala 287:25]
                                  ALUOP <= UInt<4>("h8") @[Decoder.scala 293:33]
                                else :
                                  node _T_51 = eq(UInt<3>("h6"), Funct3) @[Decoder.scala 287:25]
                                  when _T_51 : @[Decoder.scala 287:25]
                                    ALUOP <= UInt<4>("h5") @[Decoder.scala 294:33]
                                  else :
                                    node _T_52 = eq(UInt<3>("h7"), Funct3) @[Decoder.scala 287:25]
                                    when _T_52 : @[Decoder.scala 287:25]
                                      ALUOP <= UInt<4>("h6") @[Decoder.scala 295:33]
                    else :
                      node _T_53 = eq(UInt<6>("h20"), Funct7) @[Decoder.scala 285:21]
                      when _T_53 : @[Decoder.scala 285:21]
                        node _T_54 = eq(UInt<1>("h0"), Funct3) @[Decoder.scala 299:25]
                        when _T_54 : @[Decoder.scala 299:25]
                          ALUOP <= UInt<4>("h1") @[Decoder.scala 300:33]
                        else :
                          node _T_55 = eq(UInt<3>("h5"), Funct3) @[Decoder.scala 299:25]
                          when _T_55 : @[Decoder.scala 299:25]
                            ALUOP <= UInt<4>("h9") @[Decoder.scala 301:33]
                  else :
                    node _T_56 = eq(UInt<6>("h3b"), Opcode) @[Decoder.scala 133:17]
                    when _T_56 : @[Decoder.scala 133:17]
                      ALUData1Ctrl <= UInt<2>("h3") @[Decoder.scala 313:20]
                      ALUData2Ctrl <= UInt<3>("h2") @[Decoder.scala 314:20]
                      RegWEn <= UInt<1>("h1") @[Decoder.scala 315:14]
                      Rs1En <= UInt<1>("h1") @[Decoder.scala 316:14]
                      Rs2En <= UInt<1>("h1") @[Decoder.scala 317:14]
                      WordALUEn <= UInt<1>("h1") @[Decoder.scala 318:17]
                      node _T_57 = eq(UInt<1>("h0"), Funct3) @[Decoder.scala 319:21]
                      when _T_57 : @[Decoder.scala 319:21]
                        node _T_58 = eq(UInt<1>("h0"), Funct7) @[Decoder.scala 321:25]
                        when _T_58 : @[Decoder.scala 321:25]
                          WordALUOP <= UInt<3>("h1") @[Decoder.scala 322:41]
                        else :
                          node _T_59 = eq(UInt<6>("h20"), Funct7) @[Decoder.scala 321:25]
                          when _T_59 : @[Decoder.scala 321:25]
                            WordALUOP <= UInt<3>("h2") @[Decoder.scala 323:41]
                      else :
                        node _T_60 = eq(UInt<1>("h1"), Funct3) @[Decoder.scala 319:21]
                        when _T_60 : @[Decoder.scala 319:21]
                          node _T_61 = eq(UInt<1>("h0"), Funct7) @[Decoder.scala 327:25]
                          when _T_61 : @[Decoder.scala 327:25]
                            WordALUOP <= UInt<3>("h3") @[Decoder.scala 328:41]
                        else :
                          node _T_62 = eq(UInt<3>("h5"), Funct3) @[Decoder.scala 319:21]
                          when _T_62 : @[Decoder.scala 319:21]
                            node _T_63 = eq(UInt<1>("h0"), Funct7) @[Decoder.scala 332:25]
                            when _T_63 : @[Decoder.scala 332:25]
                              WordALUOP <= UInt<3>("h4") @[Decoder.scala 333:41]
                            else :
                              node _T_64 = eq(UInt<6>("h20"), Funct7) @[Decoder.scala 332:25]
                              when _T_64 : @[Decoder.scala 332:25]
                                WordALUOP <= UInt<3>("h5") @[Decoder.scala 334:41]
                    else :
                      node _T_65 = eq(UInt<7>("h6f"), Opcode) @[Decoder.scala 133:17]
                      when _T_65 : @[Decoder.scala 133:17]
                        ImmCtrl <= UInt<3>("h5") @[Decoder.scala 346:19]
                        JumpCtrl <= UInt<4>("h7") @[Decoder.scala 347:19]
                        ALUOP <= UInt<4>("h0") @[Decoder.scala 348:20]
                        ALUData1Ctrl <= UInt<2>("h2") @[Decoder.scala 349:20]
                        ALUData2Ctrl <= UInt<3>("h3") @[Decoder.scala 350:20]
                        RegWEn <= UInt<1>("h1") @[Decoder.scala 351:14]
                      else :
                        node _T_66 = eq(UInt<7>("h67"), Opcode) @[Decoder.scala 133:17]
                        when _T_66 : @[Decoder.scala 133:17]
                          ImmCtrl <= UInt<3>("h1") @[Decoder.scala 354:19]
                          JumpCtrl <= UInt<4>("h8") @[Decoder.scala 355:19]
                          ALUOP <= UInt<4>("h0") @[Decoder.scala 356:20]
                          ALUData1Ctrl <= UInt<2>("h2") @[Decoder.scala 357:20]
                          ALUData2Ctrl <= UInt<3>("h3") @[Decoder.scala 358:20]
                          RegWEn <= UInt<1>("h1") @[Decoder.scala 359:14]
                          Rs1En <= UInt<1>("h1") @[Decoder.scala 360:14]
    io.IMMCTRL.ImmCtrl <= ImmCtrl @[Decoder.scala 414:22]
    io.JUMPCTRL.JumpCtrl <= JumpCtrl @[Decoder.scala 416:24]
    io.ALUCTRL.ALUOP <= ALUOP @[Decoder.scala 418:27]
    io.ALUCTRL.ALUData1Ctrl <= ALUData1Ctrl @[Decoder.scala 419:27]
    io.ALUCTRL.ALUData2Ctrl <= ALUData2Ctrl @[Decoder.scala 420:27]
    io.ALUCTRL.WordALUEn <= WordALUEn @[Decoder.scala 421:27]
    io.ALUCTRL.WordALUOP <= WordALUOP @[Decoder.scala 422:27]
    io.MEMCTRL.REn <= MEMREn @[Decoder.scala 424:20]
    io.MEMCTRL.RCtrl <= MEMRCtrl @[Decoder.scala 425:20]
    io.MEMCTRL.WEn <= MEMWEn @[Decoder.scala 426:20]
    io.MEMCTRL.WCtrl <= MEMWCtrl @[Decoder.scala 427:20]
    io.REGWRITE.WEn <= RegWEn @[Decoder.scala 429:19]
    io.REGWRITE.Rd <= Rd @[Decoder.scala 430:19]
    io.REGREAD_A.Rs1 <= Rs1 @[Decoder.scala 432:20]
    io.REGREAD_A.Rs2 <= Rs2 @[Decoder.scala 433:20]
    io.REGREAD_B.Rs1En <= Rs1En @[Decoder.scala 435:22]
    io.REGREAD_B.Rs2En <= Rs2En @[Decoder.scala 436:22]

