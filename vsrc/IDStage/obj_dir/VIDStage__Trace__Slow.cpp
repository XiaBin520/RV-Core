// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "VIDStage__Syms.h"


void VIDStage___024root__traceInitSub0(VIDStage___024root* vlSelf, VerilatedVcd* tracep) VL_ATTR_COLD;

void VIDStage___024root__traceInitTop(VIDStage___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VIDStage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    {
        VIDStage___024root__traceInitSub0(vlSelf, tracep);
    }
}

void VIDStage___024root__traceInitSub0(VIDStage___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VIDStage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    const int c = vlSymsp->__Vm_baseCode;
    if (false && tracep && c) {}  // Prevent unused
    // Body
    {
        tracep->declBit(c+75,"clock", false,-1);
        tracep->declBit(c+76,"reset", false,-1);
        tracep->declBus(c+77,"io_IF_Instr", false,-1, 31,0);
        tracep->declBus(c+78,"io_IF_PC", false,-1, 31,0);
        tracep->declBus(c+79,"io_EX_A_ALUOP", false,-1, 3,0);
        tracep->declBus(c+80,"io_EX_A_ALUSrc1Ctrl", false,-1, 2,0);
        tracep->declBus(c+81,"io_EX_A_ALUSrc2Ctrl", false,-1, 2,0);
        tracep->declBit(c+82,"io_EX_A_WordALUEn", false,-1);
        tracep->declBus(c+83,"io_EX_A_WordALUOP", false,-1, 2,0);
        tracep->declBit(c+84,"io_EX_B_MEMREn", false,-1);
        tracep->declBus(c+85,"io_EX_B_MEMRCtrl", false,-1, 2,0);
        tracep->declBit(c+86,"io_EX_B_MEMWEn", false,-1);
        tracep->declBus(c+87,"io_EX_B_MEMWCtrl", false,-1, 2,0);
        tracep->declBit(c+88,"io_EX_C_RegWEn", false,-1);
        tracep->declBus(c+89,"io_EX_C_RegWSrc", false,-1, 1,0);
        tracep->declBus(c+90,"io_EX_C_Rd", false,-1, 4,0);
        tracep->declBit(c+91,"io_EX_D_Rs1REn", false,-1);
        tracep->declBit(c+92,"io_EX_D_Rs2REn", false,-1);
        tracep->declBus(c+93,"io_EX_D_Rs1", false,-1, 4,0);
        tracep->declBus(c+94,"io_EX_D_Rs2", false,-1, 4,0);
        tracep->declBus(c+95,"io_EX_E_PC", false,-1, 31,0);
        tracep->declQuad(c+96,"io_EX_E_Imm", false,-1, 63,0);
        tracep->declQuad(c+98,"io_EX_E_RData1", false,-1, 63,0);
        tracep->declQuad(c+100,"io_EX_E_RData2", false,-1, 63,0);
        tracep->declBit(c+102,"io_WB_RegWEn", false,-1);
        tracep->declQuad(c+103,"io_WB_WData", false,-1, 63,0);
        tracep->declBus(c+105,"io_WB_Rd", false,-1, 4,0);
        tracep->declBus(c+106,"io_PC_PC", false,-1, 31,0);
        tracep->declBit(c+107,"io_HAZARD_JumpEn", false,-1);
        tracep->declBus(c+108,"io_DATAPATH_Rs1Ctrl", false,-1, 1,0);
        tracep->declBus(c+109,"io_DATAPATH_Rs2Ctrl", false,-1, 1,0);
        tracep->declQuad(c+110,"io_DATAPATH_MEMData", false,-1, 63,0);
        tracep->declQuad(c+112,"io_DATAPATH_WBData", false,-1, 63,0);
        tracep->declBit(c+75,"IDStage clock", false,-1);
        tracep->declBit(c+76,"IDStage reset", false,-1);
        tracep->declBus(c+77,"IDStage io_IF_Instr", false,-1, 31,0);
        tracep->declBus(c+78,"IDStage io_IF_PC", false,-1, 31,0);
        tracep->declBus(c+79,"IDStage io_EX_A_ALUOP", false,-1, 3,0);
        tracep->declBus(c+80,"IDStage io_EX_A_ALUSrc1Ctrl", false,-1, 2,0);
        tracep->declBus(c+81,"IDStage io_EX_A_ALUSrc2Ctrl", false,-1, 2,0);
        tracep->declBit(c+82,"IDStage io_EX_A_WordALUEn", false,-1);
        tracep->declBus(c+83,"IDStage io_EX_A_WordALUOP", false,-1, 2,0);
        tracep->declBit(c+84,"IDStage io_EX_B_MEMREn", false,-1);
        tracep->declBus(c+85,"IDStage io_EX_B_MEMRCtrl", false,-1, 2,0);
        tracep->declBit(c+86,"IDStage io_EX_B_MEMWEn", false,-1);
        tracep->declBus(c+87,"IDStage io_EX_B_MEMWCtrl", false,-1, 2,0);
        tracep->declBit(c+88,"IDStage io_EX_C_RegWEn", false,-1);
        tracep->declBus(c+89,"IDStage io_EX_C_RegWSrc", false,-1, 1,0);
        tracep->declBus(c+90,"IDStage io_EX_C_Rd", false,-1, 4,0);
        tracep->declBit(c+91,"IDStage io_EX_D_Rs1REn", false,-1);
        tracep->declBit(c+92,"IDStage io_EX_D_Rs2REn", false,-1);
        tracep->declBus(c+93,"IDStage io_EX_D_Rs1", false,-1, 4,0);
        tracep->declBus(c+94,"IDStage io_EX_D_Rs2", false,-1, 4,0);
        tracep->declBus(c+95,"IDStage io_EX_E_PC", false,-1, 31,0);
        tracep->declQuad(c+96,"IDStage io_EX_E_Imm", false,-1, 63,0);
        tracep->declQuad(c+98,"IDStage io_EX_E_RData1", false,-1, 63,0);
        tracep->declQuad(c+100,"IDStage io_EX_E_RData2", false,-1, 63,0);
        tracep->declBit(c+102,"IDStage io_WB_RegWEn", false,-1);
        tracep->declQuad(c+103,"IDStage io_WB_WData", false,-1, 63,0);
        tracep->declBus(c+105,"IDStage io_WB_Rd", false,-1, 4,0);
        tracep->declBus(c+106,"IDStage io_PC_PC", false,-1, 31,0);
        tracep->declBit(c+107,"IDStage io_HAZARD_JumpEn", false,-1);
        tracep->declBus(c+108,"IDStage io_DATAPATH_Rs1Ctrl", false,-1, 1,0);
        tracep->declBus(c+109,"IDStage io_DATAPATH_Rs2Ctrl", false,-1, 1,0);
        tracep->declQuad(c+110,"IDStage io_DATAPATH_MEMData", false,-1, 63,0);
        tracep->declQuad(c+112,"IDStage io_DATAPATH_WBData", false,-1, 63,0);
        tracep->declBus(c+77,"IDStage Decoder_io_IF_Instr", false,-1, 31,0);
        tracep->declBus(c+1,"IDStage Decoder_io_ID_ImmCtrl", false,-1, 2,0);
        tracep->declBus(c+2,"IDStage Decoder_io_ID_JumpCtrl", false,-1, 3,0);
        tracep->declBus(c+114,"IDStage Decoder_io_EX_A_ALUOP", false,-1, 3,0);
        tracep->declBus(c+115,"IDStage Decoder_io_EX_A_ALUSrc1Ctrl", false,-1, 2,0);
        tracep->declBus(c+116,"IDStage Decoder_io_EX_A_ALUSrc2Ctrl", false,-1, 2,0);
        tracep->declBit(c+117,"IDStage Decoder_io_EX_A_WordALUEn", false,-1);
        tracep->declBus(c+118,"IDStage Decoder_io_EX_A_WordALUOP", false,-1, 2,0);
        tracep->declBit(c+119,"IDStage Decoder_io_EX_B_MEMREn", false,-1);
        tracep->declBus(c+120,"IDStage Decoder_io_EX_B_MEMRCtrl", false,-1, 2,0);
        tracep->declBit(c+121,"IDStage Decoder_io_EX_B_MEMWEn", false,-1);
        tracep->declBus(c+122,"IDStage Decoder_io_EX_B_MEMWCtrl", false,-1, 2,0);
        tracep->declBit(c+123,"IDStage Decoder_io_EX_C_RegWEn", false,-1);
        tracep->declBus(c+124,"IDStage Decoder_io_EX_C_RegWSrc", false,-1, 1,0);
        tracep->declBus(c+125,"IDStage Decoder_io_EX_C_Rd", false,-1, 4,0);
        tracep->declBit(c+126,"IDStage Decoder_io_EX_D_Rs1REn", false,-1);
        tracep->declBit(c+127,"IDStage Decoder_io_EX_D_Rs2REn", false,-1);
        tracep->declBus(c+128,"IDStage Decoder_io_EX_D_Rs1", false,-1, 4,0);
        tracep->declBus(c+129,"IDStage Decoder_io_EX_D_Rs2", false,-1, 4,0);
        tracep->declBit(c+75,"IDStage RegFile_clock", false,-1);
        tracep->declBit(c+76,"IDStage RegFile_reset", false,-1);
        tracep->declBus(c+128,"IDStage RegFile_io_ID_Rs1", false,-1, 4,0);
        tracep->declBus(c+129,"IDStage RegFile_io_ID_Rs2", false,-1, 4,0);
        tracep->declBit(c+102,"IDStage RegFile_io_WB_RegWEn", false,-1);
        tracep->declQuad(c+103,"IDStage RegFile_io_WB_WData", false,-1, 63,0);
        tracep->declBus(c+105,"IDStage RegFile_io_WB_Rd", false,-1, 4,0);
        tracep->declQuad(c+130,"IDStage RegFile_io_EX_RData1", false,-1, 63,0);
        tracep->declQuad(c+132,"IDStage RegFile_io_EX_RData2", false,-1, 63,0);
        tracep->declBus(c+134,"IDStage ImmSext_io_i31To7", false,-1, 24,0);
        tracep->declBus(c+1,"IDStage ImmSext_io_immCtrl", false,-1, 2,0);
        tracep->declQuad(c+3,"IDStage ImmSext_io_imm64", false,-1, 63,0);
        tracep->declBus(c+2,"IDStage Transfer_io_ID_A_JumpCtrl", false,-1, 3,0);
        tracep->declBus(c+78,"IDStage Transfer_io_ID_B_PC", false,-1, 31,0);
        tracep->declQuad(c+3,"IDStage Transfer_io_ID_B_Imm", false,-1, 63,0);
        tracep->declQuad(c+5,"IDStage Transfer_io_ID_B_Rs1Data", false,-1, 63,0);
        tracep->declQuad(c+7,"IDStage Transfer_io_ID_B_Rs2Data", false,-1, 63,0);
        tracep->declBit(c+9,"IDStage Transfer_io_PC_JumpEn", false,-1);
        tracep->declBus(c+135,"IDStage Transfer_io_PC_PC", false,-1, 31,0);
        tracep->declBus(c+77,"IDStage Decoder io_IF_Instr", false,-1, 31,0);
        tracep->declBus(c+1,"IDStage Decoder io_ID_ImmCtrl", false,-1, 2,0);
        tracep->declBus(c+2,"IDStage Decoder io_ID_JumpCtrl", false,-1, 3,0);
        tracep->declBus(c+114,"IDStage Decoder io_EX_A_ALUOP", false,-1, 3,0);
        tracep->declBus(c+115,"IDStage Decoder io_EX_A_ALUSrc1Ctrl", false,-1, 2,0);
        tracep->declBus(c+116,"IDStage Decoder io_EX_A_ALUSrc2Ctrl", false,-1, 2,0);
        tracep->declBit(c+117,"IDStage Decoder io_EX_A_WordALUEn", false,-1);
        tracep->declBus(c+118,"IDStage Decoder io_EX_A_WordALUOP", false,-1, 2,0);
        tracep->declBit(c+119,"IDStage Decoder io_EX_B_MEMREn", false,-1);
        tracep->declBus(c+120,"IDStage Decoder io_EX_B_MEMRCtrl", false,-1, 2,0);
        tracep->declBit(c+121,"IDStage Decoder io_EX_B_MEMWEn", false,-1);
        tracep->declBus(c+122,"IDStage Decoder io_EX_B_MEMWCtrl", false,-1, 2,0);
        tracep->declBit(c+123,"IDStage Decoder io_EX_C_RegWEn", false,-1);
        tracep->declBus(c+124,"IDStage Decoder io_EX_C_RegWSrc", false,-1, 1,0);
        tracep->declBus(c+125,"IDStage Decoder io_EX_C_Rd", false,-1, 4,0);
        tracep->declBit(c+126,"IDStage Decoder io_EX_D_Rs1REn", false,-1);
        tracep->declBit(c+127,"IDStage Decoder io_EX_D_Rs2REn", false,-1);
        tracep->declBus(c+128,"IDStage Decoder io_EX_D_Rs1", false,-1, 4,0);
        tracep->declBus(c+129,"IDStage Decoder io_EX_D_Rs2", false,-1, 4,0);
        tracep->declBus(c+136,"IDStage Decoder Opcode", false,-1, 6,0);
        tracep->declBus(c+137,"IDStage Decoder Funct3", false,-1, 2,0);
        tracep->declBus(c+138,"IDStage Decoder Funct7", false,-1, 6,0);
        tracep->declBus(c+139,"IDStage Decoder ALUSrc1Ctrl", false,-1, 1,0);
        tracep->declBit(c+75,"IDStage RegFile clock", false,-1);
        tracep->declBit(c+76,"IDStage RegFile reset", false,-1);
        tracep->declBus(c+128,"IDStage RegFile io_ID_Rs1", false,-1, 4,0);
        tracep->declBus(c+129,"IDStage RegFile io_ID_Rs2", false,-1, 4,0);
        tracep->declBit(c+102,"IDStage RegFile io_WB_RegWEn", false,-1);
        tracep->declQuad(c+103,"IDStage RegFile io_WB_WData", false,-1, 63,0);
        tracep->declBus(c+105,"IDStage RegFile io_WB_Rd", false,-1, 4,0);
        tracep->declQuad(c+130,"IDStage RegFile io_EX_RData1", false,-1, 63,0);
        tracep->declQuad(c+132,"IDStage RegFile io_EX_RData2", false,-1, 63,0);
        tracep->declQuad(c+13,"IDStage RegFile gprFile_1", false,-1, 63,0);
        tracep->declQuad(c+15,"IDStage RegFile gprFile_2", false,-1, 63,0);
        tracep->declQuad(c+17,"IDStage RegFile gprFile_3", false,-1, 63,0);
        tracep->declQuad(c+19,"IDStage RegFile gprFile_4", false,-1, 63,0);
        tracep->declQuad(c+21,"IDStage RegFile gprFile_5", false,-1, 63,0);
        tracep->declQuad(c+23,"IDStage RegFile gprFile_6", false,-1, 63,0);
        tracep->declQuad(c+25,"IDStage RegFile gprFile_7", false,-1, 63,0);
        tracep->declQuad(c+27,"IDStage RegFile gprFile_8", false,-1, 63,0);
        tracep->declQuad(c+29,"IDStage RegFile gprFile_9", false,-1, 63,0);
        tracep->declQuad(c+31,"IDStage RegFile gprFile_10", false,-1, 63,0);
        tracep->declQuad(c+33,"IDStage RegFile gprFile_11", false,-1, 63,0);
        tracep->declQuad(c+35,"IDStage RegFile gprFile_12", false,-1, 63,0);
        tracep->declQuad(c+37,"IDStage RegFile gprFile_13", false,-1, 63,0);
        tracep->declQuad(c+39,"IDStage RegFile gprFile_14", false,-1, 63,0);
        tracep->declQuad(c+41,"IDStage RegFile gprFile_15", false,-1, 63,0);
        tracep->declQuad(c+43,"IDStage RegFile gprFile_16", false,-1, 63,0);
        tracep->declQuad(c+45,"IDStage RegFile gprFile_17", false,-1, 63,0);
        tracep->declQuad(c+47,"IDStage RegFile gprFile_18", false,-1, 63,0);
        tracep->declQuad(c+49,"IDStage RegFile gprFile_19", false,-1, 63,0);
        tracep->declQuad(c+51,"IDStage RegFile gprFile_20", false,-1, 63,0);
        tracep->declQuad(c+53,"IDStage RegFile gprFile_21", false,-1, 63,0);
        tracep->declQuad(c+55,"IDStage RegFile gprFile_22", false,-1, 63,0);
        tracep->declQuad(c+57,"IDStage RegFile gprFile_23", false,-1, 63,0);
        tracep->declQuad(c+59,"IDStage RegFile gprFile_24", false,-1, 63,0);
        tracep->declQuad(c+61,"IDStage RegFile gprFile_25", false,-1, 63,0);
        tracep->declQuad(c+63,"IDStage RegFile gprFile_26", false,-1, 63,0);
        tracep->declQuad(c+65,"IDStage RegFile gprFile_27", false,-1, 63,0);
        tracep->declQuad(c+67,"IDStage RegFile gprFile_28", false,-1, 63,0);
        tracep->declQuad(c+69,"IDStage RegFile gprFile_29", false,-1, 63,0);
        tracep->declQuad(c+71,"IDStage RegFile gprFile_30", false,-1, 63,0);
        tracep->declQuad(c+73,"IDStage RegFile gprFile_31", false,-1, 63,0);
        tracep->declBus(c+134,"IDStage ImmSext io_i31To7", false,-1, 24,0);
        tracep->declBus(c+1,"IDStage ImmSext io_immCtrl", false,-1, 2,0);
        tracep->declQuad(c+3,"IDStage ImmSext io_imm64", false,-1, 63,0);
        tracep->declBus(c+2,"IDStage Transfer io_ID_A_JumpCtrl", false,-1, 3,0);
        tracep->declBus(c+78,"IDStage Transfer io_ID_B_PC", false,-1, 31,0);
        tracep->declQuad(c+3,"IDStage Transfer io_ID_B_Imm", false,-1, 63,0);
        tracep->declQuad(c+5,"IDStage Transfer io_ID_B_Rs1Data", false,-1, 63,0);
        tracep->declQuad(c+7,"IDStage Transfer io_ID_B_Rs2Data", false,-1, 63,0);
        tracep->declBit(c+9,"IDStage Transfer io_PC_JumpEn", false,-1);
        tracep->declBus(c+135,"IDStage Transfer io_PC_PC", false,-1, 31,0);
        tracep->declBus(c+10,"IDStage Transfer Rs1Data32", false,-1, 31,0);
        tracep->declBus(c+140,"IDStage Transfer PCADD4", false,-1, 31,0);
        tracep->declBus(c+11,"IDStage Transfer PCADDImm", false,-1, 31,0);
        tracep->declBus(c+12,"IDStage Transfer Rs1ADDImm", false,-1, 31,0);
    }
}

void VIDStage___024root__traceFullTop0(void* voidSelf, VerilatedVcd* tracep) VL_ATTR_COLD;
void VIDStage___024root__traceChgTop0(void* voidSelf, VerilatedVcd* tracep);
void VIDStage___024root__traceCleanup(void* voidSelf, VerilatedVcd* /*unused*/);

void VIDStage___024root__traceRegister(VIDStage___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VIDStage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    {
        tracep->addFullCb(&VIDStage___024root__traceFullTop0, vlSelf);
        tracep->addChgCb(&VIDStage___024root__traceChgTop0, vlSelf);
        tracep->addCleanupCb(&VIDStage___024root__traceCleanup, vlSelf);
    }
}

void VIDStage___024root__traceFullSub0(VIDStage___024root* vlSelf, VerilatedVcd* tracep) VL_ATTR_COLD;

void VIDStage___024root__traceFullTop0(void* voidSelf, VerilatedVcd* tracep) {
    VIDStage___024root* const __restrict vlSelf = static_cast<VIDStage___024root*>(voidSelf);
    VIDStage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    {
        VIDStage___024root__traceFullSub0((&vlSymsp->TOP), tracep);
    }
}

void VIDStage___024root__traceFullSub0(VIDStage___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VIDStage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    vluint32_t* const oldp = tracep->oldp(vlSymsp->__Vm_baseCode);
    if (false && oldp) {}  // Prevent unused
    // Body
    {
        tracep->fullCData(oldp+1,(vlSelf->IDStage__DOT__Decoder_io_ID_ImmCtrl),3);
        tracep->fullCData(oldp+2,(vlSelf->IDStage__DOT__Decoder_io_ID_JumpCtrl),4);
        tracep->fullQData(oldp+3,(vlSelf->IDStage__DOT__ImmSext_io_imm64),64);
        tracep->fullQData(oldp+5,(vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs1Data),64);
        tracep->fullQData(oldp+7,(vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs2Data),64);
        tracep->fullBit(oldp+9,(((1U == (IData)(vlSelf->IDStage__DOT__Decoder_io_ID_JumpCtrl))
                                  ? (vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs1Data 
                                     == vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs2Data)
                                  : ((2U == (IData)(vlSelf->IDStage__DOT__Decoder_io_ID_JumpCtrl))
                                      ? (vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs1Data 
                                         != vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs2Data)
                                      : ((3U == (IData)(vlSelf->IDStage__DOT__Decoder_io_ID_JumpCtrl))
                                          ? VL_LTS_IQQ(1,64,64, vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs1Data, vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs2Data)
                                          : ((4U == (IData)(vlSelf->IDStage__DOT__Decoder_io_ID_JumpCtrl))
                                              ? VL_GTES_IQQ(1,64,64, vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs1Data, vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs2Data)
                                              : ((5U 
                                                  == (IData)(vlSelf->IDStage__DOT__Decoder_io_ID_JumpCtrl))
                                                  ? 
                                                 (vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs1Data 
                                                  < vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs2Data)
                                                  : 
                                                 ((6U 
                                                   == (IData)(vlSelf->IDStage__DOT__Decoder_io_ID_JumpCtrl))
                                                   ? 
                                                  (vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs1Data 
                                                   >= vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs2Data)
                                                   : 
                                                  ((7U 
                                                    == (IData)(vlSelf->IDStage__DOT__Decoder_io_ID_JumpCtrl)) 
                                                   | (8U 
                                                      == (IData)(vlSelf->IDStage__DOT__Decoder_io_ID_JumpCtrl)))))))))));
        tracep->fullIData(oldp+10,((IData)(vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs1Data)),32);
        tracep->fullIData(oldp+11,((IData)(vlSelf->IDStage__DOT__Transfer__DOT___PCADDImm_T_1)),32);
        tracep->fullIData(oldp+12,((0xfffffffeU & ((IData)(vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs1Data) 
                                                   + (IData)(vlSelf->IDStage__DOT__ImmSext_io_imm64)))),32);
        tracep->fullQData(oldp+13,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_1),64);
        tracep->fullQData(oldp+15,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_2),64);
        tracep->fullQData(oldp+17,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_3),64);
        tracep->fullQData(oldp+19,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_4),64);
        tracep->fullQData(oldp+21,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_5),64);
        tracep->fullQData(oldp+23,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_6),64);
        tracep->fullQData(oldp+25,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_7),64);
        tracep->fullQData(oldp+27,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_8),64);
        tracep->fullQData(oldp+29,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_9),64);
        tracep->fullQData(oldp+31,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_10),64);
        tracep->fullQData(oldp+33,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_11),64);
        tracep->fullQData(oldp+35,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_12),64);
        tracep->fullQData(oldp+37,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_13),64);
        tracep->fullQData(oldp+39,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_14),64);
        tracep->fullQData(oldp+41,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_15),64);
        tracep->fullQData(oldp+43,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_16),64);
        tracep->fullQData(oldp+45,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_17),64);
        tracep->fullQData(oldp+47,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_18),64);
        tracep->fullQData(oldp+49,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_19),64);
        tracep->fullQData(oldp+51,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_20),64);
        tracep->fullQData(oldp+53,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_21),64);
        tracep->fullQData(oldp+55,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_22),64);
        tracep->fullQData(oldp+57,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_23),64);
        tracep->fullQData(oldp+59,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_24),64);
        tracep->fullQData(oldp+61,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_25),64);
        tracep->fullQData(oldp+63,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_26),64);
        tracep->fullQData(oldp+65,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_27),64);
        tracep->fullQData(oldp+67,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_28),64);
        tracep->fullQData(oldp+69,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_29),64);
        tracep->fullQData(oldp+71,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_30),64);
        tracep->fullQData(oldp+73,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_31),64);
        tracep->fullBit(oldp+75,(vlSelf->clock));
        tracep->fullBit(oldp+76,(vlSelf->reset));
        tracep->fullIData(oldp+77,(vlSelf->io_IF_Instr),32);
        tracep->fullIData(oldp+78,(vlSelf->io_IF_PC),32);
        tracep->fullCData(oldp+79,(vlSelf->io_EX_A_ALUOP),4);
        tracep->fullCData(oldp+80,(vlSelf->io_EX_A_ALUSrc1Ctrl),3);
        tracep->fullCData(oldp+81,(vlSelf->io_EX_A_ALUSrc2Ctrl),3);
        tracep->fullBit(oldp+82,(vlSelf->io_EX_A_WordALUEn));
        tracep->fullCData(oldp+83,(vlSelf->io_EX_A_WordALUOP),3);
        tracep->fullBit(oldp+84,(vlSelf->io_EX_B_MEMREn));
        tracep->fullCData(oldp+85,(vlSelf->io_EX_B_MEMRCtrl),3);
        tracep->fullBit(oldp+86,(vlSelf->io_EX_B_MEMWEn));
        tracep->fullCData(oldp+87,(vlSelf->io_EX_B_MEMWCtrl),3);
        tracep->fullBit(oldp+88,(vlSelf->io_EX_C_RegWEn));
        tracep->fullCData(oldp+89,(vlSelf->io_EX_C_RegWSrc),2);
        tracep->fullCData(oldp+90,(vlSelf->io_EX_C_Rd),5);
        tracep->fullBit(oldp+91,(vlSelf->io_EX_D_Rs1REn));
        tracep->fullBit(oldp+92,(vlSelf->io_EX_D_Rs2REn));
        tracep->fullCData(oldp+93,(vlSelf->io_EX_D_Rs1),5);
        tracep->fullCData(oldp+94,(vlSelf->io_EX_D_Rs2),5);
        tracep->fullIData(oldp+95,(vlSelf->io_EX_E_PC),32);
        tracep->fullQData(oldp+96,(vlSelf->io_EX_E_Imm),64);
        tracep->fullQData(oldp+98,(vlSelf->io_EX_E_RData1),64);
        tracep->fullQData(oldp+100,(vlSelf->io_EX_E_RData2),64);
        tracep->fullBit(oldp+102,(vlSelf->io_WB_RegWEn));
        tracep->fullQData(oldp+103,(vlSelf->io_WB_WData),64);
        tracep->fullCData(oldp+105,(vlSelf->io_WB_Rd),5);
        tracep->fullIData(oldp+106,(vlSelf->io_PC_PC),32);
        tracep->fullBit(oldp+107,(vlSelf->io_HAZARD_JumpEn));
        tracep->fullCData(oldp+108,(vlSelf->io_DATAPATH_Rs1Ctrl),2);
        tracep->fullCData(oldp+109,(vlSelf->io_DATAPATH_Rs2Ctrl),2);
        tracep->fullQData(oldp+110,(vlSelf->io_DATAPATH_MEMData),64);
        tracep->fullQData(oldp+112,(vlSelf->io_DATAPATH_WBData),64);
        tracep->fullCData(oldp+114,(((0x37U == (0x7fU 
                                                & vlSelf->io_IF_Instr))
                                      ? 0U : ((0x17U 
                                               == (0x7fU 
                                                   & vlSelf->io_IF_Instr))
                                               ? 0U
                                               : ((0x63U 
                                                   == 
                                                   (0x7fU 
                                                    & vlSelf->io_IF_Instr))
                                                   ? 0U
                                                   : 
                                                  ((3U 
                                                    == 
                                                    (0x7fU 
                                                     & vlSelf->io_IF_Instr))
                                                    ? 0U
                                                    : 
                                                   ((0x23U 
                                                     == 
                                                     (0x7fU 
                                                      & vlSelf->io_IF_Instr))
                                                     ? 0U
                                                     : (IData)(vlSelf->IDStage__DOT__Decoder__DOT___GEN_106))))))),4);
        tracep->fullCData(oldp+115,(((0x37U == (0x7fU 
                                                & vlSelf->io_IF_Instr))
                                      ? 1U : ((0x17U 
                                               == (0x7fU 
                                                   & vlSelf->io_IF_Instr))
                                               ? 2U
                                               : ((0x63U 
                                                   == 
                                                   (0x7fU 
                                                    & vlSelf->io_IF_Instr))
                                                   ? 0U
                                                   : 
                                                  ((3U 
                                                    == 
                                                    (0x7fU 
                                                     & vlSelf->io_IF_Instr))
                                                    ? 3U
                                                    : 
                                                   ((0x23U 
                                                     == 
                                                     (0x7fU 
                                                      & vlSelf->io_IF_Instr))
                                                     ? 3U
                                                     : 
                                                    ((0x13U 
                                                      == 
                                                      (0x7fU 
                                                       & vlSelf->io_IF_Instr))
                                                      ? 3U
                                                      : 
                                                     ((0x1bU 
                                                       == 
                                                       (0x7fU 
                                                        & vlSelf->io_IF_Instr))
                                                       ? 3U
                                                       : 
                                                      ((0x33U 
                                                        == 
                                                        (0x7fU 
                                                         & vlSelf->io_IF_Instr))
                                                        ? 3U
                                                        : 
                                                       ((0x3bU 
                                                         == 
                                                         (0x7fU 
                                                          & vlSelf->io_IF_Instr))
                                                         ? 3U
                                                         : 
                                                        ((0x6fU 
                                                          == 
                                                          (0x7fU 
                                                           & vlSelf->io_IF_Instr))
                                                          ? 2U
                                                          : 
                                                         ((0x67U 
                                                           == 
                                                           (0x7fU 
                                                            & vlSelf->io_IF_Instr))
                                                           ? 2U
                                                           : 0U)))))))))))),3);
        tracep->fullCData(oldp+116,(((0x37U == (0x7fU 
                                                & vlSelf->io_IF_Instr))
                                      ? 1U : ((0x17U 
                                               == (0x7fU 
                                                   & vlSelf->io_IF_Instr))
                                               ? 1U
                                               : ((0x63U 
                                                   == 
                                                   (0x7fU 
                                                    & vlSelf->io_IF_Instr))
                                                   ? 0U
                                                   : 
                                                  ((3U 
                                                    == 
                                                    (0x7fU 
                                                     & vlSelf->io_IF_Instr))
                                                    ? 1U
                                                    : 
                                                   ((0x23U 
                                                     == 
                                                     (0x7fU 
                                                      & vlSelf->io_IF_Instr))
                                                     ? 1U
                                                     : 
                                                    ((0x13U 
                                                      == 
                                                      (0x7fU 
                                                       & vlSelf->io_IF_Instr))
                                                      ? 1U
                                                      : 
                                                     ((0x1bU 
                                                       == 
                                                       (0x7fU 
                                                        & vlSelf->io_IF_Instr))
                                                       ? 1U
                                                       : 
                                                      ((0x33U 
                                                        == 
                                                        (0x7fU 
                                                         & vlSelf->io_IF_Instr))
                                                        ? 2U
                                                        : 
                                                       ((0x3bU 
                                                         == 
                                                         (0x7fU 
                                                          & vlSelf->io_IF_Instr))
                                                         ? 2U
                                                         : 
                                                        ((0x6fU 
                                                          == 
                                                          (0x7fU 
                                                           & vlSelf->io_IF_Instr))
                                                          ? 3U
                                                          : 
                                                         ((0x67U 
                                                           == 
                                                           (0x7fU 
                                                            & vlSelf->io_IF_Instr))
                                                           ? 3U
                                                           : 0U)))))))))))),3);
        tracep->fullBit(oldp+117,(((0x37U != (0x7fU 
                                              & vlSelf->io_IF_Instr)) 
                                   & ((0x17U != (0x7fU 
                                                 & vlSelf->io_IF_Instr)) 
                                      & ((0x63U != 
                                          (0x7fU & vlSelf->io_IF_Instr)) 
                                         & ((3U != 
                                             (0x7fU 
                                              & vlSelf->io_IF_Instr)) 
                                            & ((0x23U 
                                                != 
                                                (0x7fU 
                                                 & vlSelf->io_IF_Instr)) 
                                               & ((0x13U 
                                                   != 
                                                   (0x7fU 
                                                    & vlSelf->io_IF_Instr)) 
                                                  & ((0x1bU 
                                                      != 
                                                      (0x7fU 
                                                       & vlSelf->io_IF_Instr)) 
                                                     & ((0x33U 
                                                         != 
                                                         (0x7fU 
                                                          & vlSelf->io_IF_Instr)) 
                                                        & (0x3bU 
                                                           == 
                                                           (0x7fU 
                                                            & vlSelf->io_IF_Instr))))))))))));
        tracep->fullCData(oldp+118,(((0x37U == (0x7fU 
                                                & vlSelf->io_IF_Instr))
                                      ? 0U : ((0x17U 
                                               == (0x7fU 
                                                   & vlSelf->io_IF_Instr))
                                               ? 0U
                                               : ((0x63U 
                                                   == 
                                                   (0x7fU 
                                                    & vlSelf->io_IF_Instr))
                                                   ? 0U
                                                   : 
                                                  ((3U 
                                                    == 
                                                    (0x7fU 
                                                     & vlSelf->io_IF_Instr))
                                                    ? 0U
                                                    : 
                                                   ((0x23U 
                                                     == 
                                                     (0x7fU 
                                                      & vlSelf->io_IF_Instr))
                                                     ? 0U
                                                     : 
                                                    ((0x13U 
                                                      == 
                                                      (0x7fU 
                                                       & vlSelf->io_IF_Instr))
                                                      ? 0U
                                                      : (IData)(vlSelf->IDStage__DOT__Decoder__DOT___GEN_95)))))))),3);
        tracep->fullBit(oldp+119,(((0x37U != (0x7fU 
                                              & vlSelf->io_IF_Instr)) 
                                   & ((0x17U != (0x7fU 
                                                 & vlSelf->io_IF_Instr)) 
                                      & ((0x63U != 
                                          (0x7fU & vlSelf->io_IF_Instr)) 
                                         & (3U == (0x7fU 
                                                   & vlSelf->io_IF_Instr)))))));
        tracep->fullCData(oldp+120,(((0x37U == (0x7fU 
                                                & vlSelf->io_IF_Instr))
                                      ? 0U : ((0x17U 
                                               == (0x7fU 
                                                   & vlSelf->io_IF_Instr))
                                               ? 0U
                                               : ((0x63U 
                                                   == 
                                                   (0x7fU 
                                                    & vlSelf->io_IF_Instr))
                                                   ? 0U
                                                   : 
                                                  ((3U 
                                                    == 
                                                    (0x7fU 
                                                     & vlSelf->io_IF_Instr))
                                                    ? 
                                                   ((0U 
                                                     == 
                                                     (7U 
                                                      & (vlSelf->io_IF_Instr 
                                                         >> 0xcU)))
                                                     ? 1U
                                                     : 
                                                    ((1U 
                                                      == 
                                                      (7U 
                                                       & (vlSelf->io_IF_Instr 
                                                          >> 0xcU)))
                                                      ? 2U
                                                      : 
                                                     ((2U 
                                                       == 
                                                       (7U 
                                                        & (vlSelf->io_IF_Instr 
                                                           >> 0xcU)))
                                                       ? 3U
                                                       : 
                                                      ((3U 
                                                        == 
                                                        (7U 
                                                         & (vlSelf->io_IF_Instr 
                                                            >> 0xcU)))
                                                        ? 7U
                                                        : 
                                                       ((4U 
                                                         == 
                                                         (7U 
                                                          & (vlSelf->io_IF_Instr 
                                                             >> 0xcU)))
                                                         ? 4U
                                                         : 
                                                        ((5U 
                                                          == 
                                                          (7U 
                                                           & (vlSelf->io_IF_Instr 
                                                              >> 0xcU)))
                                                          ? 5U
                                                          : 
                                                         ((6U 
                                                           == 
                                                           (7U 
                                                            & (vlSelf->io_IF_Instr 
                                                               >> 0xcU)))
                                                           ? 6U
                                                           : 0U)))))))
                                                    : 0U))))),3);
        tracep->fullBit(oldp+121,(((0x37U != (0x7fU 
                                              & vlSelf->io_IF_Instr)) 
                                   & ((0x17U != (0x7fU 
                                                 & vlSelf->io_IF_Instr)) 
                                      & ((0x63U != 
                                          (0x7fU & vlSelf->io_IF_Instr)) 
                                         & ((3U != 
                                             (0x7fU 
                                              & vlSelf->io_IF_Instr)) 
                                            & (0x23U 
                                               == (0x7fU 
                                                   & vlSelf->io_IF_Instr))))))));
        tracep->fullCData(oldp+122,(((0x37U == (0x7fU 
                                                & vlSelf->io_IF_Instr))
                                      ? 0U : ((0x17U 
                                               == (0x7fU 
                                                   & vlSelf->io_IF_Instr))
                                               ? 0U
                                               : ((0x63U 
                                                   == 
                                                   (0x7fU 
                                                    & vlSelf->io_IF_Instr))
                                                   ? 0U
                                                   : 
                                                  ((3U 
                                                    == 
                                                    (0x7fU 
                                                     & vlSelf->io_IF_Instr))
                                                    ? 0U
                                                    : 
                                                   ((0x23U 
                                                     == 
                                                     (0x7fU 
                                                      & vlSelf->io_IF_Instr))
                                                     ? 
                                                    ((0U 
                                                      == 
                                                      (7U 
                                                       & (vlSelf->io_IF_Instr 
                                                          >> 0xcU)))
                                                      ? 1U
                                                      : 
                                                     ((1U 
                                                       == 
                                                       (7U 
                                                        & (vlSelf->io_IF_Instr 
                                                           >> 0xcU)))
                                                       ? 2U
                                                       : 
                                                      ((2U 
                                                        == 
                                                        (7U 
                                                         & (vlSelf->io_IF_Instr 
                                                            >> 0xcU)))
                                                        ? 3U
                                                        : 
                                                       ((3U 
                                                         == 
                                                         (7U 
                                                          & (vlSelf->io_IF_Instr 
                                                             >> 0xcU)))
                                                         ? 4U
                                                         : 0U))))
                                                     : 0U)))))),3);
        tracep->fullBit(oldp+123,(((0x37U == (0x7fU 
                                              & vlSelf->io_IF_Instr)) 
                                   | ((0x17U == (0x7fU 
                                                 & vlSelf->io_IF_Instr)) 
                                      | ((0x63U != 
                                          (0x7fU & vlSelf->io_IF_Instr)) 
                                         & ((3U == 
                                             (0x7fU 
                                              & vlSelf->io_IF_Instr)) 
                                            | ((0x23U 
                                                != 
                                                (0x7fU 
                                                 & vlSelf->io_IF_Instr)) 
                                               & ((0x13U 
                                                   == 
                                                   (0x7fU 
                                                    & vlSelf->io_IF_Instr)) 
                                                  | ((0x1bU 
                                                      == 
                                                      (0x7fU 
                                                       & vlSelf->io_IF_Instr)) 
                                                     | ((0x33U 
                                                         == 
                                                         (0x7fU 
                                                          & vlSelf->io_IF_Instr)) 
                                                        | ((0x3bU 
                                                            == 
                                                            (0x7fU 
                                                             & vlSelf->io_IF_Instr)) 
                                                           | ((0x6fU 
                                                               == 
                                                               (0x7fU 
                                                                & vlSelf->io_IF_Instr)) 
                                                              | (0x67U 
                                                                 == 
                                                                 (0x7fU 
                                                                  & vlSelf->io_IF_Instr))))))))))))));
        tracep->fullCData(oldp+124,(((0x37U == (0x7fU 
                                                & vlSelf->io_IF_Instr))
                                      ? 1U : ((0x17U 
                                               == (0x7fU 
                                                   & vlSelf->io_IF_Instr))
                                               ? 1U
                                               : ((0x63U 
                                                   == 
                                                   (0x7fU 
                                                    & vlSelf->io_IF_Instr))
                                                   ? 0U
                                                   : 
                                                  ((3U 
                                                    == 
                                                    (0x7fU 
                                                     & vlSelf->io_IF_Instr))
                                                    ? 2U
                                                    : 
                                                   ((0x23U 
                                                     == 
                                                     (0x7fU 
                                                      & vlSelf->io_IF_Instr))
                                                     ? 0U
                                                     : 
                                                    ((0x13U 
                                                      == 
                                                      (0x7fU 
                                                       & vlSelf->io_IF_Instr))
                                                      ? 1U
                                                      : 
                                                     ((0x1bU 
                                                       == 
                                                       (0x7fU 
                                                        & vlSelf->io_IF_Instr))
                                                       ? 1U
                                                       : 
                                                      ((0x33U 
                                                        == 
                                                        (0x7fU 
                                                         & vlSelf->io_IF_Instr))
                                                        ? 1U
                                                        : 
                                                       ((0x3bU 
                                                         == 
                                                         (0x7fU 
                                                          & vlSelf->io_IF_Instr))
                                                         ? 1U
                                                         : 
                                                        ((0x6fU 
                                                          == 
                                                          (0x7fU 
                                                           & vlSelf->io_IF_Instr))
                                                          ? 1U
                                                          : 
                                                         ((0x67U 
                                                           == 
                                                           (0x7fU 
                                                            & vlSelf->io_IF_Instr))
                                                           ? 1U
                                                           : 0U)))))))))))),2);
        tracep->fullCData(oldp+125,((0x1fU & (vlSelf->io_IF_Instr 
                                              >> 7U))),5);
        tracep->fullBit(oldp+126,(((0x37U != (0x7fU 
                                              & vlSelf->io_IF_Instr)) 
                                   & ((0x17U != (0x7fU 
                                                 & vlSelf->io_IF_Instr)) 
                                      & ((0x63U == 
                                          (0x7fU & vlSelf->io_IF_Instr)) 
                                         | ((3U == 
                                             (0x7fU 
                                              & vlSelf->io_IF_Instr)) 
                                            | ((0x23U 
                                                == 
                                                (0x7fU 
                                                 & vlSelf->io_IF_Instr)) 
                                               | ((0x13U 
                                                   == 
                                                   (0x7fU 
                                                    & vlSelf->io_IF_Instr)) 
                                                  | ((0x1bU 
                                                      == 
                                                      (0x7fU 
                                                       & vlSelf->io_IF_Instr)) 
                                                     | ((0x33U 
                                                         == 
                                                         (0x7fU 
                                                          & vlSelf->io_IF_Instr)) 
                                                        | ((0x3bU 
                                                            == 
                                                            (0x7fU 
                                                             & vlSelf->io_IF_Instr)) 
                                                           | ((0x6fU 
                                                               != 
                                                               (0x7fU 
                                                                & vlSelf->io_IF_Instr)) 
                                                              & (0x67U 
                                                                 == 
                                                                 (0x7fU 
                                                                  & vlSelf->io_IF_Instr))))))))))))));
        tracep->fullBit(oldp+127,(((0x37U != (0x7fU 
                                              & vlSelf->io_IF_Instr)) 
                                   & ((0x17U != (0x7fU 
                                                 & vlSelf->io_IF_Instr)) 
                                      & ((0x63U == 
                                          (0x7fU & vlSelf->io_IF_Instr)) 
                                         | ((3U != 
                                             (0x7fU 
                                              & vlSelf->io_IF_Instr)) 
                                            & ((0x23U 
                                                != 
                                                (0x7fU 
                                                 & vlSelf->io_IF_Instr)) 
                                               & ((0x13U 
                                                   != 
                                                   (0x7fU 
                                                    & vlSelf->io_IF_Instr)) 
                                                  & ((0x1bU 
                                                      != 
                                                      (0x7fU 
                                                       & vlSelf->io_IF_Instr)) 
                                                     & ((0x33U 
                                                         == 
                                                         (0x7fU 
                                                          & vlSelf->io_IF_Instr)) 
                                                        | (0x3bU 
                                                           == 
                                                           (0x7fU 
                                                            & vlSelf->io_IF_Instr))))))))))));
        tracep->fullCData(oldp+128,((0x1fU & (vlSelf->io_IF_Instr 
                                              >> 0xfU))),5);
        tracep->fullCData(oldp+129,((0x1fU & (vlSelf->io_IF_Instr 
                                              >> 0x14U))),5);
        tracep->fullQData(oldp+130,((((((0x1fU & (vlSelf->io_IF_Instr 
                                                  >> 0xfU)) 
                                        == (IData)(vlSelf->io_WB_Rd)) 
                                       & (IData)(vlSelf->io_WB_RegWEn)) 
                                      & (0U != (IData)(vlSelf->io_WB_Rd)))
                                      ? vlSelf->io_WB_WData
                                      : ((0x1fU == 
                                          (0x1fU & 
                                           (vlSelf->io_IF_Instr 
                                            >> 0xfU)))
                                          ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_31
                                          : ((0x1eU 
                                              == (0x1fU 
                                                  & (vlSelf->io_IF_Instr 
                                                     >> 0xfU)))
                                              ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_30
                                              : ((0x1dU 
                                                  == 
                                                  (0x1fU 
                                                   & (vlSelf->io_IF_Instr 
                                                      >> 0xfU)))
                                                  ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_29
                                                  : 
                                                 ((0x1cU 
                                                   == 
                                                   (0x1fU 
                                                    & (vlSelf->io_IF_Instr 
                                                       >> 0xfU)))
                                                   ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_28
                                                   : 
                                                  ((0x1bU 
                                                    == 
                                                    (0x1fU 
                                                     & (vlSelf->io_IF_Instr 
                                                        >> 0xfU)))
                                                    ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_27
                                                    : vlSelf->IDStage__DOT__RegFile__DOT___GEN_26))))))),64);
        tracep->fullQData(oldp+132,((((((0x1fU & (vlSelf->io_IF_Instr 
                                                  >> 0x14U)) 
                                        == (IData)(vlSelf->io_WB_Rd)) 
                                       & (IData)(vlSelf->io_WB_RegWEn)) 
                                      & (0U != (IData)(vlSelf->io_WB_Rd)))
                                      ? vlSelf->io_WB_WData
                                      : ((0x1fU == 
                                          (0x1fU & 
                                           (vlSelf->io_IF_Instr 
                                            >> 0x14U)))
                                          ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_31
                                          : ((0x1eU 
                                              == (0x1fU 
                                                  & (vlSelf->io_IF_Instr 
                                                     >> 0x14U)))
                                              ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_30
                                              : ((0x1dU 
                                                  == 
                                                  (0x1fU 
                                                   & (vlSelf->io_IF_Instr 
                                                      >> 0x14U)))
                                                  ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_29
                                                  : 
                                                 ((0x1cU 
                                                   == 
                                                   (0x1fU 
                                                    & (vlSelf->io_IF_Instr 
                                                       >> 0x14U)))
                                                   ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_28
                                                   : 
                                                  ((0x1bU 
                                                    == 
                                                    (0x1fU 
                                                     & (vlSelf->io_IF_Instr 
                                                        >> 0x14U)))
                                                    ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_27
                                                    : vlSelf->IDStage__DOT__RegFile__DOT___GEN_58))))))),64);
        tracep->fullIData(oldp+134,((vlSelf->io_IF_Instr 
                                     >> 7U)),25);
        tracep->fullIData(oldp+135,(((1U == (IData)(vlSelf->IDStage__DOT__Decoder_io_ID_JumpCtrl))
                                      ? ((vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs1Data 
                                          == vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs2Data)
                                          ? (IData)(vlSelf->IDStage__DOT__Transfer__DOT___PCADDImm_T_1)
                                          : ((IData)(4U) 
                                             + vlSelf->io_IF_PC))
                                      : ((2U == (IData)(vlSelf->IDStage__DOT__Decoder_io_ID_JumpCtrl))
                                          ? ((vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs1Data 
                                              != vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs2Data)
                                              ? (IData)(vlSelf->IDStage__DOT__Transfer__DOT___PCADDImm_T_1)
                                              : ((IData)(4U) 
                                                 + vlSelf->io_IF_PC))
                                          : ((3U == (IData)(vlSelf->IDStage__DOT__Decoder_io_ID_JumpCtrl))
                                              ? (VL_LTS_IQQ(1,64,64, vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs1Data, vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs2Data)
                                                  ? (IData)(vlSelf->IDStage__DOT__Transfer__DOT___PCADDImm_T_1)
                                                  : 
                                                 ((IData)(4U) 
                                                  + vlSelf->io_IF_PC))
                                              : ((4U 
                                                  == (IData)(vlSelf->IDStage__DOT__Decoder_io_ID_JumpCtrl))
                                                  ? 
                                                 (VL_GTES_IQQ(1,64,64, vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs1Data, vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs2Data)
                                                   ? (IData)(vlSelf->IDStage__DOT__Transfer__DOT___PCADDImm_T_1)
                                                   : 
                                                  ((IData)(4U) 
                                                   + vlSelf->io_IF_PC))
                                                  : 
                                                 ((5U 
                                                   == (IData)(vlSelf->IDStage__DOT__Decoder_io_ID_JumpCtrl))
                                                   ? 
                                                  ((vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs1Data 
                                                    < vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs2Data)
                                                    ? (IData)(vlSelf->IDStage__DOT__Transfer__DOT___PCADDImm_T_1)
                                                    : 
                                                   ((IData)(4U) 
                                                    + vlSelf->io_IF_PC))
                                                   : 
                                                  ((6U 
                                                    == (IData)(vlSelf->IDStage__DOT__Decoder_io_ID_JumpCtrl))
                                                    ? 
                                                   ((vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs1Data 
                                                     >= vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs2Data)
                                                     ? (IData)(vlSelf->IDStage__DOT__Transfer__DOT___PCADDImm_T_1)
                                                     : 
                                                    ((IData)(4U) 
                                                     + vlSelf->io_IF_PC))
                                                    : 
                                                   ((7U 
                                                     == (IData)(vlSelf->IDStage__DOT__Decoder_io_ID_JumpCtrl))
                                                     ? (IData)(vlSelf->IDStage__DOT__Transfer__DOT___PCADDImm_T_1)
                                                     : 
                                                    ((8U 
                                                      == (IData)(vlSelf->IDStage__DOT__Decoder_io_ID_JumpCtrl))
                                                      ? 
                                                     (0xfffffffeU 
                                                      & ((IData)(vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs1Data) 
                                                         + (IData)(vlSelf->IDStage__DOT__ImmSext_io_imm64)))
                                                      : 
                                                     ((IData)(4U) 
                                                      + vlSelf->io_IF_PC)))))))))),32);
        tracep->fullCData(oldp+136,((0x7fU & vlSelf->io_IF_Instr)),7);
        tracep->fullCData(oldp+137,((7U & (vlSelf->io_IF_Instr 
                                           >> 0xcU))),3);
        tracep->fullCData(oldp+138,((vlSelf->io_IF_Instr 
                                     >> 0x19U)),7);
        tracep->fullCData(oldp+139,(((0x37U == (0x7fU 
                                                & vlSelf->io_IF_Instr))
                                      ? 1U : ((0x17U 
                                               == (0x7fU 
                                                   & vlSelf->io_IF_Instr))
                                               ? 2U
                                               : ((0x63U 
                                                   == 
                                                   (0x7fU 
                                                    & vlSelf->io_IF_Instr))
                                                   ? 0U
                                                   : 
                                                  ((3U 
                                                    == 
                                                    (0x7fU 
                                                     & vlSelf->io_IF_Instr))
                                                    ? 3U
                                                    : 
                                                   ((0x23U 
                                                     == 
                                                     (0x7fU 
                                                      & vlSelf->io_IF_Instr))
                                                     ? 3U
                                                     : 
                                                    ((0x13U 
                                                      == 
                                                      (0x7fU 
                                                       & vlSelf->io_IF_Instr))
                                                      ? 3U
                                                      : 
                                                     ((0x1bU 
                                                       == 
                                                       (0x7fU 
                                                        & vlSelf->io_IF_Instr))
                                                       ? 3U
                                                       : 
                                                      ((0x33U 
                                                        == 
                                                        (0x7fU 
                                                         & vlSelf->io_IF_Instr))
                                                        ? 3U
                                                        : 
                                                       ((0x3bU 
                                                         == 
                                                         (0x7fU 
                                                          & vlSelf->io_IF_Instr))
                                                         ? 3U
                                                         : 
                                                        ((0x6fU 
                                                          == 
                                                          (0x7fU 
                                                           & vlSelf->io_IF_Instr))
                                                          ? 2U
                                                          : 
                                                         ((0x67U 
                                                           == 
                                                           (0x7fU 
                                                            & vlSelf->io_IF_Instr))
                                                           ? 2U
                                                           : 0U)))))))))))),2);
        tracep->fullIData(oldp+140,(((IData)(4U) + vlSelf->io_IF_PC)),32);
    }
}
