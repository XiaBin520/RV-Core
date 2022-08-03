
import chisel3._
import chisel3.util._


class ctrlTransfer extends Module{
  val io = IO(new Bundle{
    val ctrlModel = Input(UInt(4.W))
    val prePC     = Input(UInt(32.W))
    val imm       = Input(UInt(64.W))
    val rs1Data   = Input(UInt(64.W))
    val rs2Data   = Input(UInt(64.W))
    val nextPC    = Output(UInt(32.W))
  })

  val noneCtrl :: equal :: notEqual  :: sLess   :: sMoreThan :: uLess :: uMoreThan :: jalCtrl :: jalrCtrl :: Nil = Enum(9)

  val ctrlModel = io.ctrlModel
  val prePC     = io.prePC
  val imm       = io.imm
  val rs1Data32 = io.rs1Data(31, 0)
  val rs1Data   = io.rs1Data
  val rs2Data   = io.rs2Data
  val pcADDimm  = WireDefault(0.U(32.W))
  val rs1ADDimm = WireDefault(0.U(32.W))
  val pcADD4    = WireDefault(0.U(32.W))
  val nextPC    = WireDefault(0.U(32.W))


  pcADDimm  := prePC + imm
  rs1ADDimm := (rs1Data32 + imm) & "hfffffffe".U
  pcADD4    := prePC + 4.U
  
  nextPC    :=  pcADD4
  switch(ctrlModel){
    is(equal){
      when(rs1Data === rs2Data) {nextPC := pcADDimm}
    }
    is(notEqual){
      when(rs1Data =/= rs2Data) {nextPC := pcADDimm}
    }
    is(sLess){
      when(rs1Data.asSInt < rs2Data.asSInt) {nextPC := pcADDimm}
    }
    is(sMoreThan){
      when(rs1Data.asSInt >= rs2Data.asSInt) {nextPC := pcADDimm}
    }
    is(uLess){
      when(rs1Data < rs2Data) {nextPC := pcADDimm}
    }
    is(uMoreThan){
      when(rs1Data >= rs2Data) {nextPC := pcADDimm}
    }
    is(jalCtrl){
      nextPC := pcADDimm
    }
    is(jalrCtrl){
      nextPC := rs1ADDimm
    }
  }

  io.nextPC := nextPC  
}


object ctrlTransfer extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(new ctrlTransfer())
}