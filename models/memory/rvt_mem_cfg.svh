/* Class: rvt_mem_cfg
 * Memory component configuration object. Extends <rvt_agnt_cfg>.
 * All memory configurations must be extended from this base class.
 */
class rvt_mem_cfg #(
  // Parameter: XLEN
  // Data bus width in bits.
  parameter int XLEN = 32,
  // Parameter: ADDR
  // Address bus width in bits.
  parameter int ADDR = 32
) extends rvt_agnt_cfg;
  // Constructor: `uvm_object_new
  // Calls plain UVM object constructor.
  `uvm_object_new()
  // Parameter: BYTE_COUNT
  // Internal parameter of the byte count in one word.
  parameter int BYTE_COUNT = XLEN / 8;  //byte count
  // Parameter: BYTE_ADDR
  // Internal parameter of how many bits required to address each byte.
  parameter int BYTE_ADDR  = $clog2(BYTE_COUNT);  //byte address length

  typedef bit [XLEN-1 :0] data_t;
  typedef bit [ADDR-1 :0] addr_t;
  typedef bit [BYTE_ADDR-1 :0] baddr_t;
  typedef bit [BYTE_COUNT-1 :0][7:0] word_t;

  typedef enum bit[1:0] {BYTE, HALF, FULL, DOUBLE} opsize_e;
  typedef enum bit[1:0] {READ, WRITE, NOOP} opcode_e;

  int xlen = XLEN;
  int addr = ADDR;
  int byte_count = BYTE_COUNT;
  int byte_addr  = BYTE_ADDR;

  // Variable: b_bfm
  // Memory bus functional model.
  rvt_bfm bfm;

  `uvm_object_param_utils_begin(rvt_mem_cfg #(T, REQ, RSP, XLEN, ADDR))
    `uvm_field_int  (xlen, UVM_DEFAULT)
    `uvm_field_int  (addr, UVM_DEFAULT)
    `uvm_field_int  (byte_count, UVM_DEFAULT)
    `uvm_field_int  (byte_addr, UVM_DEFAULT)
  `uvm_object_utils_end
endclass : rvt_mem_cfg
