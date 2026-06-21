interface dut_if();
    logic Clk;
    my_pkg::cmd_e Cmd;
    logic  [9:0] Addr;
    logic [31:0] WrData;
    logic [31:0] RdData;
endinterface: dut_if

module dut(dut_if _if);
    dut_ram 
        #(
            .RAM_WIDTH 	    (32),
            .RAM_ADDR_BITS  (10)
        )
    dut_ram0
        (
        .Clk        (_if.Clk    ),
        .Cmd        (_if.Cmd    ),  // 0: Read, 1: Write
        .Addr       (_if.Addr   ),
        .WrData     (_if.WrData ),
        .RdData     (_if.RdData )
        );
endmodule: dut

module top;
    import uvm_pkg::*;
    import my_pkg::*;

    dut_if dut_if1();

    dut dut1(._if(dut_if1));

    initial begin: blk
        uvm_config_db #(virtual dut_if)::set(null,"uvm_test_top", "dut_vi", dut_if1);
        //run_test("my_test");
        //run_test("test1");
        //run_test("test2");
        run_test("test3");
        //run_test();
    end
endmodule: top