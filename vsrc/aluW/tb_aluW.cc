#include<time.h>
#include<stdlib.h>
#include<stdio.h>
#include<iostream>
#include<verilated.h>
#include<verilated_vcd_c.h>


#include "ValuW.h"
#include "ValuW___024root.h"


typedef int                     int32;
typedef unsigned int            uint32;
typedef long long int           int64;
typedef unsigned long long int  uint64;


uint64 aluFunc(uint64 src1, uint64 src2, uint32 aluWOP){
  uint64 data1_64 = src1;
  uint32 data1_32 = (uint32)src1;
  uint64 data2_64 = src2;
  uint32 data2_5  = src2 & 0b011111;
  
  uint64 out32 = 0;
  uint64 out64 = 0;
  uint64 out   = 0;

  switch(aluWOP){
    case 0: 
      out32 = 0;
      break;
    case 1:
      out64 = data1_64 + data2_64;
      out32 = (uint32)out64;
      break;
    case 2:
      out64 = data1_64 - data2_64;
      out32 = (uint32)out64;
      break;
    case 3:
      out64 = data1_64 << data2_5;
      out32 = (uint32)out64;
      break;
    case 4:
      out32 = data1_32 >> data2_5;
      break;
    case 5:
      out32 = (int32)data1_32 >> data2_5;
      break;
  }

  out = ((int32)out32 < 0) ? (out32 | 0xffffffff00000000) : (out32 & 0x0ffffffff);
  return out;
}


int main(){
    ValuW *dut = new ValuW;

    dut->eval();

    srand(time(NULL));
    
    uint64 src1 = 0;
    uint64 src2 = 0;
    uint32 aluWOP = 0;

    uint64 Cout = 0;
    uint64 Vout = 0;

    uint64 times = 1000000;
    for(uint64 i = 0; i < times * 100; i++){
      src1 = rand();
      src2 = rand();
      aluWOP = rand() % 6;
      Cout = aluFunc(src1, src2, aluWOP);

      dut->io_src1 = src1;
      dut->io_src2 = src2;
      dut->io_aluWOP = aluWOP;
      dut->eval();
      Vout = dut->io_aluWOut;

      if(Cout != Vout) {assert(0);}
      if(i % times == 0) printf("--Test %llu--\n", i / times);
    }

    printf("\n>>>> SUCCESS <<<<\n\n");

    return 0;
}