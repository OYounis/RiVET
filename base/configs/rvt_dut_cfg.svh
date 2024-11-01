
 /**
 * @class rvt_dut_cfg
 * @brief Class containing design configuration parameters.
 * Cannot consturct objects directly from this class.
 * A class extending this class should at least provide an implementation
 * to rvt_dut_cfg::initialise(); to parse the DUT specific parameters
 * and add them to dut_params.
 */
virtual class rvt_dut_cfg extends rvt_obj;

  //! @brief Associative array containing all core (DUT) parameters.
  local rand int dut_params [string];

  //! @brief UVM factory registry.
  `uvm_object_utils_begin(rvt_dut_cfg)
    `uvm_field_aa_int_string (dut_params, UVM_DEFAULT)
  `uvm_object_utils_end

  /**
   * @fn initialise
   * @brief Initialises #dut_params with the core parameters
   * It is expected that DUT has a set of configuration parameters.
   * These parameters are declared in a text file. Initialise should sample these parameters into the
   * @param[in]  profile string variable that points to parameters text file
   * @returns a bit indicating if initialisation is successful or not.
   */
  pure virtual function bit initialiase(string profile = "");

  /**
   * @fn validate_params()
   * @brief Checks that all the configured parameters are valid and that there are no conflits.
   * @param[out] message queue string of the status of all checks
   * @returns a bit indicating if validation is successful or not.
   */
  pure virtual function bit validate_params(output string message[]);

  /**
   * @fn get_param
   * @brief Get the value of the core configuration parameter.
   * @param[in] param - input parameter name
   * @param[out] value - output parameter value
   * @returns 1 - if the parameter exists
   * @returns 0 - if the parameter does not exist
   */
  extern virtual function bit get_param(string param, ref int value = 0);

  /**
   * @fn get_param
   * @brief Set the value of the core configuration parameter.
   * @param[in] param - input parameter name
   * @param[in] value - input parameter value
   * @returns 1 - if operation is successful
   * @returns 0 - if operation is failed due to parameter rules
  */
  extern virtual function bit set_param(string param, int value);

endclass : rvt_dut_cfg

virtual function bit rvt_dut_cfg::get_param(input string param, output int value);
  if (dut_params.exists(param)) begin
    value = dut_params[param];
    return 1;
  end else begin
    value = 0;
    return 0;
  end
endfunction

virtual function bit rvt_dut_cfg::set_param(string param, int value);
  core_param[param] = value;
  return 1;
endfunction
