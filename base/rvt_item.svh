/* Class: rvt_item
 * Base sequence item transaction. Extends <uvm_sequence_item>.
 * All sequence items must be extended from this base class.
 */
class rvt_item extends uvm_sequence_item;
  // Constructor: `uvm_object_new
  // Calls plain UVM object constructor.
  `uvm_object_new()
  // Factory Registry: `uvm_object_utils
  // UVM factory registry.
  `uvm_object_utils(rvt_item)
endclass : rvt_item
