#include<time.h>
#include<stdlib.h>
#include<stdio.h>
#include<iostream>
#include<verilated.h>
#include<verilated_vcd_c.h>


#include "VdataWrite.h"
#include "VdataWrite___024root.h"


typedef int              int32;
typedef unsigned int     uint32;
typedef long long int    int64;
typedef unsigned long long int  uint64;



int main(){
    VdataWrite *dut = new VdataWrite;

    for(int i = 0; i < 100; i++){
      dut->reset = (i < 90) ? 1 : 0;
      dut->clock ^= 1;
      dut->eval();
    }

    dut->io_dataCore = 0x1234569;
    dut->io_dataAddrCore = 0x80000000;
    for(int i = 0; i < 18; i++){
      
      dut->io_dataWriteEnCtrl = (i == 2);
      dut->io_dataWriteFinishMem = (i == 7);

      printf(" i = %d, En = %d, ", i, dut->io_dataWriteEnMem);
      printf("addr = %x, size = %d, ", dut->io_dataAddrMem, dut->io_writeDataByteMem);
      printf("Data = %lx, ", dut->io_dataMem);
      printf("finish = %d\n", dut->io_dataWriteFinishCtrl);

      dut->clock ^= 1;
      dut->eval();
    }
    srand(time(NULL));
    


    printf("\n>>>> SUCCESS <<<<\n\n");

    return 0;
}