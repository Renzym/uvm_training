interface dut_if();
endinterface: dut_if

module dut(dut_if _if);

endmodule: dut

module top;
    import uvm_pkg::*;
    import my_pkg::*;

    dut_if dut_if1();

    dut dut1(._if(dut_if1));

    initial begin
        run_test("my_test");
    end
endmodule: top