// SUDOKU : 9x9
/*
	Rules:
		1) All the element inside the sudoku must be from 1 to 9.
		2) All element on the row must be unique and is in the [range of 0 to 9 (RULE - 1)]
		3) All element on the coloum must be unique and is in the [range of 0 to 9 (RULE - 1)]
		4) Value inside the subgrid must be unique - here SUDOKU matrix is of 9 x 9, so subgrid matrix is of 3 x 3
*/


class sample;
  
  // creating 9x9 sudoku array;
  rand bit [3:0] sudoku_mat[9][9];
  
  // ===== RULE - 1 ====
	// constraint all value inside 1 to 9;
  constraint rule_1{
    foreach(sudoku_mat[i,j]){
      sudoku_mat[i][j] inside {[1:9]};
    }
  }

	// ======== RULE - 2 ======
	// row element unique.
	constraint rule_2{
		foreach(sudoku_mat[i,j]){ // outerloop
			foreach(sudoku_mat[, k]) { // innerloop - [j, k]
				(j != k) -> (sudoku_mat[i][j] != sudoku_mat[i][k]); // if j and k index are not same, value at that index also not same
			}
		}
	}
	
	// ========= RULE - 3 =========
	// Coloumn element unique
	constraint rule_3{
		foreach(sudoku_mat[i,j]){ // innerloop
			foreach(sudoku_mat[k, ]){ // outerloop [k,j]
				(i != k) -> (sudoku_mat[i][j] != sudoku_mat[k][j]);
			}
		}
	}
	
	// ========= RULE - 4 =========
	// subgrid element unique
	constraint rule_4{
		foreach(sudoku_mat[i,j]){
			foreach(sudoku_mat[m,n]){
				if((i/3 == m/3) && (j/3 == n/3)){
					if((i != m) || (j != n)){
						sudoku_mat[i][j] != sudoku_mat[m][n];
					}
				}
			}
		}
	}
	


     // adding the i and j value in each array location
	function void post_randomize();
		for(integer i = 0; i < 9; i++) begin
			for(integer j = 0; j < 9; j++) begin
				$write("%d", sudoku_mat[i][j]);
				
			end	
			$display(" ");

		end
	endfunction
           
      
endclass
    
module top();
      
	sample s = new();
      
  initial begin
    assert(s.randomize());
  end
      
endmodule
  
      
      

// OUTPUT
run -all
#  6 4 8 2 3 9 1 7 5 
#  1 3 9 4 7 5 6 8 2 
#  2 5 7 8 1 6 4 3 9 
#  3 6 2 9 5 8 7 1 4 
#  5 8 1 7 4 2 3 9 6 
#  7 9 4 1 6 3 5 2 8 
#  8 7 3 6 2 4 9 5 1 
#  4 2 5 3 9 1 8 6 7 
#  9 1 6 5 8 7 2 4 3 
