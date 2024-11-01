/* Class: rvt_gen_agent_cfg
 * Generic agent configuration object. Extends <rvt_gen_cfg>.
 * All generic agent configurations must be extended from this base class.
 */
 /**/
class rvt_env_cfg extends rvt_cfg;
  // Variable: b_bfm
  // Bus functional model.
  rvt_bfm m_bfm[string];

  // Variable: agnt_cfg
  // Configuration objects for the .
  rvt_agnt_cfg m_agnt_cfg[string];

  // Constructor: `uvm_object_new
  // Calls plain UVM object constructor.
  `uvm_object_new()

  // Factory Registry: `uvm_object_param_utils
  // UVM factory registry.
  `uvm_object_param_utils_begin(rvt_env_cfg#(REQ, RSP))
    `uvm_field_aa_object_string(bfm, UVM_DEFAULT)
    `uvm_field_aa_object_string(agnt_cfg, UVM_DEFAULT)
  `uvm_object_param_utils_end
endclass : rvt_env_cfg
