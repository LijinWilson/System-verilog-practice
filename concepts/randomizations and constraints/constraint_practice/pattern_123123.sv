class transaction;
  rand int arr[];

  constraint arr_size {
    arr.size() == 10;
  }

  constraint patrn_123123 {
    foreach (arrr[i]) begin
      arr[i] == (i%3) + 1;
    end
  }

endclass
