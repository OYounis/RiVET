/* Class: rvt_object
 * Base object. Extends <uvm_object>.
 * All objects must be extended from this base class.
 */
class rvt_object extends uvm_object;
  // Constructor: `uvm_object_new
  // Calls plain UVM object constructor.
  `uvm_object_new()
  // Factory Registry: `uvm_object_utils
  // UVM factory registry.
  `uvm_object_utils(rvt_object)
endclass : rvt_object
