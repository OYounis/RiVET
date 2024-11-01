/**
 * @class rvt_cmp
 * @brief Base comopnent class.
 * All components must be extended from this base class.
 */
class rvt_cmp extends uvm_component;

  //! @brief Calls plain UVM component constructor.
  //! @see dv_macros.svh
  `uvm_component_new()

  //! @brief UVM factory registry.
  `uvm_component_utils(rvt_cmp)
endclass : rvt_cmp
