// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "VinstrRead__Syms.h"


void VinstrRead___024root__traceInitSub0(VinstrRead___024root* vlSelf, VerilatedVcd* tracep) VL_ATTR_COLD;

void VinstrRead___024root__traceInitTop(VinstrRead___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VinstrRead__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    {
        VinstrRead___024root__traceInitSub0(vlSelf, tracep);
    }
}

void VinstrRead___024root__traceInitSub0(VinstrRead___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VinstrRead__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    const int c = vlSymsp->__Vm_baseCode;
    if (false && tracep && c) {}  // Prevent unused
    // Body
    {
        tracep->declBit(c+1,"clock", false,-1);
        tracep->declBit(c+2,"reset", false,-1);
        tracep->declBus(c+3,"io_instrAddrCore", false,-1, 31,0);
        tracep->declBus(c+4,"io_instrCore", false,-1, 31,0);
        tracep->declBit(c+5,"io_instrReadEnMEM", false,-1);
        tracep->declBus(c+6,"io_instrAddrMem", false,-1, 31,0);
        tracep->declBus(c+7,"io_readInstrByteMEM", false,-1, 1,0);
        tracep->declBit(c+8,"io_instrValidMem", false,-1);
        tracep->declBus(c+9,"io_instrMEM", false,-1, 31,0);
        tracep->declBit(c+10,"io_instrReadEnCtrl", false,-1);
        tracep->declBit(c+11,"io_instrReadFinishCtrl", false,-1);
        tracep->declBit(c+1,"instrRead clock", false,-1);
        tracep->declBit(c+2,"instrRead reset", false,-1);
        tracep->declBus(c+3,"instrRead io_instrAddrCore", false,-1, 31,0);
        tracep->declBus(c+4,"instrRead io_instrCore", false,-1, 31,0);
        tracep->declBit(c+5,"instrRead io_instrReadEnMEM", false,-1);
        tracep->declBus(c+6,"instrRead io_instrAddrMem", false,-1, 31,0);
        tracep->declBus(c+7,"instrRead io_readInstrByteMEM", false,-1, 1,0);
        tracep->declBit(c+8,"instrRead io_instrValidMem", false,-1);
        tracep->declBus(c+9,"instrRead io_instrMEM", false,-1, 31,0);
        tracep->declBit(c+10,"instrRead io_instrReadEnCtrl", false,-1);
        tracep->declBit(c+11,"instrRead io_instrReadFinishCtrl", false,-1);
        tracep->declBus(c+12,"instrRead stateReg", false,-1, 1,0);
    }
}

void VinstrRead___024root__traceFullTop0(void* voidSelf, VerilatedVcd* tracep) VL_ATTR_COLD;
void VinstrRead___024root__traceChgTop0(void* voidSelf, VerilatedVcd* tracep);
void VinstrRead___024root__traceCleanup(void* voidSelf, VerilatedVcd* /*unused*/);

void VinstrRead___024root__traceRegister(VinstrRead___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VinstrRead__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    {
        tracep->addFullCb(&VinstrRead___024root__traceFullTop0, vlSelf);
        tracep->addChgCb(&VinstrRead___024root__traceChgTop0, vlSelf);
        tracep->addCleanupCb(&VinstrRead___024root__traceCleanup, vlSelf);
    }
}

void VinstrRead___024root__traceFullSub0(VinstrRead___024root* vlSelf, VerilatedVcd* tracep) VL_ATTR_COLD;

void VinstrRead___024root__traceFullTop0(void* voidSelf, VerilatedVcd* tracep) {
    VinstrRead___024root* const __restrict vlSelf = static_cast<VinstrRead___024root*>(voidSelf);
    VinstrRead__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    {
        VinstrRead___024root__traceFullSub0((&vlSymsp->TOP), tracep);
    }
}

void VinstrRead___024root__traceFullSub0(VinstrRead___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VinstrRead__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    vluint32_t* const oldp = tracep->oldp(vlSymsp->__Vm_baseCode);
    if (false && oldp) {}  // Prevent unused
    // Body
    {
        tracep->fullBit(oldp+1,(vlSelf->clock));
        tracep->fullBit(oldp+2,(vlSelf->reset));
        tracep->fullIData(oldp+3,(vlSelf->io_instrAddrCore),32);
        tracep->fullIData(oldp+4,(vlSelf->io_instrCore),32);
        tracep->fullBit(oldp+5,(vlSelf->io_instrReadEnMEM));
        tracep->fullIData(oldp+6,(vlSelf->io_instrAddrMem),32);
        tracep->fullCData(oldp+7,(vlSelf->io_readInstrByteMEM),2);
        tracep->fullBit(oldp+8,(vlSelf->io_instrValidMem));
        tracep->fullIData(oldp+9,(vlSelf->io_instrMEM),32);
        tracep->fullBit(oldp+10,(vlSelf->io_instrReadEnCtrl));
        tracep->fullBit(oldp+11,(vlSelf->io_instrReadFinishCtrl));
        tracep->fullCData(oldp+12,(vlSelf->instrRead__DOT__stateReg),2);
    }
}
