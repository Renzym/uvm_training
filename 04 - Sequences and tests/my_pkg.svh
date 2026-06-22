package my_pkg;
`include "uvm_macros.svh"
import uvm_pkg::*;
//`include "my_sequences.svh"
typedef enum logic {READ=0, WRITE} cmd_e;
`include "my_transaction.svh"
typedef uvm_sequencer #(my_transaction) my_sequencer;
`include "my_dut_config.svh"
`include "my_sequence.svh"
`include "read_modify_write.svh"
`include "seq_of_commands.svh"
`include "my_driver.svh"
`include "my_agent.svh"
`include "my_env.svh"
`include "my_test.svh"
`include "test1.svh"
`include "test2.svh"
`include "test3.svh"


endpackage: my_pkg
