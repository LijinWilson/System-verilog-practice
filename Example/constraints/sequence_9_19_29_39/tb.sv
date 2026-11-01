// Constraints to generate sequence 9,19, 29, 39 etc.....

class sample;

	rand bit [9:0] num1;
	
	static bit [9:0] num = 9; // initializing the number as 9;
	
	constraint my_con{
	
		num1 inside {num}; // passing the num value to num1;
	
	}
	
	function void post_randomize();
		
		num = num + 10; // adding the num value with 10; as sequence is having difference of 10
	
	endfunction


endclass

module seq9_19_top;

	initial
		begin
		
			sample s = new();
			
			repeat(8) begin
				assert(s.randomize());
			
				$write("%0d ", s.num1);
			end
			
		end

endmodule

// OUTPUT
9 19 29 39 49 59 69 79 
