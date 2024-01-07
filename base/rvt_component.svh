/* Class: rvt_component
 * Base comopnent object. Extends <uvm_component>.
 * All components must be extended from this base class.
 */
class rvt_component extends uvm_component;
  // Constructor: `uvm_component_new
  // Calls plain UVM component constructor.
  `uvm_component_new()
  // Factory Registry: `uvm_component_utils
  // UVM factory registry.
  `uvm_component_utils(rvt_component)
endclass : rvt_component
