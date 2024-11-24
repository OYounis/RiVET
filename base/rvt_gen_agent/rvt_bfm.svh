class rvt_bfm#(
  type REQ = rvt_item,
  tyep RSP = REQ
) extends rvt_obj;
  `uvm_object_param_utils(rvt_bfm#(REQ))
  `uvm_register_cb(rvt_bfm#(REQ), rvt_bfm_cb)

  rvt_driver#(REQ)  drv_proxy;
  rvt_monitor#(REQ) mon_proxy;

  function new(string name = "rvt_bfm");
    super.new(name);
  endfunction

  virtual task drive();
    this.pre_drive();
    this.do_drive();
    this.post_drive();
  endtask : drive

  virtual task monitor();
    this.pre_monitor();
    this.do_monitor();
    this.post_monitor();
  endtask : monitor

  virtual function void check(rvt_item pkt);
    `uvm_do_callbacks(rvt_bfm#(REQ), rvt_bfm_cb, check(rvt_item pkt))
  endfunction

  virtual function void cover(rvt_item pkt);
    `uvm_do_callbacks(rvt_bfm#(REQ), rvt_bfm_cb, cover(rvt_item pkt))
  endfunction

  virtual function void log  (rvt_item pkt);
    `uvm_do_callbacks(rvt_bfm#(REQ), rvt_bfm_cb, log(rvt_item pkt))
  endfunction

  virtual task pre_drive();
    `uvm_do_callbacks(rvt_bfm#(REQ), rvt_bfm_cb, pre_drive(this.drv_proxy))
  endtask
  virtual task post_drive();
    `uvm_do_callbacks(rvt_bfm#(REQ), rvt_bfm_cb, post_drive(this.drv_proxy))
  endtask
  virtual task do_drive();
    `uvm_do_callbacks(rvt_bfm#(REQ), rvt_bfm_cb, do_drive(this.drv_proxy))
  endtask

  virtual task pre_monitor();
    `uvm_do_callbacks(rvt_bfm#(REQ), rvt_bfm_cb, pre_monitor(this.mon_proxy))
  endtask
  virtual task post_monitor();
    `uvm_do_callbacks(rvt_bfm#(REQ), rvt_bfm_cb, post_monitor(this.mon_proxy))
  endtask
  virtual task do_monitor();
    `uvm_do_callbacks(rvt_bfm#(REQ), rvt_bfm_cb, do_monitor(this.mon_proxy))
  endtask
endclass : rvt_bfm
