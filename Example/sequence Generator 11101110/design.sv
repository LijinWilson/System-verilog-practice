// ===================================================== 
// Main Module
// ===================================================== 
module seq_110_gen(clk, rst, out);
	input clk, rst;
	output out;

	wire qa ,qa_bar, qb, qb_bar, qc_bar, d;

	// OR gate
	assign d = qa_bar | qb_bar | qc_bar;

	// instantiating D flip flop 3 times
	d_ff ff1(clk, rst, d, qa, qa_bar);
	d_ff ff2(clk, rst, qa, qb, qb_bar);
	d_ff ff3(clk, rst, qb, out, qc_bar);


endmodule

// ===================================================== 
// D Flip Flop
// ===================================================== 

module d_ff(clk, rst, d, q, q_bar);
	input clk, rst, d;
	output reg q;
	output q_bar;

	always_ff @(posedge clk, posedge rst)
		begin
			if(rst) begin
				q <= 1;
			end else begin
				q <= d;
			end
		end

	assign q_bar = ~q;

endmodule

