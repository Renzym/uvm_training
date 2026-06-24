class my_subscriber extends uvm_subscriber #(my_transaction);
    `uvm_component_utils(my_subscriber)
    bit cmd;
    int addr;
    int data;

    covergroup cover_bus;
        coverpoint cmd;
        coverpoint addr {bins a[16] = {[0:255]};}
        coverpoint data {bins d[16] = {[0:255]};}
    endgroup: cover_bus

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new

    function void build_phase(uvm_phase phase);
    endfunction: build_phase

    function void write(my_transaction t);
        cmd = t.Cmd;
        addr = t.Addr;
        data = t.WrData;
        cover_bus.sample();
    endfunction: write

endclass: my_subscriber