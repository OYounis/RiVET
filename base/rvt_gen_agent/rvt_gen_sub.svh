/* 
 * Class: rvt_gen_sub
 * Extends <uvm_subscriber>. Base subscriber.
 * All subscribers should extend this class.
 */
class rvt_gen_sub#(
  type REQ = rvt_item
) extends uvm_subscriber#(REQ);
  typedef rvt_bfm#(REQ) bfm_m;

  // Variable: bfm
  // Bus functional model.
  bfm_m bfm; //Bus functional model

  // Variable: bfm
  // Bus functional model.
  sub_mode_t sub_mode = RVT_NONE;

  // Constructor: `uvm_component_new
  // Calls plain UVM component constructor.
  `uvm_component_new()
  // Factory Registry: `uvm_component_param_utils
  // UVM factory registry.
  `uvm_component_param_utils(rvt_gen_sub#(REQ))

  // Function: end_of_elaboration
  // UVM end_of_elaboration phase, checks that the sub_mode is set.
  extern virtual function void end_of_elaboration(uvm_phase phase);
  // Function: write
  // Calls the appropiate analysis function.
  extern virtual function void write(REQ pkt);
endclass : rvt_gen_sub

function void rvt_gen_sub::end_of_elaboration(uvm_phase phase);
  super.end_of_elaboration(phase);
  if(sub_mode == RVT_NONE)
    `uvm_fatal ($sformatf("[SUB/%0s]", get_name()), "Subscriber mode (sub_mode) must be set")
endfunction

function void rvt_gen_sub::write(REQ pkt);
  case (sub_mode)
    RVT_CHECKER:  bfm.check(pkt);
    RVT_COVERAGE: bfm.cover(pkt);
    RVT_LOGGER:   bfm.log(pkt);
    default: `uvm_fatal ($sformatf("[SUB/%0s]", get_name()),
                       $sformatf("Subscriber mode ($0s) not known", sub_mode.name()))
  endcase
endfunction