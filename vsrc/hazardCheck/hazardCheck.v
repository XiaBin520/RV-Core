module hazardCheck(
  input        clock,
  input        reset,
  input        io_regWriteEn_EX,
  input  [4:0] io_regWriteNum_EX,
  input        io_regWriteEn_MEM,
  input  [4:0] io_regWriteNum_MEM,
  input  [1:0] io_regWriteSrc_MEM,
  input        io_regRs1ReadEn_ID,
  input        io_regRs2ReadEn_ID,
  input  [4:0] io_regRs1Num_ID,
  input  [4:0] io_regRs2Num_ID,
  input        io_jumpEn_ID,
  output       io_hazardEXIDValid,
  output       io_hazardMEMIDValid,
  output       io_hazardJump
);
  wire  _T_5 = io_regRs2ReadEn_ID & io_regRs2Num_ID == io_regWriteNum_EX; // @[hazardCheckFSM.scala 51:31]
  wire  _GEN_1 = io_regRs1ReadEn_ID & io_regRs1Num_ID == io_regWriteNum_EX | _T_5; // @[hazardCheckFSM.scala 48:61 49:23]
  wire  _T_13 = io_regRs2ReadEn_ID & io_regRs2Num_ID == io_regWriteNum_MEM; // @[hazardCheckFSM.scala 61:31]
  wire  _GEN_4 = io_regRs1ReadEn_ID & io_regRs1Num_ID == io_regWriteNum_MEM | _T_13; // @[hazardCheckFSM.scala 58:62 59:24]
  assign io_hazardEXIDValid = io_regWriteEn_EX & io_regWriteNum_EX != 5'h0 & _GEN_1; // @[hazardCheckFSM.scala 47:48]
  assign io_hazardMEMIDValid = io_regWriteEn_MEM & io_regWriteNum_MEM != 5'h0 & io_regWriteSrc_MEM == 2'h2 & _GEN_4; // @[hazardCheckFSM.scala 57:80]
  assign io_hazardJump = io_jumpEn_ID; // @[hazardCheckFSM.scala 71:23]
endmodule
