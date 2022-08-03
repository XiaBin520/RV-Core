#include<time.h>
#include<stdlib.h>
#include<stdio.h>
#include<iostream>
#include<verilated.h>
#include<verilated_vcd_c.h>


#include "VimmSext.h"
#include "VimmSext___024root.h"


typedef int                     int32;
typedef unsigned int            uint32;
typedef long long int           int64;
typedef unsigned long long int  uint64;


uint64 immR(int32 instr){
  return 0;
}

uint64 immI(int32 instr){
  bool sign = (instr < 0) ? true : false;
  uint64 imm = 0;
  if(sign){
    imm = (instr >> 20) | 0xfffffffffffff000;
  }
  else {
    imm = (instr >> 20) & 0x0000000000000fff;
  }

  return imm;
}


uint64 immS(int32 instr){
  bool sign = (instr < 0) ? true : false;

  uint32 data1 = (instr >> 25) << 5;
  data1 = data1 & 0x0fe0;
  uint32 data2 = instr >> 7;
  data2 = data2 & 0x1f;
  uint32 data = data1 | data2;

  uint64 imm = 0;
  if(sign){
    imm = data | 0xfffffffffffff000;
  }
  else {
    imm = data & 0x0000000000000fff;
  }
  return imm;
}


uint64 immB(int32 instr){
  bool sign = (instr < 0) ? true : false;

  uint32 data1 = (instr >> 31) << 12;
  data1 = data1 & 0x1000;
  uint32 data2 = (instr >> 7) << 11;
  data2 = data2 & 0x0800;
  uint32 data3 = (instr >> 25) << 5;
  data3 = data3 & 0x07e0;
  uint32 data4 = (instr >> 8) << 1;
  data4 = data4 & 0x001e;
  uint32 data = data1 | data2 | data3 | data4;

  uint64 imm = 0;
  if(sign){
    imm = data | 0xffffffffffffe000;
  }
  else {
    imm = data & 0x0000000000001fff;
  }
  return imm;
}


uint64 immU(int32 instr){
  bool sign = (instr < 0) ? true : false;

  uint32 data = (instr >> 12) << 12;

  uint64 imm = 0;
  if(sign){
    imm = data | 0xffffffff00000000;
  }
  else{
    imm = data & 0x00000000ffffffff;
  }
  return imm;
}


uint64 immJ(int32 instr){
  bool sign = (instr < 0) ? true : false;

  uint32 data1 = (instr >> 31) << 20;
  data1 = data1 & 0x100000;
  uint32 data2 = (instr >> 12) << 12;
  data2 = data2 & 0x0ff000;
  uint32 data3 = (instr >> 20) << 11;
  data3 = data3 & 0x000800;
  uint32 data4 = (instr >> 21) << 1;
  data4 = data4 & 0x0007fe;

  uint32 data = data1 | data2 | data3 | data4;

  uint64 imm = 0;
  if(sign){
    imm = data | 0xffffffffffe00000;
  }
  else{
    imm = data & 0x00000000001fffff;
  }
  return imm;
}

uint64 immCSRI(int32 instr){
  uint32 data = instr >> 15;
  data = data & 0x01f;

  uint64 imm = (uint64)data;
  return imm;
}




int main(){

    VimmSext *dut = new VimmSext;

    dut->io_i32To7  = 0;
    dut->io_immCtrl = 0;
    dut->eval();

    srand(time(NULL));
    uint64 Cimm = 0;
    uint64 Vimm = 0;

    int32 instr = 0;
    int32 Vinstr = 0;

    int32 times = 1000000;
    for(int j = 0; j < times * 100; j++){
      instr = rand();
      instr = (rand() % 2 == 0) ? (instr) : (-instr);
      Vinstr = instr >> 7;
      for(int i = 0; i < 7; i++){
        switch(i){
          case 0: Cimm = immR(instr); break;
          case 1: Cimm = immI(instr); break;
          case 2: Cimm = immS(instr); break;
          case 3: Cimm = immB(instr); break;
          case 4: Cimm = immU(instr); break;
          case 5: Cimm = immJ(instr); break;
          case 6: Cimm = immCSRI(instr); break;
          default: assert(0);
        }

        dut->io_i32To7 = Vinstr;
        dut->io_immCtrl = i;
        dut->eval();
        Vimm = dut->io_imm64;

        if(Cimm != Vimm) {assert(0);}
      }

      if(j % times == 0) printf("----Test %02d----\n", j / times);
    }
    
    printf("\n>>>> SUCCESS <<<<\n\n");

    return 0;
}