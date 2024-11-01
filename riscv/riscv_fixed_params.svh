| Extension | Description                         |
|-----------|-------------------------------------|
| A         | Atomic instructions                 |
| B         | Bit manipulation                    |
| C         | Compressed instructions             |
| D         | Double-precision floating-point     |
| F         | Single-precision floating-point     |
| *G*       | *Shorthand for IMAFD extensions*    |
| H         | Hypervisor extension                |
| J         | Dynamically translated languages    |
| L         | Decimal floating-point              |
| M         | Integer multiplication and division |
| N         | User-level interrupts               |
| P         | Packed-SIMD instructions            |
| Q         | Quad-precision floating-point       |
| S         | Supervisor mode                     |
| T         | Transactional memory                |
| V         | Vector operations                   |
//Privilege Levels
parameter logic [1:0] PRV_LVL_M = 2'b11;
parameter logic [1:0] PRV_LVL_S = 2'b01;
parameter logic [1:0] PRV_LVL_U = 2'b00;

//Column1
parameter logic [6:0] OPCODE_LOAD   = 7'b00_000_11;
parameter logic [6:0] OPCODE_STORE  = 7'b01_000_11;
parameter logic [6:0] OPCODE_MADD   = 7'b10_000_11;
parameter logic [6:0] OPCOED_BRANCH = 7'b11_000_11;
//Column2
parameter logic [6:0] OPCODE_LOAD_FP  = 7'b00_001_11;
parameter logic [6:0] OPCODE_STORE_FP = 7'b01_001_11;
parameter logic [6:0] OPCODE_MSUB     = 7'b10_001_11;
parameter logic [6:0] OPCODE_JALR     = 7'b11_001_11;
//Column3
parameter logic [6:0] OPCODE_CUSTOM0  = 7'b00_010_11;
parameter logic [6:0] OPCODE_CUSTOM1  = 7'b01_010_11;
parameter logic [6:0] OPCODE_NMSUB    = 7'b10_010_11;
parameter logic [6:0] OPCODE_RESERVED = 7'b11_010_11;
//Column4
parameter logic [6:0] OPCODE_MISC_MEM = 7'b00_011_11;
parameter logic [6:0] OPCODE_AMO      = 7'b01_011_11;
parameter logic [6:0] OPCODE_NMADD    = 7'b10_011_11;
parameter logic [6:0] OPCODE_JAL      = 7'b11_011_11;
//Column5
parameter logic [6:0] OPCODE_OP_IMM = 7'b00_100_11;
parameter logic [6:0] OPCODE_OP     = 7'b01_100_11;
parameter logic [6:0] OPCODE_OP_FP  = 7'b10_100_11;
parameter logic [6:0] OPCODE_SYSTEM = 7'b11_100_11;
//Column6
parameter logic [6:0] OPCODE_AUIPC = 7'b00_101_11;
parameter logic [6:0] OPCODE_LUI   = 7'b01_101_11;
parameter logic [6:0] OPCODE_OP_V  = 7'b10_101_11;
parameter logic [6:0] OPCODE_OP_VE = 7'b11_101_11;
//Column7
parameter logic [6:0] OPCODE_OP_IMM32 = 7'b00_110_11;
parameter logic [6:0] OPCODE_OP32     = 7'b01_110_11;
parameter logic [6:0] OPCODE_CUSTOM2  = 7'b10_110_11;
parameter logic [6:0] OPCODE_CUSTOM3  = 7'b11_110_11;
//Column8
parameter logic [6:0] OPCODE_48  = 7'b00_111_11;
parameter logic [6:0] OPCODE_64  = 7'b01_111_11;
parameter logic [6:0] OPCODE_48_ = 7'b10_111_11;
parameter logic [6:0] OPCODE_80  = 7'b11_111_11;

// RV32I base instruction set Funct3 field values
parameter logic [2:0] FUNCT3_JALR = 3'b000;

parameter logic [2:0] FUNCT3_BEQ  = 3'b000;
parameter logic [2:0] FUNCT3_BNE  = 3'b001;
parameter logic [2:0] FUNCT3_BLT  = 3'b100;
parameter logic [2:0] FUNCT3_BGE  = 3'b101;
parameter logic [2:0] FUNCT3_BLTU = 3'b110;
parameter logic [2:0] FUNCT3_BGEU = 3'b111;

parameter logic [2:0] FUNCT3_LB  = 3'b000;
parameter logic [2:0] FUNCT3_LH  = 3'b001;
parameter logic [2:0] FUNCT3_LW  = 3'b010;
parameter logic [2:0] FUNCT3_LBU = 3'b100;
parameter logic [2:0] FUNCT3_LHU = 3'b101;

parameter logic [2:0] FUNCT3_SB = 3'b000;
parameter logic [2:0] FUNCT3_SH = 3'b001;
parameter logic [2:0] FUNCT3_SW = 3'b010;

parameter logic [2:0] FUNCT3_ADDI  = 3'b000;

parameter logic [2:0] FUNCT3_SLTI  = 3'b001;
parameter logic [2:0] FUNCT3_SLTIU = 3'b011;

parameter logic [2:0] FUNCT3_XORI  = 3'b100;
parameter logic [2:0] FUNCT3_ORI   = 3'b110;
parameter logic [2:0] FUNCT3_ANDI  = 3'b111;

parameter logic [2:0] FUNCT3_SLLI  = 3'b001;
parameter logic [2:0] FUNCT3_SRLI  = 3'b101;
parameter logic [2:0] FUNCT3_SRAI  = 3'b101;

parameter logic [2:0] FUNCT3_ADD   = 3'b000;
parameter logic [2:0] FUNCT3_SUB   = 3'b000;

parameter logic [2:0] FUNCT3_SLL   = 3'b001;
parameter logic [2:0] FUNCT3_SLT   = 3'b010;
parameter logic [2:0] FUNCT3_SLTU  = 3'b011;

parameter logic [2:0] FUNCT3_XOR   = 3'b100;
parameter logic [2:0] FUNCT3_OR    = 3'b110;
parameter logic [2:0] FUNCT3_AND   = 3'b111;

parameter logic [2:0] FUNCT3_SRL   = 3'b101;
parameter logic [2:0] FUNCT3_SRA   = 3'b101;

parameter logic [2:0] FUNCT3_FENC      = 3'b000;
parameter logic [2:0] FUNCT3_FENCE_TSO = 3'b000;
parameter logic [2:0] FUNCT3_PAUSE     = 3'b000;
parameter logic [2:0] FUNCT3_ECALL     = 3'b000;
parameter logic [2:0] FUNCT3_EBREAK    = 3'b000;

// RV64I base instruction set Funct3 field values
parameter logic [2:0] FUNCT3_LWU = 3'b110;
parameter logic [2:0] FUNCT3_LD  = 3'b011;

parameter logic [2:0] FUNCT3_SD  = 3'b011;

parameter logic [2:0] FUNCT3_SLLI = 3'b001;
parameter logic [2:0] FUNCT3_SRLI = 3'b101;
parameter logic [2:0] FUNCT3_SRAI = 3'b101;

parameter logic [2:0] FUNCT3_SLLIW = 3'b001;
parameter logic [2:0] FUNCT3_SRLIW = 3'b101;
parameter logic [2:0] FUNCT3_SRAIW = 3'b101;

parameter logic [2:0] FUNCT3_ADDIW  = 3'b000;

parameter logic [2:0] FUNCT3_ADDW  = 3'b000;
parameter logic [2:0] FUNCT3_SUBW  = 3'b000;

parameter logic [2:0] FUNCT3_SLLW = 3'b001;
parameter logic [2:0] FUNCT3_SRLW = 3'b101;
parameter logic [2:0] FUNCT3_SRAW = 3'b101;

parameter logic [2:0] FUNCT3_AMO32 = 3'b010;
parameter logic [2:0] FUNCT3_AMO64 = 3'b011;

parameter logic [4:0] FUNCT5_LR      = 5'b00010;
parameter logic [4:0] FUNCT5_SC      = 5'b00011;
parameter logic [4:0] FUNCT5_AMOSWAP = 5'b00001;
parameter logic [4:0] FUNCT5_AMOADD  = 5'b00000;
parameter logic [4:0] FUNCT5_AMOXOR  = 5'b00100;
parameter logic [4:0] FUNCT5_AMOAND  = 5'b01100;
parameter logic [4:0] FUNCT5_AMOOR   = 5'b01000;
parameter logic [4:0] FUNCT5_AMOMIN  = 5'b10000;
parameter logic [4:0] FUNCT5_AMOMAX  = 5'b10100;
parameter logic [4:0] FUNCT5_AMOMINU = 5'b11000;
parameter logic [4:0] FUNCT5_AMOMAXU = 5'b11100;
//Not part of the spec, used for decode only
parameter logic [4:0] AMONOP = 5'b11111;
