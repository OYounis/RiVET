 /**
 * @class rvt_seq
 * @brief Base sequence class.
 * All sequences must be extended from this base class.
 * Does not have a virtual sequencer set.
 * @tparam REQ Request item type. Defaults to <rvt_item>
 * @tparam RSP Response item type. Defaults to REQ
 */
class rvt_seq#(
  type REQ = rvt_item,
  type RSP = REQ
) extends uvm_sequence#(REQ, RSP);

  // @brief If this flag is set, The sequence will raise an objection on pre_start()
  bit m_set_objections;

  //! @fn pre_start()
  //! @brief Raise objection if starting_phase != null and #m_set_objections == 1
  extern virtual task pre_start();

  //! @fn body()
  //! @brief Main sequence body.
  //! When a new class extends this class, An implementation for this task must be provided
  extern virtual task body();

  //! @fn post_start()
  //! @brief Raise objection if starting_phase != null and #m_set_objections == 1
  extern virtual task post_start();

  //! @brief Calls plain UVM object constructor.
  //! @see dv_macros.svh
  `uvm_object_new();

  //! @brief UVM factory registry.
  `uvm_object_param_utils(rvt_seq#(REQ, RSP))
endclass : rvt_seq

task rvt_seq::pre_start();
  if(m_set_objections && starting_phase != null) begin
    starting_phase.raise_objection(this);
  end
endtask : pre_start

task rvt_seq::body();
  `RVT_METHOD_REQUIRES_EXTENSION("body()")
endtask : body

task rvt_seq::post_start();
  if(m_set_objections && starting_phase != null) begin
    starting_phase.drop_objection(this);
  end
endtask : post_start
