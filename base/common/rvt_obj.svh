 /**
 * @class rvt_obj
 * @brief Base object class.
 * All objects must be extended from this base class.
 */
class rvt_obj extends uvm_object;

  //! @brief Calls plain UVM object constructor.
  //! @see dv_macros.svh
  `uvm_object_new();

  //! @brief UVM factory registry.
  `uvm_object_utils(rvt_obj)
endclass : rvt_obj
