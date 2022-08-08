circuit WordALU :
  module WordALU :
    output io : { DATAIN : { flip Data1 : UInt<64>, flip Data2 : UInt<64>}, CTRL : { flip WordALUOP : UInt<3>}, DATAOUT : { WordALUData : UInt<64>}}

    node Data1W = bits(io.DATAIN.Data1, 31, 0) @[WordALU.scala 42:31]
    node shamt = bits(io.DATAIN.Data2, 4, 0) @[WordALU.scala 43:31]
    wire DataDW : UInt<64>
    DataDW <= UInt<64>("h0")
    wire DataW : UInt<32>
    DataW <= UInt<32>("h0")
    node _T = eq(UInt<3>("h1"), io.CTRL.WordALUOP) @[WordALU.scala 48:20]
    when _T : @[WordALU.scala 48:20]
      node _DataDW_T = add(io.DATAIN.Data1, io.DATAIN.Data2) @[WordALU.scala 49:38]
      node _DataDW_T_1 = tail(_DataDW_T, 1) @[WordALU.scala 49:38]
      DataDW <= _DataDW_T_1 @[WordALU.scala 49:28]
    else :
      node _T_1 = eq(UInt<3>("h2"), io.CTRL.WordALUOP) @[WordALU.scala 48:20]
      when _T_1 : @[WordALU.scala 48:20]
        node _DataDW_T_2 = sub(io.DATAIN.Data1, io.DATAIN.Data2) @[WordALU.scala 50:38]
        node _DataDW_T_3 = tail(_DataDW_T_2, 1) @[WordALU.scala 50:38]
        DataDW <= _DataDW_T_3 @[WordALU.scala 50:28]
      else :
        node _T_2 = eq(UInt<3>("h3"), io.CTRL.WordALUOP) @[WordALU.scala 48:20]
        when _T_2 : @[WordALU.scala 48:20]
          node _DataDW_T_4 = dshl(io.DATAIN.Data1, shamt) @[WordALU.scala 51:39]
          DataDW <= _DataDW_T_4 @[WordALU.scala 51:28]
        else :
          node _T_3 = eq(UInt<3>("h4"), io.CTRL.WordALUOP) @[WordALU.scala 48:20]
          when _T_3 : @[WordALU.scala 48:20]
            node _DataW_T = dshr(Data1W, shamt) @[WordALU.scala 52:39]
            DataW <= _DataW_T @[WordALU.scala 52:28]
          else :
            node _T_4 = eq(UInt<3>("h5"), io.CTRL.WordALUOP) @[WordALU.scala 48:20]
            when _T_4 : @[WordALU.scala 48:20]
              node _DataW_T_1 = dshr(Data1W, shamt) @[WordALU.scala 53:39]
              DataW <= _DataW_T_1 @[WordALU.scala 53:28]
    wire WordALUData : UInt<64>
    WordALUData <= UInt<64>("h0")
    node _T_5 = eq(UInt<3>("h1"), io.CTRL.WordALUOP) @[WordALU.scala 59:20]
    when _T_5 : @[WordALU.scala 59:20]
      node _WordALUData_T = bits(DataDW, 31, 31) @[WordALU.scala 60:56]
      node _WordALUData_T_1 = bits(_WordALUData_T, 0, 0) @[Bitwise.scala 74:15]
      node _WordALUData_T_2 = mux(_WordALUData_T_1, UInt<32>("hffffffff"), UInt<32>("h0")) @[Bitwise.scala 74:12]
      node _WordALUData_T_3 = bits(DataDW, 31, 0) @[WordALU.scala 60:70]
      node _WordALUData_T_4 = cat(_WordALUData_T_2, _WordALUData_T_3) @[Cat.scala 31:58]
      WordALUData <= _WordALUData_T_4 @[WordALU.scala 60:33]
    else :
      node _T_6 = eq(UInt<3>("h2"), io.CTRL.WordALUOP) @[WordALU.scala 59:20]
      when _T_6 : @[WordALU.scala 59:20]
        node _WordALUData_T_5 = bits(DataDW, 31, 31) @[WordALU.scala 61:56]
        node _WordALUData_T_6 = bits(_WordALUData_T_5, 0, 0) @[Bitwise.scala 74:15]
        node _WordALUData_T_7 = mux(_WordALUData_T_6, UInt<32>("hffffffff"), UInt<32>("h0")) @[Bitwise.scala 74:12]
        node _WordALUData_T_8 = bits(DataDW, 31, 0) @[WordALU.scala 61:70]
        node _WordALUData_T_9 = cat(_WordALUData_T_7, _WordALUData_T_8) @[Cat.scala 31:58]
        WordALUData <= _WordALUData_T_9 @[WordALU.scala 61:33]
      else :
        node _T_7 = eq(UInt<3>("h3"), io.CTRL.WordALUOP) @[WordALU.scala 59:20]
        when _T_7 : @[WordALU.scala 59:20]
          node _WordALUData_T_10 = bits(DataDW, 31, 31) @[WordALU.scala 62:56]
          node _WordALUData_T_11 = bits(_WordALUData_T_10, 0, 0) @[Bitwise.scala 74:15]
          node _WordALUData_T_12 = mux(_WordALUData_T_11, UInt<32>("hffffffff"), UInt<32>("h0")) @[Bitwise.scala 74:12]
          node _WordALUData_T_13 = bits(DataDW, 31, 0) @[WordALU.scala 62:70]
          node _WordALUData_T_14 = cat(_WordALUData_T_12, _WordALUData_T_13) @[Cat.scala 31:58]
          WordALUData <= _WordALUData_T_14 @[WordALU.scala 62:33]
        else :
          node _T_8 = eq(UInt<3>("h4"), io.CTRL.WordALUOP) @[WordALU.scala 59:20]
          when _T_8 : @[WordALU.scala 59:20]
            node _WordALUData_T_15 = bits(DataW, 31, 31) @[WordALU.scala 63:55]
            node _WordALUData_T_16 = bits(_WordALUData_T_15, 0, 0) @[Bitwise.scala 74:15]
            node _WordALUData_T_17 = mux(_WordALUData_T_16, UInt<32>("hffffffff"), UInt<32>("h0")) @[Bitwise.scala 74:12]
            node _WordALUData_T_18 = bits(DataW, 31, 0) @[WordALU.scala 63:69]
            node _WordALUData_T_19 = cat(_WordALUData_T_17, _WordALUData_T_18) @[Cat.scala 31:58]
            WordALUData <= _WordALUData_T_19 @[WordALU.scala 63:33]
          else :
            node _T_9 = eq(UInt<3>("h5"), io.CTRL.WordALUOP) @[WordALU.scala 59:20]
            when _T_9 : @[WordALU.scala 59:20]
              node _WordALUData_T_20 = bits(DataW, 31, 31) @[WordALU.scala 64:55]
              node _WordALUData_T_21 = bits(_WordALUData_T_20, 0, 0) @[Bitwise.scala 74:15]
              node _WordALUData_T_22 = mux(_WordALUData_T_21, UInt<32>("hffffffff"), UInt<32>("h0")) @[Bitwise.scala 74:12]
              node _WordALUData_T_23 = bits(DataW, 31, 0) @[WordALU.scala 64:69]
              node _WordALUData_T_24 = cat(_WordALUData_T_22, _WordALUData_T_23) @[Cat.scala 31:58]
              WordALUData <= _WordALUData_T_24 @[WordALU.scala 64:33]
    io.DATAOUT.WordALUData <= WordALUData @[WordALU.scala 67:26]

