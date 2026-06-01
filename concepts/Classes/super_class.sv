// =============================== SUPER ========================
/*
  -  it is used to refer the function/method used in base-class from sub-class.
  -  
*/

// Example - 1
class parent_class;
  bit [31:0] data;
  
  function void display();
    $display("Parent: Data is %0d", data);
  endfunction
  
endclass

class Child_class extends parent_class;
  
  bit [31:0] data;
  
  function void display();
    super.data = 12;
    super.display();
    $display("Child: Data is %0d", data);
  endfunction
  
endclass

module top_mod();
  Child_class cl;
  
  initial
    begin
      cl = new();
      cl.data = 10;
      cl.display();
    end
  
endmodule

// Output 
# KERNEL: Parent: Data is 12
# KERNEL: Child: Data is 10

// Example - 2
// In this example super.new is called automatically on internally
class parent_class;
  bit [31:0] data;
  int id;
  
  function void display();
    $display("Parent: Value of data = %0d, Id = %0d", data, id);
  endfunction
  
endclass

class child_class extends parent_class;
  bit [31:0] data;
  int id;
  
  function void display();
    $display("Child: Value of Data = %0d, Id = %0d", data, id);
  endfunction
  
endclass

module top_mod();
  initial
    begin
      parent_class pl;
      child_class cl;
      
      cl = new();
      cl.data = 10;
      cl.id = 1;
      
      pl = cl;
      pl.data = 20;
      pl.id = 2;
      
      pl.display();
      cl.display();
    end
endmodule

// Output 
# KERNEL: Parent: Value of data = 20, Id = 2
# KERNEL: Child: Value of Data = 10, Id = 1
