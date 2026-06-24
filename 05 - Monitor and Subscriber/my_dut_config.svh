class my_dut_config extends uvm_object;
    `uvm_object_utils(my_dut_config)

    virtual dut_if dut_vi;

    function new(string name = "");
        super.new(name);
    endfunction: new
endclass: my_dut_config