module dut_ram
	#(
		parameter RAM_WIDTH 		= 32,
		parameter RAM_ADDR_BITS 	= 9
	)
	(
	input  	logic					    Clk,
	input	logic	                    Cmd,  // 0: Read, 1: Write
    input 	logic	[RAM_ADDR_BITS-1:0]	Addr,
    input 	logic	[RAM_WIDTH-1:0] 	WrData,
	output  logic	[RAM_WIDTH-1:0] 	RdData
	);
   logic [RAM_WIDTH-1:0] RamArray [(2**RAM_ADDR_BITS)-1:0];


    always_ff @(posedge Clk) begin
        if (Cmd) RamArray[Addr] <= WrData;
    end

    assign RdData = RamArray[Addr];

endmodule
