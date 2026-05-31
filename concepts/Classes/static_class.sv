// ----------------------- STATIC CLASS ----------------------------------
/*
-    Each instance of class have it's own variables
        Consider class having cls1, cls2, cls3 instance. each having it's own variables.
-    In Static class the variable are shared among the instances, shared SINGLE MEMORY LOCATION with all instances.
- In static class we cannot use the keyword virtual
- Static method CANNOT ACCESS non static members.
- Non-Static methods CAN ACCESS Static members.
-    Static members and method inside a class CAN ACCESS without creating objects

*/

// ========================== STATIC FUNCTION & FUNCTION STATIC ==========================
//    -------------- STATIC FUNCTION ------------
static function void fun();
    // definitions
endfunction
/*
    * can only ACCESS the STATIC variables not non-static
    * THIS and SUPER keyword cannot be used.
*/

//     ----------------- FUNCTION STATIC -----------------
function static void fun();
	// definitions
endfunction

/*
    * can ACCESS both static and non static variables
    * THIS and SUPER keyword can be used.
*/

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
