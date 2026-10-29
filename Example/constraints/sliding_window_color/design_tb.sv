// -------------------- PROBLEM STATEMENT ---------------------
// A box contain 10 color. During randomization that particular color wont repeat for next three time and after three randomization that particular color can repeat, until no repeat.
// ------------------------------------------------------------


class sample;
  
  // creating 10 different color
  typedef enum bit[3:0] {C1, C2, C3, C4, C5, C6, C7, C8, c9, C10} col_name;
  
  // randomizing the col_name;
  rand col_name col;
  
  // creating the que for storing col;
  col_name col_q[$];
  
  // declaring the constraint not to pick the col inside the col_q;
  constraint my_con{
    
    !(col inside {col_q}); // donot take col inside the col_q. randomized col must not from col_q;
  
  }
  
  // post randomize;
  // storing the randomized color inside the que. so the color inside the que wont repeat;
  function void post_randomize();
    
    col_q.push_back(col); // storing each col value inside the que;
    
    // setting the sliding window concept with window size 3;
    
    if(col_q.size() > 3)
      begin
        
        col_q.pop_front();
        
      end
    
    $display("%0s", col);
  
  endfunction
             
  
endclass


// Top Module
module top;
  
  sample s = new();
  
  initial
    begin
      repeat(10) begin
        assert(s.randomize()) else $display("Randomization failed :)");
      end
    end
  
endmodule
