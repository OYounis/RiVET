/* Class: rvt_monitor
 * Extends <uvm_monitor>. Base genric monitor class containing generic monitor methods.
 * All generic monitors should extend this class.
 */
class rvt_monitor #(
  type REQ = rvt_item
) extends uvm_monitor;
  typedef rvt_bfm#(REQ) bfm_m;

  // Variable: ap
  // Analysis port used to notify subscribers.
  uvm_analysis_port#(REQ) ap;
  // Variable: bfm
  // Bus functional model.
  bfm_m bfm; //Bus functional model

  // Constructor: `uvm_component_new
  // Calls plain UVM component constructor.
  `uvm_component_new()
  // Factory Registry: `uvm_component_utils
  // UVM factory registry.
  `uvm_component_param_utils(rvt_monitor#(REQ))

  // Function: build_phase
  // UVM build phase, calls the do_build function.
  extern virtual function void build_phase(uvm_phase phase);
  // Task: run_phase
  // UVM run phase responsible for sampling the DUT i/o values during simulation.
  extern virtual task run_phase(uvm_phase phase);
  // Function: do_build
  // Executed in the build phase, creates the analysis port.
  extern virtual function void do_build();
  // Task: monitor
  // Sample DUT bus signals. Base implementation calls the BFM monitor() task.
  extern virtual task monitor();
endclass : rvt_monitor

function void rvt_monitor::build_phase(uvm_phase phase);
  super.build_phase(phase);
  this.do_build();
endfunction

task rvt_monitor::run_phase(uvm_phase phase);
  super.run_phase(phase);
  this.monitor();
endtask

function void rvt_monitor::do_build();
  ap = new({this.get_name(),"_ap"}, this);
endfunction

task rvt_monitor::monitor();
  bfm.monitor();
endtask
