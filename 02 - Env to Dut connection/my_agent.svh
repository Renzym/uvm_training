class my_agent extends uvm_agent;
    `uvm_component_utils(my_agent)

    my_driver    my_driver_h;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new

    function void build_phase(uvm_phase phase);
        my_driver_h    = my_driver::type_id::create("my_driver_h", this);
    endfunction: build_phase

endclass: my_agent