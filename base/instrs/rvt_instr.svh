/********************************************************************
 * Class: rvt_instr
 * RISC-V instruction object. Extends <rvt_item>.
 * Contains all coverage and randomization related utilities.
********************************************************************/
`ifndef _RVT_INSTR_
`define _RVT_INSTR_

class rvt_instr extends rvt_item;
  protected instr_t   m_instr;
  protected rvt_instr_cov m_cov;

  rand format_t m_format;
  rand asm_t m_asm;
  bit   m_decoded;

  rand opcode_t opcode;

  rand logic [2:0] funct3;
  rand logic [4:0] funct5;
  rand logic [7:0] funct7;

  rand logic [4:0] rs2;
  rand logic [4:0] rs1;
  rand logic [4:0] rd;

  rand logic [31:0] imm;

  rand amo_t amo;
  rand logic aq;
  rand logic rl;

  rand fpo_t fpo;
  rand logic [1:0] fmt;

  bit m_imm_vld;
  bit m_rd_vld;
  bit m_rs1_vld;
  bit m_rs2_vld;

  bit m_funct3_vld;
  bit m_funct5_vld;
  bit m_funct7_vld;

  extern virtual function logic [31:0] getRawInstr();

  extern virtual function setRawInstr(logic [31:0] raw_instr);

  extern virtual function sampleCov();

  extern virtual function decode();

  extern virtual function bit hasRd();
  extern virtual function bit hasRs1();
  extern virtual function bit hasRs2();

  extern virtual function bit hasImm();
  extern virtual function logic[31:0] getImm();

  extern virtual function bit hasFunct7();
  extern virtual function logic [6:0] getFunct7();

  extern virtual function bit hasFunct5();
  extern virtual function logic [4:0] getFunct5();

  extern virtual function bit hasFunct3();
  extern virtual function logic [2:0] getFunct3();

  extern virtual function asm_t getAsm();
endclass : rvt_instr

function logic [31:0] rvt_instr::getRawInstr();
  return m_instr.raw;
endfunction : getRawInstr

function rvt_instr::setRawInstr(logic [31:0] raw_instr);
  m_instr.raw = raw_instr;
endfunction : setRawInstr

function rvt_instr::sampleCov();
  if(m_instr16_vld) m_cov16.sample(m_instr);
endfunction : sampleCov

extern virtual function bit hasRd();


`endif //_RVT_INSTR_
