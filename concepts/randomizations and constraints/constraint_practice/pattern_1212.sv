class transaction;
  rand int arr[];

  constraint pattern_c {
    arr.size() == 4; // Or whatever length you want
  
    foreach (arr[i]) {
      arr[i] == (i % 2) + 1;
    }
  }
      
endclass
