// Write SV constraints to generate prime number in given range.

class sample;

	rand bit [10:0] lower_range;
	rand bit [10:0] upper_range;
	rand bit [10:0] num;
	
	constraint my_con{
		lower_range inside {[10:20]}; // deciding the lower range
		
		upper_range inside {[40:50]}; // deciding the upper range
		
		solve lower_range, upper_range before num; // telling the constraint to solve the upper_range and lower_range before the num
		
		num inside {[lower_range:upper_range]};
		
	}
	
	// Function for checking the given num is prime or not
	function int prime(int num);
		
		if(num < 2)
			begin
				return 0;
			end
		
		// why we giving (num - 1) as max iterator is: the given number can only be divisble by less than that number not more than that number. if num is 15. we can divide that 15 by less that number not 15/16 or 15/20
		
		// iteration must start from 2 not from 1 and end by number less than that number, prime number is an whole number which can be divisble by either 1 or that number itself
		
		// If given number is divisble by 1, that number. It will return 0. else 1
		
		for(integer i = 2; i < (num - 1); i++) 
			begin
				if(num%i == 0)
					begin
						return 0;
					end
			end
		
		return 1; // returning 1 if that number is prime
		
	endfunction
	
	// here we are providing the argument num to function prime, 
	function void post_randomize();
	
	$display("Prime Number between %0d and %0d is: ", lower_range, upper_range);
		
		for(integer i = lower_range; i <= upper_range; i++ )
			begin
			// here one by one number between lower_range and upper_range. those number will give to prime(num) and check the returning value and if it is 1, then that number is prime and printed
				if(prime(i) == 1) 
					begin
						$write("%0d ", i);
					end
			end
	
	endfunction
	

endclass

module prime_top;

	sample s = new();
	
	initial
		begin
			assert(s.randomize());
		end

endmodule


