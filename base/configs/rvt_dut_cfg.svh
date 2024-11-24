
 /**
 * @class rvt_dut_cfg
 * @brief virtual class containing design configuration parameters.
 * A class extending this class should at least provide an implementation
 * to rvt_dut_cfg::initialiaze() to parse the DUT specific parameters
 * and add them to dut_params.
 */
virtual class rvt_dut_cfg extends rvt_obj;

  //! @brief Associative array containing all core (DUT) parameters.
  local rand int dut_params [string];

  /**
   * @fn initialiaze
   * @brief Initialiaze #dut_params with the core parameters
   * It is expected that DUT has a set of configuration parameters.
   * These parameters are declared in a text file. initialiaze should sample these parameters into the
   * @param[in]  profile string variable that points to parameters text file
   * @returns 1 - Initialization is successful
   * @returns 0 - Initialization failed
   */
  pure virtual function bit initialiaze(string profile = "");

  /**
   * @fn validate_params()
   * @brief Checks that all the configured parameters are valid and that there are no conflits.
   * @param[out] message queue string of the status of all checks
   * @returns 1 - Validation is successful
   * @returns 0 - Validation failed
   */
  pure virtual function bit validate_params(output string message[]);

  /**
   * @fn get_param
   * @brief Get the value of the core configuration parameter.
   * @param[in] param - Parameter name
   * @param[out] value - Parameter value
   * @returns 1 - Parameter exists
   * @returns 0 - Parameter does not exist
   */
  extern virtual function bit get_param(string param, ref int value = 0);

  /**
   * @fn set_param
   * @brief Set the value of the core configuration parameter.
   * @param[in] param - Parameter name
   * @param[in] value - Parameter value
   * @returns 1 - Operation is successful
   * @returns 0 - Operation failed due to parameter rules
  */
  extern virtual function bit set_param(string param, int value);

  //! @brief UVM factory registry.
  `uvm_object_utils_begin(rvt_dut_cfg)
    `uvm_field_aa_int_string (dut_params, UVM_DEFAULT)
  `uvm_object_utils_end
endclass : rvt_dut_cfg

function bit rvt_dut_cfg::get_param(input string param, output int value);
  if (dut_params.exists(param)) begin
    value = dut_params[param];
    return 1;
  end else begin
    value = 0;
    return 0;
  end
endfunction

function bit rvt_dut_cfg::set_param(string param, int value);
  dut_params[param] = value;
  return 1;
endfunction
