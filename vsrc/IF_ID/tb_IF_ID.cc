#include<time.h>
#include<stdlib.h>
#include<stdio.h>
#include<iostream>
#include<verilated.h>
#include<verilated_vcd_c.h>


#include "VIF_ID.h"
#include "VIF_ID___024root.h"


typedef int                     int32;
typedef unsigned int            uint32;
typedef long long int           int64;
typedef unsigned long long int  uint64;






int main(){
    VIF_ID *dut = new VIF_ID;

    dut->clock = 0;
    dut->reset = 1;
    dut->eval();
    dut->clock = 1;
    dut->eval();
    dut->reset = 0;
    dut->clock = 1;
    dut->eval();
    srand(time(NULL));


    uint32 instr = 0x00000013;
    uint32 pc    = 0x80000000;
    bool   flush = false;
    bool   hold  = false;

    uint32 Cinstr = 0;
    uint32 Cpc    = 0;
    uint32 Vinstr = 0;
    uint32 Vpc    = 0;

    uint64 times = 10000000;
    for(uint64 i = 0; i < times * 100; i++){
      flush = (rand() % 100 < 10);
      hold  = (rand() % 100 < 10);
      instr = rand();
      pc    = rand();
      if(flush){
        Cinstr = 0x00000013;
        Cpc    = 0x80000000;
      }
      else if(hold){
        Cinstr = Cinstr;
        Cpc    = Cpc;
      }
      else{
        Cinstr = instr;
        Cpc    = pc;
      }

      dut->io_flush   = flush;
      dut->io_hold    = hold;
      dut->io_inInstr = instr;
      dut->io_inPC    = pc;
      dut->clock = 0;
      dut->eval();
      dut->clock = 1;
      dut->eval();
      dut->clock = 0;
      dut->eval();


      Vinstr = dut->io_outInstr;
      Vpc    = dut->io_outPC;
      if(Vinstr != Cinstr || Vpc != Cpc) {assert(0);}

      if(i % times == 0) printf("----Test %llu----\n", i / times);
    }
    

    printf("\n>>>> SUCCESS <<<<\n\n");

    return 0;
}