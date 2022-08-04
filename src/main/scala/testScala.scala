
import chisel3._
import chisel3.util._

class testScala extends Module {
  val io = IO(new Bundle{
    val wEn   = Input(Bool())
    val rEn   = Input(Bool())
    val addr  = Input(UInt(64.W))
    val wData = Input(UInt(64.W))
    val out   = Output(UInt(64.W))
  })

  val wEn   = io.wEn
  val rEn   = io.rEn
  val addr  = io.addr
  val wData = io.wData
  val out   = WireDefault(233.U(64.W))

  // val regV = Reg(Vec(32, UInt(64.W)))
  // val regV = RegInit(Vec(32, UInt(64.W)))

  val regV = RegInit( VecInit( Seq.fill(32)(0.U(64.W)) ) )

  when(wEn){
    regV(addr) := wData
  }
  .elsewhen(rEn){
    out := regV(addr)
  }

  io.out := out
}



object testScala extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(new testScala())
}