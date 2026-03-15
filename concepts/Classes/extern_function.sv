// ---------------------------------------- EXTERNAL FUNCTION ----------------------------------------
/*
- The logic/definition of the function is defined outside the class declaration.
- SYNTAX: extern virtual void/int/ function function_name();
- How to define the function outside class?
      function void class_name::function_name();
        statements;
      endfunction
- Change in argument name between method declaration and method definition will lead to a compilation error.
*/
/*
- An external function derived inside the class;
- Function is basically adding 2 numbers;
- on main module printing the values of sum;
*/

class extern_class;
  extern virtual function int display(int a, int b);
endclass
    
    function int extern_class::display(int a, int b);
      return a + b;
    endfunction
    
    
    module extern_function_module();
      initial
        begin
          extern_class ex = new();
          $display("External Sum = %0d", ex.display(10, 20));
        end
    endmodule
