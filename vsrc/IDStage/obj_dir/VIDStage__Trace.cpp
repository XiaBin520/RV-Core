// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "VIDStage__Syms.h"


void VIDStage___024root__traceChgSub0(VIDStage___024root* vlSelf, VerilatedVcd* tracep);

void VIDStage___024root__traceChgTop0(void* voidSelf, VerilatedVcd* tracep) {
    VIDStage___024root* const __restrict vlSelf = static_cast<VIDStage___024root*>(voidSelf);
    VIDStage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (VL_UNLIKELY(!vlSymsp->__Vm_activity)) return;
    // Body
    {
        VIDStage___024root__traceChgSub0((&vlSymsp->TOP), tracep);
    }
}

void VIDStage___024root__traceChgSub0(VIDStage___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VIDStage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    vluint32_t* const oldp = tracep->oldp(vlSymsp->__Vm_baseCode + 1);
    if (false && oldp) {}  // Prevent unused
    // Body
    {
        if (VL_UNLIKELY(vlSelf->__Vm_traceActivity[1U])) {
            tracep->chgCData(oldp+0,(vlSelf->IDStage__DOT__Decoder_io_ID_ImmCtrl),3);
            tracep->chgCData(oldp+1,(vlSelf->IDStage__DOT__Decoder_io_ID_JumpCtrl),4);
            tracep->chgQData(oldp+2,(vlSelf->IDStage__DOT__ImmSext_io_imm64),64);
            tracep->chgQData(oldp+4,(vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs1Data),64);
            tracep->chgQData(oldp+6,(vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs2Data),64);
            tracep->chgBit(oldp+8,(((1U == (IData)(vlSelf->IDStage__DOT__Decoder_io_ID_JumpCtrl))
                                     ? (vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs1Data 
                                        == vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs2Data)
                                     : ((2U == (IData)(vlSelf->IDStage__DOT__Decoder_io_ID_JumpCtrl))
                                         ? (vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs1Data 
                                            != vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs2Data)
                                         : ((3U == (IData)(vlSelf->IDStage__DOT__Decoder_io_ID_JumpCtrl))
                                             ? VL_LTS_IQQ(1,64,64, vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs1Data, vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs2Data)
                                             : ((4U 
                                                 == (IData)(vlSelf->IDStage__DOT__Decoder_io_ID_JumpCtrl))
                                                 ? 
                                                VL_GTES_IQQ(1,64,64, vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs1Data, vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs2Data)
                                                 : 
                                                ((5U 
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
            tracep->chgIData(oldp+9,((IData)(vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs1Data)),32);
            tracep->chgIData(oldp+10,((IData)(vlSelf->IDStage__DOT__Transfer__DOT___PCADDImm_T_1)),32);
            tracep->chgIData(oldp+11,((0xfffffffeU 
                                       & ((IData)(vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs1Data) 
                                          + (IData)(vlSelf->IDStage__DOT__ImmSext_io_imm64)))),32);
        }
        if (VL_UNLIKELY(vlSelf->__Vm_traceActivity[2U])) {
            tracep->chgQData(oldp+12,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_1),64);
            tracep->chgQData(oldp+14,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_2),64);
            tracep->chgQData(oldp+16,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_3),64);
            tracep->chgQData(oldp+18,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_4),64);
            tracep->chgQData(oldp+20,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_5),64);
            tracep->chgQData(oldp+22,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_6),64);
            tracep->chgQData(oldp+24,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_7),64);
            tracep->chgQData(oldp+26,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_8),64);
            tracep->chgQData(oldp+28,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_9),64);
            tracep->chgQData(oldp+30,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_10),64);
            tracep->chgQData(oldp+32,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_11),64);
            tracep->chgQData(oldp+34,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_12),64);
            tracep->chgQData(oldp+36,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_13),64);
            tracep->chgQData(oldp+38,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_14),64);
            tracep->chgQData(oldp+40,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_15),64);
            tracep->chgQData(oldp+42,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_16),64);
            tracep->chgQData(oldp+44,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_17),64);
            tracep->chgQData(oldp+46,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_18),64);
            tracep->chgQData(oldp+48,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_19),64);
            tracep->chgQData(oldp+50,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_20),64);
            tracep->chgQData(oldp+52,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_21),64);
            tracep->chgQData(oldp+54,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_22),64);
            tracep->chgQData(oldp+56,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_23),64);
            tracep->chgQData(oldp+58,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_24),64);
            tracep->chgQData(oldp+60,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_25),64);
            tracep->chgQData(oldp+62,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_26),64);
            tracep->chgQData(oldp+64,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_27),64);
            tracep->chgQData(oldp+66,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_28),64);
            tracep->chgQData(oldp+68,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_29),64);
            tracep->chgQData(oldp+70,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_30),64);
            tracep->chgQData(oldp+72,(vlSelf->IDStage__DOT__RegFile__DOT__gprFile_31),64);
        }
        tracep->chgBit(oldp+74,(vlSelf->clock));
        tracep->chgBit(oldp+75,(vlSelf->reset));
        tracep->chgIData(oldp+76,(vlSelf->io_IF_Instr),32);
        tracep->chgIData(oldp+77,(vlSelf->io_IF_PC),32);
        tracep->chgCData(oldp+78,(vlSelf->io_EX_A_ALUOP),4);
        tracep->chgCData(oldp+79,(vlSelf->io_EX_A_ALUSrc1Ctrl),3);
        tracep->chgCData(oldp+80,(vlSelf->io_EX_A_ALUSrc2Ctrl),3);
        tracep->chgBit(oldp+81,(vlSelf->io_EX_A_WordALUEn));
        tracep->chgCData(oldp+82,(vlSelf->io_EX_A_WordALUOP),3);
        tracep->chgBit(oldp+83,(vlSelf->io_EX_B_MEMREn));
        tracep->chgCData(oldp+84,(vlSelf->io_EX_B_MEMRCtrl),3);
        tracep->chgBit(oldp+85,(vlSelf->io_EX_B_MEMWEn));
        tracep->chgCData(oldp+86,(vlSelf->io_EX_B_MEMWCtrl),3);
        tracep->chgBit(oldp+87,(vlSelf->io_EX_C_RegWEn));
        tracep->chgCData(oldp+88,(vlSelf->io_EX_C_RegWSrc),2);
        tracep->chgCData(oldp+89,(vlSelf->io_EX_C_Rd),5);
        tracep->chgBit(oldp+90,(vlSelf->io_EX_D_Rs1REn));
        tracep->chgBit(oldp+91,(vlSelf->io_EX_D_Rs2REn));
        tracep->chgCData(oldp+92,(vlSelf->io_EX_D_Rs1),5);
        tracep->chgCData(oldp+93,(vlSelf->io_EX_D_Rs2),5);
        tracep->chgIData(oldp+94,(vlSelf->io_EX_E_PC),32);
        tracep->chgQData(oldp+95,(vlSelf->io_EX_E_Imm),64);
        tracep->chgQData(oldp+97,(vlSelf->io_EX_E_RData1),64);
        tracep->chgQData(oldp+99,(vlSelf->io_EX_E_RData2),64);
        tracep->chgBit(oldp+101,(vlSelf->io_WB_RegWEn));
        tracep->chgQData(oldp+102,(vlSelf->io_WB_WData),64);
        tracep->chgCData(oldp+104,(vlSelf->io_WB_Rd),5);
        tracep->chgIData(oldp+105,(vlSelf->io_PC_PC),32);
        tracep->chgBit(oldp+106,(vlSelf->io_HAZARD_JumpEn));
        tracep->chgCData(oldp+107,(vlSelf->io_DATAPATH_Rs1Ctrl),2);
        tracep->chgCData(oldp+108,(vlSelf->io_DATAPATH_Rs2Ctrl),2);
        tracep->chgQData(oldp+109,(vlSelf->io_DATAPATH_MEMData),64);
        tracep->chgQData(oldp+111,(vlSelf->io_DATAPATH_WBData),64);
        tracep->chgCData(oldp+113,(((0x37U == (0x7fU 
                                               & vlSelf->io_IF_Instr))
                                     ? 0U : ((0x17U 
                                              == (0x7fU 
                                                  & vlSelf->io_IF_Instr))
                                              ? 0U : 
                                             ((0x63U 
                                               == (0x7fU 
                                                   & vlSelf->io_IF_Instr))
                                               ? 0U
                                               : ((3U 
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
        tracep->chgCData(oldp+114,(((0x37U == (0x7fU 
                                               & vlSelf->io_IF_Instr))
                                     ? 1U : ((0x17U 
                                              == (0x7fU 
                                                  & vlSelf->io_IF_Instr))
                                              ? 2U : 
                                             ((0x63U 
                                               == (0x7fU 
                                                   & vlSelf->io_IF_Instr))
                                               ? 0U
                                               : ((3U 
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
        tracep->chgCData(oldp+115,(((0x37U == (0x7fU 
                                               & vlSelf->io_IF_Instr))
                                     ? 1U : ((0x17U 
                                              == (0x7fU 
                                                  & vlSelf->io_IF_Instr))
                                              ? 1U : 
                                             ((0x63U 
                                               == (0x7fU 
                                                   & vlSelf->io_IF_Instr))
                                               ? 0U
                                               : ((3U 
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
        tracep->chgBit(oldp+116,(((0x37U != (0x7fU 
                                             & vlSelf->io_IF_Instr)) 
                                  & ((0x17U != (0x7fU 
                                                & vlSelf->io_IF_Instr)) 
                                     & ((0x63U != (0x7fU 
                                                   & vlSelf->io_IF_Instr)) 
                                        & ((3U != (0x7fU 
                                                   & vlSelf->io_IF_Instr)) 
                                           & ((0x23U 
                                               != (0x7fU 
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
        tracep->chgCData(oldp+117,(((0x37U == (0x7fU 
                                               & vlSelf->io_IF_Instr))
                                     ? 0U : ((0x17U 
                                              == (0x7fU 
                                                  & vlSelf->io_IF_Instr))
                                              ? 0U : 
                                             ((0x63U 
                                               == (0x7fU 
                                                   & vlSelf->io_IF_Instr))
                                               ? 0U
                                               : ((3U 
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
        tracep->chgBit(oldp+118,(((0x37U != (0x7fU 
                                             & vlSelf->io_IF_Instr)) 
                                  & ((0x17U != (0x7fU 
                                                & vlSelf->io_IF_Instr)) 
                                     & ((0x63U != (0x7fU 
                                                   & vlSelf->io_IF_Instr)) 
                                        & (3U == (0x7fU 
                                                  & vlSelf->io_IF_Instr)))))));
        tracep->chgCData(oldp+119,(((0x37U == (0x7fU 
                                               & vlSelf->io_IF_Instr))
                                     ? 0U : ((0x17U 
                                              == (0x7fU 
                                                  & vlSelf->io_IF_Instr))
                                              ? 0U : 
                                             ((0x63U 
                                               == (0x7fU 
                                                   & vlSelf->io_IF_Instr))
                                               ? 0U
                                               : ((3U 
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
        tracep->chgBit(oldp+120,(((0x37U != (0x7fU 
                                             & vlSelf->io_IF_Instr)) 
                                  & ((0x17U != (0x7fU 
                                                & vlSelf->io_IF_Instr)) 
                                     & ((0x63U != (0x7fU 
                                                   & vlSelf->io_IF_Instr)) 
                                        & ((3U != (0x7fU 
                                                   & vlSelf->io_IF_Instr)) 
                                           & (0x23U 
                                              == (0x7fU 
                                                  & vlSelf->io_IF_Instr))))))));
        tracep->chgCData(oldp+121,(((0x37U == (0x7fU 
                                               & vlSelf->io_IF_Instr))
                                     ? 0U : ((0x17U 
                                              == (0x7fU 
                                                  & vlSelf->io_IF_Instr))
                                              ? 0U : 
                                             ((0x63U 
                                               == (0x7fU 
                                                   & vlSelf->io_IF_Instr))
                                               ? 0U
                                               : ((3U 
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
        tracep->chgBit(oldp+122,(((0x37U == (0x7fU 
                                             & vlSelf->io_IF_Instr)) 
                                  | ((0x17U == (0x7fU 
                                                & vlSelf->io_IF_Instr)) 
                                     | ((0x63U != (0x7fU 
                                                   & vlSelf->io_IF_Instr)) 
                                        & ((3U == (0x7fU 
                                                   & vlSelf->io_IF_Instr)) 
                                           | ((0x23U 
                                               != (0x7fU 
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
        tracep->chgCData(oldp+123,(((0x37U == (0x7fU 
                                               & vlSelf->io_IF_Instr))
                                     ? 1U : ((0x17U 
                                              == (0x7fU 
                                                  & vlSelf->io_IF_Instr))
                                              ? 1U : 
                                             ((0x63U 
                                               == (0x7fU 
                                                   & vlSelf->io_IF_Instr))
                                               ? 0U
                                               : ((3U 
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
        tracep->chgCData(oldp+124,((0x1fU & (vlSelf->io_IF_Instr 
                                             >> 7U))),5);
        tracep->chgBit(oldp+125,(((0x37U != (0x7fU 
                                             & vlSelf->io_IF_Instr)) 
                                  & ((0x17U != (0x7fU 
                                                & vlSelf->io_IF_Instr)) 
                                     & ((0x63U == (0x7fU 
                                                   & vlSelf->io_IF_Instr)) 
                                        | ((3U == (0x7fU 
                                                   & vlSelf->io_IF_Instr)) 
                                           | ((0x23U 
                                               == (0x7fU 
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
        tracep->chgBit(oldp+126,(((0x37U != (0x7fU 
                                             & vlSelf->io_IF_Instr)) 
                                  & ((0x17U != (0x7fU 
                                                & vlSelf->io_IF_Instr)) 
                                     & ((0x63U == (0x7fU 
                                                   & vlSelf->io_IF_Instr)) 
                                        | ((3U != (0x7fU 
                                                   & vlSelf->io_IF_Instr)) 
                                           & ((0x23U 
                                               != (0x7fU 
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
        tracep->chgCData(oldp+127,((0x1fU & (vlSelf->io_IF_Instr 
                                             >> 0xfU))),5);
        tracep->chgCData(oldp+128,((0x1fU & (vlSelf->io_IF_Instr 
                                             >> 0x14U))),5);
        tracep->chgQData(oldp+129,((((((0x1fU & (vlSelf->io_IF_Instr 
                                                 >> 0xfU)) 
                                       == (IData)(vlSelf->io_WB_Rd)) 
                                      & (IData)(vlSelf->io_WB_RegWEn)) 
                                     & (0U != (IData)(vlSelf->io_WB_Rd)))
                                     ? vlSelf->io_WB_WData
                                     : ((0x1fU == (0x1fU 
                                                   & (vlSelf->io_IF_Instr 
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
        tracep->chgQData(oldp+131,((((((0x1fU & (vlSelf->io_IF_Instr 
                                                 >> 0x14U)) 
                                       == (IData)(vlSelf->io_WB_Rd)) 
                                      & (IData)(vlSelf->io_WB_RegWEn)) 
                                     & (0U != (IData)(vlSelf->io_WB_Rd)))
                                     ? vlSelf->io_WB_WData
                                     : ((0x1fU == (0x1fU 
                                                   & (vlSelf->io_IF_Instr 
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
        tracep->chgIData(oldp+133,((vlSelf->io_IF_Instr 
                                    >> 7U)),25);
        tracep->chgIData(oldp+134,(((1U == (IData)(vlSelf->IDStage__DOT__Decoder_io_ID_JumpCtrl))
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
        tracep->chgCData(oldp+135,((0x7fU & vlSelf->io_IF_Instr)),7);
        tracep->chgCData(oldp+136,((7U & (vlSelf->io_IF_Instr 
                                          >> 0xcU))),3);
        tracep->chgCData(oldp+137,((vlSelf->io_IF_Instr 
                                    >> 0x19U)),7);
        tracep->chgCData(oldp+138,(((0x37U == (0x7fU 
                                               & vlSelf->io_IF_Instr))
                                     ? 1U : ((0x17U 
                                              == (0x7fU 
                                                  & vlSelf->io_IF_Instr))
                                              ? 2U : 
                                             ((0x63U 
                                               == (0x7fU 
                                                   & vlSelf->io_IF_Instr))
                                               ? 0U
                                               : ((3U 
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
        tracep->chgIData(oldp+139,(((IData)(4U) + vlSelf->io_IF_PC)),32);
    }
}

void VIDStage___024root__traceCleanup(void* voidSelf, VerilatedVcd* /*unused*/) {
    VIDStage___024root* const __restrict vlSelf = static_cast<VIDStage___024root*>(voidSelf);
    VIDStage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    {
        vlSymsp->__Vm_activity = false;
        vlSymsp->TOP.__Vm_traceActivity[0U] = 0U;
        vlSymsp->TOP.__Vm_traceActivity[1U] = 0U;
        vlSymsp->TOP.__Vm_traceActivity[2U] = 0U;
    }
}
