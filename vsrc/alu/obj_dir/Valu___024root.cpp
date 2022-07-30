// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Valu.h for the primary calling header

#include "Valu___024root.h"
#include "Valu__Syms.h"

//==========

VL_INLINE_OPT void Valu___024root___combo__TOP__1(Valu___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Valu__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Valu___024root___combo__TOP__1\n"); );
    // Variables
    VlWide<4>/*127:0*/ __Vtemp2;
    VlWide<4>/*127:0*/ __Vtemp3;
    VlWide<4>/*127:0*/ __Vtemp4;
    VlWide<4>/*127:0*/ __Vtemp5;
    VlWide<4>/*127:0*/ __Vtemp6;
    VlWide<4>/*127:0*/ __Vtemp7;
    VlWide<4>/*127:0*/ __Vtemp8;
    VlWide<4>/*127:0*/ __Vtemp9;
    VlWide<4>/*127:0*/ __Vtemp10;
    VlWide<4>/*127:0*/ __Vtemp11;
    // Body
    VL_EXTEND_WQ(127,64, __Vtemp2, (vlSelf->io_aluSrc1 
                                    + vlSelf->io_aluSrc2));
    VL_EXTEND_WQ(127,64, __Vtemp3, (vlSelf->io_aluSrc1 
                                    - vlSelf->io_aluSrc2));
    VL_EXTEND_WI(127,1, __Vtemp4, VL_LTS_IQQ(1,64,64, vlSelf->io_aluSrc1, vlSelf->io_aluSrc2));
    VL_EXTEND_WI(127,1, __Vtemp5, (vlSelf->io_aluSrc1 
                                   < vlSelf->io_aluSrc2));
    VL_EXTEND_WQ(127,64, __Vtemp6, (vlSelf->io_aluSrc1 
                                    ^ vlSelf->io_aluSrc2));
    VL_EXTEND_WQ(127,64, __Vtemp7, (vlSelf->io_aluSrc1 
                                    | vlSelf->io_aluSrc2));
    VL_EXTEND_WQ(127,64, __Vtemp8, (vlSelf->io_aluSrc1 
                                    & vlSelf->io_aluSrc2));
    VL_EXTEND_WQ(127,64, __Vtemp9, vlSelf->io_aluSrc1);
    VL_SHIFTL_WWI(127,127,6, __Vtemp10, __Vtemp9, (0x3fU 
                                                   & (IData)(vlSelf->io_aluSrc2)));
    VL_EXTEND_WQ(127,64, __Vtemp11, ((8U == (IData)(vlSelf->io_aluOP))
                                      ? (vlSelf->io_aluSrc1 
                                         >> (0x3fU 
                                             & (IData)(vlSelf->io_aluSrc2)))
                                      : ((9U == (IData)(vlSelf->io_aluOP))
                                          ? VL_SHIFTRS_QQI(64,64,6, vlSelf->io_aluSrc1, 
                                                           (0x3fU 
                                                            & (IData)(vlSelf->io_aluSrc2)))
                                          : 0ULL)));
    vlSelf->io_aluOut = (((QData)((IData)(((0U == (IData)(vlSelf->io_aluOP))
                                            ? __Vtemp2[1U]
                                            : ((1U 
                                                == (IData)(vlSelf->io_aluOP))
                                                ? __Vtemp3[1U]
                                                : (
                                                   (2U 
                                                    == (IData)(vlSelf->io_aluOP))
                                                    ? 
                                                   __Vtemp4[1U]
                                                    : 
                                                   ((3U 
                                                     == (IData)(vlSelf->io_aluOP))
                                                     ? 
                                                    __Vtemp5[1U]
                                                     : 
                                                    ((4U 
                                                      == (IData)(vlSelf->io_aluOP))
                                                      ? 
                                                     __Vtemp6[1U]
                                                      : 
                                                     ((5U 
                                                       == (IData)(vlSelf->io_aluOP))
                                                       ? 
                                                      __Vtemp7[1U]
                                                       : 
                                                      ((6U 
                                                        == (IData)(vlSelf->io_aluOP))
                                                        ? 
                                                       __Vtemp8[1U]
                                                        : 
                                                       ((7U 
                                                         == (IData)(vlSelf->io_aluOP))
                                                         ? 
                                                        __Vtemp10[1U]
                                                         : 
                                                        __Vtemp11[1U])))))))))) 
                          << 0x20U) | (QData)((IData)(
                                                      ((0U 
                                                        == (IData)(vlSelf->io_aluOP))
                                                        ? 
                                                       __Vtemp2[0U]
                                                        : 
                                                       ((1U 
                                                         == (IData)(vlSelf->io_aluOP))
                                                         ? 
                                                        __Vtemp3[0U]
                                                         : 
                                                        ((2U 
                                                          == (IData)(vlSelf->io_aluOP))
                                                          ? 
                                                         __Vtemp4[0U]
                                                          : 
                                                         ((3U 
                                                           == (IData)(vlSelf->io_aluOP))
                                                           ? 
                                                          __Vtemp5[0U]
                                                           : 
                                                          ((4U 
                                                            == (IData)(vlSelf->io_aluOP))
                                                            ? 
                                                           __Vtemp6[0U]
                                                            : 
                                                           ((5U 
                                                             == (IData)(vlSelf->io_aluOP))
                                                             ? 
                                                            __Vtemp7[0U]
                                                             : 
                                                            ((6U 
                                                              == (IData)(vlSelf->io_aluOP))
                                                              ? 
                                                             __Vtemp8[0U]
                                                              : 
                                                             ((7U 
                                                               == (IData)(vlSelf->io_aluOP))
                                                               ? 
                                                              __Vtemp10[0U]
                                                               : 
                                                              __Vtemp11[0U])))))))))));
}

void Valu___024root___eval(Valu___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Valu__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Valu___024root___eval\n"); );
    // Body
    Valu___024root___combo__TOP__1(vlSelf);
}

QData Valu___024root___change_request_1(Valu___024root* vlSelf);

VL_INLINE_OPT QData Valu___024root___change_request(Valu___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Valu__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Valu___024root___change_request\n"); );
    // Body
    return (Valu___024root___change_request_1(vlSelf));
}

VL_INLINE_OPT QData Valu___024root___change_request_1(Valu___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Valu__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Valu___024root___change_request_1\n"); );
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    return __req;
}

#ifdef VL_DEBUG
void Valu___024root___eval_debug_assertions(Valu___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Valu__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Valu___024root___eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((vlSelf->clock & 0xfeU))) {
        Verilated::overWidthError("clock");}
    if (VL_UNLIKELY((vlSelf->reset & 0xfeU))) {
        Verilated::overWidthError("reset");}
    if (VL_UNLIKELY((vlSelf->io_aluOP & 0xf0U))) {
        Verilated::overWidthError("io_aluOP");}
}
#endif  // VL_DEBUG
