class my_transaction extends uvm_sequence_item;
    `uvm_object_utils(my_transaction)
    rand my_pkg::cmd_e Cmd;
    rand int Addr;
    rand logic [31:0] WrData;
    logic [31:0] RdData;

    //constraint c_addr {Addr >= 0; Addr <= 256;}
    constraint c_data {WrData >= 0; WrData <= 256;}

    function new(string name="");
        super.new(name);
    endfunction: new

endclass: my_transaction
