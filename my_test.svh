class my_test extends uvm_test;
    `uvm_component_utils(my_test)

    my_env my_env_h;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new

    function void build_phase(uvm_phase phase);
        my_env_h = my_env::type_id::create("my_env_h", this);
    endfunction: build_phase

endclass: my_test