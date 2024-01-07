/* Class: rvt_gen_agent_cfg
 * Generic agent configuration object. Extends <rvt_gen_cfg>.
 * All generic agent configurations must be extended from this base class.
 */
class rvt_agent_cfg #(
  // Parameter: REQ
  // Request ransaction type. Default value <rvt_base_item>.
  type REQ = rvt_item,
) extends rvt_cfg;
  // Factory Registry: `uvm_object_param_utils
  // UVM factory registry.
  `uvm_object_param_utils(rvt_agent_cfg#(REQ))
  // Constructor: new
  // UVM component constructor.
  function new(string name = "gap_cfg");
    super.new(name);
    bfm = rvt_bfm#(REQ)::type_id::create("bfm");
  endfunction

  typedef rvt_bfm#(REQ) bfm_m;
  // Variable: b_bfm
  // Bus functional model.
  bfm_m bfm;
endclass : rvt_agent_cfg
