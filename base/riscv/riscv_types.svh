/**
 * @file riscv_types.svh
 * @brief Typedefs for RISC-V ISA instructions
 */

`ifndef _RVT_TYPES_
`define _RVT_TYPES_

/**
 * @enum prvt_lvl_t
 * @brief Enum definition for RISC-V privilege levels
 */
typedef enum logic[1:0] {
  PrvLvlM = 2'b11,
  PrvLvlS = 2'b01,
  PrvLvlU = 2'b00
} prv_lvl_t;

/**
 * @enum opcode_t
 * @brief Enum definition for RISC-V instruction opcodes
 */
typedef enum logic [6:0] {
  OpcodeLoad    = OPCODE_LOAD,
  OpcodeLoadFp  = OPCODE_LOAD_FP,
  OpcodeCustom0 = OPCODE_CUSTOM0,
  OpcodeMiscMem = OPCODE_MISC_MEM,
  OpcodeOpImm   = OPCODE_OP_IMM,
  OpcodeAuipc   = OPCODE_AUIPC,
  OpcodeOpImm32 = OPCODE_OP_IMM32,
  Opcode48      = OPCODE_48,

  OpcodeStore   = OPCODE_STORE,
  OpcodeStoteFp = OPCODE_STORE_FP,
  OpcodeCustom1 = OPCODE_CUSTOM1,
  OpcodeAmo     = OPCODE_AMO,
  OpcodeOp      = OPCODE_OP,
  OpcodeLui     = OPCODE_LUI,
  OpcodeOp32    = OPCODE_OP32,
  Opcode64      = OPCODE_64,

  OpcodeMadd    = OPCODE_MADD,
  OpcodeMsub    = OPCODE_MSUB,
  OpcodeNmsub   = OPCODE_NMSUB,
  OpcodeNmadd   = OPCODE_NMADD,
  OpcodeOpFp    = OPCODE_OP_FP,
  OpcodeOpV     = OPCODE_OP_V,
  OpcodeCustom2 = OPCODE_CUSTOM2,
  Opcode48_     = OPCODE_48_,

  OpcodeBranch   = OPCOED_BRANCH,
  OpcodeJalr     = OPCODE_JALR,
  OpcodeReserved = OPCODE_RESERVED,
  OpcodeJal      = OPCODE_JAL,
  OpcodeSystem   = OPCODE_SYSTEM,
  OpcodeOpVe     = OPCODE_OP_VE,
  OpcodeCustom3  = OPCODE_CUSTOM3,
  Opcode80       = OPCODE_80
} opcode_t;

/**
 * @enum amo_t
 * @brief Enum definition for RISC-V Atomic instructions
 */
typedef enum logic [4:0] {
  AmoLr   = FUNCT5_LR,
  AmoSc   = FUNCT5_SC,
  AmoSwap = FUNCT5_AMOSWAP,
  AmoAdd  = FUNCT5_AMOADD,
  AmoAnd  = FUNCT5_AMOAND,
  AmoOr   = FUNCT5_AMOOR,
  AMOXor  = FUNCT5_AMOXOR,
  AmoMax  = FUNCT5_AMOMAX,
  AmoMaxU = FUNCT5_AMOMAXU,
  AmoMin  = FUNCT5_AMOMIN,
  AmoMinU = FUNCT5_AMOMINU,
  AmoNop  = AMONOP
} amo_t;

/**
 * @struct rtype_t
 * @brief R-Type instruction struct
 *
 *  31----25  24-20   19-15   14-12  11--7    6-----0
 * +--------+-------+-------+------+-------+----------+
 * | funct7 |  rs2  |  rs1  |funct3|  rd   |  opcode  |
 * +--------+-------+-------+------+-------+----------+
 **/
typedef struct packed {
  logic [7:0] funct7;
  logic [4:0] rs2;
  logic [4:0] rs1;
  logic [2:0] funct3;
  logic [4:0] rd;
  opcode_t opcode;
} rtype_t;

/**
 * @struct itype_t
 * @brief I-Type instruction struct
 *
 *  31-----------20   19-15   14-12  11--7    6-----0
 * +--------+-------+-------+------+-------+----------+
 * |    imm[11:0]   |  rs1  |funct3|  rd   |  opcode  |
 * +--------+-------+-------+------+-------+----------+
 */
typedef struct packed {
  logic [11:0] imm;
  logic [4:0] rs1;
  logic [2:0] funct3;
  logic [4:0] rd;
  opcode_t opcode;
} itype_t;

/**
 * @struct stype_t
 * @brief S-Type instruction struct
 *
 *    31----25   24-20   19-15   14-12    11--7    6-----0
 * +-----------+-------+-------+------+----------+----------+
 * | imm[11:5] |  rs2  |  rs1  |funct3| imm[4:0] |  opcode  |
 * +-----------+-------+-------+------+----------+----------+
 */
typedef struct packed {
  logic [6:0] imm2;
  logic [4:0] rs2;
  logic [4:0] rs1;
  logic [2:0] funct3;
  logic [4:0] imm1;
  opcode_t opcode;
} stype_t;

/**
 * @struct utype_t
 * @brief U-Type instruction struct
 *
 *  31---------------------------12  11--7    6-----0
 * +--------+-------+-------+------+-------+----------+
 * |           imm[31:12]          |  rd   |  opcode  |
 * +--------+-------+-------+------+-------+----------+
 */
typedef struct packed {
  logic [19:0] imm;
  logic [4:0] rd;
  opcode_t opcode;
} utype_t;

/**
 * @struct btype_t
 * @brief B-Type instruction struct
 *
 *   31  30-----25 24---20  19-15   14-12  11----8   7    6-----0
 * +----+---------+-------+-------+------+--------+----+----------+
 * |[12]|imm[10:5]|  rs2  |  rs1  |funct3|imm[4:1]|[11]|  opcode  |
 * +----+---------+-------+-------+------+--------+----+----------+
 */
typedef struct packed {
  logic [6:0] imm2;
  logic [4:0] rs2;
  logic [4:0] rs1;
  logic [2:0] funct3;
  logic [4:0] imm1;
  opcode_t opcode;
} btype_t;

/**
 * @struct jtype_t
 * @brief J-Type instruction struct
 *
 *   31   30------21  20  19--------12  11--7    6-----0
 * +----+-----------+----+------------+-------+----------+
 * |[20]| imm[10:1] |[11]| imm[19:12] |  rd   |  opcode  |
 * +----+-----------+----+------------+-------+----------+
 */
typedef struct packed {
  logic [19:0] imm;
  logic [4:0] rd;
  opcode_t opcode;
} jtype_t;

/**
 * @struct atype_t
 * @brief A-Type instruction struct
 *
 *  A-Type -> ATOMIC MEMORY OPERATIONS
 *  31--27 26 25  24-20   19-15   14-12  11--7    6-----0
 * +------+--+--+-------+-------+------+-------+----------+
 * |funct5|aq|rl|  rs2  |  rs1  |funct3|  rd   |  opcode  |
 * +------+--+--+-------+-------+------+-------+----------+
 */
typedef struct packed {
  amo_t amo;
  logic aq;
  logic rl;
  logic [4:0] rs2;
  logic [4:0] rs1;
  logic [2:0] funct3;
  logic [4:0] rd;
  opcode_t opcode;
} atype_t;

/**
 * @struct ftype_t
 * @brief F-Type instruction struct
 *
 *  F-Type -> FLOATING POINT OPERATIONS
 *  31--27 26-25  24-20   19-15   14-12  11--7    6-----0
 * +------+--+--+-------+-------+------+-------+----------+
 * |funct5| fmt |  rs2  |  rs1  |funct3|  rd   |  opcode  |
 * +------+--+--+-------+-------+------+-------+----------+
 */
typedef struct packed {
  fpo_t fpo;
  logic [1:0] fmt;
  logic [4:0] rs2;
  logic [4:0] rs1;
  logic [2:0] funct3;
  logic [4:0] rd;
  opcode_t opcode;
} ftype_t;

/**
 * @struct instr_t
 * @brief RISC-v instruction union
 */
typedef union packed {
  logic [31:0] raw;
  rtype_t      rtype;
  itype_t      itype;
  stype_t      stype;
  utype_t      utype;
  btype_t      btype;
  jtype_t      jtype;
  atype_t      atype;
  ftype_t      ftype;
} instr_t;

function automatic logic [19:0] sort_jtype_imm (logic [19:0] imm);
  sort_jtype_imm = {imm[19], imm[7:0], imm[8], imm[18:9]};
endfunction

function automatic logic [19:0] sort_btype_imm (btype_t instr);
  sort_btype_imm = {instr.imm2[6], instr.imm1[0], instr.imm2[5:0], instr.imm1[4:1]};
endfunction

function automatic logic [12:0] sort_stype_imm (stype_t instr);
  sort_stype_imm = {instr.imm2, instr.imm1};
endfunction

typedef enum int {
  RVExtUnknown,
  RVExtI, // Base Integer Instruction Set
  RvExtE, // Base Integer Instruction Set (embedded)
  RvExtM, // Standard Extension for Atomic Instructions
  RvExtA, // Standard Extension for Atomic Instructions
  RvExtB, // Standard Extension for Bit Manipulation
  RvExtC, // Standard Extension for Compressed Instructions
  RvExtD, // Standard Extension for Double-Precision Floating-Point
  RvExtF, // Standard Extension for Single-Precision Floating-Point
  RvExtG, // Shorthand for the base and above extensions, G = IMAFD
  RvExtH, // Standard Extension for Hypervisor
  RvExtJ, // Standard Extension for Dynamically Translated Languages
  RvExtL, // Standard Extension for Decimal Floating-Point
  RvExtN, // Standard Extension for User-Level Interrupts
  RvExtP, // Standard Extension for Packed-SIMD Instructions
  RvExtQ, // Standard Extension for Quad-Precision Floating-Point
  RvExtS, // Standard Extension for Supervisor-level Instructions
  RvExtT, // Standard Extension for Transactional Memory
  RvExtV,  // Standard Extension for Vector Operations
  RvExtZfh,
  RvExtZawrs
} rv_ext_t;

typedef enum int{
  FormatUnknown,
  FormatR,
  FormatI,
  FormatS,
  FormatU,
  FormatB,
  FormatJ,
  FormatA,
  FormatF
} format_t;

typedef enum int{
  //I-Extension
  LUI, AUIPC, JAL, JALR, BEQ, BNE, BLT, BGE, BLTU, BGEU, LB, LH, LW, LBU, LHU, SB, SH, SW, ADDI,
  SLTI, SLTIU, XORI, ORI, ANDI, SLLI, SRLI, SRAI, ADD, SUB, SLL, SLT, SLTU, XOR, SRL, SRA, OR,
  AND, FENCE, FENCE_TSO, PAUSE, ECALL, EBREAK, LWU, LD, SD, ADDIW, SLLIW,
  SRLIW, SRAIW, ADDW, SUBW, SLLW, SRLW, SRAW,
  //M-Extension
  MUL, MULH, MULHSU, MULHU, DIV, DIVU, REM, REMU, MULW, DIVW, DIVUW, REMW, REMUW,
  //A-Extension
  LR_W, SC_W, AMOSWAP_W, AMOADD_W, AMOXOR_W, AMOAND_W, AMOOR_W,
  AMOMIN_W, AMOMAX_W, AMOMINU_W, AMOMAXU_W, LR_D, SC_D, AMOSWAP_D, AMOADD_D, AMOXOR_D, AMOAND_D,
  AMOOR_D, AMOMIN_D, AMOMAX_D, AMOMINU_D, AMOMAXU_D,
  //D-Extension
  FLD, FSD, FMADD_D, FMSUB_D, FNMSUB_D, FNMADD_D, FADD_D, FSUB_D, FMUL_D, FDIV_D, FSQRT_D,
  FSGNJ_D, FSGNJN_D, FSGNJX_D, FMIN_D, FMAX_D, FCVT_S_D, FCVT_D_S, FEQ_D, FLT_D, FLE_D,
  FCLASS_D, FCVT_W_D, FCVT_WU_D, FCVT_D_W, FCVT_D_WU, FCVT_L_D, FCVT_LU_D, FMV_X_D, FCVT_D_L,
  FCVT_D_LU, FMV_D_X,
  //F-Extension
  FLW, FSW, FMADD_S, FMSUB_S, FNMSUB_S, FNMADD_S, FADD_S, FSUB_S, FMUL_S, FDIV_S, FSQRT_S,
  FSGNJ_S, FSGNJN_S, FSGNJX_S, FMIN_S, FMAX_S, FCVT_W_S, FCVT_WU_S, FMV_X_W, FEQ_S, FLT_S,
  FLE_S, FCLASS_S, FCVT_S_W, FCVT_S_WU, FMV_W_X, FCVT_L_S, FCVT_LU_S, FCVT_S_L, FCVT_S_LU,
  //Q-Extension
  FLQ, FSQ, FMADD_Q, FMSUB_Q, FNMSUB_Q, FNMADD_Q, FADD_Q, FSUB_Q, FMUL_Q, FDIV_Q, FSQRT_Q,
  FSGNJ_Q, FSGNJN_Q, FSGNJX_Q, FMIN_Q, FMAX_Q, FCVT_S_Q, FCVT_Q_S, FCVT_D_Q, FCVT_Q_D, FEQ_Q,
  FLT_Q, FLE_Q, FCLASS_Q, FCVT_W_Q, FCVT_WU_Q, FCVT_Q_W, FCVT_Q_WU, FCVT_L_Q, FCVT_LU_Q,
  FCVT_Q_L, FCVT_Q_LU,
  //Zfh-Extension
  FLH, FSH, FMADD_H, FMSUB_H, FNMSUB_H, FNMADD_H, FADD_H, FSUB_H, FMUL_H, FDIV_H, FSQRT_H,
  FSGNJ_H, FSGNJN_H, FSGNJX_H, FMIN_H, FMAX_H, FCVT_S_H, FCVT_H_S, FCVT_D_H, FCVT_H_D, FCVT_Q_H,
  FCVT_H_Q, FEQ_H, FLT_H, FLE_H, FCLASS_H, FCVT_W_H, FCVT_WU_H, FMV_X_H, FCVT_H_W, FCVT_H_WU,
  FMV_H_X, FCVT_L_H, FCVT_LU_H, FCVT_H_L, FCVT_H_LU,
  //Zawrs-Extension
  WRS_NTO, WRS_STO
} asm_t;

`endif //_RVT_TYPES_
