


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
