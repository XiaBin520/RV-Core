#include<time.h>
#include<stdlib.h>
#include<stdio.h>
#include<iostream>
#include<verilated.h>
#include<verilated_vcd_c.h>


#include "VIDStage.h"
#include "VIDStage___024root.h"


typedef int              int32;
typedef unsigned int     uint32;
typedef long long int    int64;
typedef unsigned long long int  uint64;



int main(){
    VIDStage *dut = new VIDStage;

    dut->reset = 1;
    for(int i = 0; i < 100; i++){
      dut->clock ^= 1;
      dut->eval();
    }
    dut->reset = 0;
    dut->clock = 0;

    dut->io_IF_Instr = 0;
    dut->io_IF_PC = 0xa0000000;
    dut->io_WB_RegWEn = 0;
    dut->io_WB_WData = 0;
    dut->io_WB_Rd = 0;
    dut->io_DATAPATH_Rs1Ctrl = 0;
    dut->io_DATAPATH_Rs2Ctrl = 0;
    dut->io_DATAPATH_MEMData = 0;
    dut->io_DATAPATH_WBData = 0;
    
  //                    b0000000??????????101?????0011011
    dut->io_IF_Instr = 0b00000000000100000101010010011011;
    for(int i = 0; i < 10; i++){
      printf("\n=========== i = %d =============\n", i);
      printf("ALU  ----> OP = %d, ", dut->io_EX_A_ALUOP);
      printf("Src1Ctrl = %d, ", dut->io_EX_A_ALUSrc1Ctrl);
      printf("Src2Ctrl = %d, ", dut->io_EX_A_ALUSrc2Ctrl);
      printf("WordALUEn = %d, ", dut->io_EX_A_WordALUEn);
      printf("WordALUOP = %d\n", dut->io_EX_A_WordALUOP);
      printf("MEM  ----> Read En = %d, ", dut->io_EX_B_MEMREn);
      printf("Read ctrl = %d, ", dut->io_EX_B_MEMRCtrl);
      printf("Write En = %d, ", dut->io_EX_B_MEMWEn);
      printf("Write ctrl = %d\n", dut->io_EX_B_MEMWCtrl);
      printf("REG  ----> Write En = %d, ", dut->io_EX_C_RegWEn);
      printf("Write Src = %d, ", dut->io_EX_C_RegWSrc);
      printf("Write Rd = %d\n", dut->io_EX_C_Rd);
      printf("Path ---->Read rs1 En = %d, ", dut->io_EX_D_Rs1REn);
      printf("Read Rs2 En%d, ", dut->io_EX_D_Rs2REn);
      printf("Rs1 Num = %d, ", dut->io_EX_D_Rs1);
      printf("Rs2 Num = %d\n", dut->io_EX_D_Rs2);
      printf("Data ----> PC = %x, ", dut->io_EX_E_PC);
      printf("IMM = %lx, ", dut->io_EX_E_Imm);
      printf("Data1 = %lx, ", dut->io_EX_E_RData1);
      printf("Data2 = %lx\n", dut->io_EX_E_RData2);
      printf("Jump ----> nextPC = %x, ", dut->io_PC_PC);
      printf("Jump En = %d, \n", dut->io_HAZARD_JumpEn);

      dut->clock ^= 1;
      dut->eval();
    }


    printf("\n>>>> SUCCESS <<<<\n\n");

    return 0;
}