// Write SV constraints to generate prime number in given range.

class sample;

	rand bit [10:0] lower_range;
	rand bit [10:0] upper_range;
	rand bit [10:0] num;
	
	constraint my_con{
		lower_range inside {[1:10]};
		
		upper_range inside {[40:50]};
		
		solve lower_range, upper_range before num;
		
		num inside {[lower_range:upper_range]};
		
	}
	
	function int prime(int num);
		
		if(num < 2)
			begin
				return 0;
			end
		
		for(integer i = 2; i < (num - 1); i++)
			begin
				if(num%i == 0)
					begin
						return 0;
					end
			end
		
		return 1;
		
	endfunction
	
	
	function void post_randomize();
	
	$display("Prime Number between %0d and %0d is: ", lower_range, upper_range);
		
		for(integer i = lower_range; i <= upper_range; i++ )
			begin
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

// ===========================================================================================================
// -------------------------------------- OUTPUT --------------------------------
// ===========================================================================================================
# Prime Number between 5 and 41 is: 
5 7 11 13 17 19 23 29 31 37 41
