`default_nettype none

module de0cv(
	     input wire CLOCK_50,
	     input wire [9:0] SW
	     );

    (* keep *) wire [31:0] q_a;

    memtest dut(
		.clk(CLOCK_50),
		.addr_a(SW),
		.q_a(q_a),
		.we_b(0),
		.addr_b(0),
		.q_b(),
		.din_b(0)
	       );

endmodule // de0cv

`default_nettype wire
