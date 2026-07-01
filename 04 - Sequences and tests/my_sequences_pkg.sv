package my_sequences_pkg;
`include "uvm_macros.svh"
import uvm_pkg::*;

import my_pkg::*;

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
            tx.Cmd = WRITE; tx.Addr = a; tx.WrData = d;
            // assert(tx.randomize() with { Cmd == WRITE; Addr == a; WrData == d; });
            finish_item(tx);
        endtask: body
    endclass: read_modify_write

    class seq_of_commands extends uvm_sequence #(my_transaction);
        `uvm_object_utils(seq_of_commands)

        rand int n;
        constraint how_many { n inside {[2:4]};}

        function new(string name="");
            super.new(name);
        endfunction: new

        task body;
            repeat(n) begin
                read_modify_write seq;
                seq = read_modify_write::type_id::create("seq");
                seq.start(m_sequencer, this);
            end
        endtask: body
    endclass: seq_of_commands
endpackage: my_sequences_pkg
