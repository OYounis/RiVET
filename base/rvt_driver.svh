/* Class: rvt_driver
 * Extends <uvm_driver>. Base generic driver class containing the base driver methods.
 * All generic drivers should extend this class.
 */
class rvt_driver#(
  type REQ = rvt_item
) extends uvm_driver#(REQ);
  typedef rvt_bfm#(REQ) bfm_m;

  // Variable: b_bfm
  // Bus functional model.
  bfm_m bfm; //Bus functional model

  // Constructor: `uvm_component_new
  // Calls plain UVM component constructor.
  `uvm_component_new()
  // Factory Registry: `uvm_component_utils
  // UVM factory registry.
  `uvm_component_param_utils(rvt_driver#(REQ))

  // Task: run_phase
  // UVM run phase responsible for driving the DUT i/o during simulation.
  extern virtual task run_phase(uvm_phase phase);
  // Task: Drive
  // Drive DUT bus signals. Base implementation calls the BFM drive() task.
  extern virtual task drive();
endclass : rvt_driver

task rvt_gen_driver::run_phase(uvm_phase phase);
  super.run_phase(phase);
  this.drive();
endtask

task rvt_gen_driver::drive();
  bfm.drive();
endtask

