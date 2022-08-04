// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See VtestScala.h for the primary calling header

#ifndef VERILATED_VTESTSCALA___024ROOT_H_
#define VERILATED_VTESTSCALA___024ROOT_H_  // guard

#include "verilated_heavy.h"

//==========

class VtestScala__Syms;
class VtestScala_VerilatedVcd;


//----------

VL_MODULE(VtestScala___024root) {
  public:

    // PORTS
    VL_IN8(clock,0,0);
    VL_IN8(reset,0,0);
    VL_IN8(io_a,2,0);
    VL_OUT8(io_out,3,0);

    // INTERNAL VARIABLES
    VtestScala__Syms* vlSymsp;  // Symbol table

    // CONSTRUCTORS
  private:
    VL_UNCOPYABLE(VtestScala___024root);  ///< Copying not allowed
  public:
    VtestScala___024root(const char* name);
    ~VtestScala___024root();

    // INTERNAL METHODS
    void __Vconfigure(VtestScala__Syms* symsp, bool first);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

//----------


#endif  // guard
