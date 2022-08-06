// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See VinstrRead.h for the primary calling header

#ifndef VERILATED_VINSTRREAD___024ROOT_H_
#define VERILATED_VINSTRREAD___024ROOT_H_  // guard

#include "verilated_heavy.h"

//==========

class VinstrRead__Syms;
class VinstrRead_VerilatedVcd;


//----------

VL_MODULE(VinstrRead___024root) {
  public:

    // PORTS
    VL_IN8(clock,0,0);
    VL_IN8(reset,0,0);
    VL_OUT8(io_instrReadEnMEM,0,0);
    VL_OUT8(io_readInstrByteMEM,1,0);
    VL_IN8(io_instrValidMem,0,0);
    VL_IN8(io_instrReadEnCtrl,0,0);
    VL_OUT8(io_instrReadFinishCtrl,0,0);
    VL_IN(io_instrAddrCore,31,0);
    VL_OUT(io_instrCore,31,0);
    VL_OUT(io_instrAddrMem,31,0);
    VL_IN(io_instrMEM,31,0);

    // LOCAL SIGNALS
    CData/*1:0*/ instrRead__DOT__stateReg;
    CData/*1:0*/ instrRead__DOT___GEN_1;
    CData/*1:0*/ instrRead__DOT___GEN_2;

    // LOCAL VARIABLES
    CData/*0:0*/ __Vclklast__TOP__clock;

    // INTERNAL VARIABLES
    VinstrRead__Syms* vlSymsp;  // Symbol table

    // CONSTRUCTORS
  private:
    VL_UNCOPYABLE(VinstrRead___024root);  ///< Copying not allowed
  public:
    VinstrRead___024root(const char* name);
    ~VinstrRead___024root();

    // INTERNAL METHODS
    void __Vconfigure(VinstrRead__Syms* symsp, bool first);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

//----------


#endif  // guard
