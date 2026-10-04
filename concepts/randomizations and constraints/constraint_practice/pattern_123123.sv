class transaction;
  rand int arr[];
  
  constraint c1{
    arr.size() == 10; // declaring the array size
    
    foreach (arr[i])
      arr[i] == (i%3) + 1; // generating pattern of 123123
  
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
