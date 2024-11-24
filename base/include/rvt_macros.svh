/**
 * @file rvt_macors.svh
 * @brief Additional RiVET essential DV macros
 */

//! @def RVT_STRINGIFY(MSG_)
//! Return a string of the input
`ifndef RVT_STRINGIFY
  `define RVT_STRINGIFY(MSG_) `"MSG_`"
`endif //RVT_STRINGIFY

//! @def AGNT_ID
//! Return a string of the agent ID. Used mainly in UVM message IDs
`define AGNT_ID $sformatf("[AGNT/%0s]", get_name())

//! @def RVT_METHOD_REQUIRES_EXTENSION
//! Return a string of the input
`ifndef RVT_METHOD_REQUIRES_EXTENSION
`define RVT_METHOD_REQUIRES_EXTENSION(METHOD_ = "")\
  `uvm_fatal($sformatf("[RVT/%0s]", get_name()), \
  $sformatf("Method %0s::%0s requires an implementation in this extended class", get_type_name(), METHOD_);
`endif //RVT_METHOD_REQUIRES_EXTENSION

/**
 * @def RVT_SINGLETON_UTILS(NAME_)
 * Singleton utilities macro
 *
 * @showinlinesource
 */
`ifndef RVT_SINGLETON_UTILS
`define RVT_SINGLETON_UTILS(NAME_) \
  static local NAME_ singleton_inst; \
  protected function new (string name = `RVT_STRINGIFY(NAME_)); \
    singleton_inst = new(); \
  endfunction : new \
  static virtual function NAME_ get(); \
   if(singleton_inst == null) begin \
    singleton_inst = new(); \
    initialize();\
   end \
   return singleton_inst; \
  endfunction : get \
  virtual function void kill(); \
    singleton_inst = null; \
  endfunction : kill
`endif //RVT_SINGLETON_UTILS
