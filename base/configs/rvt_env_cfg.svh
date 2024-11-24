 /**
 * @class rvt_env_cfg
 * @brief Base environment configuration class.
 * All environment configuration objects should extend this class.
 */
 class rvt_env_cfg extends rvt_cfg;

  //! @brief BFM enable array.
  rvt_bfm m_bfm[string];

  //! @brief Agent configuration object array.
  rvt_agnt_cfg m_agnt_cfg[string];

  //! @brief Calls plain UVM object constructor.
  //! @see dv_macros.svh
  `uvm_object_new();

  //! @brief UVM factory registry.
  `uvm_object_param_utils_begin(rvt_env_cfg#(REQ, RSP))
    `uvm_field_aa_object_string(bfm, UVM_DEFAULT)
    `uvm_field_aa_object_string(agnt_cfg, UVM_DEFAULT)
  `uvm_object_param_utils_end
endclass : rvt_env_cfg
