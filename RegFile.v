module RegFile(
  input         clock,
  input         reset,
  input  [4:0]  io_READ_CTRL_Rs1,
  input  [4:0]  io_READ_CTRL_Rs2,
  output [63:0] io_READ_DATA_RData1,
  output [63:0] io_READ_DATA_RData2,
  input         io_WRITE_CTRL_WEn,
  input  [4:0]  io_WRITE_CTRL_Rd,
  input  [63:0] io_WRITE_DATA_WData
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
  reg [63:0] gprFile_1; // @[RegFile.scala 55:24]
  reg [63:0] gprFile_2; // @[RegFile.scala 55:24]
  reg [63:0] gprFile_3; // @[RegFile.scala 55:24]
  reg [63:0] gprFile_4; // @[RegFile.scala 55:24]
  reg [63:0] gprFile_5; // @[RegFile.scala 55:24]
  reg [63:0] gprFile_6; // @[RegFile.scala 55:24]
  reg [63:0] gprFile_7; // @[RegFile.scala 55:24]
  reg [63:0] gprFile_8; // @[RegFile.scala 55:24]
  reg [63:0] gprFile_9; // @[RegFile.scala 55:24]
  reg [63:0] gprFile_10; // @[RegFile.scala 55:24]
  reg [63:0] gprFile_11; // @[RegFile.scala 55:24]
  reg [63:0] gprFile_12; // @[RegFile.scala 55:24]
  reg [63:0] gprFile_13; // @[RegFile.scala 55:24]
  reg [63:0] gprFile_14; // @[RegFile.scala 55:24]
  reg [63:0] gprFile_15; // @[RegFile.scala 55:24]
  reg [63:0] gprFile_16; // @[RegFile.scala 55:24]
  reg [63:0] gprFile_17; // @[RegFile.scala 55:24]
  reg [63:0] gprFile_18; // @[RegFile.scala 55:24]
  reg [63:0] gprFile_19; // @[RegFile.scala 55:24]
  reg [63:0] gprFile_20; // @[RegFile.scala 55:24]
  reg [63:0] gprFile_21; // @[RegFile.scala 55:24]
  reg [63:0] gprFile_22; // @[RegFile.scala 55:24]
  reg [63:0] gprFile_23; // @[RegFile.scala 55:24]
  reg [63:0] gprFile_24; // @[RegFile.scala 55:24]
  reg [63:0] gprFile_25; // @[RegFile.scala 55:24]
  reg [63:0] gprFile_26; // @[RegFile.scala 55:24]
  reg [63:0] gprFile_27; // @[RegFile.scala 55:24]
  reg [63:0] gprFile_28; // @[RegFile.scala 55:24]
  reg [63:0] gprFile_29; // @[RegFile.scala 55:24]
  reg [63:0] gprFile_30; // @[RegFile.scala 55:24]
  reg [63:0] gprFile_31; // @[RegFile.scala 55:24]
  wire [63:0] _GEN_1 = 5'h1 == io_READ_CTRL_Rs1 ? gprFile_1 : 64'h0; // @[RegFile.scala 56:{10,10}]
  wire [63:0] _GEN_2 = 5'h2 == io_READ_CTRL_Rs1 ? gprFile_2 : _GEN_1; // @[RegFile.scala 56:{10,10}]
  wire [63:0] _GEN_3 = 5'h3 == io_READ_CTRL_Rs1 ? gprFile_3 : _GEN_2; // @[RegFile.scala 56:{10,10}]
  wire [63:0] _GEN_4 = 5'h4 == io_READ_CTRL_Rs1 ? gprFile_4 : _GEN_3; // @[RegFile.scala 56:{10,10}]
  wire [63:0] _GEN_5 = 5'h5 == io_READ_CTRL_Rs1 ? gprFile_5 : _GEN_4; // @[RegFile.scala 56:{10,10}]
  wire [63:0] _GEN_6 = 5'h6 == io_READ_CTRL_Rs1 ? gprFile_6 : _GEN_5; // @[RegFile.scala 56:{10,10}]
  wire [63:0] _GEN_7 = 5'h7 == io_READ_CTRL_Rs1 ? gprFile_7 : _GEN_6; // @[RegFile.scala 56:{10,10}]
  wire [63:0] _GEN_8 = 5'h8 == io_READ_CTRL_Rs1 ? gprFile_8 : _GEN_7; // @[RegFile.scala 56:{10,10}]
  wire [63:0] _GEN_9 = 5'h9 == io_READ_CTRL_Rs1 ? gprFile_9 : _GEN_8; // @[RegFile.scala 56:{10,10}]
  wire [63:0] _GEN_10 = 5'ha == io_READ_CTRL_Rs1 ? gprFile_10 : _GEN_9; // @[RegFile.scala 56:{10,10}]
  wire [63:0] _GEN_11 = 5'hb == io_READ_CTRL_Rs1 ? gprFile_11 : _GEN_10; // @[RegFile.scala 56:{10,10}]
  wire [63:0] _GEN_12 = 5'hc == io_READ_CTRL_Rs1 ? gprFile_12 : _GEN_11; // @[RegFile.scala 56:{10,10}]
  wire [63:0] _GEN_13 = 5'hd == io_READ_CTRL_Rs1 ? gprFile_13 : _GEN_12; // @[RegFile.scala 56:{10,10}]
  wire [63:0] _GEN_14 = 5'he == io_READ_CTRL_Rs1 ? gprFile_14 : _GEN_13; // @[RegFile.scala 56:{10,10}]
  wire [63:0] _GEN_15 = 5'hf == io_READ_CTRL_Rs1 ? gprFile_15 : _GEN_14; // @[RegFile.scala 56:{10,10}]
  wire [63:0] _GEN_16 = 5'h10 == io_READ_CTRL_Rs1 ? gprFile_16 : _GEN_15; // @[RegFile.scala 56:{10,10}]
  wire [63:0] _GEN_17 = 5'h11 == io_READ_CTRL_Rs1 ? gprFile_17 : _GEN_16; // @[RegFile.scala 56:{10,10}]
  wire [63:0] _GEN_18 = 5'h12 == io_READ_CTRL_Rs1 ? gprFile_18 : _GEN_17; // @[RegFile.scala 56:{10,10}]
  wire [63:0] _GEN_19 = 5'h13 == io_READ_CTRL_Rs1 ? gprFile_19 : _GEN_18; // @[RegFile.scala 56:{10,10}]
  wire [63:0] _GEN_20 = 5'h14 == io_READ_CTRL_Rs1 ? gprFile_20 : _GEN_19; // @[RegFile.scala 56:{10,10}]
  wire [63:0] _GEN_21 = 5'h15 == io_READ_CTRL_Rs1 ? gprFile_21 : _GEN_20; // @[RegFile.scala 56:{10,10}]
  wire [63:0] _GEN_22 = 5'h16 == io_READ_CTRL_Rs1 ? gprFile_22 : _GEN_21; // @[RegFile.scala 56:{10,10}]
  wire [63:0] _GEN_23 = 5'h17 == io_READ_CTRL_Rs1 ? gprFile_23 : _GEN_22; // @[RegFile.scala 56:{10,10}]
  wire [63:0] _GEN_24 = 5'h18 == io_READ_CTRL_Rs1 ? gprFile_24 : _GEN_23; // @[RegFile.scala 56:{10,10}]
  wire [63:0] _GEN_25 = 5'h19 == io_READ_CTRL_Rs1 ? gprFile_25 : _GEN_24; // @[RegFile.scala 56:{10,10}]
  wire [63:0] _GEN_26 = 5'h1a == io_READ_CTRL_Rs1 ? gprFile_26 : _GEN_25; // @[RegFile.scala 56:{10,10}]
  wire [63:0] _GEN_27 = 5'h1b == io_READ_CTRL_Rs1 ? gprFile_27 : _GEN_26; // @[RegFile.scala 56:{10,10}]
  wire [63:0] _GEN_28 = 5'h1c == io_READ_CTRL_Rs1 ? gprFile_28 : _GEN_27; // @[RegFile.scala 56:{10,10}]
  wire [63:0] _GEN_29 = 5'h1d == io_READ_CTRL_Rs1 ? gprFile_29 : _GEN_28; // @[RegFile.scala 56:{10,10}]
  wire [63:0] _GEN_30 = 5'h1e == io_READ_CTRL_Rs1 ? gprFile_30 : _GEN_29; // @[RegFile.scala 56:{10,10}]
  wire [63:0] _GEN_31 = 5'h1f == io_READ_CTRL_Rs1 ? gprFile_31 : _GEN_30; // @[RegFile.scala 56:{10,10}]
  wire [63:0] _GEN_33 = 5'h1 == io_READ_CTRL_Rs2 ? gprFile_1 : 64'h0; // @[RegFile.scala 57:{10,10}]
  wire [63:0] _GEN_34 = 5'h2 == io_READ_CTRL_Rs2 ? gprFile_2 : _GEN_33; // @[RegFile.scala 57:{10,10}]
  wire [63:0] _GEN_35 = 5'h3 == io_READ_CTRL_Rs2 ? gprFile_3 : _GEN_34; // @[RegFile.scala 57:{10,10}]
  wire [63:0] _GEN_36 = 5'h4 == io_READ_CTRL_Rs2 ? gprFile_4 : _GEN_35; // @[RegFile.scala 57:{10,10}]
  wire [63:0] _GEN_37 = 5'h5 == io_READ_CTRL_Rs2 ? gprFile_5 : _GEN_36; // @[RegFile.scala 57:{10,10}]
  wire [63:0] _GEN_38 = 5'h6 == io_READ_CTRL_Rs2 ? gprFile_6 : _GEN_37; // @[RegFile.scala 57:{10,10}]
  wire [63:0] _GEN_39 = 5'h7 == io_READ_CTRL_Rs2 ? gprFile_7 : _GEN_38; // @[RegFile.scala 57:{10,10}]
  wire [63:0] _GEN_40 = 5'h8 == io_READ_CTRL_Rs2 ? gprFile_8 : _GEN_39; // @[RegFile.scala 57:{10,10}]
  wire [63:0] _GEN_41 = 5'h9 == io_READ_CTRL_Rs2 ? gprFile_9 : _GEN_40; // @[RegFile.scala 57:{10,10}]
  wire [63:0] _GEN_42 = 5'ha == io_READ_CTRL_Rs2 ? gprFile_10 : _GEN_41; // @[RegFile.scala 57:{10,10}]
  wire [63:0] _GEN_43 = 5'hb == io_READ_CTRL_Rs2 ? gprFile_11 : _GEN_42; // @[RegFile.scala 57:{10,10}]
  wire [63:0] _GEN_44 = 5'hc == io_READ_CTRL_Rs2 ? gprFile_12 : _GEN_43; // @[RegFile.scala 57:{10,10}]
  wire [63:0] _GEN_45 = 5'hd == io_READ_CTRL_Rs2 ? gprFile_13 : _GEN_44; // @[RegFile.scala 57:{10,10}]
  wire [63:0] _GEN_46 = 5'he == io_READ_CTRL_Rs2 ? gprFile_14 : _GEN_45; // @[RegFile.scala 57:{10,10}]
  wire [63:0] _GEN_47 = 5'hf == io_READ_CTRL_Rs2 ? gprFile_15 : _GEN_46; // @[RegFile.scala 57:{10,10}]
  wire [63:0] _GEN_48 = 5'h10 == io_READ_CTRL_Rs2 ? gprFile_16 : _GEN_47; // @[RegFile.scala 57:{10,10}]
  wire [63:0] _GEN_49 = 5'h11 == io_READ_CTRL_Rs2 ? gprFile_17 : _GEN_48; // @[RegFile.scala 57:{10,10}]
  wire [63:0] _GEN_50 = 5'h12 == io_READ_CTRL_Rs2 ? gprFile_18 : _GEN_49; // @[RegFile.scala 57:{10,10}]
  wire [63:0] _GEN_51 = 5'h13 == io_READ_CTRL_Rs2 ? gprFile_19 : _GEN_50; // @[RegFile.scala 57:{10,10}]
  wire [63:0] _GEN_52 = 5'h14 == io_READ_CTRL_Rs2 ? gprFile_20 : _GEN_51; // @[RegFile.scala 57:{10,10}]
  wire [63:0] _GEN_53 = 5'h15 == io_READ_CTRL_Rs2 ? gprFile_21 : _GEN_52; // @[RegFile.scala 57:{10,10}]
  wire [63:0] _GEN_54 = 5'h16 == io_READ_CTRL_Rs2 ? gprFile_22 : _GEN_53; // @[RegFile.scala 57:{10,10}]
  wire [63:0] _GEN_55 = 5'h17 == io_READ_CTRL_Rs2 ? gprFile_23 : _GEN_54; // @[RegFile.scala 57:{10,10}]
  wire [63:0] _GEN_56 = 5'h18 == io_READ_CTRL_Rs2 ? gprFile_24 : _GEN_55; // @[RegFile.scala 57:{10,10}]
  wire [63:0] _GEN_57 = 5'h19 == io_READ_CTRL_Rs2 ? gprFile_25 : _GEN_56; // @[RegFile.scala 57:{10,10}]
  wire [63:0] _GEN_58 = 5'h1a == io_READ_CTRL_Rs2 ? gprFile_26 : _GEN_57; // @[RegFile.scala 57:{10,10}]
  wire [63:0] _GEN_59 = 5'h1b == io_READ_CTRL_Rs2 ? gprFile_27 : _GEN_58; // @[RegFile.scala 57:{10,10}]
  wire [63:0] _GEN_60 = 5'h1c == io_READ_CTRL_Rs2 ? gprFile_28 : _GEN_59; // @[RegFile.scala 57:{10,10}]
  wire [63:0] _GEN_61 = 5'h1d == io_READ_CTRL_Rs2 ? gprFile_29 : _GEN_60; // @[RegFile.scala 57:{10,10}]
  wire [63:0] _GEN_62 = 5'h1e == io_READ_CTRL_Rs2 ? gprFile_30 : _GEN_61; // @[RegFile.scala 57:{10,10}]
  wire [63:0] _GEN_63 = 5'h1f == io_READ_CTRL_Rs2 ? gprFile_31 : _GEN_62; // @[RegFile.scala 57:{10,10}]
  wire  _T_2 = io_WRITE_CTRL_Rd != 5'h0; // @[RegFile.scala 58:32]
  assign io_READ_DATA_RData1 = io_READ_CTRL_Rs1 == io_WRITE_CTRL_Rd & io_WRITE_CTRL_WEn & io_WRITE_CTRL_Rd != 5'h0 ?
    io_WRITE_DATA_WData : _GEN_31; // @[RegFile.scala 56:10 58:{41,49}]
  assign io_READ_DATA_RData2 = io_READ_CTRL_Rs2 == io_WRITE_CTRL_Rd & io_WRITE_CTRL_WEn & _T_2 ? io_WRITE_DATA_WData :
    _GEN_63; // @[RegFile.scala 57:10 59:{41,49}]
  always @(posedge clock) begin
    if (reset) begin // @[RegFile.scala 55:24]
      gprFile_1 <= 64'h0; // @[RegFile.scala 55:24]
    end else if (io_WRITE_CTRL_WEn) begin // @[RegFile.scala 60:12]
      if (5'h1 == io_WRITE_CTRL_Rd) begin // @[RegFile.scala 60:26]
        gprFile_1 <= io_WRITE_DATA_WData; // @[RegFile.scala 60:26]
      end
    end
    if (reset) begin // @[RegFile.scala 55:24]
      gprFile_2 <= 64'h0; // @[RegFile.scala 55:24]
    end else if (io_WRITE_CTRL_WEn) begin // @[RegFile.scala 60:12]
      if (5'h2 == io_WRITE_CTRL_Rd) begin // @[RegFile.scala 60:26]
        gprFile_2 <= io_WRITE_DATA_WData; // @[RegFile.scala 60:26]
      end
    end
    if (reset) begin // @[RegFile.scala 55:24]
      gprFile_3 <= 64'h0; // @[RegFile.scala 55:24]
    end else if (io_WRITE_CTRL_WEn) begin // @[RegFile.scala 60:12]
      if (5'h3 == io_WRITE_CTRL_Rd) begin // @[RegFile.scala 60:26]
        gprFile_3 <= io_WRITE_DATA_WData; // @[RegFile.scala 60:26]
      end
    end
    if (reset) begin // @[RegFile.scala 55:24]
      gprFile_4 <= 64'h0; // @[RegFile.scala 55:24]
    end else if (io_WRITE_CTRL_WEn) begin // @[RegFile.scala 60:12]
      if (5'h4 == io_WRITE_CTRL_Rd) begin // @[RegFile.scala 60:26]
        gprFile_4 <= io_WRITE_DATA_WData; // @[RegFile.scala 60:26]
      end
    end
    if (reset) begin // @[RegFile.scala 55:24]
      gprFile_5 <= 64'h0; // @[RegFile.scala 55:24]
    end else if (io_WRITE_CTRL_WEn) begin // @[RegFile.scala 60:12]
      if (5'h5 == io_WRITE_CTRL_Rd) begin // @[RegFile.scala 60:26]
        gprFile_5 <= io_WRITE_DATA_WData; // @[RegFile.scala 60:26]
      end
    end
    if (reset) begin // @[RegFile.scala 55:24]
      gprFile_6 <= 64'h0; // @[RegFile.scala 55:24]
    end else if (io_WRITE_CTRL_WEn) begin // @[RegFile.scala 60:12]
      if (5'h6 == io_WRITE_CTRL_Rd) begin // @[RegFile.scala 60:26]
        gprFile_6 <= io_WRITE_DATA_WData; // @[RegFile.scala 60:26]
      end
    end
    if (reset) begin // @[RegFile.scala 55:24]
      gprFile_7 <= 64'h0; // @[RegFile.scala 55:24]
    end else if (io_WRITE_CTRL_WEn) begin // @[RegFile.scala 60:12]
      if (5'h7 == io_WRITE_CTRL_Rd) begin // @[RegFile.scala 60:26]
        gprFile_7 <= io_WRITE_DATA_WData; // @[RegFile.scala 60:26]
      end
    end
    if (reset) begin // @[RegFile.scala 55:24]
      gprFile_8 <= 64'h0; // @[RegFile.scala 55:24]
    end else if (io_WRITE_CTRL_WEn) begin // @[RegFile.scala 60:12]
      if (5'h8 == io_WRITE_CTRL_Rd) begin // @[RegFile.scala 60:26]
        gprFile_8 <= io_WRITE_DATA_WData; // @[RegFile.scala 60:26]
      end
    end
    if (reset) begin // @[RegFile.scala 55:24]
      gprFile_9 <= 64'h0; // @[RegFile.scala 55:24]
    end else if (io_WRITE_CTRL_WEn) begin // @[RegFile.scala 60:12]
      if (5'h9 == io_WRITE_CTRL_Rd) begin // @[RegFile.scala 60:26]
        gprFile_9 <= io_WRITE_DATA_WData; // @[RegFile.scala 60:26]
      end
    end
    if (reset) begin // @[RegFile.scala 55:24]
      gprFile_10 <= 64'h0; // @[RegFile.scala 55:24]
    end else if (io_WRITE_CTRL_WEn) begin // @[RegFile.scala 60:12]
      if (5'ha == io_WRITE_CTRL_Rd) begin // @[RegFile.scala 60:26]
        gprFile_10 <= io_WRITE_DATA_WData; // @[RegFile.scala 60:26]
      end
    end
    if (reset) begin // @[RegFile.scala 55:24]
      gprFile_11 <= 64'h0; // @[RegFile.scala 55:24]
    end else if (io_WRITE_CTRL_WEn) begin // @[RegFile.scala 60:12]
      if (5'hb == io_WRITE_CTRL_Rd) begin // @[RegFile.scala 60:26]
        gprFile_11 <= io_WRITE_DATA_WData; // @[RegFile.scala 60:26]
      end
    end
    if (reset) begin // @[RegFile.scala 55:24]
      gprFile_12 <= 64'h0; // @[RegFile.scala 55:24]
    end else if (io_WRITE_CTRL_WEn) begin // @[RegFile.scala 60:12]
      if (5'hc == io_WRITE_CTRL_Rd) begin // @[RegFile.scala 60:26]
        gprFile_12 <= io_WRITE_DATA_WData; // @[RegFile.scala 60:26]
      end
    end
    if (reset) begin // @[RegFile.scala 55:24]
      gprFile_13 <= 64'h0; // @[RegFile.scala 55:24]
    end else if (io_WRITE_CTRL_WEn) begin // @[RegFile.scala 60:12]
      if (5'hd == io_WRITE_CTRL_Rd) begin // @[RegFile.scala 60:26]
        gprFile_13 <= io_WRITE_DATA_WData; // @[RegFile.scala 60:26]
      end
    end
    if (reset) begin // @[RegFile.scala 55:24]
      gprFile_14 <= 64'h0; // @[RegFile.scala 55:24]
    end else if (io_WRITE_CTRL_WEn) begin // @[RegFile.scala 60:12]
      if (5'he == io_WRITE_CTRL_Rd) begin // @[RegFile.scala 60:26]
        gprFile_14 <= io_WRITE_DATA_WData; // @[RegFile.scala 60:26]
      end
    end
    if (reset) begin // @[RegFile.scala 55:24]
      gprFile_15 <= 64'h0; // @[RegFile.scala 55:24]
    end else if (io_WRITE_CTRL_WEn) begin // @[RegFile.scala 60:12]
      if (5'hf == io_WRITE_CTRL_Rd) begin // @[RegFile.scala 60:26]
        gprFile_15 <= io_WRITE_DATA_WData; // @[RegFile.scala 60:26]
      end
    end
    if (reset) begin // @[RegFile.scala 55:24]
      gprFile_16 <= 64'h0; // @[RegFile.scala 55:24]
    end else if (io_WRITE_CTRL_WEn) begin // @[RegFile.scala 60:12]
      if (5'h10 == io_WRITE_CTRL_Rd) begin // @[RegFile.scala 60:26]
        gprFile_16 <= io_WRITE_DATA_WData; // @[RegFile.scala 60:26]
      end
    end
    if (reset) begin // @[RegFile.scala 55:24]
      gprFile_17 <= 64'h0; // @[RegFile.scala 55:24]
    end else if (io_WRITE_CTRL_WEn) begin // @[RegFile.scala 60:12]
      if (5'h11 == io_WRITE_CTRL_Rd) begin // @[RegFile.scala 60:26]
        gprFile_17 <= io_WRITE_DATA_WData; // @[RegFile.scala 60:26]
      end
    end
    if (reset) begin // @[RegFile.scala 55:24]
      gprFile_18 <= 64'h0; // @[RegFile.scala 55:24]
    end else if (io_WRITE_CTRL_WEn) begin // @[RegFile.scala 60:12]
      if (5'h12 == io_WRITE_CTRL_Rd) begin // @[RegFile.scala 60:26]
        gprFile_18 <= io_WRITE_DATA_WData; // @[RegFile.scala 60:26]
      end
    end
    if (reset) begin // @[RegFile.scala 55:24]
      gprFile_19 <= 64'h0; // @[RegFile.scala 55:24]
    end else if (io_WRITE_CTRL_WEn) begin // @[RegFile.scala 60:12]
      if (5'h13 == io_WRITE_CTRL_Rd) begin // @[RegFile.scala 60:26]
        gprFile_19 <= io_WRITE_DATA_WData; // @[RegFile.scala 60:26]
      end
    end
    if (reset) begin // @[RegFile.scala 55:24]
      gprFile_20 <= 64'h0; // @[RegFile.scala 55:24]
    end else if (io_WRITE_CTRL_WEn) begin // @[RegFile.scala 60:12]
      if (5'h14 == io_WRITE_CTRL_Rd) begin // @[RegFile.scala 60:26]
        gprFile_20 <= io_WRITE_DATA_WData; // @[RegFile.scala 60:26]
      end
    end
    if (reset) begin // @[RegFile.scala 55:24]
      gprFile_21 <= 64'h0; // @[RegFile.scala 55:24]
    end else if (io_WRITE_CTRL_WEn) begin // @[RegFile.scala 60:12]
      if (5'h15 == io_WRITE_CTRL_Rd) begin // @[RegFile.scala 60:26]
        gprFile_21 <= io_WRITE_DATA_WData; // @[RegFile.scala 60:26]
      end
    end
    if (reset) begin // @[RegFile.scala 55:24]
      gprFile_22 <= 64'h0; // @[RegFile.scala 55:24]
    end else if (io_WRITE_CTRL_WEn) begin // @[RegFile.scala 60:12]
      if (5'h16 == io_WRITE_CTRL_Rd) begin // @[RegFile.scala 60:26]
        gprFile_22 <= io_WRITE_DATA_WData; // @[RegFile.scala 60:26]
      end
    end
    if (reset) begin // @[RegFile.scala 55:24]
      gprFile_23 <= 64'h0; // @[RegFile.scala 55:24]
    end else if (io_WRITE_CTRL_WEn) begin // @[RegFile.scala 60:12]
      if (5'h17 == io_WRITE_CTRL_Rd) begin // @[RegFile.scala 60:26]
        gprFile_23 <= io_WRITE_DATA_WData; // @[RegFile.scala 60:26]
      end
    end
    if (reset) begin // @[RegFile.scala 55:24]
      gprFile_24 <= 64'h0; // @[RegFile.scala 55:24]
    end else if (io_WRITE_CTRL_WEn) begin // @[RegFile.scala 60:12]
      if (5'h18 == io_WRITE_CTRL_Rd) begin // @[RegFile.scala 60:26]
        gprFile_24 <= io_WRITE_DATA_WData; // @[RegFile.scala 60:26]
      end
    end
    if (reset) begin // @[RegFile.scala 55:24]
      gprFile_25 <= 64'h0; // @[RegFile.scala 55:24]
    end else if (io_WRITE_CTRL_WEn) begin // @[RegFile.scala 60:12]
      if (5'h19 == io_WRITE_CTRL_Rd) begin // @[RegFile.scala 60:26]
        gprFile_25 <= io_WRITE_DATA_WData; // @[RegFile.scala 60:26]
      end
    end
    if (reset) begin // @[RegFile.scala 55:24]
      gprFile_26 <= 64'h0; // @[RegFile.scala 55:24]
    end else if (io_WRITE_CTRL_WEn) begin // @[RegFile.scala 60:12]
      if (5'h1a == io_WRITE_CTRL_Rd) begin // @[RegFile.scala 60:26]
        gprFile_26 <= io_WRITE_DATA_WData; // @[RegFile.scala 60:26]
      end
    end
    if (reset) begin // @[RegFile.scala 55:24]
      gprFile_27 <= 64'h0; // @[RegFile.scala 55:24]
    end else if (io_WRITE_CTRL_WEn) begin // @[RegFile.scala 60:12]
      if (5'h1b == io_WRITE_CTRL_Rd) begin // @[RegFile.scala 60:26]
        gprFile_27 <= io_WRITE_DATA_WData; // @[RegFile.scala 60:26]
      end
    end
    if (reset) begin // @[RegFile.scala 55:24]
      gprFile_28 <= 64'h0; // @[RegFile.scala 55:24]
    end else if (io_WRITE_CTRL_WEn) begin // @[RegFile.scala 60:12]
      if (5'h1c == io_WRITE_CTRL_Rd) begin // @[RegFile.scala 60:26]
        gprFile_28 <= io_WRITE_DATA_WData; // @[RegFile.scala 60:26]
      end
    end
    if (reset) begin // @[RegFile.scala 55:24]
      gprFile_29 <= 64'h0; // @[RegFile.scala 55:24]
    end else if (io_WRITE_CTRL_WEn) begin // @[RegFile.scala 60:12]
      if (5'h1d == io_WRITE_CTRL_Rd) begin // @[RegFile.scala 60:26]
        gprFile_29 <= io_WRITE_DATA_WData; // @[RegFile.scala 60:26]
      end
    end
    if (reset) begin // @[RegFile.scala 55:24]
      gprFile_30 <= 64'h0; // @[RegFile.scala 55:24]
    end else if (io_WRITE_CTRL_WEn) begin // @[RegFile.scala 60:12]
      if (5'h1e == io_WRITE_CTRL_Rd) begin // @[RegFile.scala 60:26]
        gprFile_30 <= io_WRITE_DATA_WData; // @[RegFile.scala 60:26]
      end
    end
    if (reset) begin // @[RegFile.scala 55:24]
      gprFile_31 <= 64'h0; // @[RegFile.scala 55:24]
    end else if (io_WRITE_CTRL_WEn) begin // @[RegFile.scala 60:12]
      if (5'h1f == io_WRITE_CTRL_Rd) begin // @[RegFile.scala 60:26]
        gprFile_31 <= io_WRITE_DATA_WData; // @[RegFile.scala 60:26]
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
