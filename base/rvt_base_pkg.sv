/**
 * @package rvt_base_pkg
 * Includes all RiVET base objects.
 */
package rvt_base_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"
  `include "dv_macros.svh"
  `include "rvt_macros.svh"

  `include "riscv_fixed_params.svh"
  `include "riscv_types.svh"

  /**
   * @enum sub_mode_e
   * Specifies the function of the subscriber component
   * @showenumvalues
   */
  typedef enum int {
    SubNone,
    SubChecker,
    SubCoverage,
    SubLogger
  } sub_mode_e;

  // Base common files
  `include "rvt_obj.svh"
  `include "rvt_cmp.svh"

  `include "rvt_item.svh"
  `include "rvt_mon.svh"
  `include "rvt_drv.svh"
  `include "rvt_seqr.svh"

  `include "rvt_agnt.svh"

  `include "rvt_seq.svh"

  // Configuration Objects
  `include "rvt_cfg.svh"
  `include "rvt_agnt_cfg.svh"
  `include "rvt_env_cfg.svh"
  `include "rvt_dut_cfg.svh"
  `include "rvt_sim_params.svh"

  `include "rvt_subscriber.svh"

  `include "rvt_base_agent.svh"
  `include "rvt_agent.svh"
    `include "rvt_agnt.svh"

  `include "rvt_bfm_cb.svh"
  `include "rvt_bfm.svh"
endpackage : rvt_base_pkg
