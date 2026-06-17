interface dut_if();
    logic clk, reset;
    logic [31:0] data;
endinterface: dut_if

module dut(dut_if _if);
    always_ff@(posedge _if.clk) begin
        if (_if.reset) begin
            _if.data <= 0;
        end else begin
            _if.data <= ~_if.data;
        end
    end
endmodule: dut

module top;
    import uvm_pkg::*;
    import my_pkg::*;

    dut_if dut_if1();

    dut dut1(._if(dut_if1));

    initial begin: blk
        uvm_config_db #(virtual dut_if)::set(null,"uvm_test_top", "dut_vi", dut_if1);
        run_test("my_test");
    end
endmodule: top