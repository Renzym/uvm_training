class my_driver extends uvm_driver #(my_transaction);
    `uvm_component_utils(my_driver)

    virtual dut_if dut_vi;
    my_dut_config dut_config_0;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new

    function void build_phase(uvm_phase phase);
        if(!uvm_config_db #(my_dut_config)::get( this, "", "dut_config", dut_config_0))
            `uvm_fatal("MY_DRIVER", "No DUT_CONFIG");
        dut_vi = dut_config_0.dut_vi;
    endfunction: build_phase

    task run_phase(uvm_phase phase);
        forever begin
            my_transaction tx;
            @(posedge dut_vi.Clk);
            seq_item_port.get_next_item(tx);
            dut_vi.Cmd = tx.Cmd;
            dut_vi.Addr = tx.Addr;
            dut_vi.WrData = tx.WrData;
            @(posedge dut_vi.Clk) begin
                tx.RdData = dut_vi.RdData;
                seq_item_port.item_done();
            end
        end
    endtask: run_phase

endclass: my_driver
