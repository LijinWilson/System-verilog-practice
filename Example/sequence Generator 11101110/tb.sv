
module seq_tb;
	reg clk, rst;
	wire out;

// instantiating the module
seq_110_gen tb1(clk, rst, out);

// clock generation
initial
	begin
		clk = 0;
		
		forever #5 clk = ~clk;
		
	end

// reset generation
initial 
	begin
		rst = 1;
	
		#10; 
		
		rst = 0;

		#150; $finish();
	end

// printing outputs
always @(posedge clk)
	begin
		$display("Time = %0t | OUT = %0b | D = %0b", $time, out, tb1.ff1.d);
	end

endmodule
