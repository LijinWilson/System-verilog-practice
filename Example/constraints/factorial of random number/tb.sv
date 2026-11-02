// SV constraint to generate factorial of an random number.

class sample;

	randc bit [4:0] number; // The number to find the factorial.
	
	rand bit [31:0] res; // The output of factorial
	
	// constraint to make the range of rand number to find factorial
	constraint my_con{
	
		number inside {[1:10]};
		
	}
	
	// finding the factorial.
	function int factorial(int number);
	
		if(number < 2) begin
			return 1; // factorial of number less than 2 is always 1
		end
		else begin
			return number * factorial(number-1);
		end
	
	endfunction
	
	// Print the output
	function void post_randomize();
		res = factorial(number); // passing the output of factorial
		$display("Factorial of random number %0d is %0d", number, res);
	endfunction

endclass

module fact_top;

	sample s;
	
	initial
		begin
			s = new();
			repeat(5) begin
				assert(s.randomize());
			end

		end

  // OUTPUT 
# Factorial of random number 7 is 5040
# Factorial of random number 9 is 362880
# Factorial of random number 8 is 40320
# Factorial of random number 3 is 6
# Factorial of random number 10 is 3628800

endmodule
