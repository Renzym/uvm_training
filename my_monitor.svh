class my_monitor extends uvm_monitor;
    `uvm_component_utils(my_monitor)

    uvm_analysis_port #(my_transaction) aport;
    my_dut_config dut_config_0;
    virtual dut_if dut_vi;

    function new(string name, uvm_component parent);
        super.new(name,parent);
    endfunction: new

    function void build_phase(uvm_phase phase);
        if(!uvm_config_db #(my_dut_config)::get( this, "", "dut_config", dut_config_0))
            `uvm_fatal("MY_MONITOR", "No DUT_CONFIG");
        dut_vi = dut_config_0.dut_vi;

        aport = new("aport",this);
    endfunction: build_phase

    task run_phase(uvm_phase phase);
        forever begin
            my_transaction tx;
            @(posedge dut_vi.Clk);
            tx = my_transaction::type_id::create("tx");
            tx.Cmd = dut_vi.Cmd;
            tx.Addr = dut_vi.Addr;
            tx.WrData = dut_vi.WrData;

            aport.write(tx);
        end
    endtask: run_phase

endclass : my_monitor