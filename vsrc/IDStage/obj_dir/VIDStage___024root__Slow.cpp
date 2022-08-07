// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VIDStage.h for the primary calling header

#include "VIDStage___024root.h"
#include "VIDStage__Syms.h"

//==========


void VIDStage___024root___ctor_var_reset(VIDStage___024root* vlSelf);

VIDStage___024root::VIDStage___024root(const char* _vcname__)
    : VerilatedModule(_vcname__)
 {
    // Reset structure values
    VIDStage___024root___ctor_var_reset(this);
}

void VIDStage___024root::__Vconfigure(VIDStage__Syms* _vlSymsp, bool first) {
    if (false && first) {}  // Prevent unused
    this->vlSymsp = _vlSymsp;
}

VIDStage___024root::~VIDStage___024root() {
}

void VIDStage___024root___settle__TOP__2(VIDStage___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VIDStage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VIDStage___024root___settle__TOP__2\n"); );
    // Variables
    CData/*3:0*/ IDStage__DOT__Decoder__DOT___GEN_1;
    CData/*3:0*/ IDStage__DOT__Decoder__DOT___GEN_142;
    QData/*63:0*/ IDStage__DOT___GEN_0;
    QData/*63:0*/ IDStage__DOT___GEN_2;
    QData/*63:0*/ IDStage__DOT__RegFile__DOT___GEN_13;
    QData/*63:0*/ IDStage__DOT__RegFile__DOT___GEN_45;
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
    vlSelf->IDStage__DOT__Decoder_io_ID_ImmCtrl = (
                                                   (0x37U 
                                                    == 
                                                    (0x7fU 
                                                     & vlSelf->io_IF_Instr))
                                                    ? 4U
                                                    : 
                                                   ((0x17U 
                                                     == 
                                                     (0x7fU 
                                                      & vlSelf->io_IF_Instr))
                                                     ? 4U
                                                     : 
                                                    ((0x63U 
                                                      == 
                                                      (0x7fU 
                                                       & vlSelf->io_IF_Instr))
                                                      ? 3U
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
                                                        ? 2U
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
                                                              : 0U)))))))))));
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
    vlSelf->io_EX_A_WordALUOP = ((0x37U == (0x7fU & vlSelf->io_IF_Instr))
                                  ? 0U : ((0x17U == 
                                           (0x7fU & vlSelf->io_IF_Instr))
                                           ? 0U : (
                                                   (0x63U 
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
                                                       : (IData)(vlSelf->IDStage__DOT__Decoder__DOT___GEN_95)))))));
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
    vlSelf->io_EX_E_Imm = vlSelf->IDStage__DOT__ImmSext_io_imm64;
    vlSelf->IDStage__DOT__Transfer__DOT___PCADDImm_T_1 
        = ((QData)((IData)(vlSelf->io_IF_PC)) + vlSelf->IDStage__DOT__ImmSext_io_imm64);
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

void VIDStage___024root___eval_initial(VIDStage___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VIDStage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VIDStage___024root___eval_initial\n"); );
    // Body
    vlSelf->__Vclklast__TOP__clock = vlSelf->clock;
}

void VIDStage___024root___eval_settle(VIDStage___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VIDStage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VIDStage___024root___eval_settle\n"); );
    // Body
    VIDStage___024root___settle__TOP__2(vlSelf);
    vlSelf->__Vm_traceActivity[2U] = 1U;
    vlSelf->__Vm_traceActivity[1U] = 1U;
    vlSelf->__Vm_traceActivity[0U] = 1U;
}

void VIDStage___024root___final(VIDStage___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VIDStage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VIDStage___024root___final\n"); );
}

void VIDStage___024root___ctor_var_reset(VIDStage___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VIDStage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VIDStage___024root___ctor_var_reset\n"); );
    // Body
    vlSelf->clock = VL_RAND_RESET_I(1);
    vlSelf->reset = VL_RAND_RESET_I(1);
    vlSelf->io_IF_Instr = VL_RAND_RESET_I(32);
    vlSelf->io_IF_PC = VL_RAND_RESET_I(32);
    vlSelf->io_EX_A_ALUOP = VL_RAND_RESET_I(4);
    vlSelf->io_EX_A_ALUSrc1Ctrl = VL_RAND_RESET_I(3);
    vlSelf->io_EX_A_ALUSrc2Ctrl = VL_RAND_RESET_I(3);
    vlSelf->io_EX_A_WordALUEn = VL_RAND_RESET_I(1);
    vlSelf->io_EX_A_WordALUOP = VL_RAND_RESET_I(3);
    vlSelf->io_EX_B_MEMREn = VL_RAND_RESET_I(1);
    vlSelf->io_EX_B_MEMRCtrl = VL_RAND_RESET_I(3);
    vlSelf->io_EX_B_MEMWEn = VL_RAND_RESET_I(1);
    vlSelf->io_EX_B_MEMWCtrl = VL_RAND_RESET_I(3);
    vlSelf->io_EX_C_RegWEn = VL_RAND_RESET_I(1);
    vlSelf->io_EX_C_RegWSrc = VL_RAND_RESET_I(2);
    vlSelf->io_EX_C_Rd = VL_RAND_RESET_I(5);
    vlSelf->io_EX_D_Rs1REn = VL_RAND_RESET_I(1);
    vlSelf->io_EX_D_Rs2REn = VL_RAND_RESET_I(1);
    vlSelf->io_EX_D_Rs1 = VL_RAND_RESET_I(5);
    vlSelf->io_EX_D_Rs2 = VL_RAND_RESET_I(5);
    vlSelf->io_EX_E_PC = VL_RAND_RESET_I(32);
    vlSelf->io_EX_E_Imm = VL_RAND_RESET_Q(64);
    vlSelf->io_EX_E_RData1 = VL_RAND_RESET_Q(64);
    vlSelf->io_EX_E_RData2 = VL_RAND_RESET_Q(64);
    vlSelf->io_WB_RegWEn = VL_RAND_RESET_I(1);
    vlSelf->io_WB_WData = VL_RAND_RESET_Q(64);
    vlSelf->io_WB_Rd = VL_RAND_RESET_I(5);
    vlSelf->io_PC_PC = VL_RAND_RESET_I(32);
    vlSelf->io_HAZARD_JumpEn = VL_RAND_RESET_I(1);
    vlSelf->io_DATAPATH_Rs1Ctrl = VL_RAND_RESET_I(2);
    vlSelf->io_DATAPATH_Rs2Ctrl = VL_RAND_RESET_I(2);
    vlSelf->io_DATAPATH_MEMData = VL_RAND_RESET_Q(64);
    vlSelf->io_DATAPATH_WBData = VL_RAND_RESET_Q(64);
    vlSelf->IDStage__DOT__Decoder_io_ID_ImmCtrl = VL_RAND_RESET_I(3);
    vlSelf->IDStage__DOT__Decoder_io_ID_JumpCtrl = VL_RAND_RESET_I(4);
    vlSelf->IDStage__DOT__ImmSext_io_imm64 = VL_RAND_RESET_Q(64);
    vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs1Data = VL_RAND_RESET_Q(64);
    vlSelf->IDStage__DOT__Transfer_io_ID_B_Rs2Data = VL_RAND_RESET_Q(64);
    vlSelf->IDStage__DOT__Decoder__DOT___GEN_95 = VL_RAND_RESET_I(3);
    vlSelf->IDStage__DOT__Decoder__DOT___GEN_106 = VL_RAND_RESET_I(4);
    vlSelf->IDStage__DOT__RegFile__DOT__gprFile_1 = VL_RAND_RESET_Q(64);
    vlSelf->IDStage__DOT__RegFile__DOT__gprFile_2 = VL_RAND_RESET_Q(64);
    vlSelf->IDStage__DOT__RegFile__DOT__gprFile_3 = VL_RAND_RESET_Q(64);
    vlSelf->IDStage__DOT__RegFile__DOT__gprFile_4 = VL_RAND_RESET_Q(64);
    vlSelf->IDStage__DOT__RegFile__DOT__gprFile_5 = VL_RAND_RESET_Q(64);
    vlSelf->IDStage__DOT__RegFile__DOT__gprFile_6 = VL_RAND_RESET_Q(64);
    vlSelf->IDStage__DOT__RegFile__DOT__gprFile_7 = VL_RAND_RESET_Q(64);
    vlSelf->IDStage__DOT__RegFile__DOT__gprFile_8 = VL_RAND_RESET_Q(64);
    vlSelf->IDStage__DOT__RegFile__DOT__gprFile_9 = VL_RAND_RESET_Q(64);
    vlSelf->IDStage__DOT__RegFile__DOT__gprFile_10 = VL_RAND_RESET_Q(64);
    vlSelf->IDStage__DOT__RegFile__DOT__gprFile_11 = VL_RAND_RESET_Q(64);
    vlSelf->IDStage__DOT__RegFile__DOT__gprFile_12 = VL_RAND_RESET_Q(64);
    vlSelf->IDStage__DOT__RegFile__DOT__gprFile_13 = VL_RAND_RESET_Q(64);
    vlSelf->IDStage__DOT__RegFile__DOT__gprFile_14 = VL_RAND_RESET_Q(64);
    vlSelf->IDStage__DOT__RegFile__DOT__gprFile_15 = VL_RAND_RESET_Q(64);
    vlSelf->IDStage__DOT__RegFile__DOT__gprFile_16 = VL_RAND_RESET_Q(64);
    vlSelf->IDStage__DOT__RegFile__DOT__gprFile_17 = VL_RAND_RESET_Q(64);
    vlSelf->IDStage__DOT__RegFile__DOT__gprFile_18 = VL_RAND_RESET_Q(64);
    vlSelf->IDStage__DOT__RegFile__DOT__gprFile_19 = VL_RAND_RESET_Q(64);
    vlSelf->IDStage__DOT__RegFile__DOT__gprFile_20 = VL_RAND_RESET_Q(64);
    vlSelf->IDStage__DOT__RegFile__DOT__gprFile_21 = VL_RAND_RESET_Q(64);
    vlSelf->IDStage__DOT__RegFile__DOT__gprFile_22 = VL_RAND_RESET_Q(64);
    vlSelf->IDStage__DOT__RegFile__DOT__gprFile_23 = VL_RAND_RESET_Q(64);
    vlSelf->IDStage__DOT__RegFile__DOT__gprFile_24 = VL_RAND_RESET_Q(64);
    vlSelf->IDStage__DOT__RegFile__DOT__gprFile_25 = VL_RAND_RESET_Q(64);
    vlSelf->IDStage__DOT__RegFile__DOT__gprFile_26 = VL_RAND_RESET_Q(64);
    vlSelf->IDStage__DOT__RegFile__DOT__gprFile_27 = VL_RAND_RESET_Q(64);
    vlSelf->IDStage__DOT__RegFile__DOT__gprFile_28 = VL_RAND_RESET_Q(64);
    vlSelf->IDStage__DOT__RegFile__DOT__gprFile_29 = VL_RAND_RESET_Q(64);
    vlSelf->IDStage__DOT__RegFile__DOT__gprFile_30 = VL_RAND_RESET_Q(64);
    vlSelf->IDStage__DOT__RegFile__DOT__gprFile_31 = VL_RAND_RESET_Q(64);
    vlSelf->IDStage__DOT__RegFile__DOT___GEN_26 = VL_RAND_RESET_Q(64);
    vlSelf->IDStage__DOT__RegFile__DOT___GEN_58 = VL_RAND_RESET_Q(64);
    vlSelf->IDStage__DOT__Transfer__DOT___PCADDImm_T_1 = VL_RAND_RESET_Q(64);
    for (int __Vi0=0; __Vi0<3; ++__Vi0) {
        vlSelf->__Vm_traceActivity[__Vi0] = VL_RAND_RESET_I(1);
    }
}
