/* Class: rvt_gen_drv
 * Extends <rvt_drv>. Base generic driver class containing the base driver methods.
 * All generic drivers should extend this class.
 */
class rvt_gen_drv extends rvt_drv#(rvt_item);
  typedef rvt_bfm#(REQ) bfm_m;

  // Variable: b_bfm
  // Bus functional model.
  bfm_m bfm; //Bus functional model

  // Constructor: `uvm_component_new
  // Calls plain UVM component constructor.
  `uvm_component_new()

  // Factory Registry: `uvm_component_utils
  // UVM factory registry.
  `uvm_component_param_utils(rvt_gen_drv)

  // Task: run_phase
  // UVM run phase responsible for driving the DUT i/o during simulation.
  extern virtual task run_phase(uvm_phase phase);
  // Task: Drive
  // Drive DUT bus signals. Base implementation calls the BFM drive() task.
  extern virtual task drive();
endclass : rvt_gen_drv

task rvt_gen_driver::run_phase(uvm_phase phase);
  super.run_phase(phase);
  this.drive();
endtask

task rvt_gen_driver::drive();
  bfm.drive(rvt_item item);
endtask

