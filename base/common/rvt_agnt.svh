/**
 * @class rvt_agnt
 * @brief Base agent class.
 * All non-generic agents should extend this class.
 */
class rvt_agnt extends uvm_agent;

  //! @brief Calls plain UVM component constructor.
  //! @see dv_macros.svh
  `uvm_component_new();

  //! @brief UVM factory registry.
  `uvm_component_utils(rvt_agnt)
endclass : rvt_agnt
