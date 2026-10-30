// Statement
// Write and SV constraint to generate upper triangle matrix with diagonal element fibonachi series
/*
	Example:
		Upper triangle matrix
			2  0  1 1
			0 -1 -2 3
			0  0  1 4
			0  0  0 2
	This is the expected outcome
*/

//Making the array size dynamic using `define
`define M 8

class sample;

	// rand bit [4:0] arr[4][4]; // 4X4 Matrix
	rand bit [4:0] arr[`M][`M];
	
	
	constraint my_con{
		foreach(arr[i, j]){
			// RULE - 1: Making all element under the main diagonal as 0;
			( i > j ) -> ( arr[i][j] == 0 ); // change < to > to get lower triangle Matrix
			
			// RULE - 2: Making the diagonal element as fibonachi series
			if(i == j) { // diagonal element means i and j are same
				if(i == 0) { // In fibonachi series first two number are 1;
					arr[i][j] == 1;
				}
				else if(i == 1){
					arr[i][j] == 1;
				}
				else {
					arr[i][j] == arr[i-2][j-2] + arr[i-1][j-1]; // adding previos two element to get the new element
				}
			}
			
		}
	}
	
	// post_randomize function to print the array element
	function void post_randomize();
		for(integer i = 0; i < (`M); i++) begin
			for(integer j = 0; j < (`M); j++) begin
				$write("%d ", arr[i][j]);
			end
			
			$display(" ");
		end
	endfunction

endclass

module triangle_top();

	sample s = new();

	initial
		begin
			assert(s.randomize) else $error("Randomization Failed");
		end

endmodule
