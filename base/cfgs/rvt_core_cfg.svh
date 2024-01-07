/* Class: rvt_core_cfg
 * Extends <rvt_object>. class containing design configuration parameters.
 */
class rvt_core_cfg extends rvt_object;
  // Variable: core_params
  // Associative array containing all core parameters.
  local rand int core_params [string];
  // Constructor: `uvm_object_new
  // Calls plain UVM object constructor.
  `uvm_object_new()

  // Factory Registry: `uvm_object_utils_begin..end
  // UVM factory registry.
  `uvm_object_utils_begin(rvt_core_cfg)
    `uvm_field_aa_int_string (core_params, UVM_DEFAULT)
  `uvm_object_utils_end

  /* Function: initialise
    Initialises core_params with the core parameters
    using the profile as a limiter
  */
  extern virtual function void initialiase(string profile = "");
  /* Function: get_val
    Return core configuration parameter value.
    Parameters:
      param - input parameter name
      value - output parameter value
    Returns:
      1 - if the parameter exists
      0 - if the parameter does not exist
  */
  extern virtual function bit get_val(input string param, output int value);
  /* Function: set_val
    Set core configuration parameter value.
    Parameters:
      param - input parameter name
      value - input parameter value
  */
  extern virtual function void set_val(string param, int value);

endclass : rvt_core_cfg

virtual function void rvt_core_cfg::initialiase(string profile = "");
endfunction

virtual function bit rvt_core_cfg::get_val(input string param, output int value);
  if (core_params.exists(param)) begin
    value = core_params[param];
    return 1;
  end else begin
    value = 0;
    return 0;
  end
endfunction

virtual function void rvt_core_cfg::set_val(string param, int value);
  core_param[param] = value;
endfunction
