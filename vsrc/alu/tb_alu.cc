#include<time.h>
#include<stdlib.h>
#include<stdio.h>
#include<iostream>
#include<verilated.h>
#include<verilated_vcd_c.h>

#include "Valu.h"
#include "Valu___024root.h"



int main(){

    Valu *dut = new Valu;

    dut->io_aluOP = 0;
    dut->io_aluSrc1 = 0;
    dut->io_aluSrc2 = 0;
    dut->eval();

    
    uint64_t op   = 0;
    uint64_t src1 = 0;
    uint64_t src2 = 0;
    uint64_t Mout = 0;
    uint64_t Cout = 0;

    srand(time(NULL));

    for(int64_t j = 0; j < 1000000 * 100; j++){
        src1 = (uint64_t)(rand());
        src2 = (uint64_t)(rand());
        if(j % 1000000 == 0) printf("src1 = %lu, src2 = %lu\n", src1, src2);

        for(int i = 0; i < 10; i++){
            src2 = (i == 7 || i == 8 || i == 9) ? src2 % 64 : src2;
            op = i;

            dut->io_aluOP = op;
            dut->io_aluSrc1 = src1;
            dut->io_aluSrc2 = src2;

            dut->eval();
            Mout = dut->io_aluOut;

            Cout = (i == 0) ? (src1 + src2) :
                   (i == 1) ? (src1 - src2) :
                   (i == 2) ? ((int64_t)(src1) < (int64_t)src2) :
                   (i == 3) ? ((uint64_t)(src1) < (uint64_t)src2) :
                   (i == 4) ? (src1 ^ src2) :
                   (i == 5) ? (src1 | src2) :
                   (i == 6) ? (src1 & src2) :
                   (i == 7) ? (src1 << src2) :
                   (i == 8) ? (src1 >> src2) :
                   (i == 9) ? ((int64_t)src1 >> src2) :
                   -1;

            if(Mout != Cout) {
                printf("\n>>>> ERROR <<<<\n");
                printf("op = %lu, src1 = %lu, src2 = %lu, Cout = %lu, but Mout = %lu\n\n", op, src1, src2, Cout, Mout);
                assert(0);
            }
        }
    }
    

    printf("\n>>>> SUCCESS <<<<\n\n");

    return 0;
}