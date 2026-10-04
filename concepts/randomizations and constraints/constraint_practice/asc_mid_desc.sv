// Statement
// array middle index the value should be in ascending order and after middle it should be in descending order



class transaction;
  rand int arr[];
  
  constraint c1{
    arr.size() == 10;
    
    foreach (arr[i]){
      
      arr[i] inside {[1:19]};
    
      if(i>0) 
        if(i<arr.size()/2) 
          arr[i] > arr[i-1];
        else 
          arr[i] < arr[i-1];
    }
  }
  
  
endclass

module top();
  
  transaction txn;
  
  initial
    begin
      txn = new();
      repeat(15) begin
        txn.randomize();
        $display("randomized");
      end
    end
  
  initial
    begin
      #2;
      foreach(txn.arr[i]) begin
        $display("index  = %0d value = %0d", i, txn.arr[i]);
      end
    end
  
endmodule

// OUTPUT
index  = 0 value = 3
index  = 1 value = 11
index  = 2 value = 13
index  = 3 value = 17
index  = 4 value = 19
index  = 5 value = 14
index  = 6 value = 11
index  = 7 value = 10
index  = 8 value = 4
index  = 9 value = 2
