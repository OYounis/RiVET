 /**
 * @class rvt_agnt_cfg
 * @brief Generic agent configuration object.
 * All generic agent configurations must extended this base class.
 */
class rvt_agnt_cfg extends rvt_cfg;

  //! @brief Bus functional model.
  rvt_bfm bfm;

  //! @brief Calls plain UVM object constructor.
  //! @see dv_macros.svh
  `uvm_object_new();

  //! @brief UVM factory registry.
  `uvm_object_param_utils_begin(rvt_agnt_cfg#(REQ, RSP))
    `uvm_field_object(bfm, UVM_DEFAULT)
  `uvm_object_param_utils_end
endclass : rvt_agnt_cfg
