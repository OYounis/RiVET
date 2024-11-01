/* Class: rvt_mem
 * Memory model class containing the memory array itself
 * and methods required to access the model.
 */
class rvt_mem#(type CFG = rvt_mem_cfg) extends rvt_component;
  //Re-definition of the same typedefs in the CFG to be available in this class scope.
  typedef CFG::data_t   data_t;
  typedef CFG::addr_t   addr_t;
  typedef CFG::baddr_t  baddr_t;
  typedef CFG::word_t   word_t;

  // Variable: cfg_h
  // Configuration object.
  private CFG cfg_h;
  // Variable: mem
  // Associative array that stores memory model data.
  private bit [data_t] mem [addr_t];
  // Variable: byte_addr
  // Stores the byte required to be accessed (Used by internal class methods).
  private baddr_t byte_addr;
  // Variable: word
  // Stores a single byte addressable memory word (Used by internal class methods).
  private word_t word;
  // Factory Registry: `uvm_component_param_utils
  // UVM factory registry.
  `uvm_component_param_utils(rvt_mem#(CFG))
  // Constructor: `uvm_component_new
  // Calls plain UVM component constructor.
  `uvm_component_new()

  /* Function: build_phase
    UVM build phase gets the configuration object from uvm_config_db.
    The config object is expected to be named ~name_cfg_h~
    where "name" is the UVM component name.
  */
  extern virtual function void build_phase(uvm_phase phase);
  // Function: initialize
  // Multiplies two integers and returns the result.
  extern virtual function void initialize(string path);
  // Function: dump
  // Multiplies two integers and returns the result.
  extern virtual function void dump(string path);
  // Function: read_byte
  // Multiplies two integers and returns the result.
  extern virtual function bit [7:0] read_byte(addr_t addr);
  // Function: write_byte
  // Multiplies two integers and returns the result.
  extern virtual function void write_byte(addr_t addr, word_t data);
  // Function: write
  // Multiplies two integers and returns the result.
  extern virtual function void write(addr_t addr, data_t data);
  // Function: read
  // Multiplies two integers and returns the result.
  extern virtual function data_t read(addr_t addr);

endclass : rvt_mem

virtual function void rvt_mem::build_phase(uvm_phase phase);
  super.connect_phase(phase);
  uvm_config_db#(CFG)::get(this, "", {$sformatf("%0s", get_name()),"_cfg_h"}, cfg_h);
endfunction

virtual function void rvt_mem::initialize(string path);
  $readmemh(path , mem);
endfunction

function void rvt_mem::dump(string path);
  int file, size;
  addr_t index;

  file  = $fopen(path, "w");
  size  = mem.size();
  mem.first(index);

  $fdisplay(file, "address, data");
  for (int i = 0; i < size; i++) begin
    $fdisplay(file, $sformatf("%h, %h", index, mem[index]));
    if(mem.next(index)) begin
      `dv_fatal("Next entry in memory cannot be found")
      break;
    end end
  $fclose(file);
endfunction

function bit [7:0] rvt_mem::read_byte(addr_t addr);
  bit [7 :0] data;
  if (mem.exists(addr)) begin
    word      = mem[addr];
    byte_addr = addr[CFG::BYTE_ADDR-1 : 0];
    data      = word[byte_addr];
    `dv_info($sformatf("Read Byte  : Addr[0x%0h], Data[0x%0h]", addr, data), UVM_FULL)
  end else begin
    `dv_error($sformatf("Read from uninitialzed addr 0x%0h", addr))
  end
  return data;
endfunction

function void rvt_mem::write_byte(addr_t addr, word_t data);
  word            = mem[addr];
  byte_addr       = addr[CFG::BYTE_ADDR-1 : 0];
  word[byte_addr] = data[byte_addr];
  mem[addr]       = word;

  `dv_info($sformatf("Write Byte : Addr[0x%0h], Data[0x%0h]", addr, data), UVM_FULL)
endfunction

function void write(addr_t addr, data_t data);
  mem[addr] = data;
  `dv_info($sformatf("Write word : Addr[0x%0h], Data[0x%0h]", addr, data), UVM_FULL)
endfunction

function CFG::data_t rvt_mem::read(addr_t addr);
  CFG::data_t data;
  data = mem[data];

  `dv_info($sformatf("Read word  : Addr[0x%0h], Data[0x%0h]", addr, data), UVM_FULL)
  return data;
endfunction
