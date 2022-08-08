
import chisel3._
import chisel3.util._

/***************************************
*   Word ALU Module
***************************************/
class WordALU_DATAIN_IO extends Bundle{
  val Data1 = Input(UInt(64.W))
  val Data2 = Input(UInt(64.W))
}

class WordALU_CTRL_IO extends Bundle{
  val WordALUOP = Input(UInt(3.W))
}

class WordALU_DATAOUT_IO extends Bundle{
  val WordALUData = Output(UInt(64.W))
}




class WordALU_IO extends Bundle{
  val DATAIN  = new WordALU_DATAIN_IO()
  val CTRL    = new WordALU_CTRL_IO()
  val DATAOUT = new WordALU_DATAOUT_IO()
}




class WordALU  extends RawModule{
  val io = IO(new WordALU_IO())

  val opWNone :: opWAdd :: opWSub :: opWLShift :: opWURShift :: opWSRShift :: Nil = Enum(6)

  val Data1     = io.DATAIN.Data1
  val Data2     = io.DATAIN.Data2
  val WordALUOP = io.CTRL.WordALUOP
  
  val Data1W = io.DATAIN.Data1(31, 0)
  val shamt  = io.DATAIN.Data2(4,  0)

  val DataDW = WireDefault(0.U(64.W))
  val DataW  = WireDefault(0.U(32.W))

  switch(WordALUOP){
    is(opWAdd)     {DataDW :=  Data1 + Data2}
    is(opWSub)     {DataDW :=  Data1 - Data2}
    is(opWLShift)  {DataDW :=  Data1  << shamt}
    is(opWURShift) {DataW  :=  Data1W >> shamt}
    is(opWSRShift) {DataW  := (Data1W >> shamt).asUInt}
  }


  val WordALUData = WireDefault(0.U(64.W))

  switch(WordALUOP){
    is(opWAdd)     {WordALUData := Cat( Fill(32, DataDW(31)),  DataDW(31, 0) ) }
    is(opWSub)     {WordALUData := Cat( Fill(32, DataDW(31)),  DataDW(31, 0) ) }
    is(opWLShift)  {WordALUData := Cat( Fill(32, DataDW(31)),  DataDW(31, 0) ) }
    is(opWURShift) {WordALUData := Cat( Fill(32, DataW(31)),   DataW(31, 0)  ) }
    is(opWSRShift) {WordALUData := Cat( Fill(32, DataW(31)),   DataW(31, 0)  ) }
  }

  io.DATAOUT.WordALUData := WordALUData
}



object WordALU extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(new WordALU())
}