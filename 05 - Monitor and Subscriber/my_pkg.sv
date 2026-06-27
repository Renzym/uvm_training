package my_pkg;
`include "uvm_macros.svh"
import uvm_pkg::*;

typedef enum logic {READ=0, WRITE} cmd_e;
`include "my_transaction.svh"
typedef uvm_sequencer #(my_transaction) my_sequencer;
`include "my_dut_config.svh"
`include "my_driver.svh"
`include "my_subscriber.svh"
`include "my_monitor.svh"
`include "my_agent.svh"
`include "my_env.svh"
endpackage: my_pkg
