/**
 * @class rvt_cfg
 * @brief Base configuration object.
 * All non-parameterised configurations must be extended from this base class.
 */
class rvt_cfg extends rvt_obj;

  //! @brief Controls agent PASSIVE/ACTIVE operation. Default is ACTIVE.
  uvm_active_passive_enum is_active = UVM_ACTIVE;

  //! @brief Subscriber enable array.
  sub_mode_e sub_en[string];

  //! @brief Calls plain UVM object constructor.
  //! @see dv_macros.svh
  `uvm_object_new()

  //! @brief UVM factory registry.
  `uvm_object_utils_begin(rvt_cfg)
    `uvm_field_aa_int_string(sub_en, UVM_DEFAULT)
    `uvm_field_enum(uvm_active_passive_enum, is_active, UVM_DEFAULT)
  `uvm_object_utils_end

endclass : rvt_cfg
