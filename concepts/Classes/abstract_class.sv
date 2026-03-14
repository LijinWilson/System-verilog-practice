// --------------------------------- ABSTRACT CLASS ---------------------------------
/*
- Class cannot be instantiated using new() keyword.
- Method defined insde the abstract class have to implemented inside the child class.
*/
/*
if we don't define the abstract class following error will come.

Error-[SV-VMNI] Virtual method not implemented
testbench.sv, 2
  Virtual method 'area' not implemented in class 'rectangle' (declared in 
  testbench.sv, at line 5).

1 error

--- so its mandatory that method/definition defined the inside the virtual class has to be defined inside the child class.
*/

virtual class abstract_class;
  pure virtual function int area();
endclass
    
    class rectangle extends abstract_class;
      
      int length, breadth;
      
      function new (int l, int b);
        this.length = l;
        this.breadth = b;
      endfunction
      
      function void display();
        $display("Rectangle Length = %0d, Breadth = %0d", this.length, this.breadth);
      endfunction
      
      function int area();
        return this.length*this.breadth;
      endfunction
      
    endclass
    
    module abstract_module();
      initial
        begin
          rectangle R =  new(10, 20);
          R.display();
          $display("Area = %0d", R.area());
        end
    endmodule

// -------------------------------- OUTPUT --------------------------------
// # Rectangle Length = 10, Breadth = 20
// # Area = 200
    
