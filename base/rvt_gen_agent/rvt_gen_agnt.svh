/********************************************************************
 * Class: rvt_gen_agnt
 * Extends <rvt_base_agnt>. This agent contains the base agent methods.
 * All generic agents should extend this class.
********************************************************************/
class rvt_gen_agnt #(type CFG = rvt_cfg) extends rvt_base_agnt;
  //Re-definition of the typedefs in the CFG to be available in this class scope.
  typedef CFG::REQ REQ;
  //Typedefs based on the configuration
  typedef rvt_base_drv#(REQ) drv_t;
  typedef rvt_base_mon#(REQ) mon_t;
  typedef rvt_base_sqr#(REQ) sqr_t;
  typedef rvt_base_sub#(REQ) sub_t;

  // Variable: ap
  // Analysis port used to broadcast outside the agent.
  uvm_analysis_port#(REQ) ap;

  // Variable: cfg_h
  // Base agent configuration handle.
  CFG cfg_h;
  // Variable: gen_drv_h
  // Driver handle.
  drv_t gen_drv_h;
  // Variable: gen_mon_h
  // Monitor handle.
  mon_t gen_mon_h;
  // Variable: gen_sqr_h
  // Sequencer handle.
  sqr_t gen_sqr_h;
  // Variable: gen_sub_h
  // Dynamic array of subscribers (Coverage, checkers, loggers).
  sub_t gen_sub_h[];

  // Constructor: `uvm_component_new
  // Calls plain UVM component constructor.
  `uvm_component_new()

  // Factory Registry: `uvm_component_utils
  // UVM factory registry.
  `uvm_component_param_utils(rvt_gen_agnt#(CFG))

  // Function: build_phase
  // UVM build phase calls the <do_build> function.
  extern virtual function void build_phase(uvm_phase phase);

  // Function: connect_phase
  // UVM connect phase calls the <do_connect> function.
  extern virtual function void connect_phase(uvm_phase phase);

  /*
   * Function: do_build
   * Executed in the build phase. gets the configuration object from uvm_config_db.
   * The config object is expected to be named ~name_cfg_h~
   * where "name" is the UVM component name.
   */
  extern virtual function void do_build();

  // Function: do_connect
  // Executed in the connect phase. Connects the sub-components of the agent.
  extern virtual function void do_connect();
endclass : rvt_gen_agnt

function void rvt_gen_agnt::build_phase(uvm_phase phase);
  super.build_phase(phase);
  this.do_build();
endfunction

function void rvt_gen_agnt::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  this.do_connect();
endfunction

function void rvt_gen_agnt::do_build();
  if(!uvm_config_db#(CFG)::get(this, "", {$sformatf("%0s", get_name()),"_cfg"}, cfg_h)) begin
    `uvm_fatal(`AGNT_ID, $sformatf("Failed to fetch %0s from CGFDB", {$sformatf("%0s", get_name()),"_cfg"}))
  end

  if (cfg_h.is_active == UVM_ACTIVE) begin
    gen_drv_h = drv_t::type_id::create({$sformatf("%0s", get_name()),"_drv"}, this);
    gen_sqr_h = sqr_t::type_id::create({$sformatf("%0s", get_name()),"_sqr"}, this);
  end

  if (cfg_h.sub_en.size() != 0) begin
    string mode_s;
    gen_sub_h = new[cfg_h.sub_en.size()];
    foreach (gen_sub_h[i]) begin
      gen_sub_h[i] = sub_t::type_id::create({$sformatf("%0s", get_name()), mode_s}, this);
      gen_sub_h[i].set_mode(cfg_h.sub_en[mode_s]);
      cfg_h.sub_en.next(mode_s);
    end
  end

  gen_mon_h = mon_t::type_id::create({$sformatf("%0s", get_name()),"_mon"}, this);
  ap = new("analysis_port", this);
endfunction

task rvt_gen_agnt::do_connect();
  if (cfg_h.is_active == UVM_ACTIVE) begin
    cfg_h.bfm.drv_proxy = gen_drv_h;
    gen_drv_h.bfm = cfg_h.bfm;
    gen_drv_h.seq_item_port.connect(gen_sqr_h.seq_item_export);
  end
  cfg_h.bfm.mon_proxy = gen_mon_h;
  gen_mon_h.bfm = cfg_h.bfm;

  gen_mon_h.ap.connect(this.ap);

  if (gen_sub_h.size() != 0) begin
    foreach (gen_sub_h[i]) begin
      gen_sub_h[i].bfm = cfg_h.bfm;
      gen_mon_h.ap.connect(gen_sub_h[i].analysis_export);
    end
  end
endtask
