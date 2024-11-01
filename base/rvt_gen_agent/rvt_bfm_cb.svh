class rvt_bfm_cb extends uvm_callback;
  `uvm_object_utils(rvt_bfm_cb)
  `uvm_object_new()

  virtual task pre_drive (uvm_component drv); endtask
  virtual task do_drive  (uvm_component drv); endtask
  virtual task post_drive(uvm_component drv); endtask

  virtual task pre_monitor (uvm_component mon); endtask
  virtual task do_monitor  (uvm_component mon); endtask
  virtual task post_monitor(uvm_component mon); endtask
endclass : rvt_bfm_cb
