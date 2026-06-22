class read_modify_write extends uvm_sequence #(my_transaction);
    `uvm_object_utils(read_modify_write)

    function new(string name="");
        super.new(name);
    endfunction: new

    task body;
        my_transaction tx;
        int a;
        int d;

        tx = my_transaction::type_id::create("tx");
        start_item(tx);
        assert(tx.randomize());
        tx.Cmd = READ;
        finish_item(tx);
        a = tx.Addr;
        d = tx.RdData;

        ++d;
        tx = my_transaction::type_id::create("tx");
        start_item(tx);
        assert(tx.randomize());
        tx.Cmd = WRITE;
        tx.Addr = a;
        tx.WrData = d;
        finish_item(tx);
    endtask: body
endclass: read_modify_write
