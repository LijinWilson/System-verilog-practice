// Statement: Write a system verilog constraint to generate unique element in an array without using unique keyword 
// CLASS 

class sample;
	rand bit [5:0] arr[15]; 
	
	constraint my_con{
		foreach(arr[i]) {
			foreach(arr[k]) {
				/* if(i != k) {
					arr[i] != arr[k];
					// $display(" , ");
				} */
				
				// or we can use implication operator
				(i != k) -> (arr[i] != arr[k]);
				
			}
		}
	}

endclass


// TOP MODULE 

module unique_top;

	sample s;

initial
	begin
		s = new();
		
		assert(s.randomize()) else $display("randomization failed :)");
		
		$display("%0p", s.arr);
		
	end 

endmodule

// ====================== OUTPUT ===========================
# 47 51 6 45 12 50 21 27 63 14 24 39 4 15 9

/*
	- If we want to use the unique, you can use = unique(arr); inside the constraint
	- Instead declaring: rand bit [5:0] arr[15]; 
		- rand bit [5:0] arr[]; and in constraint make arr.size == 10; 
*/
