#include <stdio.h>
#include "core.h"


uint32 decoder(core *CPU){
    uint32 instr = CPU->instr;
    uint32 opcode = (instr & OPCODE_MASk);
    uint32 funct3 = (instr & FUNCT3_MASK) >> 12;
    uint32 funct7 = (instr & FUNCT7_MASK) >> 25;

    switch(opcode){
        case 0b0110111: 
            return LUI;
        case 0b0010111: 
            return AUIPC;
        case 0b1101111: 
            return JAL;
        case 0b1100111:
            return (funct3 == 0b000) ? JALR : 
                                       NONE_INSTR;
        case 0b1100011:
            return (funct3 == 0b000) ? BEQ :
                   (funct3 == 0b001) ? BNE :
                   (funct3 == 0b100) ? BLT :
                   (funct3 == 0b101) ? BGE :
                   (funct3 == 0b110) ? BLTU :
                   (funct3 == 0b111) ? BGEU :
                                       NONE_INSTR;
        case 0b0000011:
            return (funct3 == 0b000) ? LB :
                   (funct3 == 0b001) ? LH :
                   (funct3 == 0b010) ? LW :
                   (funct3 == 0b100) ? LBU :
                   (funct3 == 0b101) ? LHU :
                   (funct3 == 0b110) ? LWU :
                   (funct3 == 0b011) ? LD :
                                       NONE_INSTR;
        case 0b0100011:
            return (funct3 == 0b000) ? SB :
                   (funct3 == 0b001) ? SH :
                   (funct3 == 0b010) ? SW :
                   (funct3 == 0b011) ? SD :
                                       NONE_INSTR;

        case 0b0010011:
            return (funct3 == 0b000) ? ADDI :
                   (funct3 == 0b010) ? SLTI :
                   (funct3 == 0b011) ? SLTIU :
                   (funct3 == 0b100) ? XORI :
                   (funct3 == 0b110) ? ORI :
                   (funct3 == 0b111) ? ANDI :
                   (funct3 == 0b001 && (funct7 >> 1) == 0b000000) ? SLLI :
                   (funct3 == 0b101 && (funct7 >> 1) == 0b000000) ? SRLI :
                   (funct3 == 0b101 && (funct7 >> 1) == 0b010000) ? SLAI :
                                       NONE_INSTR;
                   
        case 0b0110011:
            return (funct3 == 0b000 && funct7 == 0b0000000) ? ADD :
                   (funct3 == 0b000 && funct7 == 0b0100000) ? SUB :
                   (funct3 == 0b001 && funct7 == 0b0000000) ? SLL :
                   (funct3 == 0b010 && funct7 == 0b0000000) ? SLT :
                   (funct3 == 0b011 && funct7 == 0b0000000) ? SLTU :
                   (funct3 == 0b100 && funct7 == 0b0000000) ? XOR :
                   (funct3 == 0b101 && funct7 == 0b0000000) ? SRL :
                   (funct3 == 0b101 && funct7 == 0b0100000) ? SRA :
                   (funct3 == 0b110 && funct7 == 0b0000000) ? OR :
                   (funct3 == 0b111 && funct7 == 0b0000000) ? AND :
                   (funct3 == 0b000 && funct7 == 0b0000001) ? MUL :
                   (funct3 == 0b001 && funct7 == 0b0000001) ? MULH :
                   (funct3 == 0b010 && funct7 == 0b0000001) ? MULHSU :
                   (funct3 == 0b011 && funct7 == 0b0000001) ? MULHU :
                   (funct3 == 0b100 && funct7 == 0b0000001) ? DIV :
                   (funct3 == 0b101 && funct7 == 0b0000001) ? DIVU :
                   (funct3 == 0b110 && funct7 == 0b0000001) ? REM :
                   (funct3 == 0b111 && funct7 == 0b0000001) ? REMU :
                                                              NONE_INSTR;
        case 0b0001111:
            return (funct3 == 0b000) ? FENCE :
                   (funct3 == 0b001) ? FENCE_I :
                                       NONE_INSTR;
        case 0b1110011:
            return (instr == 0b00000000000000000000000001110011) ? ECALL :
                   (instr == 0b00000000000100000000000001110011) ? EBREAK :
                   (funct3 == 0b001) ? CSRRW :
                   (funct3 == 0b010) ? CSRRS :
                   (funct3 == 0b011) ? CSRRC :
                   (funct3 == 0b101) ? CSRRWI :
                   (funct3 == 0b110) ? CSRRSI :
                   (funct3 == 0b111) ? CSRRCI :
                                       NONE_INSTR;
        case 0b0011011:
            return (funct3 == 0b000) ? ADDIW :
                   (funct3 == 0b001 && funct7 == 0b0000000) ? SLLIW :
                   (funct3 == 0b101 && funct7 == 0b0000000) ? SRLIW :
                   (funct3 == 0b101 && funct7 == 0b0100000) ? SRAIW :
                                                              NONE_INSTR;
        case 0b0111011:
            return (funct3 == 0b000 && funct7 == 0b0000000) ? ADDW :
                   (funct3 == 0b000 && funct7 == 0b0100000) ? SUBW :
                   (funct3 == 0b001 && funct7 == 0b0000000) ? SLLW :
                   (funct3 == 0b101 && funct7 == 0b0000000) ? SRLW :
                   (funct3 == 0b101 && funct7 == 0b0100000) ? SRAW :
                   (funct3 == 0b000 && funct7 == 0b0000001) ? MULW :
                   (funct3 == 0b100 && funct7 == 0b0000001) ? DIVW :
                   (funct3 == 0b101 && funct7 == 0b0000001) ? DIVUW :
                   (funct3 == 0b110 && funct7 == 0b0000001) ? REMW :
                   (funct3 == 0b111 && funct7 == 0b0000001) ? REMUW :
                                                              NONE_INSTR;
        default: assert(0);
    }

    return NONE_INSTR;
}