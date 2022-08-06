#include<time.h>
#include<stdlib.h>
#include<stdio.h>
#include<iostream>
#include<verilated.h>
#include<verilated_vcd_c.h>


#include "VinstrRead.h"
#include "VinstrRead___024root.h"


typedef int              int32;
typedef unsigned int     uint32;
typedef long long int    int64;
typedef unsigned long long int  uint64;



int main(){
    VinstrRead *dut = new VinstrRead;

    for(int i = 0; i < 100; i++){
      dut->reset = (i < 90) ? 1 : 0;
      dut->clock ^= 1;
      dut->eval();
    }

    dut->io_instrAddrCore = 0x80000000;
    for(int i = 0; i < 15; i++){
      dut->io_instrReadEnCtrl = (i == 4) ? 1 : 0;
      dut->io_instrValidMem = (i == 9) ? 1 : 0;
      printf("i=%d, En = %d, addr = %x, size = %d, ", i, dut->io_instrReadEnMEM, dut->io_instrAddrMem, dut->io_readInstrByteMEM);
      printf("finish = %d\n", dut->io_instrReadFinishCtrl);
      dut->clock ^= 1;
      dut->eval();
    }
    srand(time(NULL));
    


    printf("\n>>>> SUCCESS <<<<\n\n");

    return 0;
}