// package miniCore

// import chisel3._
// import chisel3.util._


// class ctrlCoreIO extends Bundle{
//   // Write & Read signal --> come from core
//   val wEnData     = Input(Bool())
//   val wCtrlData   = Input(UInt(3.W))
//   val wAddrData   = Input(UInt(32.W))
//   val wData       = Input(UInt(64.W))
//   val rEnData     = Input(Bool())
//   val rCtrlData   = Input(UInt(3.W))
//   val rAddrData   = Input(UInt(32.W))
//   val rAddrInstr  = Input(UInt(32.W))
//   // Write & Read signal --> come from memory
//   val wFinish     = Input(Bool())
//   val rValidData  = Input(Bool())
//   val rData       = Input(UInt(64.W))
//   val rValidInstr = Input(Bool())
//   val rInstr      = Input(UInt(32.W))
//   // core hazard ctrl signal
//   val regWEn_EX   = Input(Bool())
//   val rdNum_EX    = Input(Bool())
//   val regWEn_MEM  = Input(Bool())
//   val regWSrc_MEM = Input(UInt(2.W))
//   val rdNum_MEM   = Input(UInt(5.W))
//   val rs1REn_ID   = Input(Bool())
//   val rs2REn_ID   = Input(Bool())
//   val rs1Num_ID   = Input(UInt(5.W))
//   val rs2Num_ID   = Input(UInt(5.W))
//   val jumpEn_ID   = Input(Bool())
//   //  output signal to memory
//   val wEnDMem     = Output(Bool())
//   val wCtrlDMem   = Output(UInt(2.W))
//   val wDataDMem   = Output(UInt(64.W))
//   val wAddrDmem   = Output(UInt(32.W))
//   val rEnDMem     = Output(Bool())
//   val rCtrlDMem   = Output(UInt(2.W))
//   val rAddrDMem   = Output(UInt(32.W))
//   val rEnIMem     = Output(Bool())
//   val rAddrIMem   = Output(UInt(32.W))
//   // output signal to core
//   val instr       = Output(UInt(32.W))
//   val data        = Output(UInt(64.W))
//   val pcHold      = Output(Bool())
//   val IFIDHold    = Output(Bool())
//   val IDEXHold    = Output(Bool())
//   val EXMEMHold   = Output(Bool())
//   val MEMWBHold   = Output(Bool())
//   val IFIDFlush   = Output(Bool())
//   val IDEXFlush   = Output(Bool())
// }



// class ctrlCore extends Module{
//   val io = IO(new ctrlCoreIO())

//   // Write & Read signal --> come from core
//   val wEnData     = io.wEnData
//   val wCtrlData   = io.wCtrlData
//   val wAddrData   = io.wAddrData
//   val wData       = io.wData
//   val rEnData     = io.rEnData
//   val rCtrlData   = io.rCtrlData
//   val rAddrData   = io.rAddrData
//   val rAddrInstr  = io.rAddrInstr
//   // Write & Read signal --> come from memory
//   val wFinish     = io.wFinish
//   val rValidData  = io.rValidData
//   val rData       = io.rData
//   val rValidInstr = io.rValidInstr
//   val rInstr      = io.rInstr
//   // core hazard ctrl signal
//   val regWEn_EX   = io.regWEn_EX
//   val rdNum_EX    = io.rdNum_EX
//   val regWEn_MEM  = io.regWEn_MEM
//   val regWSrc_MEM = io.regWSrc_MEM
//   val rdNum_MEM   = io.rdNum_MEM
//   val rs1REn_ID   = io.rs1REn_ID
//   val rs2REn_ID   = io.rs2REn_ID
//   val rs1Num_ID   = io.rs1Num_ID
//   val rs2Num_ID   = io.rs2Num_ID
//   val jumpEn_ID   = io.jumpEn_ID


//   val sNone :: accessMem :: checkHazard :: hazardEXID :: hazardMEMID :: hazardJump :: run :: Nil = Enum(7)

//   val stateReg   = RegInit(sNone)
//   val dataWDone  = RegInit(false.B)
//   val dataRDone  = RegInit(false.B)
//   val instrRDone = RegInit(false.B)

//   val noneSrc :: aluSrc :: memSrc :: Nil = Enum(3)

//   switch(stateReg){
//     is(sNone){
//       stateReg := accessMem
//     }
//     is(accessMem){
//       when(dataWDone && dataRDone && instrRDone){
//         stateReg := checkHazard
//       }
//     }
//     is(checkHazard){
//       when(regWEn_EX){
//         when(rs1REn_ID && rs1Num_ID === rdNum_EX){
//           stateReg := hazardEXID
//         }
//         .elsewhen(rs2REn_ID && rs2Num_ID === rdNum_EX){
//           stateReg := hazardEXID
//         }
//       }
//       .elsewhen(regWEn_MEM && regWSrc_MEM === memSrc){
//         when(rs1REn_ID && rs1Num_ID === rdNum_MEM){
//           stateReg := hazardMEMID
//         }
//         .elsewhen(rs2REn_ID && rs2Num_ID === rdNum_MEM){
//           stateReg := hazardMEMID
//         }
//       }
//       .elsewhen(jumpEn_ID){
//         stateReg := hazardJump
//       }
//       .otherwise{
//         stateReg := run
//       }
//     }
//     is(hazardEXID){
//       stateReg  := accessMem
//     }
//     is(hazardMEMID){
//       stateReg  := accessMem
//     }
//     is(hazardJump){
//       stateReg  := accessMem
//     }
//     is(run){
//       stateReg  := accessMem
//     }
//   }





//   /***
//   *     instr Read FSM
//   ***/

//   val instrNone :: instrSend :: instrWait :: instrFinish :: Nil = Enum(4)
//   val instrStateReg = RegInit(instrNone)
//   val instrReg      = RegInit("h0000_0013".U(32.W))

//   switch(stateReg){
//     is(accessMem){
//       switch(instrStateReg){
//         is(instrNone){
//           instrStateReg := instrSend
//         }
//         is(instrSend){
//           instrStateReg := instrWait
//         }
//         is(instrWait){
//           when(rValidInstr){
//             instrStateReg := instrFinish
//           }
//           instrStateReg   := instrWait
//         }
//         is(instrFinish){
//           instrStateReg := instrNone
//         }
//       }
//     }
//   }

//   when(rValidInstr && instrStateReg === instrWait){
//     instrReg := rInstr
//   }

//   when(instrStateReg === instrFinish){
//     instrRDone := true.B
//   }
//   .elsewhen(stateReg === hazardEXID  || 
//             stateReg === hazardMEMID || 
//             stateReg === hazardJump  || 
//             stateReg === run){
//     instrRDone := false.B
//   }

//   io.rEnIMem   := (instrStateReg === instrSend)
//   io.rAddrIMem := rAddrInstr
//   io.instr     := instrReg



//   /***
//   *     data Read FSM
//   ***/


//   val dataRNone :: dataRSend :: dataRWait :: dataRFinish :: Nil = Enum(4)
//   val dataRState = RegInit(dataRNone)
//   val dataReg    = RegInit(0.U(64.W))
  
//   switch(stateReg){
//     is(accessMem){
//       switch(dataRState){
//         is(dataRNone){
//           when(rEnData){
//             dataRState := dataRSend
//           }
//           dataRState   := dataRFinish
//         }
//         is(dataRSend){
//           dataRState   := dataRWait
//         }
//         is(dataRWait){
//           when(rValidData){
//             dataRState := dataRFinish
//           }
//           dataRState   := dataRWait
//         }
//         is(dataRFinish){
//           dataRState   := dataRNone
//         }
//       }
//     }
//   }

//   when(rValidData && dataRState === dataRWait){
//     dataReg := rData
//   }

//   when(dataRState === dataRFinish){
//     dataRDone := true.B
//   }
//   .elsewhen(stateReg === hazardEXID  || 
//             stateReg === hazardMEMID || 
//             stateReg === hazardJump  || 
//             stateReg === run){
//     dataRDone := false.B
//   }

//   val noneMemR :: memRSOne :: memRSTwo :: memRSFour :: memRUOne :: memRUTwo :: memRUFour :: memREight :: Nil = Enum(8)
//   val rOneByte :: rTwoByte :: rFourByte :: rEightByte :: Nil = Enum(4)


//   io.rEnDMem := (dataRState === dataRSend)

//   when(rCtrlData === memRSOne || rCtrlData === memRUOne){
//     io.rCtrlDMem := rOneByte
//   }
//   .elsewhen(rCtrlData === memRSTwo || rCtrlData === memRUTwo){
//     io.rCtrlDMem := rTwoByte
//   }
//   .elsewhen(rCtrlData === memRSFour || rCtrlData === memRUFour){
//     io.rCtrlDMem := rFourByte
//   }
//   .otherwise{
//     io.rCtrlDMem := rEightByte
//   }

//   io.rAddrDMem := rAddrData
//   io.data      := dataReg



//   /***
//   *     data Write FSM
//   ***/

//   val dataWNone :: dataWSend :: dataWWait :: dataWFinish :: Nil = Enum(4)
//   val dataWState = RegInit(dataWNone)
  
//   switch(stateReg){
//     is(accessMem){
//       switch(dataWState){
//         is(dataWNone){
//           when(wEnData){
//             dataWState := dataWSend
//           }
//           dataWState := dataWFinish
//         }
//         is(dataWSend){
//           dataWState := dataWWait
//         }
//         is(dataWWait){
//           when(wFinish){
//             dataWState := dataWFinish
//           }
//           dataWState := dataWWait
//         }
//         is(dataWFinish){
//           dataWState := dataWNone
//         }
//       }
//     }
//   }

//   when(dataWState === dataWFinish){
//     dataWDone := true.B
//   }
//   .elsewhen(stateReg === hazardEXID  || 
//             stateReg === hazardMEMID || 
//             stateReg === hazardJump  || 
//             stateReg === run){
//     dataWDone := false.B
//   }
  

//   io.wEnDMem := (dataWState === dataWSend)

//   val noneMemW :: memWOne :: memWTwo :: memWFour :: memWEight :: Nil = Enum(5)
//   val wOneByte :: wTwoByte :: wFourByte :: wEightByte :: Nil = Enum(4)
//   when(wCtrlData === memWOne){
//     io.wCtrlDMem := wOneByte
//   }
//   .elsewhen(wCtrlData === memWTwo){
//     io.wCtrlDMem := wTwoByte
//   }
//   .elsewhen(wCtrlData === memWFour){
//     io.wCtrlDMem := wFourByte
//   }
//   .otherwise{
//     io.wCtrlDMem := wEightByte
//   }

//   io.wDataDMem := wData
//   io.wAddrDmem := wAddrData




//   val pcHold      = WireDefault(true.B)
//   val IFIDHold    = WireDefault(true.B)
//   val IDEXHold    = WireDefault(true.B)
//   val EXMEMHold   = WireDefault(true.B)
//   val MEMWBHold   = WireDefault(true.B)
//   val IFIDFlush   = WireDefault(false.B)
//   val IDEXFlush   = WireDefault(false.B)
//   switch(stateReg){
//     is(hazardEXID){
//       IDEXHold  := false.B
//       IDEXFlush := true.B
//       EXMEMHold := false.B
//       MEMWBHold := false.B
//     }
//     is(hazardMEMID){
//       IDEXHold  := false.B
//       IDEXFlush := true.B
//       EXMEMHold := false.B
//       MEMWBHold := false.B
//     }
//     is(hazardJump){
//       pcHold    := false.B
//       IFIDHold  := false.B
//       IFIDFlush := true.B
//       IDEXHold  := false.B
//       EXMEMHold := false.B
//       MEMWBHold := false.B
//     }
//     is(run){
//       pcHold    := false.B
//       IFIDHold  := false.B
//       IDEXHold  := false.B
//       EXMEMHold := false.B
//       MEMWBHold := false.B
//     }
//   }

//   io.pcHold    := pcHold
//   io.IFIDHold  := IFIDHold
//   io.IDEXHold  := IDEXHold
//   io.EXMEMHold := EXMEMHold
//   io.MEMWBHold := MEMWBHold
//   io.IFIDFlush := IFIDFlush
//   io.IDEXFlush := IDEXFlush

  

// }

// object ctrlCore extends App{
//   (new chisel3.stage.ChiselStage).emitVerilog(new ctrlCore())
// }