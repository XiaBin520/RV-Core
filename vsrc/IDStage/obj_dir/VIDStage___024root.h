// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See VIDStage.h for the primary calling header

#ifndef VERILATED_VIDSTAGE___024ROOT_H_
#define VERILATED_VIDSTAGE___024ROOT_H_  // guard

#include "verilated_heavy.h"

//==========

class VIDStage__Syms;
class VIDStage_VerilatedVcd;


//----------

VL_MODULE(VIDStage___024root) {
  public:

    // PORTS
    VL_IN8(clock,0,0);
    VL_IN8(reset,0,0);
    VL_OUT8(io_EX_A_ALUOP,3,0);
    VL_OUT8(io_EX_A_ALUSrc1Ctrl,2,0);
    VL_OUT8(io_EX_A_ALUSrc2Ctrl,2,0);
    VL_OUT8(io_EX_A_WordALUEn,0,0);
    VL_OUT8(io_EX_A_WordALUOP,2,0);
    VL_OUT8(io_EX_B_MEMREn,0,0);
    VL_OUT8(io_EX_B_MEMRCtrl,2,0);
    VL_OUT8(io_EX_B_MEMWEn,0,0);
    VL_OUT8(io_EX_B_MEMWCtrl,2,0);
    VL_OUT8(io_EX_C_RegWEn,0,0);
    VL_OUT8(io_EX_C_RegWSrc,1,0);
    VL_OUT8(io_EX_C_Rd,4,0);
    VL_OUT8(io_EX_D_Rs1REn,0,0);
    VL_OUT8(io_EX_D_Rs2REn,0,0);
    VL_OUT8(io_EX_D_Rs1,4,0);
    VL_OUT8(io_EX_D_Rs2,4,0);
    VL_IN8(io_WB_RegWEn,0,0);
    VL_IN8(io_WB_Rd,4,0);
    VL_OUT8(io_HAZARD_JumpEn,0,0);
    VL_IN8(io_DATAPATH_Rs1Ctrl,1,0);
    VL_IN8(io_DATAPATH_Rs2Ctrl,1,0);
    VL_IN(io_IF_Instr,31,0);
    VL_IN(io_IF_PC,31,0);
    VL_OUT(io_EX_E_PC,31,0);
    VL_OUT(io_PC_PC,31,0);
    VL_OUT64(io_EX_E_Imm,63,0);
    VL_OUT64(io_EX_E_RData1,63,0);
    VL_OUT64(io_EX_E_RData2,63,0);
    VL_IN64(io_WB_WData,63,0);
    VL_IN64(io_DATAPATH_MEMData,63,0);
    VL_IN64(io_DATAPATH_WBData,63,0);

    // LOCAL SIGNALS
    CData/*2:0*/ IDStage__DOT__Decoder_io_ID_ImmCtrl;
    CData/*3:0*/ IDStage__DOT__Decoder_io_ID_JumpCtrl;
    CData/*2:0*/ IDStage__DOT__Decoder__DOT___GEN_95;
    CData/*3:0*/ IDStage__DOT__Decoder__DOT___GEN_106;
    QData/*63:0*/ IDStage__DOT__ImmSext_io_imm64;
    QData/*63:0*/ IDStage__DOT__Transfer_io_ID_B_Rs1Data;
    QData/*63:0*/ IDStage__DOT__Transfer_io_ID_B_Rs2Data;
    QData/*63:0*/ IDStage__DOT__RegFile__DOT__gprFile_1;
    QData/*63:0*/ IDStage__DOT__RegFile__DOT__gprFile_2;
    QData/*63:0*/ IDStage__DOT__RegFile__DOT__gprFile_3;
    QData/*63:0*/ IDStage__DOT__RegFile__DOT__gprFile_4;
    QData/*63:0*/ IDStage__DOT__RegFile__DOT__gprFile_5;
    QData/*63:0*/ IDStage__DOT__RegFile__DOT__gprFile_6;
    QData/*63:0*/ IDStage__DOT__RegFile__DOT__gprFile_7;
    QData/*63:0*/ IDStage__DOT__RegFile__DOT__gprFile_8;
    QData/*63:0*/ IDStage__DOT__RegFile__DOT__gprFile_9;
    QData/*63:0*/ IDStage__DOT__RegFile__DOT__gprFile_10;
    QData/*63:0*/ IDStage__DOT__RegFile__DOT__gprFile_11;
    QData/*63:0*/ IDStage__DOT__RegFile__DOT__gprFile_12;
    QData/*63:0*/ IDStage__DOT__RegFile__DOT__gprFile_13;
    QData/*63:0*/ IDStage__DOT__RegFile__DOT__gprFile_14;
    QData/*63:0*/ IDStage__DOT__RegFile__DOT__gprFile_15;
    QData/*63:0*/ IDStage__DOT__RegFile__DOT__gprFile_16;
    QData/*63:0*/ IDStage__DOT__RegFile__DOT__gprFile_17;
    QData/*63:0*/ IDStage__DOT__RegFile__DOT__gprFile_18;
    QData/*63:0*/ IDStage__DOT__RegFile__DOT__gprFile_19;
    QData/*63:0*/ IDStage__DOT__RegFile__DOT__gprFile_20;
    QData/*63:0*/ IDStage__DOT__RegFile__DOT__gprFile_21;
    QData/*63:0*/ IDStage__DOT__RegFile__DOT__gprFile_22;
    QData/*63:0*/ IDStage__DOT__RegFile__DOT__gprFile_23;
    QData/*63:0*/ IDStage__DOT__RegFile__DOT__gprFile_24;
    QData/*63:0*/ IDStage__DOT__RegFile__DOT__gprFile_25;
    QData/*63:0*/ IDStage__DOT__RegFile__DOT__gprFile_26;
    QData/*63:0*/ IDStage__DOT__RegFile__DOT__gprFile_27;
    QData/*63:0*/ IDStage__DOT__RegFile__DOT__gprFile_28;
    QData/*63:0*/ IDStage__DOT__RegFile__DOT__gprFile_29;
    QData/*63:0*/ IDStage__DOT__RegFile__DOT__gprFile_30;
    QData/*63:0*/ IDStage__DOT__RegFile__DOT__gprFile_31;
    QData/*63:0*/ IDStage__DOT__RegFile__DOT___GEN_26;
    QData/*63:0*/ IDStage__DOT__RegFile__DOT___GEN_58;
    QData/*63:0*/ IDStage__DOT__Transfer__DOT___PCADDImm_T_1;

    // LOCAL VARIABLES
    CData/*0:0*/ __Vclklast__TOP__clock;
    VlUnpacked<CData/*0:0*/, 3> __Vm_traceActivity;

    // INTERNAL VARIABLES
    VIDStage__Syms* vlSymsp;  // Symbol table

    // CONSTRUCTORS
  private:
    VL_UNCOPYABLE(VIDStage___024root);  ///< Copying not allowed
  public:
    VIDStage___024root(const char* name);
    ~VIDStage___024root();

    // INTERNAL METHODS
    void __Vconfigure(VIDStage__Syms* symsp, bool first);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

//----------


#endif  // guard
