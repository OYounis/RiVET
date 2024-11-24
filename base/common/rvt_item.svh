 /**
 * @class rvt_item
 * @brief Base sequence item transactio.
 *All sequence items must be extended from this base class.
 */
class rvt_item extends uvm_sequence_item;

  //! @brief Calls plain UVM object constructor.
  //! @see dv_macros.svh
  `uvm_object_new();

  //! @brief UVM factory registry.
  `uvm_object_utils(rvt_item)
endclass : rvt_item
