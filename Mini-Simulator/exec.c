#include <stdio.h>
#include "core.h"





void exec(core *CPU, uint32 instrTYPE){
    uint32 rd     = (CPU->instr & RD_MASK)  >> 7;
    uint32 rs1    = (CPU->instr & RS1_MASK) >> 15;
    uint32 rs2    = (CPU->instr & RS2_MASK) >> 20;
    uint32 funct7 = (CPU->instr & FUNCT7_MASK) >> 25;

}