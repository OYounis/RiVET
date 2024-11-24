 /**
 * @class rvt_seqr
 * @brief Base sequencer class.
 * All sequencers should extend this class.
 * @tparam REQ Request item type. Defaults to <rvt_item>
 * @tparam RSP Response item type. Defaults to REQ
 */
class rvt_seqr#(
  type REQ = rvt_item,
  type RSP = REQ
) extends uvm_sequencer#(REQ, RSP);

  //! @brief Calls plain UVM component constructor.
  //! @see dv_macros.svh
  `uvm_component_new();

  //! @brief UVM factory registry.
  `uvm_component_param_utils(rvt_seqr#(REQ, RSP))
endclass : rvt_seqr
