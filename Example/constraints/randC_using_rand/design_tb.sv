class sample;
  
  rand bit [2:0] x;
  
  bit [2:0] x_q[$]; // que for storing the each randomized element
  
  constraint my_con{
  
    !(x inside {x_q}); // value of x not inside the x_q;
    
  }
  
  function void post_randomize();
  
    x_q.push_back(x); // storing each value inside the que;
    
//     if(x_q.size() == 4)
    if(x_q.size() == 2**$bits(x))
      begin
        x_q.delete(); // if size of que is more than 4 delete the entire element inside the que
      end
    
  endfunction
  
endclass

// ++++++++++++++++++++++++++++++++++ TOP MODULE ++++++++++++++++++++++++++++++++++

module top();
  
  sample s;
  
  initial
    begin
      
      s = new();
      
      repeat(15) begin
        
        assert(s.randomize()); // else $display("Randomization failed :)");
        $write("%d  ", s.x);
      end
      
    end
  
endmodule

// ========================== OUPUT ==========================
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Oct 29 14:17 2026
5  3  6  2  0  1  4  7  4  1  5  7  0  2  6             V C S   S i m u l a t i o n   R e p o r t 
Time: 0 ns
CPU Time:      0.560 seconds;       Data structure size:   0.0Mb
Thu Oct 29 14:17:14 2026
