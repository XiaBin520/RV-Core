circuit alu :
  module alu :
    input clock : Clock
    input reset : UInt<1>
    input io_aluOP : UInt<4>
    input io_aluSrc1 : UInt<64>
    input io_aluSrc2 : UInt<64>
    output io_aluOut : UInt<64>

    node shiftNum = bits(io_aluSrc2, 5, 0) @[alu.scala 21:30]
    node _T = eq(UInt<4>("h0"), io_aluOP) @[alu.scala 25:15]
    node _out_T = add(io_aluSrc1, io_aluSrc2) @[alu.scala 26:36]
    node _out_T_1 = tail(_out_T, 1) @[alu.scala 26:36]
    node _T_1 = eq(UInt<4>("h1"), io_aluOP) @[alu.scala 25:15]
    node _out_T_2 = sub(io_aluSrc1, io_aluSrc2) @[alu.scala 27:36]
    node _out_T_3 = tail(_out_T_2, 1) @[alu.scala 27:36]
    node _T_2 = eq(UInt<4>("h2"), io_aluOP) @[alu.scala 25:15]
    node _out_T_4 = asSInt(io_aluSrc1) @[alu.scala 28:37]
    node _out_T_5 = asSInt(io_aluSrc2) @[alu.scala 28:51]
    node _out_T_6 = lt(_out_T_4, _out_T_5) @[alu.scala 28:44]
    node _T_3 = eq(UInt<4>("h3"), io_aluOP) @[alu.scala 25:15]
    node _out_T_7 = lt(io_aluSrc1, io_aluSrc2) @[alu.scala 29:36]
    node _T_4 = eq(UInt<4>("h4"), io_aluOP) @[alu.scala 25:15]
    node _out_T_8 = xor(io_aluSrc1, io_aluSrc2) @[alu.scala 30:36]
    node _T_5 = eq(UInt<4>("h5"), io_aluOP) @[alu.scala 25:15]
    node _out_T_9 = or(io_aluSrc1, io_aluSrc2) @[alu.scala 31:36]
    node _T_6 = eq(UInt<4>("h6"), io_aluOP) @[alu.scala 25:15]
    node _out_T_10 = and(io_aluSrc1, io_aluSrc2) @[alu.scala 32:36]
    node _T_7 = eq(UInt<4>("h7"), io_aluOP) @[alu.scala 25:15]
    node _out_T_11 = dshl(io_aluSrc1, shiftNum) @[alu.scala 33:36]
    node _T_8 = eq(UInt<4>("h8"), io_aluOP) @[alu.scala 25:15]
    node _out_T_12 = dshr(io_aluSrc1, shiftNum) @[alu.scala 34:36]
    node _T_9 = eq(UInt<4>("h9"), io_aluOP) @[alu.scala 25:15]
    node _out_T_13 = asSInt(io_aluSrc1) @[alu.scala 35:37]
    node _out_T_14 = dshr(_out_T_13, shiftNum) @[alu.scala 35:44]
    node _out_T_15 = asUInt(_out_T_14) @[alu.scala 35:57]
    node _GEN_0 = mux(_T_9, _out_T_15, UInt<64>("h0")) @[alu.scala 25:15 35:28]
    node _GEN_1 = mux(_T_8, _out_T_12, _GEN_0) @[alu.scala 25:15 34:28]
    node _GEN_2 = mux(_T_7, _out_T_11, _GEN_1) @[alu.scala 25:15 33:28]
    node _GEN_3 = mux(_T_6, _out_T_10, _GEN_2) @[alu.scala 25:15 32:28]
    node _GEN_4 = mux(_T_5, _out_T_9, _GEN_3) @[alu.scala 25:15 31:28]
    node _GEN_5 = mux(_T_4, _out_T_8, _GEN_4) @[alu.scala 25:15 30:28]
    node _GEN_6 = mux(_T_3, _out_T_7, _GEN_5) @[alu.scala 25:15 29:28]
    node _GEN_7 = mux(_T_2, _out_T_6, _GEN_6) @[alu.scala 25:15 28:28]
    node _GEN_8 = mux(_T_1, _out_T_3, _GEN_7) @[alu.scala 25:15 27:28]
    node _GEN_9 = mux(_T, _out_T_1, _GEN_8) @[alu.scala 25:15 26:28]
    node out = bits(_GEN_9, 63, 0)
    io_aluOut <= out @[alu.scala 38:15]
