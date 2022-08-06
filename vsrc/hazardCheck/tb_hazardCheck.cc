#include<time.h>
#include<stdlib.h>
#include<stdio.h>
#include<iostream>
#include<verilated.h>
#include<verilated_vcd_c.h>


#include "VhazardCheck.h"
#include "VhazardCheck___024root.h"


typedef int              int32;
typedef unsigned int     uint32;
typedef long long int    int64;
typedef unsigned long long int  uint64;



int main(){
    VhazardCheck *dut = new VhazardCheck;

    for(int i = 0; i < 100; i++){
      dut->reset = (i < 90) ? 1 : 0;
      dut->clock ^= 1;
      dut->eval();
    }

    dut->io_regWriteEn_EX = 1;
    dut-> io_regWriteNum_EX = 5;

    dut->io_regWriteEn_MEM = 1;
    dut->io_regWriteNum_MEM = 6;
    dut-> io_regWriteSrc_MEM = 2;

    dut->io_regRs1ReadEn_ID = 1;
    dut->io_regRs2ReadEn_ID = 1;
    dut->io_regRs1Num_ID = 5;
    dut->io_regRs2Num_ID = 6;
    dut->io_jumpEn_ID = 1;

    dut->eval();
    printf("EXID  = %d\n", dut->io_hazardEXIDValid);
    printf("MEMID = %d\n", dut->io_hazardMEMIDValid);
    printf("JUMP  = %d \n", dut->io_hazardJump);



    printf("\n>>>> SUCCESS <<<<\n\n");

    return 0;
}