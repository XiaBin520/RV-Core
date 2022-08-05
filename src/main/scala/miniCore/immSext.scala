package miniCore

import chisel3._
import chisel3.util._

class immSextIO extends Bundle{
  val i32To7  = Input(UInt(25.W))
  val immCtrl = Input(UInt(3.W))
  val imm64   = Output(UInt(64.W))
}



class immSext extends Module {
    val io = IO(new immSextIO())

    val immR :: immI :: immS :: immB :: immU :: immJ :: immCSRI :: Nil = Enum(7)

    val i32To7  = io.i32To7
    val immCtrl = io.immCtrl
    val out     = WireDefault(0.U(64.W))


    switch(immCtrl){
        is(immI) {
            out := Cat(Fill(64-12, i32To7(31-7)),  i32To7(31-7, 20-7))
        }
        is(immS) {
            out := Cat(Fill(64-12, i32To7(31-7)),  i32To7(31-7, 25-7),  i32To7(11-7, 7-7))
        }
        is(immB) {
            out := Cat(Fill(64-13, i32To7(31-7)),  i32To7(31-7),  i32To7(7-7), i32To7(30-7, 25-7), i32To7(11-7, 8-7), 0.U(1.W))
        }
        is(immU) {
            out := Cat(Fill(64-32, i32To7(31-7)), i32To7(31-7, 12-7), 0.U(12.W))
        }
        is(immJ) {
            out := Cat(Fill(64-21, i32To7(31-7)), i32To7(31-7), i32To7(19-7, 12-7), i32To7(20-7), i32To7(30-7, 21-7), 0.U(1.W))
        }
        is(immCSRI) {
            out := Cat(Fill(64-5, 0.U(1.W)), i32To7(19-7, 15-7))
        }
    }

    io.imm64 := out
}


object immSext extends App {
    (new chisel3.stage.ChiselStage).emitVerilog(new immSext())
}