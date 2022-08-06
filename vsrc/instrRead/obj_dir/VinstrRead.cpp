// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "VinstrRead.h"
#include "VinstrRead__Syms.h"
#include "verilated_vcd_c.h"

//============================================================
// Constructors

VinstrRead::VinstrRead(VerilatedContext* _vcontextp__, const char* _vcname__)
    : vlSymsp{new VinstrRead__Syms(_vcontextp__, _vcname__, this)}
    , clock{vlSymsp->TOP.clock}
    , reset{vlSymsp->TOP.reset}
    , io_instrAddrCore{vlSymsp->TOP.io_instrAddrCore}
    , io_instrCore{vlSymsp->TOP.io_instrCore}
    , io_instrReadEnMEM{vlSymsp->TOP.io_instrReadEnMEM}
    , io_instrAddrMem{vlSymsp->TOP.io_instrAddrMem}
    , io_readInstrByteMEM{vlSymsp->TOP.io_readInstrByteMEM}
    , io_instrValidMem{vlSymsp->TOP.io_instrValidMem}
    , io_instrMEM{vlSymsp->TOP.io_instrMEM}
    , io_instrReadEnCtrl{vlSymsp->TOP.io_instrReadEnCtrl}
    , io_instrReadFinishCtrl{vlSymsp->TOP.io_instrReadFinishCtrl}
    , rootp{&(vlSymsp->TOP)}
{
}

VinstrRead::VinstrRead(const char* _vcname__)
    : VinstrRead(nullptr, _vcname__)
{
}

//============================================================
// Destructor

VinstrRead::~VinstrRead() {
    delete vlSymsp;
}

//============================================================
// Evaluation loop

void VinstrRead___024root___eval_initial(VinstrRead___024root* vlSelf);
void VinstrRead___024root___eval_settle(VinstrRead___024root* vlSelf);
void VinstrRead___024root___eval(VinstrRead___024root* vlSelf);
QData VinstrRead___024root___change_request(VinstrRead___024root* vlSelf);
#ifdef VL_DEBUG
void VinstrRead___024root___eval_debug_assertions(VinstrRead___024root* vlSelf);
#endif  // VL_DEBUG
void VinstrRead___024root___final(VinstrRead___024root* vlSelf);

static void _eval_initial_loop(VinstrRead__Syms* __restrict vlSymsp) {
    vlSymsp->__Vm_didInit = true;
    VinstrRead___024root___eval_initial(&(vlSymsp->TOP));
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    vlSymsp->__Vm_activity = true;
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial loop\n"););
        VinstrRead___024root___eval_settle(&(vlSymsp->TOP));
        VinstrRead___024root___eval(&(vlSymsp->TOP));
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = VinstrRead___024root___change_request(&(vlSymsp->TOP));
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("instrRead.v", 1, "",
                "Verilated model didn't DC converge\n"
                "- See https://verilator.org/warn/DIDNOTCONVERGE");
        } else {
            __Vchange = VinstrRead___024root___change_request(&(vlSymsp->TOP));
        }
    } while (VL_UNLIKELY(__Vchange));
}

void VinstrRead::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate VinstrRead::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    VinstrRead___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    // Initialize
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) _eval_initial_loop(vlSymsp);
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    vlSymsp->__Vm_activity = true;
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Clock loop\n"););
        VinstrRead___024root___eval(&(vlSymsp->TOP));
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = VinstrRead___024root___change_request(&(vlSymsp->TOP));
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("instrRead.v", 1, "",
                "Verilated model didn't converge\n"
                "- See https://verilator.org/warn/DIDNOTCONVERGE");
        } else {
            __Vchange = VinstrRead___024root___change_request(&(vlSymsp->TOP));
        }
    } while (VL_UNLIKELY(__Vchange));
}

//============================================================
// Invoke final blocks

void VinstrRead::final() {
    VinstrRead___024root___final(&(vlSymsp->TOP));
}

//============================================================
// Utilities

VerilatedContext* VinstrRead::contextp() const {
    return vlSymsp->_vm_contextp__;
}

const char* VinstrRead::name() const {
    return vlSymsp->name();
}

//============================================================
// Trace configuration

void VinstrRead___024root__traceInitTop(VinstrRead___024root* vlSelf, VerilatedVcd* tracep);

static void traceInit(void* voidSelf, VerilatedVcd* tracep, uint32_t code) {
    // Callback from tracep->open()
    VinstrRead___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VinstrRead___024root*>(voidSelf);
    VinstrRead__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (!vlSymsp->_vm_contextp__->calcUnusedSigs()) {
        VL_FATAL_MT(__FILE__, __LINE__, __FILE__,
            "Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    }
    vlSymsp->__Vm_baseCode = code;
    tracep->module(vlSymsp->name());
    tracep->scopeEscape(' ');
    VinstrRead___024root__traceInitTop(vlSelf, tracep);
    tracep->scopeEscape('.');
}

void VinstrRead___024root__traceRegister(VinstrRead___024root* vlSelf, VerilatedVcd* tracep);

void VinstrRead::trace(VerilatedVcdC* tfp, int, int) {
    tfp->spTrace()->addInitCb(&traceInit, &(vlSymsp->TOP));
    VinstrRead___024root__traceRegister(&(vlSymsp->TOP), tfp->spTrace());
}
