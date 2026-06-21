class read_modify_write extends uvm_sequence #(my_transaction);
    `uvm_object_utils(read_modify_write)

    function new(string name="");
        super.new(name);
    endfunction: new

    task body;
        forever begin
            my_transaction tx;
            tx = my_transaction::type_id::create("tx");
            int a;
            int d;
            start_item(tx);
            assert(tx.randomize());
            tx.Cmd = READ;
            finish_item(tx);
            a = tx.Addr;
            b = tx.RdData;
            ++d;
            tx = my_transaction::type_id::create("tx");
            start_item(tx);
            assert(tx.randomize());
            tx.Cmd = WRITE; tx.Addr = a; tx.WrData = d;
            // assert(tx.randomize() with { Cmd == WRITE; Addr == a; WrData == d; });
            finish_item(tx);
        end
    endtask: body
endclass: read_modify_write