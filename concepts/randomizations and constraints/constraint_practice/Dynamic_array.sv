// Statement - 1;
// DYNAMIC ARRAY;
// Using constraint, allocate the size of Dynamic Array.
// Size we are going to allocate is 10;

// Statement - 2
// On each array location store store even number;

// Statement - 3;
// Storing even indexes with odd values;

// Statement - 4
// Store unique element inside array;

// Statement - 5
// Sorting array in ascending order;

// Statement - 6
// Ensure that no two adjacent elements share the same value.

class packet;
  // Statement - 1;
  rant int arr[];
  constraint c1 {arr.size == 10}; // Creating the dynamic array with size = 10;

  // Statement - 2
  constraint c2 {
    foreach (arr[i]) begin
      arr[i] % 2 == 0; // storing even number in each array location
    end
  }

    // Statement - 3;
    constraint c3 {
      foreach (arr[i]) begin
        if(i%2 == 0) begin
          arr[i]%2!=0; // for even number indexes storing the odd values.
        end
      end
    }

  // Statement - 4
  constraint c4 { unique {arr};}  // Store unique element inside an array.

  // Statement -5;
  constraint sort_asc_c {
    foreach (arr[i]) {
      if (i > 0) {
        arr[i] > arr[i-1]; // sorting array in ascending order;
      }
    }
  }
        
        arr.sum(); // to get sum of all element 
      
// Statement - 6
 constraint c2 {
  foreach (arr[i]) {
    if (i > 0) {
      arr[i] != arr[i-1]; // Make no adjacement element is same;
    }
  }
}     
        
endclass
