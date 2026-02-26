// Static classes
static <data_type> <property_name>;

// It belongs to the class itself, NOT to individual objects.
// Normal variables belong to each object.
// Static variables are shared by ALL objects.

// ----------------- Example ---------------
/*
- In this example we are declaring a variable class_count which is shared across all object creation
- On each object creation this class_count will get increemented.
- 
*/

class student;
    static int class_count = 0;
    
    function new();
      class_count++;
    endfunction
  endclass

module class_sample();

  student s1 = new();
  student s2 = new();
  student s3 = new();
  student s4 = new();
  
  initial
    begin
      $monitor("Student Count = %0d", student::class_count);
    end
  
endmodule


// Output
# KERNEL: Student Count = 4
