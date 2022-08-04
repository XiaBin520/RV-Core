
import chisel3._
import chisel3.util._


class regFile extends Module {
  val io = IO(new Bundle{
      val rs1    = Input(UInt(5.W))
      val rs2    = Input(UInt(5.W))
      val rd     = Input(UInt(5.W))
      val wData  = Input(UInt(64.W))
      val wEn    = Input(Bool())
      val rData1 = Output(UInt(64.W))
      val rData2 = Output(UInt(64.W))
  })

  val rs1    = io.rs1
  val rs2    = io.rs2
  val rd     = io.rd
  val wData  = io.wData
  val wEn    = io.wEn
  val rData1 = WireDefault(0.U(64.W))
  val rData2 = WireDefault(0.U(64.W))

  val gprFile = RegInit( VecInit(  Seq.fill(32)(0.U(64.W))  )  )
  rData1 := gprFile(rs1)
  rData2 := gprFile(rs2)
  when(rs1 === rd && wEn && rd =/= 0.U){
    rData1 := wData
  }
  when(rs2 === rd && wEn && rd =/= 0.U){
    rData2 := wData
  }

  when(wEn){
    gprFile(rd) := wData
  }
  gprFile(0) := 0.U(64.W)

  io.rData1 := rData1
  io.rData2 := rData2
}


object regFile extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(new regFile())
}
