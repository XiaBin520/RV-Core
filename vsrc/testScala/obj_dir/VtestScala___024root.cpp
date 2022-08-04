// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VtestScala.h for the primary calling header

#include "VtestScala___024root.h"
#include "VtestScala__Syms.h"

//==========

VL_INLINE_OPT void VtestScala___024root___combo__TOP__1(VtestScala___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VtestScala__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VtestScala___024root___combo__TOP__1\n"); );
    // Body
    vlSelf->io_out = ((2U == (IData)(vlSelf->io_a))
                       ? 9U : ((1U == (IData)(vlSelf->io_a))
                                ? 8U : 3U));
}

void VtestScala___024root___eval(VtestScala___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VtestScala__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VtestScala___024root___eval\n"); );
    // Body
    VtestScala___024root___combo__TOP__1(vlSelf);
}

QData VtestScala___024root___change_request_1(VtestScala___024root* vlSelf);

VL_INLINE_OPT QData VtestScala___024root___change_request(VtestScala___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VtestScala__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VtestScala___024root___change_request\n"); );
    // Body
    return (VtestScala___024root___change_request_1(vlSelf));
}

VL_INLINE_OPT QData VtestScala___024root___change_request_1(VtestScala___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VtestScala__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VtestScala___024root___change_request_1\n"); );
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    return __req;
}

#ifdef VL_DEBUG
void VtestScala___024root___eval_debug_assertions(VtestScala___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VtestScala__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VtestScala___024root___eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((vlSelf->clock & 0xfeU))) {
        Verilated::overWidthError("clock");}
    if (VL_UNLIKELY((vlSelf->reset & 0xfeU))) {
        Verilated::overWidthError("reset");}
    if (VL_UNLIKELY((vlSelf->io_a & 0xf8U))) {
        Verilated::overWidthError("io_a");}
}
#endif  // VL_DEBUG
