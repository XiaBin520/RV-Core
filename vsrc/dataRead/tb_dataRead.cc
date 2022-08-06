#include<time.h>
#include<stdlib.h>
#include<stdio.h>
#include<iostream>
#include<verilated.h>
#include<verilated_vcd_c.h>


#include "VdataRead.h"
#include "VdataRead___024root.h"


typedef int              int32;
typedef unsigned int     uint32;
typedef long long int    int64;
typedef unsigned long long int  uint64;



int main(){
    VdataRead *dut = new VdataRead;

    for(int i = 0; i < 100; i++){
      dut->reset = (i < 90) ? 1 : 0;
      dut->clock ^= 1;
      dut->eval();
    }

    dut->io_dataMem = 0x1234569;
    dut->io_dataAddrCore = 0x80000000;
    for(int i = 0; i < 18; i++){
      dut->io_dataReadEnCtrl = (i == 2);

      dut->io_dataValidMem = (i == 7);
      if(i > 12) {dut->io_dataMem = 0x233333;}

      printf("i = %d, memReadEn = %d, ", i , dut->io_dataReadEnMem);
      printf("addr = %x, size = %d, ", dut->io_dataAddrMem, dut->io_readDataByteMem);
      printf("finish = %d, ", dut->io_dataReadFinishCtrl);
      printf("data = %lx\n", dut->io_dataCore);
      
      dut->clock ^= 1;
      dut->eval();
    }
    srand(time(NULL));
    


    printf("\n>>>> SUCCESS <<<<\n\n");

    return 0;
}