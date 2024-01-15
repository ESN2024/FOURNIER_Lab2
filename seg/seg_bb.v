
module seg (
	clk_clk,
	pio_0_external_connection_export,
	pio_1_external_connection_export,
	pio_2_external_connection_export,
	pio_3_external_connection_export,
	reset_reset_n);	

	input		clk_clk;
	output	[3:0]	pio_0_external_connection_export;
	input		pio_1_external_connection_export;
	output	[3:0]	pio_2_external_connection_export;
	output	[3:0]	pio_3_external_connection_export;
	input		reset_reset_n;
endmodule
