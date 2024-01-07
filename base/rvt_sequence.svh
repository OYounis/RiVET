/* Class: rvt_sequence
 * Base sequence. Extends <uvm_sequence>.
 * All sequence items must be extended from this base class.
 */
class rvt_sequence#(
  type REQ = rvt_item
) extends uvm_sequence#(REQ);
  // Constructor: `uvm_object_new
  // Calls plain UVM object constructor.
  `uvm_object_new()
  // Factory Registry: `uvm_object_utils
  // UVM factory registry.
  `uvm_object_param_utils(rvt_sequence#(REQ))

  extern virtual task pre_start();
  extern virtual task body();
  extern virtual task post_start();
endclass : rvt_sequence


