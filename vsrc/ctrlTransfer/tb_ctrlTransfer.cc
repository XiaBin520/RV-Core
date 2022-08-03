#include<time.h>
#include<stdlib.h>
#include<stdio.h>
#include<iostream>
#include<verilated.h>
#include<verilated_vcd_c.h>


#include "VctrlTransfer.h"
#include "VctrlTransfer___024root.h"


typedef int                     int32;
typedef unsigned int            uint32;
typedef long long int           int64;
typedef unsigned long long int  uint64;


uint32 pcFunc(uint32 ctrlModle, uint32 prePC, uint64 imm, uint64 rs1Data, uint64 rs2Data){
  uint32 nextPC = prePC + 4;
  switch(ctrlModle){
    case 0:
      nextPC = nextPC;
      break;
    case 1:
      nextPC = (rs1Data == rs2Data) ? (prePC + (uint32)imm) : nextPC;
      break;
    case 2:
      nextPC = (rs1Data != rs2Data) ? (prePC + (uint32)imm) : nextPC;
      break;
    case 3:
      nextPC = ((int64)rs1Data < (int64)rs2Data) ? (prePC + (uint32)imm) : nextPC;
      break;
    case 4:
      nextPC = ((int64)rs1Data >= (int64)rs2Data) ? (prePC + (uint32)imm) : nextPC;
      break;
    case 5:
      nextPC = (rs1Data < rs2Data) ? (prePC + (uint32)imm) : nextPC;
      break;
    case 6:
      nextPC = (rs1Data >= rs2Data) ? (prePC + (uint32)imm) : nextPC;
      break;
    case 7:
      nextPC = prePC + (uint32)imm;
      break;
    case 8:
      nextPC = ((uint32)rs1Data + (uint32)imm) & (~1);
      break;
  }
  return nextPC;
}

int main(){
    VctrlTransfer *dut = new VctrlTransfer;
    srand(time(NULL));

    uint32 ctrlModle = 0;
    uint32 prePC     = 0;
    uint64 imm       = 0;
    uint64 rs1Data   = 0;
    uint64 rs2Data   = 0;

    uint64 CnextPC = 0;
    uint64 VnextPC = 0;

    uint64 times = 1000000;
    for(uint64 i = 0; i < times * 100; i++){
      ctrlModle = rand() % 9;
      prePC     = rand();
      imm       = rand();
      rs1Data   = rand();
      rs2Data   = rand();

      dut->io_ctrlModel = ctrlModle;
      dut->io_prePC     = prePC;
      dut->io_imm       = imm;
      dut->io_rs1Data   = rs1Data;
      dut->io_rs2Data   = rs2Data;
      dut->eval();
      VnextPC = dut->io_nextPC;

      CnextPC = pcFunc(ctrlModle, prePC, imm, rs1Data, rs2Data);

      if(VnextPC != CnextPC) {
        printf("\n>>>> ERROR:\n");
        printf("ctrlModle = %d, prePC = %d, imm = %lld, rs1Data = %lld, rs2Data = %lld\n", ctrlModle, prePC, imm, rs1Data, rs2Data);
        printf("CnextPC = %lld, VnextPC = %lld\n\n", CnextPC, VnextPC);
        assert(0);
      }
      if(i % times == 0) {printf("----Run times: %02lld\n", i / times);}
    }

    printf("\n>>>> SUCCESS <<<<\n\n");
    return 0;
}