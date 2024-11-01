interface mem_bfm_if(interface _if);
  import bfm_pkg::*;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  class mem_bfm extends rvt_bfm#(rvt_mem_item);
    `uvm_object_utils(mem_bfm)

    function new(string name = "mem_bfm");
      super.new(name);
    endfunction

    extern virtual task drive();
    extern virtual task sample();
  endclass

  virtual automatic task mem_bfm::drive();

  endtask

  virtual automatic task mem_bfm::sample();

  endtask
endinterface
