#include<time.h>
#include<stdlib.h>
#include<stdio.h>
#include<iostream>
#include<verilated.h>
#include<verilated_vcd_c.h>


#include "VctrlCore.h"
#include "VctrlCore___024root.h"


typedef int              int32;
typedef unsigned int     uint32;
typedef long long int    int64;
typedef unsigned long long int  uint64;



int main(){
    VctrlCore *dut = new VctrlCore;

    for(int i = 0; i < 100; i++){
      dut->reset = (i < 90) ? 1 : 0;
      dut->clock ^= 1;
      dut->eval();
    }

    dut->io_wEnData = 0;
    dut->io_wCtrlData = 0;
    dut->io_wAddrData = 0;
    dut->io_wData = 0;
    dut->io_rEnData = 0;
    dut->io_rCtrlData = 0;
    dut->io_rAddrData = 0;
    dut->io_rAddrInstr = 0x12345678;
    dut->io_wFinish = 0;
    dut->io_rValidData = 0;
    dut->io_rData = 0;
    dut->io_rValidInstr = 0;
    dut->io_rInstr;

    // output        io_rEnIMem,
    // output [31:0] io_rAddrIMem,
    // output [31:0] io_instr,
    // output [63:0] io_data,
    dut->reset = 0;
    for(int i = 0; i < 5; i++){
      dut->clock ^=1;
      dut->eval();
      printf("io_rEnIMem = %d\n", dut->io_rEnIMem);
      printf("io_rAddrIMem = %x\n", dut->io_rAddrIMem);
      printf("io_instr = %x\n\n\n", dut->io_instr);
    }




    srand(time(NULL));
    


    printf("\n>>>> SUCCESS <<<<\n\n");

    return 0;
}