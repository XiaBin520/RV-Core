
import chisel3._
import chisel3.util._


/*******************************
*   Register file
*******************************/
class RegFile_CTRL_IOA extends Bundle{
  val Rs1 = Input(UInt(5.W))
  val Rs2 = Input(UInt(5.W))
}

class RegFile_DATAOUT_IO extends Bundle{
  val RData1 = Output(UInt(64.W))
  val RData2 = Output(UInt(64.W))
}


class RegFile_CTRL_IOB extends Bundle{
  val WEn = Input(Bool())
  val Rd  = Input(UInt(5.W))
}

class RegFile_DATAIN_IO extends Bundle{
  val WData = Input(UInt(64.W))
}




class RegFile_IO extends Bundle{
  val READ_CTRL  = new RegFile_CTRL_IOA()
  val READ_DATA  = new RegFile_DATAOUT_IO()
  val WRITE_CTRL = new RegFile_CTRL_IOB()
  val WRITE_DATA = new RegFile_DATAIN_IO()
}




class RegFile extends Module {
  val io = IO(new RegFile_IO())

  val Rs1 = io.READ_CTRL.Rs1
  val Rs2 = io.READ_CTRL.Rs2

  val WEn   = io.WRITE_CTRL.WEn
  val Rd    = io.WRITE_CTRL.Rd
  val WData = io.WRITE_DATA.WData

  val RData1 = WireDefault(0.U(64.W))
  val RData2 = WireDefault(0.U(64.W))

  val gprFile = RegInit( VecInit(  Seq.fill(32)(0.U(64.W))  ) )
  RData1 := gprFile(Rs1)
  RData2 := gprFile(Rs2)
  when(Rs1 === Rd && WEn && Rd =/= 0.U) {RData1 := WData}
  when(Rs2 === Rd && WEn && Rd =/= 0.U) {RData2 := WData}
  when(WEn){ gprFile(Rd) := WData}
  gprFile(0) := 0.U(64.W)

  io.READ_DATA.RData1 := RData1
  io.READ_DATA.RData2 := RData2
}


object RegFile extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(new RegFile())
}
