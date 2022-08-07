// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "VIDStage.h"
#include "VIDStage__Syms.h"
#include "verilated_vcd_c.h"

//============================================================
// Constructors

VIDStage::VIDStage(VerilatedContext* _vcontextp__, const char* _vcname__)
    : vlSymsp{new VIDStage__Syms(_vcontextp__, _vcname__, this)}
    , clock{vlSymsp->TOP.clock}
    , reset{vlSymsp->TOP.reset}
    , io_IF_Instr{vlSymsp->TOP.io_IF_Instr}
    , io_IF_PC{vlSymsp->TOP.io_IF_PC}
    , io_EX_A_ALUOP{vlSymsp->TOP.io_EX_A_ALUOP}
    , io_EX_A_ALUSrc1Ctrl{vlSymsp->TOP.io_EX_A_ALUSrc1Ctrl}
    , io_EX_A_ALUSrc2Ctrl{vlSymsp->TOP.io_EX_A_ALUSrc2Ctrl}
    , io_EX_A_WordALUEn{vlSymsp->TOP.io_EX_A_WordALUEn}
    , io_EX_A_WordALUOP{vlSymsp->TOP.io_EX_A_WordALUOP}
    , io_EX_B_MEMREn{vlSymsp->TOP.io_EX_B_MEMREn}
    , io_EX_B_MEMRCtrl{vlSymsp->TOP.io_EX_B_MEMRCtrl}
    , io_EX_B_MEMWEn{vlSymsp->TOP.io_EX_B_MEMWEn}
    , io_EX_B_MEMWCtrl{vlSymsp->TOP.io_EX_B_MEMWCtrl}
    , io_EX_C_RegWEn{vlSymsp->TOP.io_EX_C_RegWEn}
    , io_EX_C_RegWSrc{vlSymsp->TOP.io_EX_C_RegWSrc}
    , io_EX_C_Rd{vlSymsp->TOP.io_EX_C_Rd}
    , io_EX_D_Rs1REn{vlSymsp->TOP.io_EX_D_Rs1REn}
    , io_EX_D_Rs2REn{vlSymsp->TOP.io_EX_D_Rs2REn}
    , io_EX_D_Rs1{vlSymsp->TOP.io_EX_D_Rs1}
    , io_EX_D_Rs2{vlSymsp->TOP.io_EX_D_Rs2}
    , io_EX_E_PC{vlSymsp->TOP.io_EX_E_PC}
    , io_EX_E_Imm{vlSymsp->TOP.io_EX_E_Imm}
    , io_EX_E_RData1{vlSymsp->TOP.io_EX_E_RData1}
    , io_EX_E_RData2{vlSymsp->TOP.io_EX_E_RData2}
    , io_WB_RegWEn{vlSymsp->TOP.io_WB_RegWEn}
    , io_WB_WData{vlSymsp->TOP.io_WB_WData}
    , io_WB_Rd{vlSymsp->TOP.io_WB_Rd}
    , io_PC_PC{vlSymsp->TOP.io_PC_PC}
    , io_HAZARD_JumpEn{vlSymsp->TOP.io_HAZARD_JumpEn}
    , io_DATAPATH_Rs1Ctrl{vlSymsp->TOP.io_DATAPATH_Rs1Ctrl}
    , io_DATAPATH_Rs2Ctrl{vlSymsp->TOP.io_DATAPATH_Rs2Ctrl}
    , io_DATAPATH_MEMData{vlSymsp->TOP.io_DATAPATH_MEMData}
    , io_DATAPATH_WBData{vlSymsp->TOP.io_DATAPATH_WBData}
    , rootp{&(vlSymsp->TOP)}
{
}

VIDStage::VIDStage(const char* _vcname__)
    : VIDStage(nullptr, _vcname__)
{
}

//============================================================
// Destructor

VIDStage::~VIDStage() {
    delete vlSymsp;
}

//============================================================
// Evaluation loop

void VIDStage___024root___eval_initial(VIDStage___024root* vlSelf);
void VIDStage___024root___eval_settle(VIDStage___024root* vlSelf);
void VIDStage___024root___eval(VIDStage___024root* vlSelf);
QData VIDStage___024root___change_request(VIDStage___024root* vlSelf);
#ifdef VL_DEBUG
void VIDStage___024root___eval_debug_assertions(VIDStage___024root* vlSelf);
#endif  // VL_DEBUG
void VIDStage___024root___final(VIDStage___024root* vlSelf);

static void _eval_initial_loop(VIDStage__Syms* __restrict vlSymsp) {
    vlSymsp->__Vm_didInit = true;
    VIDStage___024root___eval_initial(&(vlSymsp->TOP));
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    vlSymsp->__Vm_activity = true;
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial loop\n"););
        VIDStage___024root___eval_settle(&(vlSymsp->TOP));
        VIDStage___024root___eval(&(vlSymsp->TOP));
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = VIDStage___024root___change_request(&(vlSymsp->TOP));
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("IDStage.v", 750, "",
                "Verilated model didn't DC converge\n"
                "- See https://verilator.org/warn/DIDNOTCONVERGE");
        } else {
            __Vchange = VIDStage___024root___change_request(&(vlSymsp->TOP));
        }
    } while (VL_UNLIKELY(__Vchange));
}

void VIDStage::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate VIDStage::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    VIDStage___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    // Initialize
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) _eval_initial_loop(vlSymsp);
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    vlSymsp->__Vm_activity = true;
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Clock loop\n"););
        VIDStage___024root___eval(&(vlSymsp->TOP));
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = VIDStage___024root___change_request(&(vlSymsp->TOP));
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("IDStage.v", 750, "",
                "Verilated model didn't converge\n"
                "- See https://verilator.org/warn/DIDNOTCONVERGE");
        } else {
            __Vchange = VIDStage___024root___change_request(&(vlSymsp->TOP));
        }
    } while (VL_UNLIKELY(__Vchange));
}

//============================================================
// Invoke final blocks

void VIDStage::final() {
    VIDStage___024root___final(&(vlSymsp->TOP));
}

//============================================================
// Utilities

VerilatedContext* VIDStage::contextp() const {
    return vlSymsp->_vm_contextp__;
}

const char* VIDStage::name() const {
    return vlSymsp->name();
}

//============================================================
// Trace configuration

void VIDStage___024root__traceInitTop(VIDStage___024root* vlSelf, VerilatedVcd* tracep);

static void traceInit(void* voidSelf, VerilatedVcd* tracep, uint32_t code) {
    // Callback from tracep->open()
    VIDStage___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VIDStage___024root*>(voidSelf);
    VIDStage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (!vlSymsp->_vm_contextp__->calcUnusedSigs()) {
        VL_FATAL_MT(__FILE__, __LINE__, __FILE__,
            "Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    }
    vlSymsp->__Vm_baseCode = code;
    tracep->module(vlSymsp->name());
    tracep->scopeEscape(' ');
    VIDStage___024root__traceInitTop(vlSelf, tracep);
    tracep->scopeEscape('.');
}

void VIDStage___024root__traceRegister(VIDStage___024root* vlSelf, VerilatedVcd* tracep);

void VIDStage::trace(VerilatedVcdC* tfp, int, int) {
    tfp->spTrace()->addInitCb(&traceInit, &(vlSymsp->TOP));
    VIDStage___024root__traceRegister(&(vlSymsp->TOP), tfp->spTrace());
}
