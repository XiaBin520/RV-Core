#include<time.h>
#include<stdlib.h>
#include<stdio.h>
#include<iostream>
#include<verilated.h>
#include<verilated_vcd_c.h>


#include "Vdecoder.h"
#include "Vdecoder___024root.h"


typedef int                     int32;
typedef unsigned int            uint32;
typedef long long int           int64;
typedef unsigned long long int  uint64;




int main(){
    Vdecoder *dut = new Vdecoder;

    dut->eval();
    srand(time(NULL));

    //             0b0100000??????????101?????0111011
    uint32 instr = 0b01000000100010010101001000111011;
    dut->io_instr = instr;
    dut->eval();

    printf("immCtrl     -->%d\n", dut->io_immCtrl);
    printf("ctrlModel   -->%d\n", dut->io_ctrlModel);
    printf("aluOP       -->%d\n", dut->io_aluOP);
    printf("aluSrc1Ctrl -->%d\n", dut->io_aluSrc1Ctrl);
    printf("aluSrc2Ctrl -->%d\n", dut->io_aluSrc2Ctrl);
    printf("aluWEn      -->%d\n", dut->io_aluWEn);
    printf("aluWOP      -->%d\n", dut->io_aluWOP);

    printf("\n>>>> SUCCESS <<<<\n\n");

    return 0;
}