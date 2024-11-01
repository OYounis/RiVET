 /**
 * @class rvt_mon
 * @brief Base monitor class.
 * All non-generic monitors should extend this class.
 */
class rvt_mon extends uvm_monitor;

  //! @brief Calls plain UVM component constructor.
  //! @see dv_macros.svh
  `uvm_component_new()

  //! @brief UVM factory registry.
  `uvm_component_param_utils(rvt_mon)
endclass : rvt_drv
