/* Class: rvt_sequencer
 * Extends <uvm_sequencer>. Base sequencer class.
 * All sequencers should extend this class.
 */
class rvt_sequencer#(
  type REQ = rvt_item
) extends uvm_sequencer#(REQ);
  // Constructor: `uvm_component_new
  // Calls plain UVM component constructor.
  `uvm_component_new()
  // Factory Registry: `uvm_component_param_utils
  // UVM factory registry.
  `uvm_component_param_utils(rvt_sequencer#(REQ))
endclass : rvt_sequencer
