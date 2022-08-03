#include<time.h>
#include<stdlib.h>
#include<stdio.h>
#include<iostream>
#include<verilated.h>
#include<verilated_vcd_c.h>


#include "VregFile.h"
#include "VregFile___024root.h"


typedef int                     int32;
typedef unsigned int            uint32;
typedef long long int           int64;
typedef unsigned long long int  uint64;



uint64 CregFile[32];

void regDiff(VregFile *dut){
  uint64 Cdata  = 0;
  uint64 Vdata1 = 0;
  uint64 Vdata2 = 0;

  for(int i = 0; i < 32; i++){
    dut->io_rs1 = i;
    dut->io_rs2 = i;
    dut->eval();
    Vdata1 = dut->io_rData1;
    Vdata2 = dut->io_rData2;
    Cdata = CregFile[i];

    if(Vdata1 != Cdata || Vdata2 != Cdata) {
      printf(">>>> ERROR:\n");
      printf("     i = %d, Vdata1 = %llx, Vdata2 = %llx, Cdata = %llx\n", i, Vdata1, Vdata2, Cdata);
      assert(0);
    }
  }
}

int main(){
    VregFile *dut = new VregFile;

    dut->eval();

    srand(time(NULL));
    uint32 Modle   = rand() % 4;
    uint32 regNum  = rand() % 32;
    uint64 wData   = rand();
    
    int64 times = 100000;
    for(int i = 0; i < times * 10; i++){
      dut->clock = 0;
      dut->eval();
      
      dut->io_rs1   = (uint32)rand() % 32;
      dut->io_rs2   = (uint32)rand() % 32;
      dut->io_rd    = (uint32)rand() % 32;
      dut->io_wData = (uint64)rand();
      if(rand() % 100 < 20){
        dut->io_wEn = 1;
        CregFile[dut->io_rd] = dut->io_wData;
        CregFile[0] = 0;
      }
      dut->eval();

      dut->clock = 1;
      dut->eval();

      dut->clock = 0;
      dut->io_wEn = 0;
      dut->eval();

      regDiff(dut);
    }
    printf("\n>>>> SUCCESS <<<<\n\n");

    return 0;
}