// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VtestScala.h for the primary calling header

#include "VtestScala___024root.h"
#include "VtestScala__Syms.h"

//==========


void VtestScala___024root___ctor_var_reset(VtestScala___024root* vlSelf);

VtestScala___024root::VtestScala___024root(const char* _vcname__)
    : VerilatedModule(_vcname__)
 {
    // Reset structure values
    VtestScala___024root___ctor_var_reset(this);
}

void VtestScala___024root::__Vconfigure(VtestScala__Syms* _vlSymsp, bool first) {
    if (false && first) {}  // Prevent unused
    this->vlSymsp = _vlSymsp;
}

VtestScala___024root::~VtestScala___024root() {
}

void VtestScala___024root___eval_initial(VtestScala___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VtestScala__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VtestScala___024root___eval_initial\n"); );
}

void VtestScala___024root___combo__TOP__1(VtestScala___024root* vlSelf);

void VtestScala___024root___eval_settle(VtestScala___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VtestScala__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VtestScala___024root___eval_settle\n"); );
    // Body
    VtestScala___024root___combo__TOP__1(vlSelf);
}

void VtestScala___024root___final(VtestScala___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VtestScala__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VtestScala___024root___final\n"); );
}

void VtestScala___024root___ctor_var_reset(VtestScala___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VtestScala__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VtestScala___024root___ctor_var_reset\n"); );
    // Body
    vlSelf->clock = VL_RAND_RESET_I(1);
    vlSelf->reset = VL_RAND_RESET_I(1);
    vlSelf->io_a = VL_RAND_RESET_I(3);
    vlSelf->io_out = VL_RAND_RESET_I(4);
}
