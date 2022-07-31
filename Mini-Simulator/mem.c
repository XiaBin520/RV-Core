#include<stdio.h>
#include "core.h"


uint64 memRead(uint32 addr, uint32 sizeB){
    uint32 index = addr - 0x80000000;
    char data0 = Mem[index];
    char data1 = Mem[index + 1];
    char data2 = Mem[index + 2];
    char data3 = Mem[index + 3];
    char data4 = Mem[index + 4];
    char data5 = Mem[index + 5];
    char data6 = Mem[index + 6];
    char data7 = Mem[index + 7];
    
    uint64 data = (data7 << 56) | (data6 << 48) | (data5 << 40) | 
                  (data4 << 32) | (data3 << 24) | (data2 << 16) | 
                  (data1 << 8)  | data0;

    switch(sizeB){
        case 1: { return (data & 0x0ff); }
        case 2: { return (data & 0x0ffff); }
        case 4: { return (data & 0x0ffffffff); }
        case 8: { return data; }
        default: { assert(0);}
    }

    return 0;
}




void memWrite(uint32 addr, uint64 data, uint32 sizeB){
    uint32 index = addr - 0x80000000;
    for(int i = 0; i < sizeB; i++){
        Mem[index + i] = (char)(data >> (8 * i));
    }

    switch(sizeB){
        case 1: case 2: case 4: case 8: break;
        default: assert(0);
    }
}

