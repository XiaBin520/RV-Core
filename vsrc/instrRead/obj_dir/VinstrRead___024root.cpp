// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VinstrRead.h for the primary calling header

#include "VinstrRead___024root.h"
#include "VinstrRead__Syms.h"

//==========

VL_INLINE_OPT void VinstrRead___024root___combo__TOP__2(VinstrRead___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VinstrRead__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VinstrRead___024root___combo__TOP__2\n"); );
    // Body
    vlSelf->io_instrAddrMem = vlSelf->io_instrAddrCore;
}

VL_INLINE_OPT void VinstrRead___024root___sequent__TOP__4(VinstrRead___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VinstrRead__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VinstrRead___024root___sequent__TOP__4\n"); );
    // Variables
    CData/*1:0*/ __Vdly__instrRead__DOT__stateReg;
    // Body
    __Vdly__instrRead__DOT__stateReg = vlSelf->instrRead__DOT__stateReg;
    if (vlSelf->reset) {
        __Vdly__instrRead__DOT__stateReg = 0U;
    } else if ((0U == (IData)(vlSelf->instrRead__DOT__stateReg))) {
        if (vlSelf->io_instrReadEnCtrl) {
            __Vdly__instrRead__DOT__stateReg = 1U;
        }
    } else {
        __Vdly__instrRead__DOT__stateReg = ((1U == (IData)(vlSelf->instrRead__DOT__stateReg))
                                             ? 2U : 
                                            ((2U == (IData)(vlSelf->instrRead__DOT__stateReg))
                                              ? (IData)(vlSelf->instrRead__DOT___GEN_1)
                                              : (IData)(vlSelf->instrRead__DOT___GEN_2)));
    }
    vlSelf->instrRead__DOT__stateReg = __Vdly__instrRead__DOT__stateReg;
    vlSelf->instrRead__DOT___GEN_2 = ((3U == (IData)(vlSelf->instrRead__DOT__stateReg))
                                       ? 0U : (IData)(vlSelf->instrRead__DOT__stateReg));
    vlSelf->io_instrReadEnMEM = (1U == (IData)(vlSelf->instrRead__DOT__stateReg));
    vlSelf->io_instrReadFinishCtrl = (3U == (IData)(vlSelf->instrRead__DOT__stateReg));
}

VL_INLINE_OPT void VinstrRead___024root___combo__TOP__5(VinstrRead___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VinstrRead__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VinstrRead___024root___combo__TOP__5\n"); );
    // Body
    vlSelf->instrRead__DOT___GEN_1 = ((IData)(vlSelf->io_instrValidMem)
                                       ? 3U : (IData)(vlSelf->instrRead__DOT__stateReg));
}

void VinstrRead___024root___eval(VinstrRead___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VinstrRead__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VinstrRead___024root___eval\n"); );
    // Body
    VinstrRead___024root___combo__TOP__2(vlSelf);
    if (((IData)(vlSelf->clock) & (~ (IData)(vlSelf->__Vclklast__TOP__clock)))) {
        VinstrRead___024root___sequent__TOP__4(vlSelf);
    }
    VinstrRead___024root___combo__TOP__5(vlSelf);
    // Final
    vlSelf->__Vclklast__TOP__clock = vlSelf->clock;
}

QData VinstrRead___024root___change_request_1(VinstrRead___024root* vlSelf);

VL_INLINE_OPT QData VinstrRead___024root___change_request(VinstrRead___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VinstrRead__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VinstrRead___024root___change_request\n"); );
    // Body
    return (VinstrRead___024root___change_request_1(vlSelf));
}

VL_INLINE_OPT QData VinstrRead___024root___change_request_1(VinstrRead___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VinstrRead__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VinstrRead___024root___change_request_1\n"); );
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    return __req;
}

#ifdef VL_DEBUG
void VinstrRead___024root___eval_debug_assertions(VinstrRead___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VinstrRead__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VinstrRead___024root___eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((vlSelf->clock & 0xfeU))) {
        Verilated::overWidthError("clock");}
    if (VL_UNLIKELY((vlSelf->reset & 0xfeU))) {
        Verilated::overWidthError("reset");}
    if (VL_UNLIKELY((vlSelf->io_instrValidMem & 0xfeU))) {
        Verilated::overWidthError("io_instrValidMem");}
    if (VL_UNLIKELY((vlSelf->io_instrReadEnCtrl & 0xfeU))) {
        Verilated::overWidthError("io_instrReadEnCtrl");}
}
#endif  // VL_DEBUG
