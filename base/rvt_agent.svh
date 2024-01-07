/* Class: rvt_agent
 * Extends <rvt_base_agent>. Base agent class containing the base agent methods.
 * All generic agents should extend this class.
 */
class rvt_agent #(type CFG = rvt_cfg) extends rvt_base_agent;
  //Re-definition of the typedefs in the CFG to be available in this class scope.
  typedef CFG::REQ REQ;
  //Typedefs based on the configuration
  typedef rvt_driver#(REQ)     drv_t;
  typedef rvt_monitor#(REQ)    mon_t;
  typedef rvt_sequencer#(REQ)  sqr_t;
  typedef rvt_subscriber#(REQ) sub_t;

  // Variable: ap
  // Analysis port used to broadcast outside the agent.
  uvm_analysis_port#(REQ) ap;
  // Variable: cfg_h
  // Base agent configuration handle.
  CFG cfg_h;
  // Variable: driver_h
  // Driver handle.
  drv_t driver_h;
  // Variable: monitor_h
  // Monitor handle.
  mon_t monitor_h;
  // Variable: sequencer_h
  // Sequencer handle.
  sqr_t sequencer_h;
  // Variable: subscriber_h
  // Dynamic array of subscribers (Coverage, checkers, loggers).
  sub_t subscriber_h[];

  // Constructor: `uvm_component_new
  // Calls plain UVM component constructor.
  `uvm_component_new()
  // Factory Registry: `uvm_component_utils
  // UVM factory registry.
  `uvm_component_param_utils(rvt_agent#(CFG))

  // Function: build_phase
  // UVM build phase calls the <do_build> function.
  extern virtual function void build_phase(uvm_phase phase);
  // Function: connect_phase
  // UVM connect phase calls the <do_connect> function.
  extern virtual function void connect_phase(uvm_phase phase);
  /* Function: do_build
   * Executed in the build phase. gets the configuration object from uvm_config_db.
   * The config object is expected to be named ~name_cfg_h~
   * where "name" is the UVM component name.
   */
  extern virtual function void do_build();
  // Function: do_connect
  // Executed in the connect phase. Connects the sub-components of the agent.
  extern virtual function void do_connect();
endclass : rvt_agent

function void rvt_gen_agent::build_phase(uvm_phase phase);
  super.build_phase(phase);
  this.do_build();
endfunction

function void rvt_gen_agent::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  this.do_connect();
endfunction

function void rvt_gen_agent::do_build();
  if(!uvm_config_db#(CFG)::get(this, "", {$sformatf("%0s", get_name()),"_cfg"}, cfg_h)) begin
    `uvm_fatal($sformatf("[AGNT/%0s]", get_name()), 
               $sformatf("Failed to fetch %0s from CGFDB", {$sformatf("%0s", get_name()),"_cfg"}))
  end

  if (cfg_h.is_active == UVM_ACTIVE) begin
    driver_h = drv_t::type_id::create({$sformatf("%0s", get_name()),"_drv"}, this);
    sequencer_h = sqr_t::type_id::create({$sformatf("%0s", get_name()),"_sqr"}, this);
  end

  if (cfg_h.sub_en.size() != 0) begin
    string mode_s;
    subscriber_h = new[cfg_h.sub_en.size()];
    foreach (subscriber_h[i]) begin
      subscriber_h[i] = sub_t::type_id::create({$sformatf("%0s", get_name()), mode_s}, this);
      subscriber_h[i].set_mode(cfg_h.sub_en[mode_s]);
      cfg_h.sub_en.next(mode_s);
    end
  end

  monitor_h = mon_t::type_id::create({$sformatf("%0s", get_name()),"_mon"}, this);
  ap = new("analysis_port", this);
endfunction

task rvt_gen_agent::do_connect();
  if (cfg_h.is_active == UVM_ACTIVE) begin
    cfg_h.bfm.drv_proxy = driver_h;
    driver_h.bfm = cfg_h.bfm;
    driver_h.seq_item_port.connect(sequencer_h.seq_item_export);
  end
  cfg_h.bfm.mon_proxy = monitor_h;
  monitor_h.bfm = cfg_h.bfm;

  monitor_h.ap.connect(this.ap);

  if (subscriber_h.size() != 0) begin
    foreach (subscriber_h[i]) begin
      subscriber_h[i].bfm = cfg_h.bfm;
      monitor_h.ap.connect(subscriber_h[i].analysis_export);
    end
  end
endtask
