package miniCore

import chisel3._
import chisel3.util._


/*****************************************
* The rules named:
*   IRead_MEM_IOA
*   ----IRead: the name of Module
*   ----MEM: the name of connect with
*   ----IOA: input & output ports A  
*****************************************/



/*****************************************
*   instruction read FSM
*****************************************/

class IRead_MEM_IOA extends Bundle{
  val En   = Output(Bool())
  val Addr = Output(UInt(32.W))
  val Size = Output(UInt(2.W))
}

class IRead_MEM_IOB extends Bundle{
  val DataValid = Input(Bool())
  val Data      = Input(UInt(32.W))
}

class IRead_CTRL_IO extends Bundle{
  val Start = Input(Bool())
  val Done  = Output(Bool())
}


class IRead_CORE_IO extends Bundle{
  val pc    = Input(UInt(32.W))
  val instr = Output(UInt(32.W))
}


class IReadFSM_IO extends Bundle{
  val CORE  = new IRead_CORE_IO()
  val MEM_A = new IRead_MEM_IOA()
  val MEM_B = new IRead_MEM_IOB()
  val CTRL  = new IRead_CTRL_IO()
}


class IReadFSM extends Module{
  val io = IO(new IReadFSM_IO())

  val pc        = io.CORE.pc
  val DataValid = io.MEM_B.DataValid
  val instr     = io.MEM_B.Data
  val Start     = io.CTRL.Start

  val idle_S :: send_S :: wait_S :: finish_S :: Nil = Enum(4)
  val stateReg = RegInit(idle_S)
  val instrReg = RegInit("h0000_0013".U(32.W))
  
  switch(stateReg){
    is(idle_S){
      when(Start){
        stateReg := send_S
      }
    }
    is(send_S){
      stateReg := wait_S
    }
    is(wait_S){
      when(DataValid){
        stateReg := finish_S
        instrReg := instr
      }
    }
    is(finish_S){
      stateReg := idle_S
    }
  }

  io.MEM_A.En  := (stateReg === send_S)
  io.CTRL.Done := (stateReg === finish_S)

  io.CORE.instr  := instrReg
  io.MEM_A.Addr  := pc

  val oneByte :: twoByte :: fourByte :: eightByte :: Nil = Enum(4)
  io.MEM_A.Size  := fourByte
}




/*****************************************
*   data read FSM
*****************************************/

class DRead_CORE_IO extends Bundle{
  val Addr = Input(UInt(32.W))
  val Size = Input(UInt(3.W))
  val Data = Output(UInt(64.W))
}

class DRead_MEM_IO extends Bundle{
  val En        = Output(Bool())
  val Addr      = Output(UInt(32.W))
  val Size      = Output(UInt(2.W))
  val DataValid = Input(Bool())
  val Data      = Input(UInt(64.W))
}


class DRead_CTRL_IO extends Bundle{
  val Start = Input(Bool())
  val Done  = Output(Bool())
}


class DReadFSM_IO extends Bundle{
  val CORE = new DRead_CORE_IO()
  val MEM  = new DRead_MEM_IO()
  val CTRL = new DRead_CTRL_IO()
}



class DReadFSM extends Module{
  val io = IO(new DReadFSM_IO())
  
  val Addr = io.CORE.Addr
  val Size = io.CORE.Size 
  val DataValid = io.MEM.DataValid
  val Data = io.MEM.Data
  val Start = io.CTRL.Start

  val idle_S :: send_S :: wait_S :: finish_S :: Nil = Enum(4)
  val stateReg = RegInit(idle_S)
  val dataReg  = RegInit(0.U(64.W))

  switch(stateReg){
    is(idle_S){
      when(Start){
        stateReg := send_S
      }
    }
    is(send_S){
      stateReg := wait_S
    }
    is(wait_S){
      when(DataValid){
        stateReg := finish_S
        dataReg  := Data
      }
    }
    is(finish_S){
      stateReg := idle_S
    }
  }

  io.MEM.En    := (stateReg === send_S)
  io.CTRL.Done := (stateReg === finish_S)

  io.CORE.Data := dataReg
  io.MEM.Addr  := Addr
  val noneMemR :: memRSOne :: memRSTwo :: memRSFour :: memRUOne :: memRUTwo :: memRUFour :: memREight :: Nil = Enum(8)
  val oneByte :: twoByte :: fourByte :: eightByte :: Nil = Enum(4)
  when(Size === memRSOne || Size === memRUOne){
    io.MEM.Size := oneByte
  }
  .elsewhen(Size === memRSTwo || Size === memRUTwo){
    io.MEM.Size := twoByte
  }
  .elsewhen(Size === memRSFour || Size === memRUFour){
    io.MEM.Size := fourByte
  }
  .otherwise{
    io.MEM.Size := eightByte
  }

}





/*****************************************
*   data write FSM
*****************************************/

class DWrite_CORE_IO extends Bundle{
  val Addr = Input(UInt(32.W))
  val Size = Input(UInt(3.W))
  val Data = Input(UInt(64.W))
}


class DWrite_MEM_IO extends Bundle{
  val En   = Output(Bool())
  val Addr = Output(UInt(32.W))
  val Size = Output(UInt(2.W))
  val Data = Output(UInt(64.W))
  val Done = Input(Bool())
}


class DWrite_CTRL_IO extends Bundle{
  val Start = Input(Bool())
  val Done  = Output(Bool())
}



class DWriteFSM_IO extends Bundle{
  val CORE = new DWrite_CORE_IO()
  val MEM  = new DWrite_MEM_IO()
  val CTRL = new DWrite_CTRL_IO()
}





class DWriteFSM extends Module{
  val io = IO(new DWriteFSM_IO())

  val Addr  = io.CORE.Addr
  val Size  = io.CORE.Size
  val Data  = io.CORE.Data
  val Done  = io.MEM.Done
  val Start = io.CTRL.Start

  val idle_S :: send_S :: wait_S :: finish_S :: Nil = Enum(4)
  val stateReg = RegInit(idle_S)
  
  switch(stateReg){
    is(idle_S){
      when(Start){
        stateReg := send_S
      }
    }
    is(send_S){
      stateReg := wait_S
    }
    is(wait_S){
      when(Done){
        stateReg := finish_S
      }
    }
    is(finish_S){
      stateReg := idle_S
    }
  }

  io.MEM.En    := (stateReg === send_S)
  io.CTRL.Done := (stateReg === finish_S)
  io.MEM.Addr  := Addr
  io.MEM.Data  := Data

  val noneMemW :: memWOne :: memWTwo :: memWFour :: memWEight :: Nil = Enum(5)
  val oneByte :: twoByte :: fourByte :: eightByte :: Nil = Enum(4)
  when(Size === memWOne){
    io.MEM.Size := oneByte
  }
  .elsewhen(Size === memWTwo){
    io.MEM.Size := twoByte
  }
  .elsewhen(Size === memWFour){
    io.MEM.Size := memWFour
  }
  .otherwise{
    io.MEM.Size := memWEight
  }


}






/*****************************************
*   hazard check Machine
*****************************************/

class HazardCheck_IDStage_IO extends Bundle{
  val Rs1En  = Input(Bool())
  val Rs2En  = Input(Bool())
  val Rs1    = Input(UInt(5.W))
  val Rs2    = Input(UInt(5.W))
  val JumpEn = Input(Bool())
}

class HazardCheck_EXStage_IO extends Bundle{
  val En = Input(Bool())
  val Rd = Input(UInt(5.W))
}

class HazardCheck_MEMStage_IO extends Bundle{
  val En  = Input(Bool())
  val Rd  = Input(UInt(5.W))
  val Src = Input(UInt(2.W))
}

class HazardCheck_CTRL_IO extends Bundle{
  val HazardEn_EXID  = Output(Bool())
  val HazardEn_MEMID = Output(Bool())
  val HazardEn_JUMP  = Output(Bool())
}



class HazardCheck_IO extends Bundle{
  val IDStage  = new HazardCheck_IDStage_IO()
  val EXStage  = new HazardCheck_EXStage_IO()
  val MEMStage = new HazardCheck_MEMStage_IO()
  val CTRL     = new HazardCheck_CTRL_IO()
}



class HazardCheck extends Module{
  val io = IO(new HazardCheck_IO())

  val HazardEn_EXID  = WireDefault(false.B)
  val HazardEn_MEMID = WireDefault(false.B)
  val HazardEn_JUMP  = WireDefault(false.B)

  // EX-ID hazard Check
  when(io.EXStage.En && io.EXStage.Rd =/= 0.U){
    when(io.IDStage.Rs1En && io.IDStage.Rs1 === io.EXStage.Rd){
      HazardEn_EXID := true.B
    }
    .elsewhen(io.IDStage.Rs2En && io.IDStage.Rs2 === io.EXStage.Rd){
      HazardEn_EXID := true.B
    }
  }

  // MEM-ID hazard Check
  val noneSrc :: aluSrc :: memSrc :: Nil = Enum(3)
  when(io.MEMStage.En && io.MEMStage.Rd =/= 0.U && io.MEMStage.Src === memSrc){
    when(io.IDStage.Rs1En && io.IDStage.Rs1 === io.MEMStage.Rd){
      HazardEn_MEMID := true.B
    }
    .elsewhen(io.MEMStage.En && io.IDStage.Rs2 === io.MEMStage.Rd){
      HazardEn_MEMID := true.B
    }
  }

  // Jump hazard Check
  HazardEn_JUMP := io.IDStage.JumpEn

  io.CTRL.HazardEn_EXID  := HazardEn_EXID
  io.CTRL.HazardEn_MEMID := HazardEn_MEMID
  io.CTRL.HazardEn_JUMP  := HazardEn_JUMP
}






/*****************************************
*   main ctrl FSM
*****************************************/

class MainCtrl_CORE_IOA extends Bundle{
  val REn = Input(Bool())
  val WEn = Input(Bool())
}

class MainCtrl_CORE_IOB extends Bundle{
  val HoldPC    = Output(Bool())
  val HoldIFID  = Output(Bool())
  val HoldIDEX  = Output(Bool())
  val HoldEXMEM = Output(Bool())
  val HoldMEMWB = Output(Bool())
  val FlushIFID = Output(Bool())
  val FLUSHIDEX = Output(Bool())
}



class MainCtrlFSM_IO extends Bundle{
  val CORE_A      = new MainCtrl_CORE_IOA()
  val CORE_B      = new MainCtrl_CORE_IOB()
  val IREAD       = Flipped(new IRead_CTRL_IO())
  val DREAD       = Flipped(new DRead_CTRL_IO())
  val DWRITE      = Flipped(new DWrite_CTRL_IO())
  val HazardCheck = Flipped(new HazardCheck_CTRL_IO())
}




class MainCtrlFSM extends Module{
  val io = IO(new MainCtrlFSM_IO())

  val idle_S :: iRead_S :: iReadWait_S :: dRead_S :: dReadWait_S :: dWrite_S :: dWriteWait_S :: hazardCheck_S :: hazardEXID_S :: hazardMEMID_S :: hazardJump_S :: hazardNone_S :: Nil = Enum(12)
  val stateReg = RegInit(idle_S)
  switch(stateReg){
    is(idle_S)  { stateReg := iRead_S}
    // read instruction state
    is(iRead_S) { stateReg := iReadWait_S}
    is(iReadWait_S){
      when(io.IREAD.Done){
        when(io.CORE_A.REn)      { stateReg := dRead_S}
        .elsewhen(io.CORE_A.WEn) { stateReg := dWrite_S}
        .otherwise               { stateReg := hazardCheck_S}
      }
    }
    // read data state
    is(dRead_S) { stateReg := dReadWait_S}
    is(dReadWait_S){
      when(io.DREAD.Done){ stateReg := hazardCheck_S}
    }
    // write data state
    is(dWrite_S) {stateReg := dWriteWait_S}
    is(dWriteWait_S){
      when(io.DWRITE.Done){stateReg := hazardCheck_S}
    }
    // hazard check state
    is(hazardCheck_S){
      when(io.HazardCheck.HazardEn_EXID)       { stateReg := hazardEXID_S}
      .elsewhen(io.HazardCheck.HazardEn_MEMID) { stateReg := hazardMEMID_S}
      .elsewhen(io.HazardCheck.HazardEn_JUMP)  { stateReg := hazardJump_S}
      .otherwise                               { stateReg := hazardNone_S}
    }
    is(hazardEXID_S)  { stateReg := iRead_S}
    is(hazardMEMID_S) { stateReg := iRead_S}
    is(hazardJump_S)  { stateReg := iRead_S}
    is(hazardNone_S)  { stateReg := iRead_S}
  }


  io.IREAD.Start  := (stateReg === iRead_S)
  io.DREAD.Start  := (stateReg === dRead_S)
  io.DWRITE.Start := (stateReg === dWrite_S)

  val HoldPC    = WireDefault(true.B)
  val HoldIFID  = WireDefault(true.B)
  val HoldIDEX  = WireDefault(true.B)
  val HoldEXMEM = WireDefault(true.B)
  val HoldMEMWB = WireDefault(true.B)
  val FlushIFID = WireDefault(false.B)
  val FlushIDEX = WireDefault(false.B)

  when(stateReg === hazardEXID_S){
    HoldIDEX  := false.B
    HoldEXMEM := false.B
    HoldMEMWB := false.B
    FlushIDEX := true.B
  }
  .elsewhen(stateReg === hazardMEMID_S){
    HoldIDEX  := false.B
    HoldEXMEM := false.B
    HoldMEMWB := false.B
    FlushIDEX := true.B
  }
  .elsewhen(stateReg === hazardJump_S){
    HoldPC    := false.B
    HoldIFID  := false.B
    HoldIDEX  := false.B
    HoldEXMEM := false.B
    HoldMEMWB := false.B
    FlushIFID := true.B
  }
  .elsewhen(stateReg === hazardNone_S){
    HoldPC    := false.B
    HoldIFID  := false.B
    HoldIDEX  := false.B
    HoldEXMEM := false.B
    HoldMEMWB := false.B
  }

  io.CORE_B.HoldPC    := HoldPC
  io.CORE_B.HoldIFID  := HoldIFID
  io.CORE_B.HoldIDEX  := HoldIDEX
  io.CORE_B.HoldEXMEM := HoldEXMEM
  io.CORE_B.HoldMEMWB := HoldMEMWB
  io.CORE_B.FlushIFID := FlushIFID
  io.CORE_B.FLUSHIDEX := FlushIDEX
}





/*****************************************
*   CPU core ctrl Machine
*****************************************/


class CoreCtrl_CORE_IOA extends Bundle{
  val IREAD  = new IRead_CORE_IO()
  val DREAD  = new DRead_CORE_IO()
  val DWRITE = new DWrite_CORE_IO()
  val WRCTRL = new MainCtrl_CORE_IOA()
}


class CoreCtrl_CORE_IOB extends Bundle{
  val IDStage = new HazardCheck_IDStage_IO()
  val EXStage = new HazardCheck_EXStage_IO()
  val MEMStage = new HazardCheck_MEMStage_IO()
  val CORECTRL = new MainCtrl_CORE_IOB()
}



class CoreCtrl_MEM_IO extends Bundle{
  val IREAD_A = new IRead_MEM_IOA()
  val IREAD_B = new IRead_MEM_IOB()
  val DREAD   = new DRead_MEM_IO()
  val DWRITE  = new DWrite_MEM_IO()
}


class CoreCtrl_IO extends Bundle{
  val CORE_A = new CoreCtrl_CORE_IOA()
  val CORE_B = new CoreCtrl_CORE_IOB()
  val MEM    = new CoreCtrl_MEM_IO()
}






class CoreCtrl extends Module{
  val io = IO(new CoreCtrl_IO())

  val IREAD    = Module(new IReadFSM())
  val DREAD    = Module(new DReadFSM())
  val DWRITE   = Module(new DWriteFSM())
  val HAZARD   = Module(new HazardCheck())
  val MAINCTRL = Module(new MainCtrlFSM())

  // instruction read FSM
  IREAD.io.CORE  <> io.CORE_A.IREAD
  IREAD.io.MEM_A <> io.MEM.IREAD_A
  IREAD.io.MEM_B <> io.MEM.IREAD_B
  IREAD.io.CTRL  <> MAINCTRL.io.IREAD
  // data read FSM
  DREAD.io.CORE <> io.CORE_A.DREAD
  DREAD.io.MEM  <> io.MEM.DREAD
  DREAD.io.CTRL <> MAINCTRL.io.DREAD
  // data write FSM
  DWRITE.io.CORE <> io.CORE_A.DWRITE
  DWRITE.io.MEM  <> io.MEM.DWRITE
  DWRITE.io.CTRL <> MAINCTRL.io.DWRITE
  // hazard check Machine
  HAZARD.io.IDStage  <> io.CORE_B.IDStage
  HAZARD.io.EXStage  <> io.CORE_B.EXStage
  HAZARD.io.MEMStage <> io.CORE_B.MEMStage
  HAZARD.io.CTRL     <> MAINCTRL.io.HazardCheck
  // main ctrl FSM
  MAINCTRL.io.CORE_A <> io.CORE_A.WRCTRL
  MAINCTRL.io.CORE_B <> io.CORE_B.CORECTRL
}





object CoreCtrl extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(new CoreCtrl())
}