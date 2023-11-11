class tev_mem_item_c extends tev_base_item_c;
    mem_opcode_e opcode;
    logic [4:0][XLEN-1 : 0] data;
    logic [XLEN-1 : 0] address;

    `uvm_object_utils_begin (tev_mem_item_c)
        `uvm_field_enum      (opcode_e, opcode, UVM_DEFAULT)
        `uvm_field_int       (address, UVM_DEFAULT)
        `uvm_field_queue_int (data, UVM_DEFAULT)
    `uvm_object_utils_end
endclass
