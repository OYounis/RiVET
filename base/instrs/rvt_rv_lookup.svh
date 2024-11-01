/********************************************************************
 * Class: rvt_rv_lookup
 * RISC-V look up data base. Extends <rvt_obj>.
 * This class provides high level correlation information useful
 * for randomisation, and obtaining info related to the instruction
********************************************************************/
virtual class rvt_rv_lookup extends rvt_obj;
  const static asm_t ASM_BY_FORMAT [format_t][$] = '{
    FormatR : {
      ADD, ADDW, AND, OR, SLL, SLLW, SLT, SLTU, SRA, SRAW, SRL, SRLW, SUB, SUBW, XOR,
      MUL, MULH, MULHSU, MULHU, DIV, DIVU, REM, REMU, MULW, DIVW, DIVUW, REMW, REMUW
    },

    FormatI : {
      ADDIW, SLLIW, SRLIW, SRAIW,  SLLI, SRLI, SRAI, ORI, XORI, SLTI, SLTIU, ANDI, ADDI,
      LB, LH, LW, LBU, LHU, LWU, LD, FENCE, FENCE_TSO, ECALL, EBREAK, PAUSE,
      FLD, FLW, FLQ, FLH, WRS_NTO, WRS_STO
    },

    FormatS : {SB, SH, SW, SD, FSD, FSW, FSQ, FSH},

    FormatU : {LUI, AUIPC},

    FormatB : {BEQ, BNE, BLT, BGE, BLTU, BGEU},

    FormatJ : {JAL, JALR},

    FormatA : {
      LR_W, SC_W, AMOSWAP_W, AMOADD_W, AMOXOR_W, AMOAND_W, AMOOR_W, AMOMIN_W, AMOMAX_W, AMOMINU_W,
      AMOMAXU_W, LR_D, SC_D, AMOSWAP_D, AMOADD_D, AMOXOR_D, AMOAND_D,
      AMOOR_D, AMOMIN_D, AMOMAX_D, AMOMINU_D, AMOMAXU_D
    },

    FormatF : {
      //D-Extension
      FMADD_D, FMSUB_D, FNMSUB_D, FNMADD_D, FADD_D, FSUB_D, FMUL_D, FDIV_D, FSQRT_D,
      FSGNJ_D, FSGNJN_D, FSGNJX_D, FMIN_D, FMAX_D, FCVT_S_D, FCVT_D_S, FEQ_D, FLT_D, FLE_D,
      FCLASS_D, FCVT_W_D, FCVT_WU_D, FCVT_D_W, FCVT_D_WU, FCVT_L_D, FCVT_LU_D, FMV_X_D, FCVT_D_L,
      FCVT_D_LU, FMV_D_X,
      //F-Extension
      FMADD_S, FMSUB_S, FNMSUB_S, FNMADD_S, FADD_S, FSUB_S, FMUL_S, FDIV_S, FSQRT_S,
      FSGNJ_S, FSGNJN_S, FSGNJX_S, FMIN_S, FMAX_S, FCVT_W_S, FCVT_WU_S, FMV_X_W, FEQ_S, FLT_S,
      FLE_S, FCLASS_S, FCVT_S_W, FCVT_S_WU, FMV_W_X, FCVT_L_S, FCVT_LU_S, FCVT_S_L, FCVT_S_LU,
      //Q-Extension
      FMADD_Q, FMSUB_Q, FNMSUB_Q, FNMADD_Q, FADD_Q, FSUB_Q, FMUL_Q, FDIV_Q, FSQRT_Q,
      FSGNJ_Q, FSGNJN_Q, FSGNJX_Q, FMIN_Q, FMAX_Q, FCVT_S_Q, FCVT_Q_S, FCVT_D_Q, FCVT_Q_D, FEQ_Q,
      FLT_Q, FLE_Q, FCLASS_Q, FCVT_W_Q, FCVT_WU_Q, FCVT_Q_W, FCVT_Q_WU, FCVT_L_Q, FCVT_LU_Q,
      FCVT_Q_L, FCVT_Q_LU,
      //Zawrs-Extension
      FMADD_H, FMSUB_H, FNMSUB_H, FNMADD_H, FADD_H, FSUB_H, FMUL_H, FDIV_H, FSQRT_H,
      FSGNJ_H, FSGNJN_H, FSGNJX_H, FMIN_H, FMAX_H, FCVT_S_H, FCVT_H_S, FCVT_D_H, FCVT_H_D, FCVT_Q_H,
      FCVT_H_Q, FEQ_H, FLT_H, FLE_H, FCLASS_H, FCVT_W_H, FCVT_WU_H, FMV_X_H, FCVT_H_W, FCVT_H_WU,
      FMV_H_X, FCVT_L_H, FCVT_LU_H, FCVT_H_L, FCVT_H_LU
    }
  };

  const static RV64_ASM[$] = {
    LWU, LD, SD, SLLI, SRLI, SRAI, ADDIW, SLLIW, SRLIW, SRAIW, ADDW, SUBW, SLLW, SRLW, SRAW,
    MULW, DIVW, DIVUW, REMW, REMUW, LR_D, SC_D, AMOSWAP_D, AMOADD_D, AMOXOR_D, AMOAND_D, AMOOR_D,
    AMOMIN_D, AMOMAX_D, AMOMINU_D, AMOMAXU_D, FCVT_L_S, FCVT_LU_S, FCVT_S_L, FCVT_S_LU,
    FCVT_L_D, FCVT_LU_D, FMV_X_D, FCVT_D_L, FCVT_D_LU, FMV_D_X, FCVT_L_Q, FCVT_LU_Q, FCVT_Q_L,
    FCVT_Q_LU, FCVT_L_H, FCVT_LU_H, FCVT_H_L, FCVT_H_LU
  };

  const static asm_t ASM_BY_EXT [rv_ext_t][$] = '{
    RVExtI : {
      LUI, AUIPC, JAL, JALR, BEQ, BNE, BLT, BGE, BLTU, BGEU, LB, LH, LW, LBU, LHU, SB, SH, SW, ADDI,
      SLTI, SLTIU, XORI, ORI, ANDI, SLLI, SRLI, SRAI, ADD, SUB, SLL, SLT, SLTU, XOR, SRL, SRA, OR,
      AND, FENCE, FENCE_TSO, PAUSE, ECALL, EBREAK, LWU, LD, SD, ADDIW, SLLIW,
      SRLIW, SRAIW, ADDW, SUBW, SLLW, SRLW, SRAW
    },

    RvExtM : {MUL, MULH, MULHSU, MULHU, DIV, DIVU, REM, REMU, MULW, DIVW, DIVUW, REMW, REMUW},

    RvExtA : {
      LR_W, SC_W, AMOSWAP_W, AMOADD_W, AMOXOR_W, AMOAND_W, AMOOR_W, AMOMIN_W, AMOMAX_W, AMOMINU_W,
      AMOMAXU_W, LR_D, SC_D, AMOSWAP_D, AMOADD_D, AMOXOR_D, AMOAND_D, AMOOR_D, AMOMIN_D, AMOMAX_D,
      AMOMINU_D, AMOMAXU_D
    },

    RvExtD : {
      FLD, FSD, FMADD_D, FMSUB_D, FNMSUB_D, FNMADD_D, FADD_D, FSUB_D, FMUL_D, FDIV_D, FSQRT_D,
      FSGNJ_D, FSGNJN_D, FSGNJX_D, FMIN_D, FMAX_D, FCVT_S_D, FCVT_D_S, FEQ_D, FLT_D, FLE_D,
      FCLASS_D, FCVT_W_D, FCVT_WU_D, FCVT_D_W, FCVT_D_WU, FCVT_L_D, FCVT_LU_D, FMV_X_D, FCVT_D_L,
      FCVT_D_LU, FMV_D_X
    },

    RvExtF : {
      FLW, FSW, FMADD_S, FMSUB_S, FNMSUB_S, FNMADD_S, FADD_S, FSUB_S, FMUL_S, FDIV_S, FSQRT_S,
      FSGNJ_S, FSGNJN_S, FSGNJX_S, FMIN_S, FMAX_S, FCVT_W_S, FCVT_WU_S, FMV_X_W, FEQ_S, FLT_S,
      FLE_S, FCLASS_S, FCVT_S_W, FCVT_S_WU, FMV_W_X, FCVT_L_S, FCVT_LU_S, FCVT_S_L, FCVT_S_LU
    },

    RvExtQ : {
      FLQ, FSQ, FMADD_Q, FMSUB_Q, FNMSUB_Q, FNMADD_Q, FADD_Q, FSUB_Q, FMUL_Q, FDIV_Q, FSQRT_Q,
      FSGNJ_Q, FSGNJN_Q, FSGNJX_Q, FMIN_Q, FMAX_Q, FCVT_S_Q, FCVT_Q_S, FCVT_D_Q, FCVT_Q_D, FEQ_Q,
      FLT_Q, FLE_Q, FCLASS_Q, FCVT_W_Q, FCVT_WU_Q, FCVT_Q_W, FCVT_Q_WU, FCVT_L_Q, FCVT_LU_Q,
      FCVT_Q_L, FCVT_Q_LU
    },

    RvExtZfh : {
      FLH, FSH, FMADD_H, FMSUB_H, FNMSUB_H, FNMADD_H, FADD_H, FSUB_H, FMUL_H, FDIV_H, FSQRT_H,
      FSGNJ_H, FSGNJN_H, FSGNJX_H, FMIN_H, FMAX_H, FCVT_S_H, FCVT_H_S, FCVT_D_H, FCVT_H_D, FCVT_Q_H,
      FCVT_H_Q, FEQ_H, FLT_H, FLE_H, FCLASS_H, FCVT_W_H, FCVT_WU_H, FMV_X_H, FCVT_H_W, FCVT_H_WU,
      FMV_H_X, FCVT_L_H, FCVT_LU_H, FCVT_H_L, FCVT_H_LU
    },

    RvExtZawrs : {WRS_NTO, WRS_STO},

    RvExtB : '{},
    RvExtC : '{},
    RvExtG : '{},
    RvExtH : '{},
    RvExtJ : '{},
    RvExtL : '{},
    RvExtN : '{},
    RvExtP : '{},
    RvExtS : '{},
    RvExtT : '{},
    RvExtV : '{}
  };

  static virtual function format_t getFormatFromAsm(asm_t asm);
    foreach (ASM_BY_FORMAT[key]) begin
      if(asm inside {ASM_BY_FORMAT[key]}) return key;
    end
  endfunction : getFormatFromAsm

  static virtual function is64bAsm(asm_t asm);
    return (asm inside {RV64_ASM});
  endfunction

endclass : rvt_rv_lookup
