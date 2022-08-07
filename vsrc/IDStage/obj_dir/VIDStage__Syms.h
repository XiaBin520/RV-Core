// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef VERILATED_VIDSTAGE__SYMS_H_
#define VERILATED_VIDSTAGE__SYMS_H_  // guard

#include "verilated_heavy.h"

// INCLUDE MODEL CLASS

#include "VIDStage.h"

// INCLUDE MODULE CLASSES
#include "VIDStage___024root.h"

// SYMS CLASS (contains all model state)
class VIDStage__Syms final : public VerilatedSyms {
  public:
    // INTERNAL STATE
    VIDStage* const __Vm_modelp;
    bool __Vm_activity = false;  ///< Used by trace routines to determine change occurred
    uint32_t __Vm_baseCode = 0;  ///< Used by trace routines when tracing multiple models
    bool __Vm_didInit = false;

    // MODULE INSTANCE STATE
    VIDStage___024root             TOP;

    // CONSTRUCTORS
    VIDStage__Syms(VerilatedContext* contextp, const char* namep, VIDStage* modelp);
    ~VIDStage__Syms();

    // METHODS
    const char* name() { return TOP.name(); }
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

#endif  // guard
