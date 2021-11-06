`default_nettype none

module memtest(
	       input wire clk,
	       input wire [9:0] addr_a,
	       output reg [31:0] q_a,
	       input wire [3:0] we_b,
	       input wire [9:0] addr_b,
	       output reg [31:0] q_b,
	       input wire [31:0] din_b
	       );

    (* ram_style = "block" *) reg [31:0] mem[0:1023];
    initial begin
        $readmemh("memtest.hex", mem);
    end

    always@(posedge clk) begin
        q_a <= mem[addr_a];
    end

    always @(posedge clk) begin
        if (we_b[0]) mem[addr_b][7:0] <= din_b[7:0];
        if (we_b[1]) mem[addr_b][15: 8] <= din_b[15: 8];
        if (we_b[2]) mem[addr_b][23:16] <= din_b[23:16];
        if (we_b[3]) mem[addr_b][31:24] <= din_b[31:24];
        q_b <= mem[addr_b];
    end
endmodule // memtest

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
