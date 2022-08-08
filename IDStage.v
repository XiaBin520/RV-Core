module Decoder(
  input  [31:0] io_IF_Instr,
  output [2:0]  io_ID_ImmCtrl,
  output [3:0]  io_ID_JumpCtrl,
  output [3:0]  io_EX_A_ALUOP,
  output [2:0]  io_EX_A_ALUSrc1Ctrl,
  output [2:0]  io_EX_A_ALUSrc2Ctrl,
  output        io_EX_A_WordALUEn,
  output [2:0]  io_EX_A_WordALUOP,
  output        io_EX_B_MEMREn,
  output [2:0]  io_EX_B_MEMRCtrl,
  output        io_EX_B_MEMWEn,
  output [2:0]  io_EX_B_MEMWCtrl,
  output        io_EX_C_RegWEn,
  output [1:0]  io_EX_C_RegWSrc,
  output [4:0]  io_EX_C_Rd,
  output        io_EX_D_Rs1REn,
  output        io_EX_D_Rs2REn,
  output [4:0]  io_EX_D_Rs1,
  output [4:0]  io_EX_D_Rs2
);
  wire [6:0] Opcode = io_IF_Instr[6:0]; // @[IDStage.scala 85:27]
  wire [2:0] Funct3 = io_IF_Instr[14:12]; // @[IDStage.scala 87:27]
  wire [6:0] Funct7 = io_IF_Instr[31:25]; // @[IDStage.scala 90:27]
  wire  _T_3 = 3'h0 == Funct3; // @[IDStage.scala 158:21]
  wire  _T_4 = 3'h1 == Funct3; // @[IDStage.scala 158:21]
  wire  _T_5 = 3'h4 == Funct3; // @[IDStage.scala 158:21]
  wire  _T_6 = 3'h5 == Funct3; // @[IDStage.scala 158:21]
  wire  _T_7 = 3'h6 == Funct3; // @[IDStage.scala 158:21]
  wire  _T_8 = 3'h7 == Funct3; // @[IDStage.scala 158:21]
  wire [3:0] _GEN_0 = 3'h7 == Funct3 ? 4'h6 : 4'h0; // @[IDStage.scala 158:21 164:32]
  wire [3:0] _GEN_1 = 3'h6 == Funct3 ? 4'h5 : _GEN_0; // @[IDStage.scala 158:21 163:32]
  wire [3:0] _GEN_2 = 3'h5 == Funct3 ? 4'h4 : _GEN_1; // @[IDStage.scala 158:21 162:32]
  wire [3:0] _GEN_3 = 3'h4 == Funct3 ? 4'h3 : _GEN_2; // @[IDStage.scala 158:21 161:32]
  wire [3:0] _GEN_4 = 3'h1 == Funct3 ? 4'h2 : _GEN_3; // @[IDStage.scala 158:21 160:32]
  wire [3:0] _GEN_5 = 3'h0 == Funct3 ? 4'h1 : _GEN_4; // @[IDStage.scala 158:21 159:32]
  wire  _T_12 = 3'h2 == Funct3; // @[IDStage.scala 184:21]
  wire  _T_13 = 3'h3 == Funct3; // @[IDStage.scala 184:21]
  wire [2:0] _GEN_6 = _T_7 ? 3'h6 : 3'h0; // @[IDStage.scala 184:21 191:32]
  wire [2:0] _GEN_7 = _T_6 ? 3'h5 : _GEN_6; // @[IDStage.scala 184:21 190:32]
  wire [2:0] _GEN_8 = _T_5 ? 3'h4 : _GEN_7; // @[IDStage.scala 184:21 189:32]
  wire [2:0] _GEN_9 = 3'h3 == Funct3 ? 3'h7 : _GEN_8; // @[IDStage.scala 184:21 188:32]
  wire [2:0] _GEN_10 = 3'h2 == Funct3 ? 3'h3 : _GEN_9; // @[IDStage.scala 184:21 187:32]
  wire [2:0] _GEN_11 = _T_4 ? 3'h2 : _GEN_10; // @[IDStage.scala 184:21 186:32]
  wire [2:0] _GEN_12 = _T_3 ? 3'h1 : _GEN_11; // @[IDStage.scala 184:21 185:32]
  wire [2:0] _GEN_13 = _T_13 ? 3'h4 : 3'h0; // @[IDStage.scala 206:21 210:32]
  wire [2:0] _GEN_14 = _T_12 ? 3'h3 : _GEN_13; // @[IDStage.scala 206:21 209:32]
  wire [2:0] _GEN_15 = _T_4 ? 3'h2 : _GEN_14; // @[IDStage.scala 206:21 208:32]
  wire [2:0] _GEN_16 = _T_3 ? 3'h1 : _GEN_15; // @[IDStage.scala 206:21 207:32]
  wire [6:0] _T_30 = Funct7 & 7'h7e; // @[IDStage.scala 238:36]
  wire  _T_31 = 7'h0 == _T_30; // @[IDStage.scala 238:36]
  wire [3:0] _GEN_17 = 7'h0 == _T_30 ? 4'h7 : 4'h0; // @[IDStage.scala 238:{60,67}]
  wire [3:0] _GEN_18 = 7'h20 == _T_30 ? 4'h9 : 4'h0; // @[IDStage.scala 240:{60,67}]
  wire [3:0] _GEN_19 = _T_31 ? 4'h8 : _GEN_18; // @[IDStage.scala 239:{60,67}]
  wire [3:0] _GEN_20 = _T_6 ? _GEN_19 : 4'h0; // @[IDStage.scala 231:21]
  wire [3:0] _GEN_21 = _T_4 ? _GEN_17 : _GEN_20; // @[IDStage.scala 231:21]
  wire [3:0] _GEN_22 = _T_8 ? 4'h6 : _GEN_21; // @[IDStage.scala 231:21 237:29]
  wire [3:0] _GEN_23 = _T_7 ? 4'h5 : _GEN_22; // @[IDStage.scala 231:21 236:29]
  wire [3:0] _GEN_24 = _T_5 ? 4'h4 : _GEN_23; // @[IDStage.scala 231:21 235:29]
  wire [3:0] _GEN_25 = _T_13 ? 4'h3 : _GEN_24; // @[IDStage.scala 231:21 234:29]
  wire [3:0] _GEN_26 = _T_12 ? 4'h2 : _GEN_25; // @[IDStage.scala 231:21 233:29]
  wire [3:0] _GEN_27 = _T_3 ? 4'h0 : _GEN_26; // @[IDStage.scala 231:21 232:29]
  wire [2:0] _GEN_28 = Funct7 == 7'h20 ? 3'h5 : 3'h0; // @[IDStage.scala 262:{53,64}]
  wire [2:0] _GEN_29 = Funct7 == 7'h0 ? 3'h4 : _GEN_28; // @[IDStage.scala 261:{53,64}]
  wire [2:0] _GEN_30 = _T_6 ? _GEN_29 : 3'h0; // @[IDStage.scala 258:21]
  wire [2:0] _GEN_31 = _T_4 ? 3'h3 : _GEN_30; // @[IDStage.scala 258:21 260:33]
  wire [2:0] _GEN_32 = _T_3 ? 3'h1 : _GEN_31; // @[IDStage.scala 258:21 259:33]
  wire  _T_44 = 7'h0 == Funct7; // @[IDStage.scala 285:21]
  wire [3:0] _GEN_35 = _T_6 ? 4'h8 : _GEN_1; // @[IDStage.scala 287:25 293:33]
  wire [3:0] _GEN_36 = _T_5 ? 4'h4 : _GEN_35; // @[IDStage.scala 287:25 292:33]
  wire [3:0] _GEN_37 = _T_13 ? 4'h3 : _GEN_36; // @[IDStage.scala 287:25 291:33]
  wire [3:0] _GEN_38 = _T_12 ? 4'h2 : _GEN_37; // @[IDStage.scala 287:25 290:33]
  wire [3:0] _GEN_39 = _T_4 ? 4'h7 : _GEN_38; // @[IDStage.scala 287:25 289:33]
  wire [3:0] _GEN_40 = _T_3 ? 4'h0 : _GEN_39; // @[IDStage.scala 287:25 288:33]
  wire  _T_53 = 7'h20 == Funct7; // @[IDStage.scala 285:21]
  wire [3:0] _GEN_41 = _T_6 ? 4'h9 : 4'h0; // @[IDStage.scala 299:25 301:33]
  wire [3:0] _GEN_42 = _T_3 ? 4'h1 : _GEN_41; // @[IDStage.scala 299:25 300:33]
  wire [3:0] _GEN_43 = 7'h20 == Funct7 ? _GEN_42 : 4'h0; // @[IDStage.scala 285:21]
  wire [3:0] _GEN_44 = 7'h0 == Funct7 ? _GEN_40 : _GEN_43; // @[IDStage.scala 285:21]
  wire [2:0] _GEN_45 = _T_53 ? 3'h2 : 3'h0; // @[IDStage.scala 322:25 324:41]
  wire [2:0] _GEN_46 = _T_44 ? 3'h1 : _GEN_45; // @[IDStage.scala 322:25 323:41]
  wire [2:0] _GEN_47 = _T_44 ? 3'h3 : 3'h0; // @[IDStage.scala 328:25 329:41]
  wire [2:0] _GEN_48 = _T_53 ? 3'h5 : 3'h0; // @[IDStage.scala 333:25 335:41]
  wire [2:0] _GEN_49 = _T_44 ? 3'h4 : _GEN_48; // @[IDStage.scala 333:25 334:41]
  wire [2:0] _GEN_50 = _T_6 ? _GEN_49 : 3'h0; // @[IDStage.scala 320:21]
  wire [2:0] _GEN_51 = _T_4 ? _GEN_47 : _GEN_50; // @[IDStage.scala 320:21]
  wire [2:0] _GEN_52 = _T_3 ? _GEN_46 : _GEN_51; // @[IDStage.scala 320:21]
  wire [2:0] _GEN_53 = 7'h67 == Opcode ? 3'h1 : 3'h0; // @[IDStage.scala 128:17 356:19]
  wire [3:0] _GEN_54 = 7'h67 == Opcode ? 4'h8 : 4'h0; // @[IDStage.scala 128:17 357:19]
  wire [1:0] _GEN_56 = 7'h67 == Opcode ? 2'h2 : 2'h0; // @[IDStage.scala 128:17 359:19]
  wire [2:0] _GEN_57 = 7'h67 == Opcode ? 3'h3 : 3'h0; // @[IDStage.scala 128:17 360:19]
  wire [1:0] _GEN_59 = 7'h67 == Opcode ? 2'h1 : 2'h0; // @[IDStage.scala 128:17 362:19]
  wire [2:0] _GEN_60 = 7'h6f == Opcode ? 3'h5 : _GEN_53; // @[IDStage.scala 128:17 347:19]
  wire [3:0] _GEN_61 = 7'h6f == Opcode ? 4'h7 : _GEN_54; // @[IDStage.scala 128:17 348:19]
  wire [1:0] _GEN_63 = 7'h6f == Opcode ? 2'h2 : _GEN_56; // @[IDStage.scala 128:17 350:19]
  wire [2:0] _GEN_64 = 7'h6f == Opcode ? 3'h3 : _GEN_57; // @[IDStage.scala 128:17 351:19]
  wire  _GEN_65 = 7'h6f == Opcode | 7'h67 == Opcode; // @[IDStage.scala 128:17 352:19]
  wire [1:0] _GEN_66 = 7'h6f == Opcode ? 2'h1 : _GEN_59; // @[IDStage.scala 128:17 353:19]
  wire  _GEN_67 = 7'h6f == Opcode ? 1'h0 : 7'h67 == Opcode; // @[IDStage.scala 128:17]
  wire [1:0] _GEN_68 = 7'h3b == Opcode ? 2'h3 : _GEN_63; // @[IDStage.scala 128:17 313:19]
  wire [2:0] _GEN_69 = 7'h3b == Opcode ? 3'h2 : _GEN_64; // @[IDStage.scala 128:17 314:19]
  wire  _GEN_70 = 7'h3b == Opcode | _GEN_65; // @[IDStage.scala 128:17 315:19]
  wire [1:0] _GEN_71 = 7'h3b == Opcode ? 2'h1 : _GEN_66; // @[IDStage.scala 128:17 316:19]
  wire  _GEN_72 = 7'h3b == Opcode | _GEN_67; // @[IDStage.scala 128:17 317:19]
  wire [2:0] _GEN_74 = 7'h3b == Opcode ? _GEN_52 : 3'h0; // @[IDStage.scala 128:17]
  wire [2:0] _GEN_75 = 7'h3b == Opcode ? 3'h0 : _GEN_60; // @[IDStage.scala 128:17]
  wire [3:0] _GEN_76 = 7'h3b == Opcode ? 4'h0 : _GEN_61; // @[IDStage.scala 128:17]
  wire [1:0] _GEN_78 = 7'h33 == Opcode ? 2'h3 : _GEN_68; // @[IDStage.scala 128:17 279:19]
  wire [2:0] _GEN_79 = 7'h33 == Opcode ? 3'h2 : _GEN_69; // @[IDStage.scala 128:17 280:19]
  wire  _GEN_80 = 7'h33 == Opcode | _GEN_70; // @[IDStage.scala 128:17 281:19]
  wire [1:0] _GEN_81 = 7'h33 == Opcode ? 2'h1 : _GEN_71; // @[IDStage.scala 128:17 282:19]
  wire  _GEN_82 = 7'h33 == Opcode | _GEN_72; // @[IDStage.scala 128:17 283:19]
  wire  _GEN_83 = 7'h33 == Opcode | 7'h3b == Opcode; // @[IDStage.scala 128:17 284:19]
  wire [3:0] _GEN_84 = 7'h33 == Opcode ? _GEN_44 : 4'h0; // @[IDStage.scala 128:17]
  wire  _GEN_85 = 7'h33 == Opcode ? 1'h0 : 7'h3b == Opcode; // @[IDStage.scala 128:17]
  wire [2:0] _GEN_86 = 7'h33 == Opcode ? 3'h0 : _GEN_74; // @[IDStage.scala 128:17]
  wire [2:0] _GEN_87 = 7'h33 == Opcode ? 3'h0 : _GEN_75; // @[IDStage.scala 128:17]
  wire [3:0] _GEN_88 = 7'h33 == Opcode ? 4'h0 : _GEN_76; // @[IDStage.scala 128:17]
  wire [2:0] _GEN_89 = 7'h1b == Opcode ? 3'h1 : _GEN_87; // @[IDStage.scala 128:17 251:19]
  wire [1:0] _GEN_90 = 7'h1b == Opcode ? 2'h3 : _GEN_78; // @[IDStage.scala 128:17 252:19]
  wire [2:0] _GEN_91 = 7'h1b == Opcode ? 3'h1 : _GEN_79; // @[IDStage.scala 128:17 253:19]
  wire  _GEN_92 = 7'h1b == Opcode | _GEN_80; // @[IDStage.scala 128:17 254:19]
  wire [1:0] _GEN_93 = 7'h1b == Opcode ? 2'h1 : _GEN_81; // @[IDStage.scala 128:17 255:19]
  wire  _GEN_94 = 7'h1b == Opcode | _GEN_82; // @[IDStage.scala 128:17 256:19]
  wire  _GEN_95 = 7'h1b == Opcode | _GEN_85; // @[IDStage.scala 128:17 257:19]
  wire [2:0] _GEN_96 = 7'h1b == Opcode ? _GEN_32 : _GEN_86; // @[IDStage.scala 128:17]
  wire  _GEN_97 = 7'h1b == Opcode ? 1'h0 : _GEN_83; // @[IDStage.scala 128:17]
  wire [3:0] _GEN_98 = 7'h1b == Opcode ? 4'h0 : _GEN_84; // @[IDStage.scala 128:17]
  wire [3:0] _GEN_99 = 7'h1b == Opcode ? 4'h0 : _GEN_88; // @[IDStage.scala 128:17]
  wire [2:0] _GEN_100 = 7'h13 == Opcode ? 3'h1 : _GEN_89; // @[IDStage.scala 128:17 225:19]
  wire [1:0] _GEN_101 = 7'h13 == Opcode ? 2'h3 : _GEN_90; // @[IDStage.scala 128:17 226:19]
  wire [2:0] _GEN_102 = 7'h13 == Opcode ? 3'h1 : _GEN_91; // @[IDStage.scala 128:17 227:19]
  wire  _GEN_103 = 7'h13 == Opcode | _GEN_92; // @[IDStage.scala 128:17 228:19]
  wire [1:0] _GEN_104 = 7'h13 == Opcode ? 2'h1 : _GEN_93; // @[IDStage.scala 128:17 229:19]
  wire  _GEN_105 = 7'h13 == Opcode | _GEN_94; // @[IDStage.scala 128:17 230:19]
  wire [3:0] _GEN_106 = 7'h13 == Opcode ? _GEN_27 : _GEN_98; // @[IDStage.scala 128:17]
  wire  _GEN_107 = 7'h13 == Opcode ? 1'h0 : _GEN_95; // @[IDStage.scala 128:17]
  wire [2:0] _GEN_108 = 7'h13 == Opcode ? 3'h0 : _GEN_96; // @[IDStage.scala 128:17]
  wire  _GEN_109 = 7'h13 == Opcode ? 1'h0 : _GEN_97; // @[IDStage.scala 128:17]
  wire [3:0] _GEN_110 = 7'h13 == Opcode ? 4'h0 : _GEN_99; // @[IDStage.scala 128:17]
  wire [2:0] _GEN_111 = 7'h23 == Opcode ? 3'h2 : _GEN_100; // @[IDStage.scala 128:17 200:19]
  wire [3:0] _GEN_112 = 7'h23 == Opcode ? 4'h0 : _GEN_106; // @[IDStage.scala 128:17 201:19]
  wire [1:0] _GEN_113 = 7'h23 == Opcode ? 2'h3 : _GEN_101; // @[IDStage.scala 128:17 202:19]
  wire [2:0] _GEN_114 = 7'h23 == Opcode ? 3'h1 : _GEN_102; // @[IDStage.scala 128:17 203:19]
  wire  _GEN_116 = 7'h23 == Opcode | _GEN_105; // @[IDStage.scala 128:17 205:19]
  wire [2:0] _GEN_117 = 7'h23 == Opcode ? _GEN_16 : 3'h0; // @[IDStage.scala 128:17]
  wire  _GEN_118 = 7'h23 == Opcode ? 1'h0 : _GEN_103; // @[IDStage.scala 128:17]
  wire [1:0] _GEN_119 = 7'h23 == Opcode ? 2'h0 : _GEN_104; // @[IDStage.scala 128:17]
  wire  _GEN_120 = 7'h23 == Opcode ? 1'h0 : _GEN_107; // @[IDStage.scala 128:17]
  wire [2:0] _GEN_121 = 7'h23 == Opcode ? 3'h0 : _GEN_108; // @[IDStage.scala 128:17]
  wire  _GEN_122 = 7'h23 == Opcode ? 1'h0 : _GEN_109; // @[IDStage.scala 128:17]
  wire [3:0] _GEN_123 = 7'h23 == Opcode ? 4'h0 : _GEN_110; // @[IDStage.scala 128:17]
  wire [2:0] _GEN_124 = 7'h3 == Opcode ? 3'h1 : _GEN_111; // @[IDStage.scala 128:17 176:19]
  wire [3:0] _GEN_125 = 7'h3 == Opcode ? 4'h0 : _GEN_112; // @[IDStage.scala 128:17 177:19]
  wire [1:0] _GEN_126 = 7'h3 == Opcode ? 2'h3 : _GEN_113; // @[IDStage.scala 128:17 178:19]
  wire [2:0] _GEN_127 = 7'h3 == Opcode ? 3'h1 : _GEN_114; // @[IDStage.scala 128:17 179:19]
  wire  _GEN_129 = 7'h3 == Opcode | _GEN_118; // @[IDStage.scala 128:17 181:19]
  wire [1:0] _GEN_130 = 7'h3 == Opcode ? 2'h2 : _GEN_119; // @[IDStage.scala 128:17 182:19]
  wire  _GEN_131 = 7'h3 == Opcode | _GEN_116; // @[IDStage.scala 128:17 183:19]
  wire [2:0] _GEN_132 = 7'h3 == Opcode ? _GEN_12 : 3'h0; // @[IDStage.scala 128:17]
  wire  _GEN_133 = 7'h3 == Opcode ? 1'h0 : 7'h23 == Opcode; // @[IDStage.scala 128:17]
  wire [2:0] _GEN_134 = 7'h3 == Opcode ? 3'h0 : _GEN_117; // @[IDStage.scala 128:17]
  wire  _GEN_135 = 7'h3 == Opcode ? 1'h0 : _GEN_120; // @[IDStage.scala 128:17]
  wire [2:0] _GEN_136 = 7'h3 == Opcode ? 3'h0 : _GEN_121; // @[IDStage.scala 128:17]
  wire  _GEN_137 = 7'h3 == Opcode ? 1'h0 : _GEN_122; // @[IDStage.scala 128:17]
  wire [3:0] _GEN_138 = 7'h3 == Opcode ? 4'h0 : _GEN_123; // @[IDStage.scala 128:17]
  wire [2:0] _GEN_139 = 7'h63 == Opcode ? 3'h3 : _GEN_124; // @[IDStage.scala 128:17 155:15]
  wire  _GEN_140 = 7'h63 == Opcode | _GEN_131; // @[IDStage.scala 128:17 156:15]
  wire  _GEN_141 = 7'h63 == Opcode | _GEN_137; // @[IDStage.scala 128:17 157:15]
  wire [3:0] _GEN_142 = 7'h63 == Opcode ? _GEN_5 : _GEN_138; // @[IDStage.scala 128:17]
  wire [3:0] _GEN_143 = 7'h63 == Opcode ? 4'h0 : _GEN_125; // @[IDStage.scala 128:17]
  wire [1:0] _GEN_144 = 7'h63 == Opcode ? 2'h0 : _GEN_126; // @[IDStage.scala 128:17]
  wire [2:0] _GEN_145 = 7'h63 == Opcode ? 3'h0 : _GEN_127; // @[IDStage.scala 128:17]
  wire  _GEN_146 = 7'h63 == Opcode ? 1'h0 : 7'h3 == Opcode; // @[IDStage.scala 128:17]
  wire  _GEN_147 = 7'h63 == Opcode ? 1'h0 : _GEN_129; // @[IDStage.scala 128:17]
  wire [1:0] _GEN_148 = 7'h63 == Opcode ? 2'h0 : _GEN_130; // @[IDStage.scala 128:17]
  wire [2:0] _GEN_149 = 7'h63 == Opcode ? 3'h0 : _GEN_132; // @[IDStage.scala 128:17]
  wire  _GEN_150 = 7'h63 == Opcode ? 1'h0 : _GEN_133; // @[IDStage.scala 128:17]
  wire [2:0] _GEN_151 = 7'h63 == Opcode ? 3'h0 : _GEN_134; // @[IDStage.scala 128:17]
  wire  _GEN_152 = 7'h63 == Opcode ? 1'h0 : _GEN_135; // @[IDStage.scala 128:17]
  wire [2:0] _GEN_153 = 7'h63 == Opcode ? 3'h0 : _GEN_136; // @[IDStage.scala 128:17]
  wire [2:0] _GEN_154 = 7'h17 == Opcode ? 3'h4 : _GEN_139; // @[IDStage.scala 128:17 140:19]
  wire [3:0] _GEN_155 = 7'h17 == Opcode ? 4'h0 : _GEN_143; // @[IDStage.scala 128:17 141:19]
  wire [1:0] _GEN_156 = 7'h17 == Opcode ? 2'h2 : _GEN_144; // @[IDStage.scala 128:17 142:19]
  wire [2:0] _GEN_157 = 7'h17 == Opcode ? 3'h1 : _GEN_145; // @[IDStage.scala 128:17 143:19]
  wire  _GEN_158 = 7'h17 == Opcode | _GEN_147; // @[IDStage.scala 128:17 144:19]
  wire [1:0] _GEN_159 = 7'h17 == Opcode ? 2'h1 : _GEN_148; // @[IDStage.scala 128:17 145:19]
  wire  _GEN_160 = 7'h17 == Opcode ? 1'h0 : _GEN_140; // @[IDStage.scala 128:17]
  wire  _GEN_161 = 7'h17 == Opcode ? 1'h0 : _GEN_141; // @[IDStage.scala 128:17]
  wire [3:0] _GEN_162 = 7'h17 == Opcode ? 4'h0 : _GEN_142; // @[IDStage.scala 128:17]
  wire  _GEN_163 = 7'h17 == Opcode ? 1'h0 : _GEN_146; // @[IDStage.scala 128:17]
  wire [2:0] _GEN_164 = 7'h17 == Opcode ? 3'h0 : _GEN_149; // @[IDStage.scala 128:17]
  wire  _GEN_165 = 7'h17 == Opcode ? 1'h0 : _GEN_150; // @[IDStage.scala 128:17]
  wire [2:0] _GEN_166 = 7'h17 == Opcode ? 3'h0 : _GEN_151; // @[IDStage.scala 128:17]
  wire  _GEN_167 = 7'h17 == Opcode ? 1'h0 : _GEN_152; // @[IDStage.scala 128:17]
  wire [2:0] _GEN_168 = 7'h17 == Opcode ? 3'h0 : _GEN_153; // @[IDStage.scala 128:17]
  wire [1:0] ALUSrc1Ctrl = 7'h37 == Opcode ? 2'h1 : _GEN_156; // @[IDStage.scala 128:17 133:19]
  assign io_ID_ImmCtrl = 7'h37 == Opcode ? 3'h4 : _GEN_154; // @[IDStage.scala 128:17 131:19]
  assign io_ID_JumpCtrl = 7'h37 == Opcode ? 4'h0 : _GEN_162; // @[IDStage.scala 128:17]
  assign io_EX_A_ALUOP = 7'h37 == Opcode ? 4'h0 : _GEN_155; // @[IDStage.scala 128:17 132:19]
  assign io_EX_A_ALUSrc1Ctrl = {{1'd0}, ALUSrc1Ctrl}; // @[IDStage.scala 421:23]
  assign io_EX_A_ALUSrc2Ctrl = 7'h37 == Opcode ? 3'h1 : _GEN_157; // @[IDStage.scala 128:17 134:19]
  assign io_EX_A_WordALUEn = 7'h37 == Opcode ? 1'h0 : _GEN_167; // @[IDStage.scala 128:17]
  assign io_EX_A_WordALUOP = 7'h37 == Opcode ? 3'h0 : _GEN_168; // @[IDStage.scala 128:17]
  assign io_EX_B_MEMREn = 7'h37 == Opcode ? 1'h0 : _GEN_163; // @[IDStage.scala 128:17]
  assign io_EX_B_MEMRCtrl = 7'h37 == Opcode ? 3'h0 : _GEN_164; // @[IDStage.scala 128:17]
  assign io_EX_B_MEMWEn = 7'h37 == Opcode ? 1'h0 : _GEN_165; // @[IDStage.scala 128:17]
  assign io_EX_B_MEMWCtrl = 7'h37 == Opcode ? 3'h0 : _GEN_166; // @[IDStage.scala 128:17]
  assign io_EX_C_RegWEn = 7'h37 == Opcode | _GEN_158; // @[IDStage.scala 128:17 135:19]
  assign io_EX_C_RegWSrc = 7'h37 == Opcode ? 2'h1 : _GEN_159; // @[IDStage.scala 128:17 136:19]
  assign io_EX_C_Rd = io_IF_Instr[11:7]; // @[IDStage.scala 86:27]
  assign io_EX_D_Rs1REn = 7'h37 == Opcode ? 1'h0 : _GEN_160; // @[IDStage.scala 128:17]
  assign io_EX_D_Rs2REn = 7'h37 == Opcode ? 1'h0 : _GEN_161; // @[IDStage.scala 128:17]
  assign io_EX_D_Rs1 = io_IF_Instr[19:15]; // @[IDStage.scala 88:27]
  assign io_EX_D_Rs2 = io_IF_Instr[24:20]; // @[IDStage.scala 89:27]
endmodule
module RegFile(
  input         clock,
  input         reset,
  input  [4:0]  io_ID_Rs1,
  input  [4:0]  io_ID_Rs2,
  input         io_WB_RegWEn,
  input  [63:0] io_WB_WData,
  input  [4:0]  io_WB_Rd,
  output [63:0] io_EX_RData1,
  output [63:0] io_EX_RData2
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [63:0] _RAND_10;
  reg [63:0] _RAND_11;
  reg [63:0] _RAND_12;
  reg [63:0] _RAND_13;
  reg [63:0] _RAND_14;
  reg [63:0] _RAND_15;
  reg [63:0] _RAND_16;
  reg [63:0] _RAND_17;
  reg [63:0] _RAND_18;
  reg [63:0] _RAND_19;
  reg [63:0] _RAND_20;
  reg [63:0] _RAND_21;
  reg [63:0] _RAND_22;
  reg [63:0] _RAND_23;
  reg [63:0] _RAND_24;
  reg [63:0] _RAND_25;
  reg [63:0] _RAND_26;
  reg [63:0] _RAND_27;
  reg [63:0] _RAND_28;
  reg [63:0] _RAND_29;
  reg [63:0] _RAND_30;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] gprFile_1; // @[IDStage.scala 484:24]
  reg [63:0] gprFile_2; // @[IDStage.scala 484:24]
  reg [63:0] gprFile_3; // @[IDStage.scala 484:24]
  reg [63:0] gprFile_4; // @[IDStage.scala 484:24]
  reg [63:0] gprFile_5; // @[IDStage.scala 484:24]
  reg [63:0] gprFile_6; // @[IDStage.scala 484:24]
  reg [63:0] gprFile_7; // @[IDStage.scala 484:24]
  reg [63:0] gprFile_8; // @[IDStage.scala 484:24]
  reg [63:0] gprFile_9; // @[IDStage.scala 484:24]
  reg [63:0] gprFile_10; // @[IDStage.scala 484:24]
  reg [63:0] gprFile_11; // @[IDStage.scala 484:24]
  reg [63:0] gprFile_12; // @[IDStage.scala 484:24]
  reg [63:0] gprFile_13; // @[IDStage.scala 484:24]
  reg [63:0] gprFile_14; // @[IDStage.scala 484:24]
  reg [63:0] gprFile_15; // @[IDStage.scala 484:24]
  reg [63:0] gprFile_16; // @[IDStage.scala 484:24]
  reg [63:0] gprFile_17; // @[IDStage.scala 484:24]
  reg [63:0] gprFile_18; // @[IDStage.scala 484:24]
  reg [63:0] gprFile_19; // @[IDStage.scala 484:24]
  reg [63:0] gprFile_20; // @[IDStage.scala 484:24]
  reg [63:0] gprFile_21; // @[IDStage.scala 484:24]
  reg [63:0] gprFile_22; // @[IDStage.scala 484:24]
  reg [63:0] gprFile_23; // @[IDStage.scala 484:24]
  reg [63:0] gprFile_24; // @[IDStage.scala 484:24]
  reg [63:0] gprFile_25; // @[IDStage.scala 484:24]
  reg [63:0] gprFile_26; // @[IDStage.scala 484:24]
  reg [63:0] gprFile_27; // @[IDStage.scala 484:24]
  reg [63:0] gprFile_28; // @[IDStage.scala 484:24]
  reg [63:0] gprFile_29; // @[IDStage.scala 484:24]
  reg [63:0] gprFile_30; // @[IDStage.scala 484:24]
  reg [63:0] gprFile_31; // @[IDStage.scala 484:24]
  wire [63:0] _GEN_1 = 5'h1 == io_ID_Rs1 ? gprFile_1 : 64'h0; // @[IDStage.scala 485:{10,10}]
  wire [63:0] _GEN_2 = 5'h2 == io_ID_Rs1 ? gprFile_2 : _GEN_1; // @[IDStage.scala 485:{10,10}]
  wire [63:0] _GEN_3 = 5'h3 == io_ID_Rs1 ? gprFile_3 : _GEN_2; // @[IDStage.scala 485:{10,10}]
  wire [63:0] _GEN_4 = 5'h4 == io_ID_Rs1 ? gprFile_4 : _GEN_3; // @[IDStage.scala 485:{10,10}]
  wire [63:0] _GEN_5 = 5'h5 == io_ID_Rs1 ? gprFile_5 : _GEN_4; // @[IDStage.scala 485:{10,10}]
  wire [63:0] _GEN_6 = 5'h6 == io_ID_Rs1 ? gprFile_6 : _GEN_5; // @[IDStage.scala 485:{10,10}]
  wire [63:0] _GEN_7 = 5'h7 == io_ID_Rs1 ? gprFile_7 : _GEN_6; // @[IDStage.scala 485:{10,10}]
  wire [63:0] _GEN_8 = 5'h8 == io_ID_Rs1 ? gprFile_8 : _GEN_7; // @[IDStage.scala 485:{10,10}]
  wire [63:0] _GEN_9 = 5'h9 == io_ID_Rs1 ? gprFile_9 : _GEN_8; // @[IDStage.scala 485:{10,10}]
  wire [63:0] _GEN_10 = 5'ha == io_ID_Rs1 ? gprFile_10 : _GEN_9; // @[IDStage.scala 485:{10,10}]
  wire [63:0] _GEN_11 = 5'hb == io_ID_Rs1 ? gprFile_11 : _GEN_10; // @[IDStage.scala 485:{10,10}]
  wire [63:0] _GEN_12 = 5'hc == io_ID_Rs1 ? gprFile_12 : _GEN_11; // @[IDStage.scala 485:{10,10}]
  wire [63:0] _GEN_13 = 5'hd == io_ID_Rs1 ? gprFile_13 : _GEN_12; // @[IDStage.scala 485:{10,10}]
  wire [63:0] _GEN_14 = 5'he == io_ID_Rs1 ? gprFile_14 : _GEN_13; // @[IDStage.scala 485:{10,10}]
  wire [63:0] _GEN_15 = 5'hf == io_ID_Rs1 ? gprFile_15 : _GEN_14; // @[IDStage.scala 485:{10,10}]
  wire [63:0] _GEN_16 = 5'h10 == io_ID_Rs1 ? gprFile_16 : _GEN_15; // @[IDStage.scala 485:{10,10}]
  wire [63:0] _GEN_17 = 5'h11 == io_ID_Rs1 ? gprFile_17 : _GEN_16; // @[IDStage.scala 485:{10,10}]
  wire [63:0] _GEN_18 = 5'h12 == io_ID_Rs1 ? gprFile_18 : _GEN_17; // @[IDStage.scala 485:{10,10}]
  wire [63:0] _GEN_19 = 5'h13 == io_ID_Rs1 ? gprFile_19 : _GEN_18; // @[IDStage.scala 485:{10,10}]
  wire [63:0] _GEN_20 = 5'h14 == io_ID_Rs1 ? gprFile_20 : _GEN_19; // @[IDStage.scala 485:{10,10}]
  wire [63:0] _GEN_21 = 5'h15 == io_ID_Rs1 ? gprFile_21 : _GEN_20; // @[IDStage.scala 485:{10,10}]
  wire [63:0] _GEN_22 = 5'h16 == io_ID_Rs1 ? gprFile_22 : _GEN_21; // @[IDStage.scala 485:{10,10}]
  wire [63:0] _GEN_23 = 5'h17 == io_ID_Rs1 ? gprFile_23 : _GEN_22; // @[IDStage.scala 485:{10,10}]
  wire [63:0] _GEN_24 = 5'h18 == io_ID_Rs1 ? gprFile_24 : _GEN_23; // @[IDStage.scala 485:{10,10}]
  wire [63:0] _GEN_25 = 5'h19 == io_ID_Rs1 ? gprFile_25 : _GEN_24; // @[IDStage.scala 485:{10,10}]
  wire [63:0] _GEN_26 = 5'h1a == io_ID_Rs1 ? gprFile_26 : _GEN_25; // @[IDStage.scala 485:{10,10}]
  wire [63:0] _GEN_27 = 5'h1b == io_ID_Rs1 ? gprFile_27 : _GEN_26; // @[IDStage.scala 485:{10,10}]
  wire [63:0] _GEN_28 = 5'h1c == io_ID_Rs1 ? gprFile_28 : _GEN_27; // @[IDStage.scala 485:{10,10}]
  wire [63:0] _GEN_29 = 5'h1d == io_ID_Rs1 ? gprFile_29 : _GEN_28; // @[IDStage.scala 485:{10,10}]
  wire [63:0] _GEN_30 = 5'h1e == io_ID_Rs1 ? gprFile_30 : _GEN_29; // @[IDStage.scala 485:{10,10}]
  wire [63:0] _GEN_31 = 5'h1f == io_ID_Rs1 ? gprFile_31 : _GEN_30; // @[IDStage.scala 485:{10,10}]
  wire [63:0] _GEN_33 = 5'h1 == io_ID_Rs2 ? gprFile_1 : 64'h0; // @[IDStage.scala 486:{10,10}]
  wire [63:0] _GEN_34 = 5'h2 == io_ID_Rs2 ? gprFile_2 : _GEN_33; // @[IDStage.scala 486:{10,10}]
  wire [63:0] _GEN_35 = 5'h3 == io_ID_Rs2 ? gprFile_3 : _GEN_34; // @[IDStage.scala 486:{10,10}]
  wire [63:0] _GEN_36 = 5'h4 == io_ID_Rs2 ? gprFile_4 : _GEN_35; // @[IDStage.scala 486:{10,10}]
  wire [63:0] _GEN_37 = 5'h5 == io_ID_Rs2 ? gprFile_5 : _GEN_36; // @[IDStage.scala 486:{10,10}]
  wire [63:0] _GEN_38 = 5'h6 == io_ID_Rs2 ? gprFile_6 : _GEN_37; // @[IDStage.scala 486:{10,10}]
  wire [63:0] _GEN_39 = 5'h7 == io_ID_Rs2 ? gprFile_7 : _GEN_38; // @[IDStage.scala 486:{10,10}]
  wire [63:0] _GEN_40 = 5'h8 == io_ID_Rs2 ? gprFile_8 : _GEN_39; // @[IDStage.scala 486:{10,10}]
  wire [63:0] _GEN_41 = 5'h9 == io_ID_Rs2 ? gprFile_9 : _GEN_40; // @[IDStage.scala 486:{10,10}]
  wire [63:0] _GEN_42 = 5'ha == io_ID_Rs2 ? gprFile_10 : _GEN_41; // @[IDStage.scala 486:{10,10}]
  wire [63:0] _GEN_43 = 5'hb == io_ID_Rs2 ? gprFile_11 : _GEN_42; // @[IDStage.scala 486:{10,10}]
  wire [63:0] _GEN_44 = 5'hc == io_ID_Rs2 ? gprFile_12 : _GEN_43; // @[IDStage.scala 486:{10,10}]
  wire [63:0] _GEN_45 = 5'hd == io_ID_Rs2 ? gprFile_13 : _GEN_44; // @[IDStage.scala 486:{10,10}]
  wire [63:0] _GEN_46 = 5'he == io_ID_Rs2 ? gprFile_14 : _GEN_45; // @[IDStage.scala 486:{10,10}]
  wire [63:0] _GEN_47 = 5'hf == io_ID_Rs2 ? gprFile_15 : _GEN_46; // @[IDStage.scala 486:{10,10}]
  wire [63:0] _GEN_48 = 5'h10 == io_ID_Rs2 ? gprFile_16 : _GEN_47; // @[IDStage.scala 486:{10,10}]
  wire [63:0] _GEN_49 = 5'h11 == io_ID_Rs2 ? gprFile_17 : _GEN_48; // @[IDStage.scala 486:{10,10}]
  wire [63:0] _GEN_50 = 5'h12 == io_ID_Rs2 ? gprFile_18 : _GEN_49; // @[IDStage.scala 486:{10,10}]
  wire [63:0] _GEN_51 = 5'h13 == io_ID_Rs2 ? gprFile_19 : _GEN_50; // @[IDStage.scala 486:{10,10}]
  wire [63:0] _GEN_52 = 5'h14 == io_ID_Rs2 ? gprFile_20 : _GEN_51; // @[IDStage.scala 486:{10,10}]
  wire [63:0] _GEN_53 = 5'h15 == io_ID_Rs2 ? gprFile_21 : _GEN_52; // @[IDStage.scala 486:{10,10}]
  wire [63:0] _GEN_54 = 5'h16 == io_ID_Rs2 ? gprFile_22 : _GEN_53; // @[IDStage.scala 486:{10,10}]
  wire [63:0] _GEN_55 = 5'h17 == io_ID_Rs2 ? gprFile_23 : _GEN_54; // @[IDStage.scala 486:{10,10}]
  wire [63:0] _GEN_56 = 5'h18 == io_ID_Rs2 ? gprFile_24 : _GEN_55; // @[IDStage.scala 486:{10,10}]
  wire [63:0] _GEN_57 = 5'h19 == io_ID_Rs2 ? gprFile_25 : _GEN_56; // @[IDStage.scala 486:{10,10}]
  wire [63:0] _GEN_58 = 5'h1a == io_ID_Rs2 ? gprFile_26 : _GEN_57; // @[IDStage.scala 486:{10,10}]
  wire [63:0] _GEN_59 = 5'h1b == io_ID_Rs2 ? gprFile_27 : _GEN_58; // @[IDStage.scala 486:{10,10}]
  wire [63:0] _GEN_60 = 5'h1c == io_ID_Rs2 ? gprFile_28 : _GEN_59; // @[IDStage.scala 486:{10,10}]
  wire [63:0] _GEN_61 = 5'h1d == io_ID_Rs2 ? gprFile_29 : _GEN_60; // @[IDStage.scala 486:{10,10}]
  wire [63:0] _GEN_62 = 5'h1e == io_ID_Rs2 ? gprFile_30 : _GEN_61; // @[IDStage.scala 486:{10,10}]
  wire [63:0] _GEN_63 = 5'h1f == io_ID_Rs2 ? gprFile_31 : _GEN_62; // @[IDStage.scala 486:{10,10}]
  wire  _T_2 = io_WB_Rd != 5'h0; // @[IDStage.scala 487:32]
  assign io_EX_RData1 = io_ID_Rs1 == io_WB_Rd & io_WB_RegWEn & io_WB_Rd != 5'h0 ? io_WB_WData : _GEN_31; // @[IDStage.scala 485:10 487:{40,49}]
  assign io_EX_RData2 = io_ID_Rs2 == io_WB_Rd & io_WB_RegWEn & _T_2 ? io_WB_WData : _GEN_63; // @[IDStage.scala 486:10 488:{40,49}]
  always @(posedge clock) begin
    if (reset) begin // @[IDStage.scala 484:24]
      gprFile_1 <= 64'h0; // @[IDStage.scala 484:24]
    end else if (io_WB_RegWEn) begin // @[IDStage.scala 489:12]
      if (5'h1 == io_WB_Rd) begin // @[IDStage.scala 489:26]
        gprFile_1 <= io_WB_WData; // @[IDStage.scala 489:26]
      end
    end
    if (reset) begin // @[IDStage.scala 484:24]
      gprFile_2 <= 64'h0; // @[IDStage.scala 484:24]
    end else if (io_WB_RegWEn) begin // @[IDStage.scala 489:12]
      if (5'h2 == io_WB_Rd) begin // @[IDStage.scala 489:26]
        gprFile_2 <= io_WB_WData; // @[IDStage.scala 489:26]
      end
    end
    if (reset) begin // @[IDStage.scala 484:24]
      gprFile_3 <= 64'h0; // @[IDStage.scala 484:24]
    end else if (io_WB_RegWEn) begin // @[IDStage.scala 489:12]
      if (5'h3 == io_WB_Rd) begin // @[IDStage.scala 489:26]
        gprFile_3 <= io_WB_WData; // @[IDStage.scala 489:26]
      end
    end
    if (reset) begin // @[IDStage.scala 484:24]
      gprFile_4 <= 64'h0; // @[IDStage.scala 484:24]
    end else if (io_WB_RegWEn) begin // @[IDStage.scala 489:12]
      if (5'h4 == io_WB_Rd) begin // @[IDStage.scala 489:26]
        gprFile_4 <= io_WB_WData; // @[IDStage.scala 489:26]
      end
    end
    if (reset) begin // @[IDStage.scala 484:24]
      gprFile_5 <= 64'h0; // @[IDStage.scala 484:24]
    end else if (io_WB_RegWEn) begin // @[IDStage.scala 489:12]
      if (5'h5 == io_WB_Rd) begin // @[IDStage.scala 489:26]
        gprFile_5 <= io_WB_WData; // @[IDStage.scala 489:26]
      end
    end
    if (reset) begin // @[IDStage.scala 484:24]
      gprFile_6 <= 64'h0; // @[IDStage.scala 484:24]
    end else if (io_WB_RegWEn) begin // @[IDStage.scala 489:12]
      if (5'h6 == io_WB_Rd) begin // @[IDStage.scala 489:26]
        gprFile_6 <= io_WB_WData; // @[IDStage.scala 489:26]
      end
    end
    if (reset) begin // @[IDStage.scala 484:24]
      gprFile_7 <= 64'h0; // @[IDStage.scala 484:24]
    end else if (io_WB_RegWEn) begin // @[IDStage.scala 489:12]
      if (5'h7 == io_WB_Rd) begin // @[IDStage.scala 489:26]
        gprFile_7 <= io_WB_WData; // @[IDStage.scala 489:26]
      end
    end
    if (reset) begin // @[IDStage.scala 484:24]
      gprFile_8 <= 64'h0; // @[IDStage.scala 484:24]
    end else if (io_WB_RegWEn) begin // @[IDStage.scala 489:12]
      if (5'h8 == io_WB_Rd) begin // @[IDStage.scala 489:26]
        gprFile_8 <= io_WB_WData; // @[IDStage.scala 489:26]
      end
    end
    if (reset) begin // @[IDStage.scala 484:24]
      gprFile_9 <= 64'h0; // @[IDStage.scala 484:24]
    end else if (io_WB_RegWEn) begin // @[IDStage.scala 489:12]
      if (5'h9 == io_WB_Rd) begin // @[IDStage.scala 489:26]
        gprFile_9 <= io_WB_WData; // @[IDStage.scala 489:26]
      end
    end
    if (reset) begin // @[IDStage.scala 484:24]
      gprFile_10 <= 64'h0; // @[IDStage.scala 484:24]
    end else if (io_WB_RegWEn) begin // @[IDStage.scala 489:12]
      if (5'ha == io_WB_Rd) begin // @[IDStage.scala 489:26]
        gprFile_10 <= io_WB_WData; // @[IDStage.scala 489:26]
      end
    end
    if (reset) begin // @[IDStage.scala 484:24]
      gprFile_11 <= 64'h0; // @[IDStage.scala 484:24]
    end else if (io_WB_RegWEn) begin // @[IDStage.scala 489:12]
      if (5'hb == io_WB_Rd) begin // @[IDStage.scala 489:26]
        gprFile_11 <= io_WB_WData; // @[IDStage.scala 489:26]
      end
    end
    if (reset) begin // @[IDStage.scala 484:24]
      gprFile_12 <= 64'h0; // @[IDStage.scala 484:24]
    end else if (io_WB_RegWEn) begin // @[IDStage.scala 489:12]
      if (5'hc == io_WB_Rd) begin // @[IDStage.scala 489:26]
        gprFile_12 <= io_WB_WData; // @[IDStage.scala 489:26]
      end
    end
    if (reset) begin // @[IDStage.scala 484:24]
      gprFile_13 <= 64'h0; // @[IDStage.scala 484:24]
    end else if (io_WB_RegWEn) begin // @[IDStage.scala 489:12]
      if (5'hd == io_WB_Rd) begin // @[IDStage.scala 489:26]
        gprFile_13 <= io_WB_WData; // @[IDStage.scala 489:26]
      end
    end
    if (reset) begin // @[IDStage.scala 484:24]
      gprFile_14 <= 64'h0; // @[IDStage.scala 484:24]
    end else if (io_WB_RegWEn) begin // @[IDStage.scala 489:12]
      if (5'he == io_WB_Rd) begin // @[IDStage.scala 489:26]
        gprFile_14 <= io_WB_WData; // @[IDStage.scala 489:26]
      end
    end
    if (reset) begin // @[IDStage.scala 484:24]
      gprFile_15 <= 64'h0; // @[IDStage.scala 484:24]
    end else if (io_WB_RegWEn) begin // @[IDStage.scala 489:12]
      if (5'hf == io_WB_Rd) begin // @[IDStage.scala 489:26]
        gprFile_15 <= io_WB_WData; // @[IDStage.scala 489:26]
      end
    end
    if (reset) begin // @[IDStage.scala 484:24]
      gprFile_16 <= 64'h0; // @[IDStage.scala 484:24]
    end else if (io_WB_RegWEn) begin // @[IDStage.scala 489:12]
      if (5'h10 == io_WB_Rd) begin // @[IDStage.scala 489:26]
        gprFile_16 <= io_WB_WData; // @[IDStage.scala 489:26]
      end
    end
    if (reset) begin // @[IDStage.scala 484:24]
      gprFile_17 <= 64'h0; // @[IDStage.scala 484:24]
    end else if (io_WB_RegWEn) begin // @[IDStage.scala 489:12]
      if (5'h11 == io_WB_Rd) begin // @[IDStage.scala 489:26]
        gprFile_17 <= io_WB_WData; // @[IDStage.scala 489:26]
      end
    end
    if (reset) begin // @[IDStage.scala 484:24]
      gprFile_18 <= 64'h0; // @[IDStage.scala 484:24]
    end else if (io_WB_RegWEn) begin // @[IDStage.scala 489:12]
      if (5'h12 == io_WB_Rd) begin // @[IDStage.scala 489:26]
        gprFile_18 <= io_WB_WData; // @[IDStage.scala 489:26]
      end
    end
    if (reset) begin // @[IDStage.scala 484:24]
      gprFile_19 <= 64'h0; // @[IDStage.scala 484:24]
    end else if (io_WB_RegWEn) begin // @[IDStage.scala 489:12]
      if (5'h13 == io_WB_Rd) begin // @[IDStage.scala 489:26]
        gprFile_19 <= io_WB_WData; // @[IDStage.scala 489:26]
      end
    end
    if (reset) begin // @[IDStage.scala 484:24]
      gprFile_20 <= 64'h0; // @[IDStage.scala 484:24]
    end else if (io_WB_RegWEn) begin // @[IDStage.scala 489:12]
      if (5'h14 == io_WB_Rd) begin // @[IDStage.scala 489:26]
        gprFile_20 <= io_WB_WData; // @[IDStage.scala 489:26]
      end
    end
    if (reset) begin // @[IDStage.scala 484:24]
      gprFile_21 <= 64'h0; // @[IDStage.scala 484:24]
    end else if (io_WB_RegWEn) begin // @[IDStage.scala 489:12]
      if (5'h15 == io_WB_Rd) begin // @[IDStage.scala 489:26]
        gprFile_21 <= io_WB_WData; // @[IDStage.scala 489:26]
      end
    end
    if (reset) begin // @[IDStage.scala 484:24]
      gprFile_22 <= 64'h0; // @[IDStage.scala 484:24]
    end else if (io_WB_RegWEn) begin // @[IDStage.scala 489:12]
      if (5'h16 == io_WB_Rd) begin // @[IDStage.scala 489:26]
        gprFile_22 <= io_WB_WData; // @[IDStage.scala 489:26]
      end
    end
    if (reset) begin // @[IDStage.scala 484:24]
      gprFile_23 <= 64'h0; // @[IDStage.scala 484:24]
    end else if (io_WB_RegWEn) begin // @[IDStage.scala 489:12]
      if (5'h17 == io_WB_Rd) begin // @[IDStage.scala 489:26]
        gprFile_23 <= io_WB_WData; // @[IDStage.scala 489:26]
      end
    end
    if (reset) begin // @[IDStage.scala 484:24]
      gprFile_24 <= 64'h0; // @[IDStage.scala 484:24]
    end else if (io_WB_RegWEn) begin // @[IDStage.scala 489:12]
      if (5'h18 == io_WB_Rd) begin // @[IDStage.scala 489:26]
        gprFile_24 <= io_WB_WData; // @[IDStage.scala 489:26]
      end
    end
    if (reset) begin // @[IDStage.scala 484:24]
      gprFile_25 <= 64'h0; // @[IDStage.scala 484:24]
    end else if (io_WB_RegWEn) begin // @[IDStage.scala 489:12]
      if (5'h19 == io_WB_Rd) begin // @[IDStage.scala 489:26]
        gprFile_25 <= io_WB_WData; // @[IDStage.scala 489:26]
      end
    end
    if (reset) begin // @[IDStage.scala 484:24]
      gprFile_26 <= 64'h0; // @[IDStage.scala 484:24]
    end else if (io_WB_RegWEn) begin // @[IDStage.scala 489:12]
      if (5'h1a == io_WB_Rd) begin // @[IDStage.scala 489:26]
        gprFile_26 <= io_WB_WData; // @[IDStage.scala 489:26]
      end
    end
    if (reset) begin // @[IDStage.scala 484:24]
      gprFile_27 <= 64'h0; // @[IDStage.scala 484:24]
    end else if (io_WB_RegWEn) begin // @[IDStage.scala 489:12]
      if (5'h1b == io_WB_Rd) begin // @[IDStage.scala 489:26]
        gprFile_27 <= io_WB_WData; // @[IDStage.scala 489:26]
      end
    end
    if (reset) begin // @[IDStage.scala 484:24]
      gprFile_28 <= 64'h0; // @[IDStage.scala 484:24]
    end else if (io_WB_RegWEn) begin // @[IDStage.scala 489:12]
      if (5'h1c == io_WB_Rd) begin // @[IDStage.scala 489:26]
        gprFile_28 <= io_WB_WData; // @[IDStage.scala 489:26]
      end
    end
    if (reset) begin // @[IDStage.scala 484:24]
      gprFile_29 <= 64'h0; // @[IDStage.scala 484:24]
    end else if (io_WB_RegWEn) begin // @[IDStage.scala 489:12]
      if (5'h1d == io_WB_Rd) begin // @[IDStage.scala 489:26]
        gprFile_29 <= io_WB_WData; // @[IDStage.scala 489:26]
      end
    end
    if (reset) begin // @[IDStage.scala 484:24]
      gprFile_30 <= 64'h0; // @[IDStage.scala 484:24]
    end else if (io_WB_RegWEn) begin // @[IDStage.scala 489:12]
      if (5'h1e == io_WB_Rd) begin // @[IDStage.scala 489:26]
        gprFile_30 <= io_WB_WData; // @[IDStage.scala 489:26]
      end
    end
    if (reset) begin // @[IDStage.scala 484:24]
      gprFile_31 <= 64'h0; // @[IDStage.scala 484:24]
    end else if (io_WB_RegWEn) begin // @[IDStage.scala 489:12]
      if (5'h1f == io_WB_Rd) begin // @[IDStage.scala 489:26]
        gprFile_31 <= io_WB_WData; // @[IDStage.scala 489:26]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  gprFile_1 = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  gprFile_2 = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  gprFile_3 = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  gprFile_4 = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  gprFile_5 = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  gprFile_6 = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  gprFile_7 = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  gprFile_8 = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  gprFile_9 = _RAND_8[63:0];
  _RAND_9 = {2{`RANDOM}};
  gprFile_10 = _RAND_9[63:0];
  _RAND_10 = {2{`RANDOM}};
  gprFile_11 = _RAND_10[63:0];
  _RAND_11 = {2{`RANDOM}};
  gprFile_12 = _RAND_11[63:0];
  _RAND_12 = {2{`RANDOM}};
  gprFile_13 = _RAND_12[63:0];
  _RAND_13 = {2{`RANDOM}};
  gprFile_14 = _RAND_13[63:0];
  _RAND_14 = {2{`RANDOM}};
  gprFile_15 = _RAND_14[63:0];
  _RAND_15 = {2{`RANDOM}};
  gprFile_16 = _RAND_15[63:0];
  _RAND_16 = {2{`RANDOM}};
  gprFile_17 = _RAND_16[63:0];
  _RAND_17 = {2{`RANDOM}};
  gprFile_18 = _RAND_17[63:0];
  _RAND_18 = {2{`RANDOM}};
  gprFile_19 = _RAND_18[63:0];
  _RAND_19 = {2{`RANDOM}};
  gprFile_20 = _RAND_19[63:0];
  _RAND_20 = {2{`RANDOM}};
  gprFile_21 = _RAND_20[63:0];
  _RAND_21 = {2{`RANDOM}};
  gprFile_22 = _RAND_21[63:0];
  _RAND_22 = {2{`RANDOM}};
  gprFile_23 = _RAND_22[63:0];
  _RAND_23 = {2{`RANDOM}};
  gprFile_24 = _RAND_23[63:0];
  _RAND_24 = {2{`RANDOM}};
  gprFile_25 = _RAND_24[63:0];
  _RAND_25 = {2{`RANDOM}};
  gprFile_26 = _RAND_25[63:0];
  _RAND_26 = {2{`RANDOM}};
  gprFile_27 = _RAND_26[63:0];
  _RAND_27 = {2{`RANDOM}};
  gprFile_28 = _RAND_27[63:0];
  _RAND_28 = {2{`RANDOM}};
  gprFile_29 = _RAND_28[63:0];
  _RAND_29 = {2{`RANDOM}};
  gprFile_30 = _RAND_29[63:0];
  _RAND_30 = {2{`RANDOM}};
  gprFile_31 = _RAND_30[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ImmSext(
  input  [24:0] io_i31To7,
  input  [2:0]  io_immCtrl,
  output [63:0] io_imm64
);
  wire [51:0] _out_T_2 = io_i31To7[24] ? 52'hfffffffffffff : 52'h0; // @[Bitwise.scala 74:12]
  wire [63:0] _out_T_4 = {_out_T_2,io_i31To7[24:13]}; // @[Cat.scala 31:58]
  wire [63:0] _out_T_10 = {_out_T_2,io_i31To7[24:18],io_i31To7[4:0]}; // @[Cat.scala 31:58]
  wire [50:0] _out_T_13 = io_i31To7[24] ? 51'h7ffffffffffff : 51'h0; // @[Bitwise.scala 74:12]
  wire [63:0] _out_T_18 = {_out_T_13,io_i31To7[24],io_i31To7[0],io_i31To7[23:18],io_i31To7[4:1],1'h0}; // @[Cat.scala 31:58]
  wire [31:0] _out_T_21 = io_i31To7[24] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 74:12]
  wire [63:0] _out_T_23 = {_out_T_21,io_i31To7[24:5],12'h0}; // @[Cat.scala 31:58]
  wire [42:0] _out_T_26 = io_i31To7[24] ? 43'h7ffffffffff : 43'h0; // @[Bitwise.scala 74:12]
  wire [63:0] _out_T_31 = {_out_T_26,io_i31To7[24],io_i31To7[12:5],io_i31To7[13],io_i31To7[23:14],1'h0}; // @[Cat.scala 31:58]
  wire [63:0] _out_T_34 = {59'h0,io_i31To7[12:8]}; // @[Cat.scala 31:58]
  wire [63:0] _GEN_0 = 3'h6 == io_immCtrl ? _out_T_34 : 64'h0; // @[IDStage.scala 524:20 530:27]
  wire [63:0] _GEN_1 = 3'h5 == io_immCtrl ? _out_T_31 : _GEN_0; // @[IDStage.scala 524:20 529:27]
  wire [63:0] _GEN_2 = 3'h4 == io_immCtrl ? _out_T_23 : _GEN_1; // @[IDStage.scala 524:20 528:27]
  wire [63:0] _GEN_3 = 3'h3 == io_immCtrl ? _out_T_18 : _GEN_2; // @[IDStage.scala 524:20 527:27]
  wire [63:0] _GEN_4 = 3'h2 == io_immCtrl ? _out_T_10 : _GEN_3; // @[IDStage.scala 524:20 526:27]
  assign io_imm64 = 3'h1 == io_immCtrl ? _out_T_4 : _GEN_4; // @[IDStage.scala 524:20 525:27]
endmodule
module Transfer(
  input  [3:0]  io_ID_A_JumpCtrl,
  input  [31:0] io_ID_B_PC,
  input  [63:0] io_ID_B_Imm,
  input  [63:0] io_ID_B_Rs1Data,
  input  [63:0] io_ID_B_Rs2Data,
  output        io_PC_JumpEn,
  output [31:0] io_PC_PC
);
  wire [31:0] Rs1Data32 = io_ID_B_Rs1Data[31:0]; // @[IDStage.scala 573:34]
  wire [63:0] _GEN_28 = {{32'd0}, io_ID_B_PC}; // @[IDStage.scala 582:19]
  wire [63:0] _PCADDImm_T_1 = _GEN_28 + io_ID_B_Imm; // @[IDStage.scala 582:19]
  wire [63:0] _GEN_29 = {{32'd0}, Rs1Data32}; // @[IDStage.scala 583:27]
  wire [63:0] _Rs1ADDImm_T_1 = _GEN_29 + io_ID_B_Imm; // @[IDStage.scala 583:27]
  wire [63:0] _Rs1ADDImm_T_2 = _Rs1ADDImm_T_1 & 64'hfffffffe; // @[IDStage.scala 583:34]
  wire [31:0] PCADD4 = io_ID_B_PC + 32'h4; // @[IDStage.scala 584:19]
  wire  _T_1 = io_ID_B_Rs1Data == io_ID_B_Rs2Data; // @[IDStage.scala 590:20]
  wire [31:0] PCADDImm = _PCADDImm_T_1[31:0];
  wire [31:0] _GEN_1 = io_ID_B_Rs1Data == io_ID_B_Rs2Data ? PCADDImm : PCADD4; // @[IDStage.scala 586:16 590:32 592:16]
  wire  _T_3 = io_ID_B_Rs1Data != io_ID_B_Rs2Data; // @[IDStage.scala 596:20]
  wire [31:0] _GEN_3 = io_ID_B_Rs1Data != io_ID_B_Rs2Data ? PCADDImm : PCADD4; // @[IDStage.scala 586:16 596:32 598:16]
  wire  _T_7 = $signed(io_ID_B_Rs1Data) < $signed(io_ID_B_Rs2Data); // @[IDStage.scala 602:27]
  wire [31:0] _GEN_5 = $signed(io_ID_B_Rs1Data) < $signed(io_ID_B_Rs2Data) ? PCADDImm : PCADD4; // @[IDStage.scala 586:16 602:44 604:16]
  wire  _T_11 = $signed(io_ID_B_Rs1Data) >= $signed(io_ID_B_Rs2Data); // @[IDStage.scala 608:27]
  wire [31:0] _GEN_7 = $signed(io_ID_B_Rs1Data) >= $signed(io_ID_B_Rs2Data) ? PCADDImm : PCADD4; // @[IDStage.scala 586:16 608:45 610:16]
  wire  _T_13 = io_ID_B_Rs1Data < io_ID_B_Rs2Data; // @[IDStage.scala 614:20]
  wire [31:0] _GEN_9 = io_ID_B_Rs1Data < io_ID_B_Rs2Data ? PCADDImm : PCADD4; // @[IDStage.scala 586:16 614:30 616:16]
  wire  _T_15 = io_ID_B_Rs1Data >= io_ID_B_Rs2Data; // @[IDStage.scala 620:20]
  wire [31:0] _GEN_11 = io_ID_B_Rs1Data >= io_ID_B_Rs2Data ? PCADDImm : PCADD4; // @[IDStage.scala 586:16 620:31 622:16]
  wire [31:0] Rs1ADDImm = _Rs1ADDImm_T_2[31:0];
  wire [31:0] _GEN_13 = 4'h8 == io_ID_A_JumpCtrl ? Rs1ADDImm : PCADD4; // @[IDStage.scala 588:19 631:14 586:16]
  wire  _GEN_14 = 4'h7 == io_ID_A_JumpCtrl | 4'h8 == io_ID_A_JumpCtrl; // @[IDStage.scala 588:19 626:20]
  wire [31:0] _GEN_15 = 4'h7 == io_ID_A_JumpCtrl ? PCADDImm : _GEN_13; // @[IDStage.scala 588:19 627:14]
  wire  _GEN_16 = 4'h6 == io_ID_A_JumpCtrl ? _T_15 : _GEN_14; // @[IDStage.scala 588:19]
  wire [31:0] _GEN_17 = 4'h6 == io_ID_A_JumpCtrl ? _GEN_11 : _GEN_15; // @[IDStage.scala 588:19]
  wire  _GEN_18 = 4'h5 == io_ID_A_JumpCtrl ? _T_13 : _GEN_16; // @[IDStage.scala 588:19]
  wire [31:0] _GEN_19 = 4'h5 == io_ID_A_JumpCtrl ? _GEN_9 : _GEN_17; // @[IDStage.scala 588:19]
  wire  _GEN_20 = 4'h4 == io_ID_A_JumpCtrl ? _T_11 : _GEN_18; // @[IDStage.scala 588:19]
  wire [31:0] _GEN_21 = 4'h4 == io_ID_A_JumpCtrl ? _GEN_7 : _GEN_19; // @[IDStage.scala 588:19]
  wire  _GEN_22 = 4'h3 == io_ID_A_JumpCtrl ? _T_7 : _GEN_20; // @[IDStage.scala 588:19]
  wire [31:0] _GEN_23 = 4'h3 == io_ID_A_JumpCtrl ? _GEN_5 : _GEN_21; // @[IDStage.scala 588:19]
  wire  _GEN_24 = 4'h2 == io_ID_A_JumpCtrl ? _T_3 : _GEN_22; // @[IDStage.scala 588:19]
  wire [31:0] _GEN_25 = 4'h2 == io_ID_A_JumpCtrl ? _GEN_3 : _GEN_23; // @[IDStage.scala 588:19]
  assign io_PC_JumpEn = 4'h1 == io_ID_A_JumpCtrl ? _T_1 : _GEN_24; // @[IDStage.scala 588:19]
  assign io_PC_PC = 4'h1 == io_ID_A_JumpCtrl ? _GEN_1 : _GEN_25; // @[IDStage.scala 588:19]
endmodule
module IDStage(
  input         clock,
  input         reset,
  input  [31:0] io_IF_Instr,
  input  [31:0] io_IF_PC,
  output [3:0]  io_EX_A_ALUOP,
  output [2:0]  io_EX_A_ALUSrc1Ctrl,
  output [2:0]  io_EX_A_ALUSrc2Ctrl,
  output        io_EX_A_WordALUEn,
  output [2:0]  io_EX_A_WordALUOP,
  output        io_EX_B_MEMREn,
  output [2:0]  io_EX_B_MEMRCtrl,
  output        io_EX_B_MEMWEn,
  output [2:0]  io_EX_B_MEMWCtrl,
  output        io_EX_C_RegWEn,
  output [1:0]  io_EX_C_RegWSrc,
  output [4:0]  io_EX_C_Rd,
  output        io_EX_D_Rs1REn,
  output        io_EX_D_Rs2REn,
  output [4:0]  io_EX_D_Rs1,
  output [4:0]  io_EX_D_Rs2,
  output [31:0] io_EX_E_PC,
  output [63:0] io_EX_E_Imm,
  output [63:0] io_EX_E_RData1,
  output [63:0] io_EX_E_RData2,
  input         io_WB_RegWEn,
  input  [63:0] io_WB_WData,
  input  [4:0]  io_WB_Rd,
  output [31:0] io_PC_PC,
  output        io_HAZARD_JumpEn,
  input  [1:0]  io_DATAPATH_Rs1Ctrl,
  input  [1:0]  io_DATAPATH_Rs2Ctrl,
  input  [63:0] io_DATAPATH_MEMData,
  input  [63:0] io_DATAPATH_WBData
);
  wire [31:0] Decoder_io_IF_Instr; // @[IDStage.scala 693:24]
  wire [2:0] Decoder_io_ID_ImmCtrl; // @[IDStage.scala 693:24]
  wire [3:0] Decoder_io_ID_JumpCtrl; // @[IDStage.scala 693:24]
  wire [3:0] Decoder_io_EX_A_ALUOP; // @[IDStage.scala 693:24]
  wire [2:0] Decoder_io_EX_A_ALUSrc1Ctrl; // @[IDStage.scala 693:24]
  wire [2:0] Decoder_io_EX_A_ALUSrc2Ctrl; // @[IDStage.scala 693:24]
  wire  Decoder_io_EX_A_WordALUEn; // @[IDStage.scala 693:24]
  wire [2:0] Decoder_io_EX_A_WordALUOP; // @[IDStage.scala 693:24]
  wire  Decoder_io_EX_B_MEMREn; // @[IDStage.scala 693:24]
  wire [2:0] Decoder_io_EX_B_MEMRCtrl; // @[IDStage.scala 693:24]
  wire  Decoder_io_EX_B_MEMWEn; // @[IDStage.scala 693:24]
  wire [2:0] Decoder_io_EX_B_MEMWCtrl; // @[IDStage.scala 693:24]
  wire  Decoder_io_EX_C_RegWEn; // @[IDStage.scala 693:24]
  wire [1:0] Decoder_io_EX_C_RegWSrc; // @[IDStage.scala 693:24]
  wire [4:0] Decoder_io_EX_C_Rd; // @[IDStage.scala 693:24]
  wire  Decoder_io_EX_D_Rs1REn; // @[IDStage.scala 693:24]
  wire  Decoder_io_EX_D_Rs2REn; // @[IDStage.scala 693:24]
  wire [4:0] Decoder_io_EX_D_Rs1; // @[IDStage.scala 693:24]
  wire [4:0] Decoder_io_EX_D_Rs2; // @[IDStage.scala 693:24]
  wire  RegFile_clock; // @[IDStage.scala 694:24]
  wire  RegFile_reset; // @[IDStage.scala 694:24]
  wire [4:0] RegFile_io_ID_Rs1; // @[IDStage.scala 694:24]
  wire [4:0] RegFile_io_ID_Rs2; // @[IDStage.scala 694:24]
  wire  RegFile_io_WB_RegWEn; // @[IDStage.scala 694:24]
  wire [63:0] RegFile_io_WB_WData; // @[IDStage.scala 694:24]
  wire [4:0] RegFile_io_WB_Rd; // @[IDStage.scala 694:24]
  wire [63:0] RegFile_io_EX_RData1; // @[IDStage.scala 694:24]
  wire [63:0] RegFile_io_EX_RData2; // @[IDStage.scala 694:24]
  wire [24:0] ImmSext_io_i31To7; // @[IDStage.scala 695:24]
  wire [2:0] ImmSext_io_immCtrl; // @[IDStage.scala 695:24]
  wire [63:0] ImmSext_io_imm64; // @[IDStage.scala 695:24]
  wire [3:0] Transfer_io_ID_A_JumpCtrl; // @[IDStage.scala 696:24]
  wire [31:0] Transfer_io_ID_B_PC; // @[IDStage.scala 696:24]
  wire [63:0] Transfer_io_ID_B_Imm; // @[IDStage.scala 696:24]
  wire [63:0] Transfer_io_ID_B_Rs1Data; // @[IDStage.scala 696:24]
  wire [63:0] Transfer_io_ID_B_Rs2Data; // @[IDStage.scala 696:24]
  wire  Transfer_io_PC_JumpEn; // @[IDStage.scala 696:24]
  wire [31:0] Transfer_io_PC_PC; // @[IDStage.scala 696:24]
  wire [63:0] _GEN_0 = io_DATAPATH_Rs1Ctrl == 2'h2 ? io_DATAPATH_WBData : RegFile_io_EX_RData1; // @[IDStage.scala 727:{45,53} 728:22]
  wire [63:0] _GEN_2 = io_DATAPATH_Rs2Ctrl == 2'h2 ? io_DATAPATH_WBData : RegFile_io_EX_RData2; // @[IDStage.scala 730:{45,53} 731:22]
  Decoder Decoder ( // @[IDStage.scala 693:24]
    .io_IF_Instr(Decoder_io_IF_Instr),
    .io_ID_ImmCtrl(Decoder_io_ID_ImmCtrl),
    .io_ID_JumpCtrl(Decoder_io_ID_JumpCtrl),
    .io_EX_A_ALUOP(Decoder_io_EX_A_ALUOP),
    .io_EX_A_ALUSrc1Ctrl(Decoder_io_EX_A_ALUSrc1Ctrl),
    .io_EX_A_ALUSrc2Ctrl(Decoder_io_EX_A_ALUSrc2Ctrl),
    .io_EX_A_WordALUEn(Decoder_io_EX_A_WordALUEn),
    .io_EX_A_WordALUOP(Decoder_io_EX_A_WordALUOP),
    .io_EX_B_MEMREn(Decoder_io_EX_B_MEMREn),
    .io_EX_B_MEMRCtrl(Decoder_io_EX_B_MEMRCtrl),
    .io_EX_B_MEMWEn(Decoder_io_EX_B_MEMWEn),
    .io_EX_B_MEMWCtrl(Decoder_io_EX_B_MEMWCtrl),
    .io_EX_C_RegWEn(Decoder_io_EX_C_RegWEn),
    .io_EX_C_RegWSrc(Decoder_io_EX_C_RegWSrc),
    .io_EX_C_Rd(Decoder_io_EX_C_Rd),
    .io_EX_D_Rs1REn(Decoder_io_EX_D_Rs1REn),
    .io_EX_D_Rs2REn(Decoder_io_EX_D_Rs2REn),
    .io_EX_D_Rs1(Decoder_io_EX_D_Rs1),
    .io_EX_D_Rs2(Decoder_io_EX_D_Rs2)
  );
  RegFile RegFile ( // @[IDStage.scala 694:24]
    .clock(RegFile_clock),
    .reset(RegFile_reset),
    .io_ID_Rs1(RegFile_io_ID_Rs1),
    .io_ID_Rs2(RegFile_io_ID_Rs2),
    .io_WB_RegWEn(RegFile_io_WB_RegWEn),
    .io_WB_WData(RegFile_io_WB_WData),
    .io_WB_Rd(RegFile_io_WB_Rd),
    .io_EX_RData1(RegFile_io_EX_RData1),
    .io_EX_RData2(RegFile_io_EX_RData2)
  );
  ImmSext ImmSext ( // @[IDStage.scala 695:24]
    .io_i31To7(ImmSext_io_i31To7),
    .io_immCtrl(ImmSext_io_immCtrl),
    .io_imm64(ImmSext_io_imm64)
  );
  Transfer Transfer ( // @[IDStage.scala 696:24]
    .io_ID_A_JumpCtrl(Transfer_io_ID_A_JumpCtrl),
    .io_ID_B_PC(Transfer_io_ID_B_PC),
    .io_ID_B_Imm(Transfer_io_ID_B_Imm),
    .io_ID_B_Rs1Data(Transfer_io_ID_B_Rs1Data),
    .io_ID_B_Rs2Data(Transfer_io_ID_B_Rs2Data),
    .io_PC_JumpEn(Transfer_io_PC_JumpEn),
    .io_PC_PC(Transfer_io_PC_PC)
  );
  assign io_EX_A_ALUOP = Decoder_io_EX_A_ALUOP; // @[IDStage.scala 700:19]
  assign io_EX_A_ALUSrc1Ctrl = Decoder_io_EX_A_ALUSrc1Ctrl; // @[IDStage.scala 700:19]
  assign io_EX_A_ALUSrc2Ctrl = Decoder_io_EX_A_ALUSrc2Ctrl; // @[IDStage.scala 700:19]
  assign io_EX_A_WordALUEn = Decoder_io_EX_A_WordALUEn; // @[IDStage.scala 700:19]
  assign io_EX_A_WordALUOP = Decoder_io_EX_A_WordALUOP; // @[IDStage.scala 700:19]
  assign io_EX_B_MEMREn = Decoder_io_EX_B_MEMREn; // @[IDStage.scala 701:19]
  assign io_EX_B_MEMRCtrl = Decoder_io_EX_B_MEMRCtrl; // @[IDStage.scala 701:19]
  assign io_EX_B_MEMWEn = Decoder_io_EX_B_MEMWEn; // @[IDStage.scala 701:19]
  assign io_EX_B_MEMWCtrl = Decoder_io_EX_B_MEMWCtrl; // @[IDStage.scala 701:19]
  assign io_EX_C_RegWEn = Decoder_io_EX_C_RegWEn; // @[IDStage.scala 702:19]
  assign io_EX_C_RegWSrc = Decoder_io_EX_C_RegWSrc; // @[IDStage.scala 702:19]
  assign io_EX_C_Rd = Decoder_io_EX_C_Rd; // @[IDStage.scala 702:19]
  assign io_EX_D_Rs1REn = Decoder_io_EX_D_Rs1REn; // @[IDStage.scala 703:19]
  assign io_EX_D_Rs2REn = Decoder_io_EX_D_Rs2REn; // @[IDStage.scala 703:19]
  assign io_EX_D_Rs1 = Decoder_io_EX_D_Rs1; // @[IDStage.scala 703:19]
  assign io_EX_D_Rs2 = Decoder_io_EX_D_Rs2; // @[IDStage.scala 703:19]
  assign io_EX_E_PC = io_IF_PC; // @[IDStage.scala 733:18]
  assign io_EX_E_Imm = ImmSext_io_imm64; // @[IDStage.scala 718:15]
  assign io_EX_E_RData1 = io_DATAPATH_Rs1Ctrl == 2'h1 ? io_DATAPATH_MEMData : _GEN_0; // @[IDStage.scala 726:{41,50}]
  assign io_EX_E_RData2 = io_DATAPATH_Rs2Ctrl == 2'h1 ? io_DATAPATH_MEMData : _GEN_2; // @[IDStage.scala 729:{41,50}]
  assign io_PC_PC = Transfer_io_PC_PC; // @[IDStage.scala 746:20]
  assign io_HAZARD_JumpEn = Transfer_io_PC_JumpEn; // @[IDStage.scala 745:20]
  assign Decoder_io_IF_Instr = io_IF_Instr; // @[IDStage.scala 699:23]
  assign RegFile_clock = clock;
  assign RegFile_reset = reset;
  assign RegFile_io_ID_Rs1 = io_IF_Instr[19:15]; // @[IDStage.scala 706:24]
  assign RegFile_io_ID_Rs2 = io_IF_Instr[24:20]; // @[IDStage.scala 707:24]
  assign RegFile_io_WB_RegWEn = io_WB_RegWEn; // @[IDStage.scala 710:9]
  assign RegFile_io_WB_WData = io_WB_WData; // @[IDStage.scala 710:9]
  assign RegFile_io_WB_Rd = io_WB_Rd; // @[IDStage.scala 710:9]
  assign ImmSext_io_i31To7 = io_IF_Instr[31:7]; // @[IDStage.scala 715:29]
  assign ImmSext_io_immCtrl = Decoder_io_ID_ImmCtrl; // @[IDStage.scala 717:22]
  assign Transfer_io_ID_A_JumpCtrl = Decoder_io_ID_JumpCtrl; // @[IDStage.scala 740:29]
  assign Transfer_io_ID_B_PC = io_IF_PC; // @[IDStage.scala 741:29]
  assign Transfer_io_ID_B_Imm = ImmSext_io_imm64; // @[IDStage.scala 742:29]
  assign Transfer_io_ID_B_Rs1Data = io_DATAPATH_Rs1Ctrl == 2'h1 ? io_DATAPATH_MEMData : _GEN_0; // @[IDStage.scala 726:{41,50}]
  assign Transfer_io_ID_B_Rs2Data = io_DATAPATH_Rs2Ctrl == 2'h1 ? io_DATAPATH_MEMData : _GEN_2; // @[IDStage.scala 729:{41,50}]
endmodule
