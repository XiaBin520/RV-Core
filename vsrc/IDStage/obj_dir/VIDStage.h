// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Primary model header
//
// This header should be included by all source files instantiating the design.
// The class here is then constructed to instantiate the design.
// See the Verilator manual for examples.

#ifndef VERILATED_VIDSTAGE_H_
#define VERILATED_VIDSTAGE_H_  // guard

#include "verilated_heavy.h"

class VIDStage__Syms;
class VIDStage___024root;
class VerilatedVcdC;
class VIDStage_VerilatedVcd;


// This class is the main interface to the Verilated model
class VIDStage VL_NOT_FINAL {
  private:
    // Symbol table holding complete model state (owned by this class)
    VIDStage__Syms* const vlSymsp;

  public:

    // PORTS
    // The application code writes and reads these signals to
    // propagate new values into/out from the Verilated model.
    VL_IN8(&clock,0,0);
    VL_IN8(&reset,0,0);
    VL_IN(&io_IF_Instr,31,0);
    VL_IN(&io_IF_PC,31,0);
    VL_OUT8(&io_EX_A_ALUOP,3,0);
    VL_OUT8(&io_EX_A_ALUSrc1Ctrl,2,0);
    VL_OUT8(&io_EX_A_ALUSrc2Ctrl,2,0);
    VL_OUT8(&io_EX_A_WordALUEn,0,0);
    VL_OUT8(&io_EX_A_WordALUOP,2,0);
    VL_OUT8(&io_EX_B_MEMREn,0,0);
    VL_OUT8(&io_EX_B_MEMRCtrl,2,0);
    VL_OUT8(&io_EX_B_MEMWEn,0,0);
    VL_OUT8(&io_EX_B_MEMWCtrl,2,0);
    VL_OUT8(&io_EX_C_RegWEn,0,0);
    VL_OUT8(&io_EX_C_RegWSrc,1,0);
    VL_OUT8(&io_EX_C_Rd,4,0);
    VL_OUT8(&io_EX_D_Rs1REn,0,0);
    VL_OUT8(&io_EX_D_Rs2REn,0,0);
    VL_OUT8(&io_EX_D_Rs1,4,0);
    VL_OUT8(&io_EX_D_Rs2,4,0);
    VL_OUT(&io_EX_E_PC,31,0);
    VL_OUT64(&io_EX_E_Imm,63,0);
    VL_OUT64(&io_EX_E_RData1,63,0);
    VL_OUT64(&io_EX_E_RData2,63,0);
    VL_IN8(&io_WB_RegWEn,0,0);
    VL_IN64(&io_WB_WData,63,0);
    VL_IN8(&io_WB_Rd,4,0);
    VL_OUT(&io_PC_PC,31,0);
    VL_OUT8(&io_HAZARD_JumpEn,0,0);
    VL_IN8(&io_DATAPATH_Rs1Ctrl,1,0);
    VL_IN8(&io_DATAPATH_Rs2Ctrl,1,0);
    VL_IN64(&io_DATAPATH_MEMData,63,0);
    VL_IN64(&io_DATAPATH_WBData,63,0);

    // CELLS
    // Public to allow access to /* verilator public */ items.
    // Otherwise the application code can consider these internals.

    // Root instance pointer to allow access to model internals,
    // including inlined /* verilator public_flat_* */ items.
    VIDStage___024root* const rootp;

    // CONSTRUCTORS
    /// Construct the model; called by application code
    /// If contextp is null, then the model will use the default global context
    /// If name is "", then makes a wrapper with a
    /// single model invisible with respect to DPI scope names.
    explicit VIDStage(VerilatedContext* contextp, const char* name = "TOP");
    explicit VIDStage(const char* name = "TOP");
    /// Destroy the model; called (often implicitly) by application code
    virtual ~VIDStage();
  private:
    VL_UNCOPYABLE(VIDStage);  ///< Copying not allowed

  public:
    // API METHODS
    /// Evaluate the model.  Application must call when inputs change.
    void eval() { eval_step(); }
    /// Evaluate when calling multiple units/models per time step.
    void eval_step();
    /// Evaluate at end of a timestep for tracing, when using eval_step().
    /// Application must call after all eval() and before time changes.
    void eval_end_step() {}
    /// Simulation complete, run final blocks.  Application must call on completion.
    void final();
    /// Trace signals in the model; called by application code
    void trace(VerilatedVcdC* tfp, int levels, int options = 0);
    /// Return current simulation context for this model.
    /// Used to get to e.g. simulation time via contextp()->time()
    VerilatedContext* contextp() const;
    /// Retrieve name of this model instance (as passed to constructor).
    const char* name() const;
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

#endif  // guard
