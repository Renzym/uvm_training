package my_pkg;
`include "uvm_macros.svh"
import uvm_pkg::*;
`include "my_transaction.svh"
typedef uvm_sequencer #(my_transaction) my_sequencer;
`include "my_sequence.svh"
`include "my_driver.svh"
`include "my_agent.svh"
`include "my_env.svh"
`include "my_test.svh"
`include "my_dut_config.svh"


endpackage: my_pkg
