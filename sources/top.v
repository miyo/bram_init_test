`default_nettype none

module top(
	   input wire clk
	   );

    (* keep *) wire [9:0] addr_a;
    (* keep *) wire [31:0] q_a;
    (* keep *) wire [3:0] we_b;
    (* keep *) wire [9:0] addr_b;
    (* keep *) wire [31:0] q_b;
    (* keep *) wire [31:0] din_b;

    memtest dut(
		.clk(clk),
		.addr_a(addr_a),
		.q_a(q_a),
		.we_b(we_b),
		.addr_b(addr_b),
		.q_b(q_b),
		.din_b(din_b)
		);

    vio_0 vio_0_i (
		   .clk(clk),
		   .probe_in0(q_a),
		   .probe_in1(q_b),
		   .probe_out0(addr_a),
		   .probe_out1(we_b),
		   .probe_out2(addr_b),
		   .probe_out3(din_b)
		   );
endmodule // top

`default_nettype wire
