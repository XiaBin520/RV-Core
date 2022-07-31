#include <stdio.h>
#include "core.h"

void ifetch(core *CPU){
    uint32 addr = CPU->pc;
    CPU->instr = memRead(addr, 4);
}