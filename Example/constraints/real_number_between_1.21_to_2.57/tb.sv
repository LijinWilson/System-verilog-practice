// Write a systemVerilog constraints to Generate REAL Numbers between 1.21 and 2.57;

class  sample;
	rand bit [11:0] x;
	
	real y;
	
	constraint my_con{
	
		x inside {[121:257]}; // constraint to Generate 121 to 257;
	
	}
	
	function void post_randomize();
	
		y = (x/100.0); // Main logic in making int to real number.
	
	endfunction
	
endclass

module real_top;
	sample s = new();
	
	initial
		begin
			repeat(10) begin
				assert(s.randomize()) else $display("Randomization failed! ");
				$display("%.2f", s.y);
			end
		end
	
endmodule



// ===================================================================================================================================
// --------------------------------------- OUTPUT -----------------------------------
// ===================================================================================================================================
run -all
# 1.42
# 2.10
# 2.11
# 2.48
# 2.03
# 1.50
# 1.71
# 2.41
# 2.49
# 2.32
