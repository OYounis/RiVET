class rvt_mem_item#(type CFG = rvt_mem_cfg) extends rvt_base_item;
  //Re-definition of the same typedefs in the CFG to be available in this class scope.
  typedef CFG::data_t   data_t;
  typedef CFG::addr_t   addr_t;
  typedef CFG::opsize_e opsize_e;
  typedef CFG::opcode_e opcode_e;

  data_t data;
  addr_t addr;
  opsize_e opsize;
  opcode_e opcode;

  // Factory Registry: `uvm_object_param_utils_begin..end
  // UVM factory registry.
  `uvm_object_param_utils_begin(rvt_mem_item#(CFG))
    `uvm_field_int  (data, UVM_DEFAULT)
    `uvm_field_int  (addr, UVM_DEFAULT)
    `uvm_field_enum (opsize_e, opsize, UVM_DEFAULT)
    `uvm_field_enum (opcode_e, opcode, UVM_DEFAULT)
  `uvm_object_utils_end

  // Constructor: `uvm_component_new
  // Calls plain UVM component constructor.
  `uvm_object_new()

endclass : rvt_mem_item
