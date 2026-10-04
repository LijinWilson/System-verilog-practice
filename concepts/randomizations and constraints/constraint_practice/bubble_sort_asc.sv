// Why we are using -----ref-------- keyword inside the function argument
/*
  1. Pass-by-Value vs. Pass-by-Reference (ref)
By default, function arguments in SystemVerilog are passed by value (a copy is created).

When you run function sort_asc(int arr[]);, the function creates a local copy of arr, sorts the local copy, and leaves the original arr in top untouched.

Fix: Use the ref keyword so the function modifies the original array directly in place: function void sort_asc(ref int arr[]);.
*/

// if we dont use the ref keyword, the sorted array wont print, instead the original array will print.


module top();
  
  int arr[] = {9, 5, 1, 3, 10, 3, 7, 2, 4, 6};
  int n;
  int temp;
   
  function sort_asc(ref int arr[]);
      n = arr.size();
      for(int i = 0; i < n-1; i++) begin
        for(integer j = 0; j < n - 1; j++) begin
          if(arr[j] > arr[j+1]) begin
            temp = arr[j];
            arr[j] = arr[j+1];
            arr[j+1] = temp;
          end
        end
      end
  endfunction
  
  initial begin
    sort_asc(arr);
    
    foreach (arr[i]) begin
    $display("arr[%0d] = %0d", i, arr[i]);
  end
  end
  
endmodule



// ----------- OUTPUT ---------------
1
2
3
3
4
5
6
7
9
10
