class my_transaction extends uvm_sequence_item;
    `uvm_object_utils(my_transaction)
    rand logic [31:0] data;

    constraint c_data {data >= 0; data <= 256;}

    function new(string name="");
        super.new(name);
    endfunction: new

endclass: my_transaction