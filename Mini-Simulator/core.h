typedef           long long int  int64;
typedef  unsigned long long int  uint64;
typedef           int            int32;
typedef  unsigned int            uint32;


#define  OPCODE_MASK  0b00000000000000000000000001111111
#define  RD_MASK      0b00000000000000000000111110000000
#define  FUNCT3_MASK  0b00000000000000000111000000000000
#define  RS1_MASK     0b00000000000011111000000000000000
#define  RS2_MASK     0b00000001111100000000000000000000
#define  FUNCT7_MASK  0b11111110000000000000000000000000




char *regName[] = {
    "zero", "ra", "sp", "gp", "tp", 
    "t0", "t1", "t2", "s0", "s1", 
    "a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7", 
    "s2", "s3", "s4", "s5", "s6", "s7", "s8", "s9","s10", "s11",
    "t3", "t4", "t5", "t6"
}

char Mem[1024 * 1024 * 10];

struct {
    uint32  pc;
    uint32  instr;
    uint64  regValue[32];    
} core;






enum INSTRTYPE
{
    NONE_INSTR = 0, 
    
    /*   RV32I  */
    LUI, AUIPC, 
    JAL, JALR,                                              // Jump tyep 
    BEQ, BNE, BLT, BGE, BLTU, BGEU,                         // Branch type 
    LB, LH, LW, LBU, LHU, SB, SH, SW,                       // Load and Store type
    ADDI, SLTI, SLTIU, XORI, ORI, ANDI, SLLI, SRLI, SRAI,   // Register-Immediate type
    ADD, SUB, SLL, SLT, SLTU, XOR, SRL, SRA, OR, AND,       // Register-Register type
    FENCE                                                   // FENCE
    ECALL, EBREAK                                           // ECALL and EBREAK
    /*   RV64I   */
    LWU, LD, SD                                          // LOAD and STORE
    ADDIW, SLLIW, SRLIW, SRAIW,                          // Register-Immediate type
    ADDW, SUBW, SLLW, SRLW, SRAW,                        // Register-Register type
    FENCE_I                                              // FENCE.I
    /*    Zicsr extension    */
    CSRRW, CSRRS, CSRRC, CSRRWI, CSRRSI, CSRRCI,
    /*    RV32M    */
    MUL, MULH, MULHSU, MULHU, DIV, DIVU, REM, REMU,
    /*    RV64M    */
    MULW, DIVW, DIVUW, REMW, REMUW,
}
