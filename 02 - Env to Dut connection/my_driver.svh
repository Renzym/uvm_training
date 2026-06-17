class my_driver extends uvm_driver;
    `uvm_component_utils(my_driver)

    virtual dut_if dut_vi;
    my_dut_config dut_config_1;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new

    function void build_phase(uvm_phase phase);
        if(!uvm_config_db #(my_dut_config)::get( this, "", "dut_config", dut_config_1))
            `uvm_fatal("MY_DRIVER", "No DUT_CONFIG");
        dut_vi = dut_config_1.dut_vi;
    endfunction: build_phase

    function void connect_phase(uvm_phase phase);
    endfunction: connect_phase

    task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        #10 dut_vi.data = 0;
        #10 dut_vi.data = 1;
        phase.drop_objection(this);
    endtask: run_phase

endclass: my_driver