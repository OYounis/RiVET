/* Class: rvt_base_agent
 * Extends <uvm_agent>. Base agent class.
 * All non-generic agents should extend this class.
 */
class rvt_base_agent extends uvm_agent;
  // Constructor: `uvm_component_new
  // Calls plain UVM component constructor.
  `uvm_component_new()
  // Factory Registry: `uvm_component_utils
  // UVM factory registry.
  `uvm_component_utils(rvt_base_agent)
endclass : rvt_base_agent
