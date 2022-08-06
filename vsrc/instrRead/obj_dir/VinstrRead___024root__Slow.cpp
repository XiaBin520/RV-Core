// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VinstrRead.h for the primary calling header

#include "VinstrRead___024root.h"
#include "VinstrRead__Syms.h"

//==========


void VinstrRead___024root___ctor_var_reset(VinstrRead___024root* vlSelf);

VinstrRead___024root::VinstrRead___024root(const char* _vcname__)
    : VerilatedModule(_vcname__)
 {
    // Reset structure values
    VinstrRead___024root___ctor_var_reset(this);
}

void VinstrRead___024root::__Vconfigure(VinstrRead__Syms* _vlSymsp, bool first) {
    if (false && first) {}  // Prevent unused
    this->vlSymsp = _vlSymsp;
}

VinstrRead___024root::~VinstrRead___024root() {
}

void VinstrRead___024root___initial__TOP__1(VinstrRead___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VinstrRead__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VinstrRead___024root___initial__TOP__1\n"); );
    // Body
    vlSelf->io_instrCore = 0x13U;
    vlSelf->io_readInstrByteMEM = 2U;
}

void VinstrRead___024root___settle__TOP__3(VinstrRead___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VinstrRead__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VinstrRead___024root___settle__TOP__3\n"); );
    // Body
    vlSelf->io_instrAddrMem = vlSelf->io_instrAddrCore;
    vlSelf->instrRead__DOT___GEN_2 = ((3U == (IData)(vlSelf->instrRead__DOT__stateReg))
                                       ? 0U : (IData)(vlSelf->instrRead__DOT__stateReg));
    vlSelf->io_instrReadEnMEM = (1U == (IData)(vlSelf->instrRead__DOT__stateReg));
    vlSelf->io_instrReadFinishCtrl = (3U == (IData)(vlSelf->instrRead__DOT__stateReg));
    vlSelf->instrRead__DOT___GEN_1 = ((IData)(vlSelf->io_instrValidMem)
                                       ? 3U : (IData)(vlSelf->instrRead__DOT__stateReg));
}

void VinstrRead___024root___eval_initial(VinstrRead___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VinstrRead__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VinstrRead___024root___eval_initial\n"); );
    // Body
    VinstrRead___024root___initial__TOP__1(vlSelf);
    vlSelf->__Vclklast__TOP__clock = vlSelf->clock;
}

void VinstrRead___024root___eval_settle(VinstrRead___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VinstrRead__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VinstrRead___024root___eval_settle\n"); );
    // Body
    VinstrRead___024root___settle__TOP__3(vlSelf);
}

void VinstrRead___024root___final(VinstrRead___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VinstrRead__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VinstrRead___024root___final\n"); );
}

void VinstrRead___024root___ctor_var_reset(VinstrRead___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VinstrRead__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VinstrRead___024root___ctor_var_reset\n"); );
    // Body
    vlSelf->clock = VL_RAND_RESET_I(1);
    vlSelf->reset = VL_RAND_RESET_I(1);
    vlSelf->io_instrAddrCore = VL_RAND_RESET_I(32);
    vlSelf->io_instrCore = VL_RAND_RESET_I(32);
    vlSelf->io_instrReadEnMEM = VL_RAND_RESET_I(1);
    vlSelf->io_instrAddrMem = VL_RAND_RESET_I(32);
    vlSelf->io_readInstrByteMEM = VL_RAND_RESET_I(2);
    vlSelf->io_instrValidMem = VL_RAND_RESET_I(1);
    vlSelf->io_instrMEM = VL_RAND_RESET_I(32);
    vlSelf->io_instrReadEnCtrl = VL_RAND_RESET_I(1);
    vlSelf->io_instrReadFinishCtrl = VL_RAND_RESET_I(1);
    vlSelf->instrRead__DOT__stateReg = VL_RAND_RESET_I(2);
    vlSelf->instrRead__DOT___GEN_1 = VL_RAND_RESET_I(2);
    vlSelf->instrRead__DOT___GEN_2 = VL_RAND_RESET_I(2);
}
