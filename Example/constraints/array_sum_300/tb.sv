// Sum of all element in array equals to 300 without using arr.sum() method;

class sample;

	rand bit [10:0] arr[10];
	
	rand bit [10:0] helper_arr[10]; // Helper Array;

	constraint my_con{
	
		helper_arr[0] == arr[0]; // Making first element inside the helper_arr as same as first element in arr;
		
		// Array
		foreach(arr[i]){
			arr[i] inside {[1:100]};
			
			if( i>0 ) {
			
				helper_arr[i] == (helper_arr[i-1] + arr[i]);
			
			}
					
		}
		
		helper_arr[9] == 300;
		
	}

endclass

module arr_sum_top();

	sample s = new();
	
	initial
		begin
			assert(s.randomize()) else $error("Randomization Failed :)");
			$write("Array = %0p", s.arr);
		end

endmodule

// ===================================================== OUTPUT =============================================================
    Array = 54 49 49 45 20 1 1 36 44 1
