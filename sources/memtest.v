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


`default_nettype wire
