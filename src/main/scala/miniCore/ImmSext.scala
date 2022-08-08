
import chisel3._
import chisel3.util._


/***************************************
*   ImmSext Module
***************************************/
class ImmSext_DATAIN_IO extends Bundle{
  val Imm31To7 = Input(UInt(25.W))
}

class ImmSext_CTRL_IO extends Bundle{
  val ImmCtrl = Input(UInt(3.W))
}

class ImmSext_DATAOUT_IO extends Bundle{
  val Imm = Output(UInt(64.W))
}




class ImmSext_IO extends Bundle{
  val DATAIN  = new ImmSext_DATAIN_IO()
  val CTRL    = new ImmSext_CTRL_IO()
  val DATAOUT = new ImmSext_DATAOUT_IO()
}




class ImmSext extends RawModule {
    val io = IO(new ImmSext_IO())

    val immR :: immI :: immS :: immB :: immU :: immJ :: immCSRI :: Nil = Enum(7)

    val Imm31To7 = io.DATAIN.Imm31To7
    val ImmCtrl  = io.CTRL.ImmCtrl
    val Imm      = WireDefault(0.U(64.W))


    switch(ImmCtrl){
        is(immI)    { Imm := Cat(Fill(64-12, Imm31To7(31-7)),  Imm31To7(31-7, 20-7))}
        is(immS)    { Imm := Cat(Fill(64-12, Imm31To7(31-7)),  Imm31To7(31-7, 25-7),  Imm31To7(11-7, 7-7))}
        is(immB)    { Imm := Cat(Fill(64-13, Imm31To7(31-7)),  Imm31To7(31-7),  Imm31To7(7-7), Imm31To7(30-7, 25-7), Imm31To7(11-7, 8-7), 0.U(1.W))}
        is(immU)    { Imm := Cat(Fill(64-32, Imm31To7(31-7)), Imm31To7(31-7, 12-7), 0.U(12.W))}
        is(immJ)    { Imm := Cat(Fill(64-21, Imm31To7(31-7)), Imm31To7(31-7), Imm31To7(19-7, 12-7), Imm31To7(20-7), Imm31To7(30-7, 21-7), 0.U(1.W))}
        is(immCSRI) { Imm := Cat(Fill(64-5, 0.U(1.W)), Imm31To7(19-7, 15-7))}
    }
    io.DATAOUT.Imm := Imm
}




object ImmSext extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(new ImmSext())
}
