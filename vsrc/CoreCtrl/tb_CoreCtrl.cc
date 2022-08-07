#include<time.h>
#include<stdlib.h>
#include<stdio.h>
#include<iostream>
#include<verilated.h>
#include<verilated_vcd_c.h>


#include "VCoreCtrl.h"
#include "VCoreCtrl___024root.h"


typedef int                     int32;
typedef unsigned int            uint32;
typedef long long int           int64;
typedef unsigned long long int  uint64;


int main(){
    VCoreCtrl *dut = new VCoreCtrl;
    srand(time(NULL));
    dut->reset = 1;
    for(int i = 0; i < 100; i++){
      dut->clock ^= 1;
      dut->eval();
    }
    dut->reset = 0;


    dut->clock=0;
    dut->reset=0;
    dut->io_CORE_A_IREAD_pc=0x80000000;
    dut->io_CORE_A_DREAD_Addr=0x88880000;
    dut->io_CORE_A_DREAD_Size=1;
    dut->io_CORE_A_DWRITE_Addr=0x99990000;
    dut->io_CORE_A_DWRITE_Size=0x2;
    dut->io_CORE_A_DWRITE_Data=0x555555;

    dut->io_CORE_A_WRCTRL_REn=0;
    dut->io_CORE_A_WRCTRL_WEn=1;
    
    dut->io_CORE_B_IDStage_Rs1En=1;
    dut->io_CORE_B_IDStage_Rs2En=0;
    dut->io_CORE_B_IDStage_Rs1=5;
    dut->io_CORE_B_IDStage_Rs2=0;
    dut->io_CORE_B_IDStage_jumpEn=0;
    dut->io_CORE_B_EXStage_En=1;
    dut->io_CORE_B_EXStage_Rd=5;
    dut->io_CORE_B_MEMStage_En=0;
    dut->io_CORE_B_MEMStage_Rd=0;
    dut->io_CORE_B_MEMStage_Src=0;

    dut->io_MEM_IREAD_B_DataValid=0;
    dut->io_MEM_IREAD_B_Data=0;

    dut->io_MEM_DREAD_DataValid=0;
    dut->io_MEM_DREAD_Data=0;
    
    dut->io_MEM_DWRITE_Done=0;


    for(int i = 0; i < 40; i++){

      dut->io_MEM_IREAD_B_DataValid= (i == 9) ? 1 : 0;
      dut->io_MEM_IREAD_B_Data= (i == 9 ) ? 0x123455 : 0;

      dut->io_MEM_DWRITE_Done= (i == 21) ? 1 : 0;


      printf("\n================ i = %d===========\n", i);
      printf("   instr = %x, ", dut->io_CORE_A_IREAD_instr);
      printf("   Read data = %lx\n", dut->io_CORE_A_DREAD_Data);
      printf("Hold       ----> pc = %d, ", dut->io_CORE_B_CORECTRL_HoldPC);
      printf("ifid = %d, ", dut->io_CORE_B_CORECTRL_HoldIFID);
      printf("idex = %d, ", dut->io_CORE_B_CORECTRL_HoldIDEX);
      printf("exmem = %d, ", dut->io_CORE_B_CORECTRL_HoldEXMEM);
      printf("memwb = %d, ", dut->io_CORE_B_CORECTRL_HoldMEMWB);
      printf("Flush ----> ifid= %d, ", dut->io_CORE_B_CORECTRL_FlushIFID);
      printf("idex = %d\n", dut->io_CORE_B_CORECTRL_FLUSHIDEX);
      printf("instr read ----> en = %d, ", dut->io_MEM_IREAD_A_En);
      printf("addr = %x, ", dut->io_MEM_IREAD_A_Addr);
      printf("size = %d\n", dut->io_MEM_IREAD_A_Size);
      printf("data read  ----> en = %d, ", dut->io_MEM_DREAD_En);
      printf("addr = %x,", dut->io_MEM_DREAD_Addr);
      printf("size = %d\n", dut->io_MEM_DREAD_Size);
      printf("data write ----> en = %d, ", dut->io_MEM_DWRITE_En);
      printf("addr = %x, ", dut->io_MEM_DWRITE_Addr);
      printf("size = %d, ", dut->io_MEM_DWRITE_Size);
      printf("data = %lx\n", dut->io_MEM_DWRITE_Data);

      dut->clock ^= 1;
      dut->eval();
    }

    printf("\n>>>> SUCCESS <<<<\n\n");

    return 0;
}