
 /**
 * @class rvt_sim_params
 * @brief Singleton class containing simulation parameters.
 * A class extending this class should at least provide an implementation
 * to rvt_sim_params::initialize(); to parse the DUT specific parameters
 * and add them to dut_params.
 */
class rvt_sim_params extends rvt_obj;

  //! @brief Associative array containing all parameters.
  protected rand int params [string];

  /**
   * @fn initialize
   * @brief Initializes #params with the simulation parameters
   */
  extern virtual function initialize();

  /**
   * @fn validate_params()
   * @brief Checks that all the configured parameters are valid and that there are no conflits.
   * @param[out] message queue string of the status of all checks
   * @returns 1 - Validation is successful
   * @returns 0 - Validation failed
   */
  extern virtual function bit validate_params(output string message[]);

  /**
   * @fn get_param
   * @brief Get the value of the simulation parameter.
   * @param[in] param - Parameter name
   * @param[out] value - Parameter value
   * @returns 1 - Parameter exists
   * @returns 0 - Parameter does not exist
   */
  extern virtual function bit get_param(string param, ref int value = 0);

  /**
   * @fn get_param
   * @brief Set the value of the core configuration parameter.
   * @param[in] param - Parameter name
   * @param[in] value - Parameter value
   * @returns 1 - Operation is successful
   * @returns 0 - Operation failed due to parameter rules
  */
  extern virtual function bit set_param(string param, int value);

  //! @brief RVT singleton macro.
  //! @see rvt_macros.svh
  `RVT_SINGLETON_UTILS(rvt_sim_params);

  //! @brief UVM factory registry.
  `uvm_object_utils_begin(rvt_sim_params)
    `uvm_field_aa_int_string (params, UVM_DEFAULT)
  `uvm_object_utils_end
endclass : rvt_dut_cfg

function bit rvt_sim_params::initialiase();
  `RVT_METHOD_REQUIRES_EXTENSION("initialiase")
endfunction : initialiase

function bit rvt_sim_params::validate_params(output string message[]);
  `RVT_METHOD_REQUIRES_EXTENSION("validate_params")
endfunction : validate_params

function bit rvt_sim_params::get_param(input string param, output int value);
  if (params.exists(param)) begin
    value = params[param];
    return 1;
  end else begin
    value = 0;
    return 0;
  end
endfunction

function bit rvt_sim_params::set_param(string param, int value);
  params[param] = value;
  return 1;
endfunction
