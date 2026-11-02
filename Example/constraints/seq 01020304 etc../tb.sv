// SV constraint to generate sequence 0 1 0 2 0 3 0 4 0 5 0 6.....

class sample;

	rand bit [4:0] x [8];
	
	constraint my_con{
	
		foreach(x[i]){
		
			if(i%2 == 0){
				x[i] == 0;
			}
			else {
				x[i] == ((i + 1)/2);
			}
		
		}
		
	}
	
	

endclass

module seq_010203_top;
	sample s;

	initial
		begin
			s = new();
			
			assert(s.randomize());
			
			$write("%p ", s.x);
		end
endmodule

// OUTPUT
'{0, 1, 0, 2, 0, 3, 0, 4}
