// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "VtestScala__Syms.h"


void VtestScala___024root__traceInitSub0(VtestScala___024root* vlSelf, VerilatedVcd* tracep) VL_ATTR_COLD;

void VtestScala___024root__traceInitTop(VtestScala___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VtestScala__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    {
        VtestScala___024root__traceInitSub0(vlSelf, tracep);
    }
}

void VtestScala___024root__traceInitSub0(VtestScala___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VtestScala__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    const int c = vlSymsp->__Vm_baseCode;
    if (false && tracep && c) {}  // Prevent unused
    // Body
    {
        tracep->declBit(c+1,"clock", false,-1);
        tracep->declBit(c+2,"reset", false,-1);
        tracep->declBus(c+3,"io_a", false,-1, 2,0);
        tracep->declBus(c+4,"io_out", false,-1, 3,0);
        tracep->declBit(c+1,"testScala clock", false,-1);
        tracep->declBit(c+2,"testScala reset", false,-1);
        tracep->declBus(c+3,"testScala io_a", false,-1, 2,0);
        tracep->declBus(c+4,"testScala io_out", false,-1, 3,0);
    }
}

void VtestScala___024root__traceFullTop0(void* voidSelf, VerilatedVcd* tracep) VL_ATTR_COLD;
void VtestScala___024root__traceChgTop0(void* voidSelf, VerilatedVcd* tracep);
void VtestScala___024root__traceCleanup(void* voidSelf, VerilatedVcd* /*unused*/);

void VtestScala___024root__traceRegister(VtestScala___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VtestScala__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    {
        tracep->addFullCb(&VtestScala___024root__traceFullTop0, vlSelf);
        tracep->addChgCb(&VtestScala___024root__traceChgTop0, vlSelf);
        tracep->addCleanupCb(&VtestScala___024root__traceCleanup, vlSelf);
    }
}

void VtestScala___024root__traceFullSub0(VtestScala___024root* vlSelf, VerilatedVcd* tracep) VL_ATTR_COLD;

void VtestScala___024root__traceFullTop0(void* voidSelf, VerilatedVcd* tracep) {
    VtestScala___024root* const __restrict vlSelf = static_cast<VtestScala___024root*>(voidSelf);
    VtestScala__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    {
        VtestScala___024root__traceFullSub0((&vlSymsp->TOP), tracep);
    }
}

void VtestScala___024root__traceFullSub0(VtestScala___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VtestScala__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    vluint32_t* const oldp = tracep->oldp(vlSymsp->__Vm_baseCode);
    if (false && oldp) {}  // Prevent unused
    // Body
    {
        tracep->fullBit(oldp+1,(vlSelf->clock));
        tracep->fullBit(oldp+2,(vlSelf->reset));
        tracep->fullCData(oldp+3,(vlSelf->io_a),3);
        tracep->fullCData(oldp+4,(vlSelf->io_out),4);
    }
}
