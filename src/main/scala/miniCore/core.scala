// package miniCore

// import chisel3._
// import chisel3.util._

// /***
//   memRValid --> read data from memory is valid
//   memRData  --> come from memory data
//   memWValid --> the finish signal memory write
//   memREn    --> memory read enable signal
//   memRAddr  --> memory read addr
//   memWEn    --> memory write enable signal
//   memWAddr  --> memory write address
//   memWData  --> memory write data
// ***/


// class coreIO extends Bundle{
//   val memRValid = Input(Bool())
//   val memRData  = Input(UInt(64.W))
//   val mmeWValid = Input(Bool())
//   val memREn    = Output(Bool())
//   val memRAddr  = Output(UInt(32.W))
//   val memWEn    = Output(Bool())
//   val memWAddr  = Output(UInt(32.W))
//   val memWData  = Output(UInt(64.W))
// }

// class core extends Module{
//   val io = IO(new coreIO())

//   val memRValid = io.memRValid
//   val memRData  = io.memRData
//   val memWValid = io.memWValid


// }



// object core extends App{
//   (new chisel3.stage.ChiselStage).emitVerilog(new core())
// }