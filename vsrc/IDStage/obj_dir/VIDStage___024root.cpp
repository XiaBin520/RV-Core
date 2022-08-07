// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VIDStage.h for the primary calling header

#include "VIDStage___024root.h"
#include "VIDStage__Syms.h"

//==========

VL_INLINE_OPT void VIDStage___024root___combo__TOP__1(VIDStage___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VIDStage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VIDStage___024root___combo__TOP__1\n"); );
    // Variables
    CData/*3:0*/ IDStage__DOT__Decoder__DOT___GEN_1;
    CData/*3:0*/ IDStage__DOT__Decoder__DOT___GEN_142;
    QData/*63:0*/ IDStage__DOT__ImmSext__DOT___GEN_4;
    // Body
    if ((0x37U == (0x7fU & vlSelf->io_IF_Instr))) {
        vlSelf->io_EX_A_ALUSrc1Ctrl = 1U;
        vlSelf->io_EX_A_ALUSrc2Ctrl = 1U;
    } else {
        vlSelf->io_EX_A_ALUSrc1Ctrl = ((0x17U == (0x7fU 
                                                  & vlSelf->io_IF_Instr))
                                        ? 2U : ((0x63U 
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
                                                         : 0U))))))))));
        vlSelf->io_EX_A_ALUSrc2Ctrl = ((0x17U == (0x7fU 
                                                  & vlSelf->io_IF_Instr))
                                        ? 1U : ((0x63U 
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
                                                         : 0U))))))))));
    }
    vlSelf->io_EX_A_WordALUEn = ((0x37U != (0x7fU & vlSelf->io_IF_Instr)) 
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
                                                          & vlSelf->io_IF_Instr))))))))));
    vlSelf->io_EX_B_MEMREn = ((0x37U != (0x7fU & vlSelf->io_IF_Instr)) 
                              & ((0x17U != (0x7fU & vlSelf->io_IF_Instr)) 
                                 & ((0x63U != (0x7fU 
                                               & vlSelf->io_IF_Instr)) 
                                    & (3U == (0x7fU 
                                              & vlSelf->io_IF_Instr)))));
    vlSelf->io_EX_B_MEMRCtrl = ((0x37U == (0x7fU & vlSelf->io_IF_Instr))
                                 ? 0U : ((0x17U == 
                                          (0x7fU & vlSelf->io_IF_Instr))
                                          ? 0U : ((0x63U 
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
                                                    : 0U))));
    vlSelf->io_EX_B_MEMWEn = ((0x37U != (0x7fU & vlSelf->io_IF_Instr)) 
                              & ((0x17U != (0x7fU & vlSelf->io_IF_Instr)) 
                                 & ((0x63U != (0x7fU 
                                               & vlSelf->io_IF_Instr)) 
                                    & ((3U != (0x7fU 
                                               & vlSelf->io_IF_Instr)) 
                                       & (0x23U == 
                                          (0x7fU & vlSelf->io_IF_Instr))))));
    vlSelf->io_EX_B_MEMWCtrl = ((0x37U == (0x7fU & vlSelf->io_IF_Instr))
                                 ? 0U : ((0x17U == 
                                          (0x7fU & vlSelf->io_IF_Instr))
                                          ? 0U : ((0x63U 
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
                                                     : 0U)))));
    vlSelf->io_EX_C_RegWEn = ((0x37U == (0x7fU & vlSelf->io_IF_Instr)) 
                              | ((0x17U == (0x7fU & vlSelf->io_IF_Instr)) 
                                 | ((0x63U != (0x7fU 
                                               & vlSelf->io_IF_Instr)) 
                                    & ((3U == (0x7fU 
                                               & vlSelf->io_IF_Instr)) 
                                       | ((0x23U != 
                                           (0x7fU & vlSelf->io_IF_Instr)) 
                                          & ((0x13U 
                                              == (0x7fU 
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
                                                             & vlSelf->io_IF_Instr))))))))))));
    vlSelf->io_EX_C_RegWSrc = ((0x37U == (0x7fU & vlSelf->io_IF_Instr))
                                ? 1U : ((0x17U == (0x7fU 
                                                   & vlSelf->io_IF_Instr))
                                         ? 1U : ((0x63U 
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
                                                          : 0U)))))))))));
    vlSelf->io_EX_C_Rd = (0x1fU & (vlSelf->io_IF_Instr 
                                   >> 7U));
    vlSelf->io_EX_D_Rs1REn = ((0x37U != (0x7fU & vlSelf->io_IF_Instr)) 
                              & ((0x17U != (0x7fU & vlSelf->io_IF_Instr)) 
                                 & ((0x63U == (0x7fU 
                                               & vlSelf->io_IF_Instr)) 
                                    | ((3U == (0x7fU 
                                               & vlSelf->io_IF_Instr)) 
                                       | ((0x23U == 
                                           (0x7fU & vlSelf->io_IF_Instr)) 
                                          | ((0x13U 
                                              == (0x7fU 
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
                                                             & vlSelf->io_IF_Instr))))))))))));
    vlSelf->io_EX_D_Rs2REn = ((0x37U != (0x7fU & vlSelf->io_IF_Instr)) 
                              & ((0x17U != (0x7fU & vlSelf->io_IF_Instr)) 
                                 & ((0x63U == (0x7fU 
                                               & vlSelf->io_IF_Instr)) 
                                    | ((3U != (0x7fU 
                                               & vlSelf->io_IF_Instr)) 
                                       & ((0x23U != 
                                           (0x7fU & vlSelf->io_IF_Instr)) 
                                          & ((0x13U 
                                              != (0x7fU 
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
                                                       & vlSelf->io_IF_Instr))))))))));
    vlSelf->io_EX_D_Rs1 = (0x1fU & (vlSelf->io_IF_Instr 
                                    >> 0xfU));
    vlSelf->io_EX_D_Rs2 = (0x1fU & (vlSelf->io_IF_Instr 
                                    >> 0x14U));
    vlSelf->io_EX_E_PC = vlSelf->io_IF_PC;
    vlSelf->IDStage__DOT__Decoder__DOT___GEN_95 = (
                                                   (0x1bU 
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
                                                      ? 3U
                                                      : 
                                                     ((5U 
                                                       == 
                                                       (7U 
                                                        & (vlSelf->io_IF_Instr 
                                                           >> 0xcU)))
                                                       ? 
                                                      ((0U 
                                                        == 
                                                        (vlSelf->io_IF_Instr 
                                                         >> 0x19U))
                                                        ? 4U
                                                        : 
                                                       ((0x20U 
                                                         == 
                                                         (vlSelf->io_IF_Instr 
                                                          >> 0x19U))
                                                         ? 5U
                                                         : 0U))
                                                       : 0U)))
                                                    : 
                                                   ((0x33U 
                                                     == 
                                                     (0x7fU 
                                                      & vlSelf->io_IF_Instr))
                                                     ? 0U
                                                     : 
                                                    ((0x3bU 
                                                      == 
                                                      (0x7fU 
                                                       & vlSelf->io_IF_Instr))
                                                      ? 
                                                     ((0U 
                                                       == 
                                                       (7U 
                                                        & (vlSelf->io_IF_Instr 
                                                           >> 0xcU)))
                                                       ? 
                                                      ((0U 
                                                        == 
                                                        (vlSelf->io_IF_Instr 
                                                         >> 0x19U))
                                                        ? 1U
                                                        : 
                                                       ((0x20U 
                                                         == 
                                                         (vlSelf->io_IF_Instr 
                                                          >> 0x19U))
                                                         ? 2U
                                                         : 0U))
                                                       : 
                                                      ((1U 
                                                        == 
                                                        (7U 
                                                         & (vlSelf->io_IF_Instr 
                                                            >> 0xcU)))
                                                        ? 
                                                       ((0U 
                                                         == 
                                                         (vlSelf->io_IF_Instr 
                                                          >> 0x19U))
                                                         ? 3U
                                                         : 0U)
                                                        : 
                                                       ((5U 
                                                         == 
                                                         (7U 
                                                          & (vlSelf->io_IF_Instr 
                                                             >> 0xcU)))
                                                         ? 
                                                        ((0U 
                                                          == 
                                                          (vlSelf->io_IF_Instr 
                                                           >> 0x19U))
                                                          ? 4U
                                                          : 
                                                         ((0x20U 
                                                           == 
                                                           (vlSelf->io_IF_Instr 
                                                            >> 0x19U))
                                                           ? 5U
                                                           : 0U))
                                                         : 0U)))
                                                      : 0U)));
    IDStage__DOT__Decoder__DOT___GEN_1 = ((6U == (7U 
                                                  & (vlSelf->io_IF_Instr 
                                                     >> 0xcU)))
                                           ? 5U : (
                                                   (7U 
                                                    == 
                                                    (7U 
                                                     & (vlSelf->io_IF_Instr 
                                                        >> 0xcU)))
                                                    ? 6U
                                                    : 0U));
    if ((0x37U == (0x7fU & vlSelf->io_IF_Instr))) {
        vlSelf->IDStage__DOT__Decoder_io_ID_ImmCtrl = 4U;
        vlSelf->io_EX_A_WordALUOP = 0U;
    } else {
        vlSelf->IDStage__DOT__Decoder_io_ID_ImmCtrl 
            = ((0x17U == (0x7fU & vlSelf->io_IF_Instr))
                ? 4U : ((0x63U == (0x7fU & vlSelf->io_IF_Instr))
                         ? 3U : ((3U == (0x7fU & vlSelf->io_IF_Instr))
                                  ? 1U : ((0x23U == 
                                           (0x7fU & vlSelf->io_IF_Instr))
                                           ? 2U : (
                                                   (0x13U 
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
                                                      ? 0U
                                                      : 
                                                     ((0x3bU 
                                                       == 
                                                       (0x7fU 
                                                        & vlSelf->io_IF_Instr))
                                                       ? 0U
                                                       : 
                                                      ((0x6fU 
                                                        == 
                                                        (0x7fU 
                                                         & vlSelf->io_IF_Instr))
                                                        ? 5U
                                                        : 
                                                       ((0x67U 
                                                         == 
                                                         (0x7fU 
                                                          & vlSelf->io_IF_Instr))
                                                         ? 1U
                                                         : 0U))))))))));
        vlSelf->io_EX_A_WordALUOP = ((0x17U == (0x7fU 
                                                & vlSelf->io_IF_Instr))
                                      ? 0U : ((0x63U 
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
                                                     : (IData)(vlSelf->IDStage__DOT__Decoder__DOT___GEN_95))))));
    }
    vlSelf->IDStage__DOT__Decoder__DOT___GEN_106 = 
        ((0x13U == (0x7fU & vlSelf->io_IF_Instr)) ? 
         ((0U == (7U & (vlSelf->io_IF_Instr >> 0xcU)))
           ? 0U : ((2U == (7U & (vlSelf->io_IF_Instr 
                                 >> 0xcU))) ? 2U : 
                   ((3U == (7U & (vlSelf->io_IF_Instr 
                                  >> 0xcU))) ? 3U : 
                    ((4U == (7U & (vlSelf->io_IF_Instr 
                                   >> 0xcU))) ? 4U : 
                     ((6U == (7U & (vlSelf->io_IF_Instr 
                                    >> 0xcU))) ? 5U
                       : ((7U == (7U & (vlSelf->io_IF_Instr 
                                        >> 0xcU))) ? 6U
                           : ((1U == (7U & (vlSelf->io_IF_Instr 
                                            >> 0xcU)))
                               ? ((0U == (0x7eU & (vlSelf->io_IF_Instr 
                                                   >> 0x19U)))
                                   ? 7U : 0U) : ((5U 
                                                  == 
                                                  (7U 
                                                   & (vlSelf->io_IF_Instr 
                                                      >> 0xcU)))
                                                  ? 
                                                 ((0U 
                                                   == 
                                                   (0x7eU 
                                                    & (vlSelf->io_IF_Instr 
                                                       >> 0x19U)))
                                                   ? 8U
                                                   : 
                                                  ((0x20U 
                                                    == 
                                                    (0x7eU 
                                                     & (vlSelf->io_IF_Instr 
                                                        >> 0x19U)))
                                                    ? 9U
                                                    : 0U))
                                                  : 0U))))))))
          : ((0x1bU == (0x7fU & vlSelf->io_IF_Instr))
              ? 0U : ((0x33U == (0x7fU & vlSelf->io_IF_Instr))
                       ? ((0U == (vlSelf->io_IF_Instr 
                                  >> 0x19U)) ? ((0U 
                                                 == 
                                                 (7U 
                                                  & (vlSelf->io_IF_Instr 
                                                     >> 0xcU)))
                                                 ? 0U
                                                 : 
                                                ((1U 
                                                  == 
                                                  (7U 
                                                   & (vlSelf->io_IF_Instr 
                                                      >> 0xcU)))
                                                  ? 7U
                                                  : 
                                                 ((2U 
                                                   == 
                                                   (7U 
                                                    & (vlSelf->io_IF_Instr 
                                                       >> 0xcU)))
                                                   ? 2U
                                                   : 
                                                  ((3U 
                                                    == 
                                                    (7U 
                                                     & (vlSelf->io_IF_Instr 
                                                        >> 0xcU)))
                                                    ? 3U
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
                                                      ? 8U
                                                      : (IData)(IDStage__DOT__Decoder__DOT___GEN_1)))))))
                           : ((0x20U == (vlSelf->io_IF_Instr 
                                         >> 0x19U))
                               ? ((0U == (7U & (vlSelf->io_IF_Instr 
                                                >> 0xcU)))
                                   ? 1U : ((5U == (7U 
                                                   & (vlSelf->io_IF_Instr 
                                                      >> 0xcU)))
                                            ? 9U : 0U))
                               : 0U)) : 0U)));
    IDStage__DOT__Decoder__DOT___GEN_142 = ((0x63U 
                                             == (0x7fU 
                                                 & vlSelf->io_IF_Instr))
                                             ? ((0U 
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
                                                 ((4U 
                                                   == 
                                                   (7U 
                                                    & (vlSelf->io_IF_Instr 
                                                       >> 0xcU)))
                                                   ? 3U
                                                   : 
                                                  ((5U 
                                                    == 
                                                    (7U 
                                                     & (vlSelf->io_IF_Instr 
                                                        >> 0xcU)))
                                                    ? 4U
                                                    : (IData)(IDStage__DOT__Decoder__DOT___GEN_1)))))
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
                                                   : 
                                                  ((0x1bU 
                                                    == 
                                                    (0x7fU 
                                                     & vlSelf->io_IF_Instr))
                                                    ? 0U
                                                    : 
                                                   ((0x33U 
                                                     == 
                                                     (0x7fU 
                                                      & vlSelf->io_IF_Instr))
                                                     ? 0U
                                                     : 
                                                    ((0x3bU 
                                                      == 
                                                      (0x7fU 
                                                       & vlSelf->io_IF_Instr))
                                                      ? 0U
                                                      : 
                                                     ((0x6fU 
                                                       == 
                                                       (0x7fU 
                                                        & vlSelf->io_IF_Instr))
                                                       ? 7U
                                                       : 
                                                      ((0x67U 
                                                        == 
                                                        (0x7fU 
                                                         & vlSelf->io_IF_Instr))
                                                        ? 8U
                                                        : 0U)))))))));
    IDStage__DOT__ImmSext__DOT___GEN_4 = ((2U == (IData)(vlSelf->IDStage__DOT__Decoder_io_ID_ImmCtrl))
                                           ? ((((vlSelf->io_IF_Instr 
                                                 >> 0x1fU)
                                                 ? 0xfffffffffffffULL
                                                 : 0ULL) 
                                               << 0xcU) 
                                              | (QData)((IData)(
                                                                ((0xfe0U 
                                                                  & (vlSelf->io_IF_Instr 
                                                                     >> 0x14U)) 
                                                                 | (0x1fU 
                                                                    & (vlSelf->io_IF_Instr 
                                                                       >> 7U))))))
                                           : ((3U == (IData)(vlSelf->IDStage__DOT__Decoder_io_ID_ImmCtrl))
                                               ? ((
                                                   ((vlSelf->io_IF_Instr 
                                                     >> 0x1fU)
                                                     ? 0x7ffffffffffffULL
                                                     : 0ULL) 
                                                   << 0xdU) 
                                                  | (QData)((IData)(
                                                                    ((0x1000U 
                                                                      & (vlSelf->io_IF_Instr 
                                                                         >> 0x13U)) 
                                                                     | ((0x800U 
                                                                         & (vlSelf->io_IF_Instr 
                                                                            << 4U)) 
                                                                        | ((0x7e0U 
                                                                            & (vlSelf->io_IF_Instr 
                                                                               >> 0x14U)) 
                                                                           | (0x1eU 
                                                                              & (vlSelf->io_IF_Instr 
                                                                                >> 7U))))))))
                                               : ((4U 
                                                   == (IData)(vlSelf->IDStage__DOT__Decoder_io_ID_ImmCtrl))
                                                   ? 
                                                  (((QData)((IData)(
                                                                    ((vlSelf->io_IF_Instr 
                                                                      >> 0x1fU)
                                                                      ? 0xffffffffU
                                                                      : 0U))) 
                                                    << 0x20U) 
                                                   | (QData)((IData)(
                                                                     (0xfffff000U 
                                                                      & vlSelf->io_IF_Instr))))
                                                   : 
                                                  ((5U 
                                                    == (IData)(vlSelf->IDStage__DOT__Decoder_io_ID_ImmCtrl))
                                                    ? 
                                                   ((((vlSelf->io_IF_Instr 
                                                       >> 0x1fU)
                                                       ? 0x7ffffffffffULL
                                                       : 0ULL) 
                                                     << 0x15U) 
                                                    | (QData)((IData)(
                                                                      ((0x100000U 
                                                                        & (vlSelf->io_IF_Instr 
                                                                           >> 0xbU)) 
                                                                       | ((0xff000U 
                                                                           & vlSelf->io_IF_Instr) 
                                                                          | ((0x800U 
                                                                              & (vlSelf->io_IF_Instr 
                                                                                >> 9U)) 
                                                                             | (0x7feU 
                                                                                & (vlSelf->io_IF_Instr 
                                                                                >> 0x14U))))))))
                                                    : 
                                                   ((6U 
                                                     == (IData)(vlSelf->IDStage__DOT__Decoder_io_ID_ImmCtrl))
                                                     ? (QData)((IData)(
                                                                       (0x1fU 
                                                                        & (vlSelf->io_IF_Instr 
                                                                           >> 0xfU))))
                                                     : 0ULL)))));
    if ((0x37U == (0x7fU & vlSelf->io_IF_Instr))) {
        vlSelf->io_EX_A_ALUOP = 0U;
        vlSelf->IDStage__DOT__Decoder_io_ID_JumpCtrl = 0U;
    } else {
        vlSelf->io_EX_A_ALUOP = ((0x17U == (0x7fU & vlSelf->io_IF_Instr))
                                  ? 0U : ((0x63U == 
                                           (0x7fU & vlSelf->io_IF_Instr))
                                           ? 0U : (
                                                   (3U 
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
                                                     : (IData)(vlSelf->IDStage__DOT__Decoder__DOT___GEN_106)))));
        vlSelf->IDStage__DOT__Decoder_io_ID_JumpCtrl 
            = ((0x17U == (0x7fU & vlSelf->io_IF_Instr))
                ? 0U : (IData)(IDStage__DOT__Decoder__DOT___GEN_142));
    }
    vlSelf->IDStage__DOT__ImmSext_io_imm64 = ((1U == (IData)(vlSelf->IDStage__DOT__Decoder_io_ID_ImmCtrl))
                                               ? ((
                                                   ((vlSelf->io_IF_Instr 
                                                     >> 0x1fU)
                                                     ? 0xfffffffffffffULL
                                                     : 0ULL) 
                                                   << 0xcU) 
                                                  | (QData)((IData)(
                                                                    (vlSelf->io_IF_Instr 
                                                                     >> 0x14U))))
                                               : IDStage__DOT__ImmSext__DOT___GEN_4);
    vlSelf->io_EX_E_Imm = vlSelf->IDStage__DOT__ImmSext_io_imm64;
    vlSelf->IDStage__DOT__Transfer__DOT___PCADDImm_T_1 
        = ((QData)((IData)(vlSelf->io_IF_PC)) + vlSelf->IDStage__DOT__ImmSext_io_imm64);
}

VL_INLINE_OPT void VIDStage___024root___sequent__TOP__3(VIDStage___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VIDStage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VIDStage___024root___sequent__TOP__3\n"); );
    // Body
    if (vlSelf->reset) {
        vlSelf->IDStage__DOT__RegFile__DOT__gprFile_31 = 0ULL;
    } else if (vlSelf->io_WB_RegWEn) {
        if ((0x1fU == (IData)(vlSelf->io_WB_Rd))) {
            vlSelf->IDStage__DOT__RegFile__DOT__gprFile_31 
                = vlSelf->io_WB_WData;
        }
    }
    if (vlSelf->reset) {
        vlSelf->IDStage__DOT__RegFile__DOT__gprFile_29 = 0ULL;
    } else if (vlSelf->io_WB_RegWEn) {
        if ((0x1dU == (IData)(vlSelf->io_WB_Rd))) {
            vlSelf->IDStage__DOT__RegFile__DOT__gprFile_29 
                = vlSelf->io_WB_WData;
        }
    }
    if (vlSelf->reset) {
        vlSelf->IDStage__DOT__RegFile__DOT__gprFile_30 = 0ULL;
    } else if (vlSelf->io_WB_RegWEn) {
        if ((0x1eU == (IData)(vlSelf->io_WB_Rd))) {
            vlSelf->IDStage__DOT__RegFile__DOT__gprFile_30 
                = vlSelf->io_WB_WData;
        }
    }
    if (vlSelf->reset) {
        vlSelf->IDStage__DOT__RegFile__DOT__gprFile_27 = 0ULL;
    } else if (vlSelf->io_WB_RegWEn) {
        if ((0x1bU == (IData)(vlSelf->io_WB_Rd))) {
            vlSelf->IDStage__DOT__RegFile__DOT__gprFile_27 
                = vlSelf->io_WB_WData;
        }
    }
    if (vlSelf->reset) {
        vlSelf->IDStage__DOT__RegFile__DOT__gprFile_28 = 0ULL;
    } else if (vlSelf->io_WB_RegWEn) {
        if ((0x1cU == (IData)(vlSelf->io_WB_Rd))) {
            vlSelf->IDStage__DOT__RegFile__DOT__gprFile_28 
                = vlSelf->io_WB_WData;
        }
    }
    if (vlSelf->reset) {
        vlSelf->IDStage__DOT__RegFile__DOT__gprFile_19 = 0ULL;
    } else if (vlSelf->io_WB_RegWEn) {
        if ((0x13U == (IData)(vlSelf->io_WB_Rd))) {
            vlSelf->IDStage__DOT__RegFile__DOT__gprFile_19 
                = vlSelf->io_WB_WData;
        }
    }
    if (vlSelf->reset) {
        vlSelf->IDStage__DOT__RegFile__DOT__gprFile_18 = 0ULL;
    } else if (vlSelf->io_WB_RegWEn) {
        if ((0x12U == (IData)(vlSelf->io_WB_Rd))) {
            vlSelf->IDStage__DOT__RegFile__DOT__gprFile_18 
                = vlSelf->io_WB_WData;
        }
    }
    if (vlSelf->reset) {
        vlSelf->IDStage__DOT__RegFile__DOT__gprFile_17 = 0ULL;
    } else if (vlSelf->io_WB_RegWEn) {
        if ((0x11U == (IData)(vlSelf->io_WB_Rd))) {
            vlSelf->IDStage__DOT__RegFile__DOT__gprFile_17 
                = vlSelf->io_WB_WData;
        }
    }
    if (vlSelf->reset) {
        vlSelf->IDStage__DOT__RegFile__DOT__gprFile_16 = 0ULL;
    } else if (vlSelf->io_WB_RegWEn) {
        if ((0x10U == (IData)(vlSelf->io_WB_Rd))) {
            vlSelf->IDStage__DOT__RegFile__DOT__gprFile_16 
                = vlSelf->io_WB_WData;
        }
    }
    if (vlSelf->reset) {
        vlSelf->IDStage__DOT__RegFile__DOT__gprFile_26 = 0ULL;
    } else if (vlSelf->io_WB_RegWEn) {
        if ((0x1aU == (IData)(vlSelf->io_WB_Rd))) {
            vlSelf->IDStage__DOT__RegFile__DOT__gprFile_26 
                = vlSelf->io_WB_WData;
        }
    }
    if (vlSelf->reset) {
        vlSelf->IDStage__DOT__RegFile__DOT__gprFile_25 = 0ULL;
    } else if (vlSelf->io_WB_RegWEn) {
        if ((0x19U == (IData)(vlSelf->io_WB_Rd))) {
            vlSelf->IDStage__DOT__RegFile__DOT__gprFile_25 
                = vlSelf->io_WB_WData;
        }
    }
    if (vlSelf->reset) {
        vlSelf->IDStage__DOT__RegFile__DOT__gprFile_24 = 0ULL;
    } else if (vlSelf->io_WB_RegWEn) {
        if ((0x18U == (IData)(vlSelf->io_WB_Rd))) {
            vlSelf->IDStage__DOT__RegFile__DOT__gprFile_24 
                = vlSelf->io_WB_WData;
        }
    }
    if (vlSelf->reset) {
        vlSelf->IDStage__DOT__RegFile__DOT__gprFile_14 = 0ULL;
    } else if (vlSelf->io_WB_RegWEn) {
        if ((0xeU == (IData)(vlSelf->io_WB_Rd))) {
            vlSelf->IDStage__DOT__RegFile__DOT__gprFile_14 
                = vlSelf->io_WB_WData;
        }
    }
    if (vlSelf->reset) {
        vlSelf->IDStage__DOT__RegFile__DOT__gprFile_23 = 0ULL;
    } else if (vlSelf->io_WB_RegWEn) {
        if ((0x17U == (IData)(vlSelf->io_WB_Rd))) {
            vlSelf->IDStage__DOT__RegFile__DOT__gprFile_23 
                = vlSelf->io_WB_WData;
        }
    }
    if (vlSelf->reset) {
        vlSelf->IDStage__DOT__RegFile__DOT__gprFile_15 = 0ULL;
    } else if (vlSelf->io_WB_RegWEn) {
        if ((0xfU == (IData)(vlSelf->io_WB_Rd))) {
            vlSelf->IDStage__DOT__RegFile__DOT__gprFile_15 
                = vlSelf->io_WB_WData;
        }
    }
    if (vlSelf->reset) {
        vlSelf->IDStage__DOT__RegFile__DOT__gprFile_21 = 0ULL;
    } else if (vlSelf->io_WB_RegWEn) {
        if ((0x15U == (IData)(vlSelf->io_WB_Rd))) {
            vlSelf->IDStage__DOT__RegFile__DOT__gprFile_21 
                = vlSelf->io_WB_WData;
        }
    }
    if (vlSelf->reset) {
        vlSelf->IDStage__DOT__RegFile__DOT__gprFile_20 = 0ULL;
    } else if (vlSelf->io_WB_RegWEn) {
        if ((0x14U == (IData)(vlSelf->io_WB_Rd))) {
            vlSelf->IDStage__DOT__RegFile__DOT__gprFile_20 
                = vlSelf->io_WB_WData;
        }
    }
    if (vlSelf->reset) {
        vlSelf->IDStage__DOT__RegFile__DOT__gprFile_22 = 0ULL;
    } else if (vlSelf->io_WB_RegWEn) {
        if ((0x16U == (IData)(vlSelf->io_WB_Rd))) {
            vlSelf->IDStage__DOT__RegFile__DOT__gprFile_22 
                = vlSelf->io_WB_WData;
        }
    }
    if (vlSelf->reset) {
        vlSelf->IDStage__DOT__RegFile__DOT__gprFile_5 = 0ULL;
    } else if (vlSelf->io_WB_RegWEn) {
        if ((5U == (IData)(vlSelf->io_WB_Rd))) {
            vlSelf->IDStage__DOT__RegFile__DOT__gprFile_5 
                = vlSelf->io_WB_WData;
        }
    }
    if (vlSelf->reset) {
        vlSelf->IDStage__DOT__RegFile__DOT__gprFile_13 = 0ULL;
    } else if (vlSelf->io_WB_RegWEn) {
        if ((0xdU == (IData)(vlSelf->io_WB_Rd))) {
            vlSelf->IDStage__DOT__RegFile__DOT__gprFile_13 
                = vlSelf->io_WB_WData;
        }
    }
    if (vlSelf->reset) {
        vlSelf->IDStage__DOT__RegFile__DOT__gprFile_4 = 0ULL;
    } else if (vlSelf->io_WB_RegWEn) {
        if ((4U == (IData)(vlSelf->io_WB_Rd))) {
            vlSelf->IDStage__DOT__RegFile__DOT__gprFile_4 
                = vlSelf->io_WB_WData;
        }
    }
    if (vlSelf->reset) {
        vlSelf->IDStage__DOT__RegFile__DOT__gprFile_1 = 0ULL;
    } else if (vlSelf->io_WB_RegWEn) {
        if ((1U == (IData)(vlSelf->io_WB_Rd))) {
            vlSelf->IDStage__DOT__RegFile__DOT__gprFile_1 
                = vlSelf->io_WB_WData;
        }
    }
    if (vlSelf->reset) {
        vlSelf->IDStage__DOT__RegFile__DOT__gprFile_9 = 0ULL;
    } else if (vlSelf->io_WB_RegWEn) {
        if ((9U == (IData)(vlSelf->io_WB_Rd))) {
            vlSelf->IDStage__DOT__RegFile__DOT__gprFile_9 
                = vlSelf->io_WB_WData;
        }
    }
    if (vlSelf->reset) {
        vlSelf->IDStage__DOT__RegFile__DOT__gprFile_7 = 0ULL;
    } else if (vlSelf->io_WB_RegWEn) {
        if ((7U == (IData)(vlSelf->io_WB_Rd))) {
            vlSelf->IDStage__DOT__RegFile__DOT__gprFile_7 
                = vlSelf->io_WB_WData;
        }
    }
    if (vlSelf->reset) {
        vlSelf->IDStage__DOT__RegFile__DOT__gprFile_6 = 0ULL;
    } else if (vlSelf->io_WB_RegWEn) {
        if ((6U == (IData)(vlSelf->io_WB_Rd))) {
            vlSelf->IDStage__DOT__RegFile__DOT__gprFile_6 
                = vlSelf->io_WB_WData;
        }
    }
    if (vlSelf->reset) {
        vlSelf->IDStage__DOT__RegFile__DOT__gprFile_2 = 0ULL;
    } else if (vlSelf->io_WB_RegWEn) {
        if ((2U == (IData)(vlSelf->io_WB_Rd))) {
            vlSelf->IDStage__DOT__RegFile__DOT__gprFile_2 
                = vlSelf->io_WB_WData;
        }
    }
    if (vlSelf->reset) {
        vlSelf->IDStage__DOT__RegFile__DOT__gprFile_11 = 0ULL;
    } else if (vlSelf->io_WB_RegWEn) {
        if ((0xbU == (IData)(vlSelf->io_WB_Rd))) {
            vlSelf->IDStage__DOT__RegFile__DOT__gprFile_11 
                = vlSelf->io_WB_WData;
        }
    }
    if (vlSelf->reset) {
        vlSelf->IDStage__DOT__RegFile__DOT__gprFile_3 = 0ULL;
    } else if (vlSelf->io_WB_RegWEn) {
        if ((3U == (IData)(vlSelf->io_WB_Rd))) {
            vlSelf->IDStage__DOT__RegFile__DOT__gprFile_3 
                = vlSelf->io_WB_WData;
        }
    }
    if (vlSelf->reset) {
        vlSelf->IDStage__DOT__RegFile__DOT__gprFile_12 = 0ULL;
    } else if (vlSelf->io_WB_RegWEn) {
        if ((0xcU == (IData)(vlSelf->io_WB_Rd))) {
            vlSelf->IDStage__DOT__RegFile__DOT__gprFile_12 
                = vlSelf->io_WB_WData;
        }
    }
    if (vlSelf->reset) {
        vlSelf->IDStage__DOT__RegFile__DOT__gprFile_8 = 0ULL;
    } else if (vlSelf->io_WB_RegWEn) {
        if ((8U == (IData)(vlSelf->io_WB_Rd))) {
            vlSelf->IDStage__DOT__RegFile__DOT__gprFile_8 
                = vlSelf->io_WB_WData;
        }
    }
    if (vlSelf->reset) {
        vlSelf->IDStage__DOT__RegFile__DOT__gprFile_10 = 0ULL;
    } else if (vlSelf->io_WB_RegWEn) {
        if ((0xaU == (IData)(vlSelf->io_WB_Rd))) {
            vlSelf->IDStage__DOT__RegFile__DOT__gprFile_10 
                = vlSelf->io_WB_WData;
        }
    }
}

VL_INLINE_OPT void VIDStage___024root___combo__TOP__4(VIDStage___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VIDStage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VIDStage___024root___combo__TOP__4\n"); );
    // Variables
    QData/*63:0*/ IDStage__DOT___GEN_0;
    QData/*63:0*/ IDStage__DOT___GEN_2;
    QData/*63:0*/ IDStage__DOT__RegFile__DOT___GEN_13;
    QData/*63:0*/ IDStage__DOT__RegFile__DOT___GEN_45;
    // Body
    IDStage__DOT__RegFile__DOT___GEN_13 = ((0xdU == 
                                            (0x1fU 
                                             & (vlSelf->io_IF_Instr 
                                                >> 0xfU)))
                                            ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_13
                                            : ((0xcU 
                                                == 
                                                (0x1fU 
                                                 & (vlSelf->io_IF_Instr 
                                                    >> 0xfU)))
                                                ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_12
                                                : (
                                                   (0xbU 
                                                    == 
                                                    (0x1fU 
                                                     & (vlSelf->io_IF_Instr 
                                                        >> 0xfU)))
                                                    ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_11
                                                    : 
                                                   ((0xaU 
                                                     == 
                                                     (0x1fU 
                                                      & (vlSelf->io_IF_Instr 
                                                         >> 0xfU)))
                                                     ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_10
                                                     : 
                                                    ((9U 
                                                      == 
                                                      (0x1fU 
                                                       & (vlSelf->io_IF_Instr 
                                                          >> 0xfU)))
                                                      ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_9
                                                      : 
                                                     ((8U 
                                                       == 
                                                       (0x1fU 
                                                        & (vlSelf->io_IF_Instr 
                                                           >> 0xfU)))
                                                       ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_8
                                                       : 
                                                      ((7U 
                                                        == 
                                                        (0x1fU 
                                                         & (vlSelf->io_IF_Instr 
                                                            >> 0xfU)))
                                                        ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_7
                                                        : 
                                                       ((6U 
                                                         == 
                                                         (0x1fU 
                                                          & (vlSelf->io_IF_Instr 
                                                             >> 0xfU)))
                                                         ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_6
                                                         : 
                                                        ((5U 
                                                          == 
                                                          (0x1fU 
                                                           & (vlSelf->io_IF_Instr 
                                                              >> 0xfU)))
                                                          ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_5
                                                          : 
                                                         ((4U 
                                                           == 
                                                           (0x1fU 
                                                            & (vlSelf->io_IF_Instr 
                                                               >> 0xfU)))
                                                           ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_4
                                                           : 
                                                          ((3U 
                                                            == 
                                                            (0x1fU 
                                                             & (vlSelf->io_IF_Instr 
                                                                >> 0xfU)))
                                                            ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_3
                                                            : 
                                                           ((2U 
                                                             == 
                                                             (0x1fU 
                                                              & (vlSelf->io_IF_Instr 
                                                                 >> 0xfU)))
                                                             ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_2
                                                             : 
                                                            ((1U 
                                                              == 
                                                              (0x1fU 
                                                               & (vlSelf->io_IF_Instr 
                                                                  >> 0xfU)))
                                                              ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_1
                                                              : 0ULL)))))))))))));
    IDStage__DOT__RegFile__DOT___GEN_45 = ((0xdU == 
                                            (0x1fU 
                                             & (vlSelf->io_IF_Instr 
                                                >> 0x14U)))
                                            ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_13
                                            : ((0xcU 
                                                == 
                                                (0x1fU 
                                                 & (vlSelf->io_IF_Instr 
                                                    >> 0x14U)))
                                                ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_12
                                                : (
                                                   (0xbU 
                                                    == 
                                                    (0x1fU 
                                                     & (vlSelf->io_IF_Instr 
                                                        >> 0x14U)))
                                                    ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_11
                                                    : 
                                                   ((0xaU 
                                                     == 
                                                     (0x1fU 
                                                      & (vlSelf->io_IF_Instr 
                                                         >> 0x14U)))
                                                     ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_10
                                                     : 
                                                    ((9U 
                                                      == 
                                                      (0x1fU 
                                                       & (vlSelf->io_IF_Instr 
                                                          >> 0x14U)))
                                                      ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_9
                                                      : 
                                                     ((8U 
                                                       == 
                                                       (0x1fU 
                                                        & (vlSelf->io_IF_Instr 
                                                           >> 0x14U)))
                                                       ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_8
                                                       : 
                                                      ((7U 
                                                        == 
                                                        (0x1fU 
                                                         & (vlSelf->io_IF_Instr 
                                                            >> 0x14U)))
                                                        ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_7
                                                        : 
                                                       ((6U 
                                                         == 
                                                         (0x1fU 
                                                          & (vlSelf->io_IF_Instr 
                                                             >> 0x14U)))
                                                         ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_6
                                                         : 
                                                        ((5U 
                                                          == 
                                                          (0x1fU 
                                                           & (vlSelf->io_IF_Instr 
                                                              >> 0x14U)))
                                                          ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_5
                                                          : 
                                                         ((4U 
                                                           == 
                                                           (0x1fU 
                                                            & (vlSelf->io_IF_Instr 
                                                               >> 0x14U)))
                                                           ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_4
                                                           : 
                                                          ((3U 
                                                            == 
                                                            (0x1fU 
                                                             & (vlSelf->io_IF_Instr 
                                                                >> 0x14U)))
                                                            ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_3
                                                            : 
                                                           ((2U 
                                                             == 
                                                             (0x1fU 
                                                              & (vlSelf->io_IF_Instr 
                                                                 >> 0x14U)))
                                                             ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_2
                                                             : 
                                                            ((1U 
                                                              == 
                                                              (0x1fU 
                                                               & (vlSelf->io_IF_Instr 
                                                                  >> 0x14U)))
                                                              ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_1
                                                              : 0ULL)))))))))))));
    vlSelf->IDStage__DOT__RegFile__DOT___GEN_26 = (
                                                   (0x1aU 
                                                    == 
                                                    (0x1fU 
                                                     & (vlSelf->io_IF_Instr 
                                                        >> 0xfU)))
                                                    ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_26
                                                    : 
                                                   ((0x19U 
                                                     == 
                                                     (0x1fU 
                                                      & (vlSelf->io_IF_Instr 
                                                         >> 0xfU)))
                                                     ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_25
                                                     : 
                                                    ((0x18U 
                                                      == 
                                                      (0x1fU 
                                                       & (vlSelf->io_IF_Instr 
                                                          >> 0xfU)))
                                                      ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_24
                                                      : 
                                                     ((0x17U 
                                                       == 
                                                       (0x1fU 
                                                        & (vlSelf->io_IF_Instr 
                                                           >> 0xfU)))
                                                       ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_23
                                                       : 
                                                      ((0x16U 
                                                        == 
                                                        (0x1fU 
                                                         & (vlSelf->io_IF_Instr 
                                                            >> 0xfU)))
                                                        ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_22
                                                        : 
                                                       ((0x15U 
                                                         == 
                                                         (0x1fU 
                                                          & (vlSelf->io_IF_Instr 
                                                             >> 0xfU)))
                                                         ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_21
                                                         : 
                                                        ((0x14U 
                                                          == 
                                                          (0x1fU 
                                                           & (vlSelf->io_IF_Instr 
                                                              >> 0xfU)))
                                                          ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_20
                                                          : 
                                                         ((0x13U 
                                                           == 
                                                           (0x1fU 
                                                            & (vlSelf->io_IF_Instr 
                                                               >> 0xfU)))
                                                           ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_19
                                                           : 
                                                          ((0x12U 
                                                            == 
                                                            (0x1fU 
                                                             & (vlSelf->io_IF_Instr 
                                                                >> 0xfU)))
                                                            ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_18
                                                            : 
                                                           ((0x11U 
                                                             == 
                                                             (0x1fU 
                                                              & (vlSelf->io_IF_Instr 
                                                                 >> 0xfU)))
                                                             ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_17
                                                             : 
                                                            ((0x10U 
                                                              == 
                                                              (0x1fU 
                                                               & (vlSelf->io_IF_Instr 
                                                                  >> 0xfU)))
                                                              ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_16
                                                              : 
                                                             ((0xfU 
                                                               == 
                                                               (0x1fU 
                                                                & (vlSelf->io_IF_Instr 
                                                                   >> 0xfU)))
                                                               ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_15
                                                               : 
                                                              ((0xeU 
                                                                == 
                                                                (0x1fU 
                                                                 & (vlSelf->io_IF_Instr 
                                                                    >> 0xfU)))
                                                                ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_14
                                                                : IDStage__DOT__RegFile__DOT___GEN_13)))))))))))));
    vlSelf->IDStage__DOT__RegFile__DOT___GEN_58 = (
                                                   (0x1aU 
                                                    == 
                                                    (0x1fU 
                                                     & (vlSelf->io_IF_Instr 
                                                        >> 0x14U)))
                                                    ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_26
                                                    : 
                                                   ((0x19U 
                                                     == 
                                                     (0x1fU 
                                                      & (vlSelf->io_IF_Instr 
                                                         >> 0x14U)))
                                                     ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_25
                                                     : 
                                                    ((0x18U 
                                                      == 
                                                      (0x1fU 
                                                       & (vlSelf->io_IF_Instr 
                                                          >> 0x14U)))
                                                      ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_24
                                                      : 
                                                     ((0x17U 
                                                       == 
                                                       (0x1fU 
                                                        & (vlSelf->io_IF_Instr 
                                                           >> 0x14U)))
                                                       ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_23
                                                       : 
                                                      ((0x16U 
                                                        == 
                                                        (0x1fU 
                                                         & (vlSelf->io_IF_Instr 
                                                            >> 0x14U)))
                                                        ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_22
                                                        : 
                                                       ((0x15U 
                                                         == 
                                                         (0x1fU 
                                                          & (vlSelf->io_IF_Instr 
                                                             >> 0x14U)))
                                                         ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_21
                                                         : 
                                                        ((0x14U 
                                                          == 
                                                          (0x1fU 
                                                           & (vlSelf->io_IF_Instr 
                                                              >> 0x14U)))
                                                          ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_20
                                                          : 
                                                         ((0x13U 
                                                           == 
                                                           (0x1fU 
                                                            & (vlSelf->io_IF_Instr 
                                                               >> 0x14U)))
                                                           ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_19
                                                           : 
                                                          ((0x12U 
                                                            == 
                                                            (0x1fU 
                                                             & (vlSelf->io_IF_Instr 
                                                                >> 0x14U)))
                                                            ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_18
                                                            : 
                                                           ((0x11U 
                                                             == 
                                                             (0x1fU 
                                                              & (vlSelf->io_IF_Instr 
                                                                 >> 0x14U)))
                                                             ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_17
                                                             : 
                                                            ((0x10U 
                                                              == 
                                                              (0x1fU 
                                                               & (vlSelf->io_IF_Instr 
                                                                  >> 0x14U)))
                                                              ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_16
                                                              : 
                                                             ((0xfU 
                                                               == 
                                                               (0x1fU 
                                                                & (vlSelf->io_IF_Instr 
                                                                   >> 0x14U)))
                                                               ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_15
                                                               : 
                                                              ((0xeU 
                                                                == 
                                                                (0x1fU 
                                                                 & (vlSelf->io_IF_Instr 
                                                                    >> 0x14U)))
                                                                ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_14
                                                                : IDStage__DOT__RegFile__DOT___GEN_45)))))))))))));
    IDStage__DOT___GEN_0 = ((2U == (IData)(vlSelf->io_DATAPATH_Rs1Ctrl))
                             ? vlSelf->io_DATAPATH_WBData
                             : (((((0x1fU & (vlSelf->io_IF_Instr 
                                             >> 0xfU)) 
                                   == (IData)(vlSelf->io_WB_Rd)) 
                                  & (IData)(vlSelf->io_WB_RegWEn)) 
                                 & (0U != (IData)(vlSelf->io_WB_Rd)))
                                 ? vlSelf->io_WB_WData
                                 : ((0x1fU == (0x1fU 
                                               & (vlSelf->io_IF_Instr 
                                                  >> 0xfU)))
                                     ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_31
                                     : ((0x1eU == (0x1fU 
                                                   & (vlSelf->io_IF_Instr 
                                                      >> 0xfU)))
                                         ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_30
                                         : ((0x1dU 
                                             == (0x1fU 
                                                 & (vlSelf->io_IF_Instr 
                                                    >> 0xfU)))
                                             ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_29
                                             : ((0x1cU 
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
                                                  : vlSelf->IDStage__DOT__RegFile__DOT___GEN_26)))))));
    IDStage__DOT___GEN_2 = ((2U == (IData)(vlSelf->io_DATAPATH_Rs2Ctrl))
                             ? vlSelf->io_DATAPATH_WBData
                             : (((((0x1fU & (vlSelf->io_IF_Instr 
                                             >> 0x14U)) 
                                   == (IData)(vlSelf->io_WB_Rd)) 
                                  & (IData)(vlSelf->io_WB_RegWEn)) 
                                 & (0U != (IData)(vlSelf->io_WB_Rd)))
                                 ? vlSelf->io_WB_WData
                                 : ((0x1fU == (0x1fU 
                                               & (vlSelf->io_IF_Instr 
                                                  >> 0x14U)))
                                     ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_31
                                     : ((0x1eU == (0x1fU 
                                                   & (vlSelf->io_IF_Instr 
                                                      >> 0x14U)))
                                         ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_30
                                         : ((0x1dU 
                                             == (0x1fU 
                                                 & (vlSelf->io_IF_Instr 
                                                    >> 0x14U)))
                                             ? vlSelf->IDStage__DOT__RegFile__DOT__gprFile_29
                                             : ((0x1cU 
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
                                                  : vlSelf->IDStage__DOT__RegFile__DOT___GEN_58)))))));
    if ((1U == (IData)(vlSelf->io_DATAPATH_Rs1Ctrl))) {
        vlSelf->io_EX_E_RData1 = vlSelf->io_DATAPATH_MEMData;
        vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs1Data 
            = vlSelf->io_DATAPATH_MEMData;
    } else {
        vlSelf->io_EX_E_RData1 = IDStage__DOT___GEN_0;
        vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs1Data 
            = IDStage__DOT___GEN_0;
    }
    if ((1U == (IData)(vlSelf->io_DATAPATH_Rs2Ctrl))) {
        vlSelf->io_EX_E_RData2 = vlSelf->io_DATAPATH_MEMData;
        vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs2Data 
            = vlSelf->io_DATAPATH_MEMData;
    } else {
        vlSelf->io_EX_E_RData2 = IDStage__DOT___GEN_2;
        vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs2Data 
            = IDStage__DOT___GEN_2;
    }
    if ((1U == (IData)(vlSelf->IDStage__DOT__Decoder_io_ID_JumpCtrl))) {
        vlSelf->io_HAZARD_JumpEn = (vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs1Data 
                                    == vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs2Data);
        vlSelf->io_PC_PC = ((vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs1Data 
                             == vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs2Data)
                             ? (IData)(vlSelf->IDStage__DOT__Transfer__DOT___PCADDImm_T_1)
                             : ((IData)(4U) + vlSelf->io_IF_PC));
    } else {
        vlSelf->io_HAZARD_JumpEn = ((2U == (IData)(vlSelf->IDStage__DOT__Decoder_io_ID_JumpCtrl))
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
                                                     == (IData)(vlSelf->IDStage__DOT__Decoder_io_ID_JumpCtrl))))))));
        vlSelf->io_PC_PC = ((2U == (IData)(vlSelf->IDStage__DOT__Decoder_io_ID_JumpCtrl))
                             ? ((vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs1Data 
                                 != vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs2Data)
                                 ? (IData)(vlSelf->IDStage__DOT__Transfer__DOT___PCADDImm_T_1)
                                 : ((IData)(4U) + vlSelf->io_IF_PC))
                             : ((3U == (IData)(vlSelf->IDStage__DOT__Decoder_io_ID_JumpCtrl))
                                 ? (VL_LTS_IQQ(1,64,64, vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs1Data, vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs2Data)
                                     ? (IData)(vlSelf->IDStage__DOT__Transfer__DOT___PCADDImm_T_1)
                                     : ((IData)(4U) 
                                        + vlSelf->io_IF_PC))
                                 : ((4U == (IData)(vlSelf->IDStage__DOT__Decoder_io_ID_JumpCtrl))
                                     ? (VL_GTES_IQQ(1,64,64, vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs1Data, vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs2Data)
                                         ? (IData)(vlSelf->IDStage__DOT__Transfer__DOT___PCADDImm_T_1)
                                         : ((IData)(4U) 
                                            + vlSelf->io_IF_PC))
                                     : ((5U == (IData)(vlSelf->IDStage__DOT__Decoder_io_ID_JumpCtrl))
                                         ? ((vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs1Data 
                                             < vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs2Data)
                                             ? (IData)(vlSelf->IDStage__DOT__Transfer__DOT___PCADDImm_T_1)
                                             : ((IData)(4U) 
                                                + vlSelf->io_IF_PC))
                                         : ((6U == (IData)(vlSelf->IDStage__DOT__Decoder_io_ID_JumpCtrl))
                                             ? ((vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs1Data 
                                                 >= vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs2Data)
                                                 ? (IData)(vlSelf->IDStage__DOT__Transfer__DOT___PCADDImm_T_1)
                                                 : 
                                                ((IData)(4U) 
                                                 + vlSelf->io_IF_PC))
                                             : ((7U 
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
                                                  + vlSelf->io_IF_PC))))))));
    }
}

void VIDStage___024root___eval(VIDStage___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VIDStage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VIDStage___024root___eval\n"); );
    // Body
    VIDStage___024root___combo__TOP__1(vlSelf);
    vlSelf->__Vm_traceActivity[1U] = 1U;
    if (((IData)(vlSelf->clock) & (~ (IData)(vlSelf->__Vclklast__TOP__clock)))) {
        VIDStage___024root___sequent__TOP__3(vlSelf);
        vlSelf->__Vm_traceActivity[2U] = 1U;
    }
    VIDStage___024root___combo__TOP__4(vlSelf);
    // Final
    vlSelf->__Vclklast__TOP__clock = vlSelf->clock;
}

QData VIDStage___024root___change_request_1(VIDStage___024root* vlSelf);

VL_INLINE_OPT QData VIDStage___024root___change_request(VIDStage___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VIDStage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VIDStage___024root___change_request\n"); );
    // Body
    return (VIDStage___024root___change_request_1(vlSelf));
}

VL_INLINE_OPT QData VIDStage___024root___change_request_1(VIDStage___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VIDStage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VIDStage___024root___change_request_1\n"); );
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    return __req;
}

#ifdef VL_DEBUG
void VIDStage___024root___eval_debug_assertions(VIDStage___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VIDStage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VIDStage___024root___eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((vlSelf->clock & 0xfeU))) {
        Verilated::overWidthError("clock");}
    if (VL_UNLIKELY((vlSelf->reset & 0xfeU))) {
        Verilated::overWidthError("reset");}
    if (VL_UNLIKELY((vlSelf->io_WB_RegWEn & 0xfeU))) {
        Verilated::overWidthError("io_WB_RegWEn");}
    if (VL_UNLIKELY((vlSelf->io_WB_Rd & 0xe0U))) {
        Verilated::overWidthError("io_WB_Rd");}
    if (VL_UNLIKELY((vlSelf->io_DATAPATH_Rs1Ctrl & 0xfcU))) {
        Verilated::overWidthError("io_DATAPATH_Rs1Ctrl");}
    if (VL_UNLIKELY((vlSelf->io_DATAPATH_Rs2Ctrl & 0xfcU))) {
        Verilated::overWidthError("io_DATAPATH_Rs2Ctrl");}
}
#endif  // VL_DEBUG
