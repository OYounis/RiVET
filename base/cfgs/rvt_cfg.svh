/* Class: rvt_cfg
 * Base configuration object. Extends <rvt_base_object>.
 * All non-parameterised configurations must be extended from this base class.
 */
class rvt_cfg extends rvt_object;
  // Variable: b_is_active
  // Controls agent PASSIVE/ACTIVE operation. Default is ACTIVE.
  uvm_active_passive_enum is_active = UVM_ACTIVE;
  // Variable: sub_en
  // Subscriber enable array.
  sub_mode_t sub_en[string];

  // Constructor: `uvm_object_new
  // Calls plain UVM component constructor.
  `uvm_object_new()
  // Factory Registry: `uvm_object_utils_begin..end
  // UVM factory registry.
  `uvm_object_utils_begin(rvt_cfg)
    `uvm_field_aa_int_string (sub_en, UVM_DEFAULT)
    `uvm_field_enum (uvm_active_passive_enum, is_active, UVM_DEFAULT)
  `uvm_object_utils_end

endclass : rvt_cfg
