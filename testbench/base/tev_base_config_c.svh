class tev_base_config_c #(type vif) extends uvm_object;
    vif vi_bfm;

    `uvm_object_param_utils(tev_base_config_c#(vif))

    function new(string name = "tev_base_config");
        super.new(name);
    endfunction


endclass
