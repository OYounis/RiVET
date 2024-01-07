/* Package: rvt_pkg
 * Includes all RiVET base objects.
 */
package rvt_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"
  `include "dv_macros.svh"
  `include "rvt_macros.svh"

  typedef enum int {
    RVT_NONE, 
    RVT_CHECKER, 
    RVT_COVERAGE, 
    RVT_LOGGER
  } sub_mode_t;
  
  `include "rvt_object.svh"
  `include "rvt_component.svh"

  `include "rvt_item.svh"
  typedef class rvt_driver;
  typedef class rvt_monitor;
  typedef class rvt_subscriber;

  `include "rvt_bfm_cb.svh"
  `include "rvt_bfm.svh"

  `include "rvt_core_cfg.svh"

  `include "rvt_cfg.svh"
  `include "rvt_agent_cfg.svh"

  `include "rvt_sequencer.svh"

  `include "rvt_sequence.svh"

  `include "rvt_monitor.svh"
  `include "rvt_driver.svh"
  `include "rvt_subscriber.svh"

  `include "rvt_base_agent.svh"
  `include "rvt_agent.svh"
endpackage : rvt_pkg
