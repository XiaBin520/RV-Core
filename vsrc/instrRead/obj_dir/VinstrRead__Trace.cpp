// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "VinstrRead__Syms.h"


void VinstrRead___024root__traceChgSub0(VinstrRead___024root* vlSelf, VerilatedVcd* tracep);

void VinstrRead___024root__traceChgTop0(void* voidSelf, VerilatedVcd* tracep) {
    VinstrRead___024root* const __restrict vlSelf = static_cast<VinstrRead___024root*>(voidSelf);
    VinstrRead__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (VL_UNLIKELY(!vlSymsp->__Vm_activity)) return;
    // Body
    {
        VinstrRead___024root__traceChgSub0((&vlSymsp->TOP), tracep);
    }
}

void VinstrRead___024root__traceChgSub0(VinstrRead___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VinstrRead__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    vluint32_t* const oldp = tracep->oldp(vlSymsp->__Vm_baseCode + 1);
    if (false && oldp) {}  // Prevent unused
    // Body
    {
        tracep->chgBit(oldp+0,(vlSelf->clock));
        tracep->chgBit(oldp+1,(vlSelf->reset));
        tracep->chgIData(oldp+2,(vlSelf->io_instrAddrCore),32);
        tracep->chgIData(oldp+3,(vlSelf->io_instrCore),32);
        tracep->chgBit(oldp+4,(vlSelf->io_instrReadEnMEM));
        tracep->chgIData(oldp+5,(vlSelf->io_instrAddrMem),32);
        tracep->chgCData(oldp+6,(vlSelf->io_readInstrByteMEM),2);
        tracep->chgBit(oldp+7,(vlSelf->io_instrValidMem));
        tracep->chgIData(oldp+8,(vlSelf->io_instrMEM),32);
        tracep->chgBit(oldp+9,(vlSelf->io_instrReadEnCtrl));
        tracep->chgBit(oldp+10,(vlSelf->io_instrReadFinishCtrl));
        tracep->chgCData(oldp+11,(vlSelf->instrRead__DOT__stateReg),2);
    }
}

void VinstrRead___024root__traceCleanup(void* voidSelf, VerilatedVcd* /*unused*/) {
    VlUnpacked<CData/*0:0*/, 1> __Vm_traceActivity;
    VinstrRead___024root* const __restrict vlSelf = static_cast<VinstrRead___024root*>(voidSelf);
    VinstrRead__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    {
        vlSymsp->__Vm_activity = false;
        __Vm_traceActivity[0U] = 0U;
    }
}
