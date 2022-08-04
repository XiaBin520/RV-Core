
#include "core.h"

uint64 immR(int32 instr){
  return 0;
}

uint64 immI(int32 instr){
  bool sign = (instr < 0) ? true : false;
  uint64 imm = 0;
  if(sign){
    imm = (instr >> 20) | 0xfffffffffffff000;
  }
  else {
    imm = (instr >> 20) & 0x0000000000000fff;
  }

  return imm;
}


uint64 immS(int32 instr){
  bool sign = (instr < 0) ? true : false;

  uint32 data1 = (instr >> 25) << 5;
  data1 = data1 & 0x0fe0;
  uint32 data2 = instr >> 7;
  data2 = data2 & 0x1f;
  uint32 data = data1 | data2;

  uint64 imm = 0;
  if(sign){
    imm = data | 0xfffffffffffff000;
  }
  else {
    imm = data & 0x0000000000000fff;
  }
  return imm;
}


uint64 immB(int32 instr){
  bool sign = (instr < 0) ? true : false;

  uint32 data1 = (instr >> 31) << 12;
  data1 = data1 & 0x1000;
  uint32 data2 = (instr >> 7) << 11;
  data2 = data2 & 0x0800;
  uint32 data3 = (instr >> 25) << 5;
  data3 = data3 & 0x07e0;
  uint32 data4 = (instr >> 8) << 1;
  data4 = data4 & 0x001e;
  uint32 data = data1 | data2 | data3 | data4;

  uint64 imm = 0;
  if(sign){
    imm = data | 0xffffffffffffe000;
  }
  else {
    imm = data & 0x0000000000001fff;
  }
  return imm;
}


uint64 immU(int32 instr){
  bool sign = (instr < 0) ? true : false;

  uint32 data = (instr >> 12) << 12;

  uint64 imm = 0;
  if(sign){
    imm = data | 0xffffffff00000000;
  }
  else{
    imm = data & 0x00000000ffffffff;
  }
  return imm;
}


uint64 immJ(int32 instr){
  bool sign = (instr < 0) ? true : false;

  uint32 data1 = (instr >> 31) << 20;
  data1 = data1 & 0x100000;
  uint32 data2 = (instr >> 12) << 12;
  data2 = data2 & 0x0ff000;
  uint32 data3 = (instr >> 20) << 11;
  data3 = data3 & 0x000800;
  uint32 data4 = (instr >> 21) << 1;
  data4 = data4 & 0x0007fe;

  uint32 data = data1 | data2 | data3 | data4;

  uint64 imm = 0;
  if(sign){
    imm = data | 0xffffffffffe00000;
  }
  else{
    imm = data & 0x00000000001fffff;
  }
  return imm;
}

uint64 immCSRI(int32 instr){
  uint32 data = instr >> 15;
  data = data & 0x01f;

  uint64 imm = (uint64)data;
  return imm;
}
