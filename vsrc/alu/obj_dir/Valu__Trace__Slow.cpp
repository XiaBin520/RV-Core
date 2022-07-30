// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Valu__Syms.h"


void Valu___024root__traceInitSub0(Valu___024root* vlSelf, VerilatedVcd* tracep) VL_ATTR_COLD;

void Valu___024root__traceInitTop(Valu___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    Valu__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    {
        Valu___024root__traceInitSub0(vlSelf, tracep);
    }
}

void Valu___024root__traceInitSub0(Valu___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    Valu__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    const int c = vlSymsp->__Vm_baseCode;
    if (false && tracep && c) {}  // Prevent unused
    // Body
    {
        tracep->declBit(c+1,"clock", false,-1);
        tracep->declBit(c+2,"reset", false,-1);
        tracep->declBus(c+3,"io_aluOP", false,-1, 3,0);
        tracep->declQuad(c+4,"io_aluSrc1", false,-1, 63,0);
        tracep->declQuad(c+6,"io_aluSrc2", false,-1, 63,0);
        tracep->declQuad(c+8,"io_aluOut", false,-1, 63,0);
        tracep->declBit(c+1,"alu clock", false,-1);
        tracep->declBit(c+2,"alu reset", false,-1);
        tracep->declBus(c+3,"alu io_aluOP", false,-1, 3,0);
        tracep->declQuad(c+4,"alu io_aluSrc1", false,-1, 63,0);
        tracep->declQuad(c+6,"alu io_aluSrc2", false,-1, 63,0);
        tracep->declQuad(c+8,"alu io_aluOut", false,-1, 63,0);
        tracep->declBus(c+10,"alu shiftNum", false,-1, 5,0);
    }
}

void Valu___024root__traceFullTop0(void* voidSelf, VerilatedVcd* tracep) VL_ATTR_COLD;
void Valu___024root__traceChgTop0(void* voidSelf, VerilatedVcd* tracep);
void Valu___024root__traceCleanup(void* voidSelf, VerilatedVcd* /*unused*/);

void Valu___024root__traceRegister(Valu___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    Valu__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    {
        tracep->addFullCb(&Valu___024root__traceFullTop0, vlSelf);
        tracep->addChgCb(&Valu___024root__traceChgTop0, vlSelf);
        tracep->addCleanupCb(&Valu___024root__traceCleanup, vlSelf);
    }
}

void Valu___024root__traceFullSub0(Valu___024root* vlSelf, VerilatedVcd* tracep) VL_ATTR_COLD;

void Valu___024root__traceFullTop0(void* voidSelf, VerilatedVcd* tracep) {
    Valu___024root* const __restrict vlSelf = static_cast<Valu___024root*>(voidSelf);
    Valu__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    {
        Valu___024root__traceFullSub0((&vlSymsp->TOP), tracep);
    }
}

void Valu___024root__traceFullSub0(Valu___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    Valu__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    vluint32_t* const oldp = tracep->oldp(vlSymsp->__Vm_baseCode);
    if (false && oldp) {}  // Prevent unused
    // Body
    {
        tracep->fullBit(oldp+1,(vlSelf->clock));
        tracep->fullBit(oldp+2,(vlSelf->reset));
        tracep->fullCData(oldp+3,(vlSelf->io_aluOP),4);
        tracep->fullQData(oldp+4,(vlSelf->io_aluSrc1),64);
        tracep->fullQData(oldp+6,(vlSelf->io_aluSrc2),64);
        tracep->fullQData(oldp+8,(vlSelf->io_aluOut),64);
        tracep->fullCData(oldp+10,((0x3fU & (IData)(vlSelf->io_aluSrc2))),6);
    }
}
