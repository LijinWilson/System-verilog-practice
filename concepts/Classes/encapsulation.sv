// -------------------------- ENCAPSULATION --------------------------
// implementing the encapsulation using protected variable
// Encapsulation can be done in two way 1) Local and 2) protected
// protected variable can be accessed from derived class
/* Here a variable is defined using protected variable and it is defined inside the parent class and it is derived inside the child class
 from their we can access the protected variable defined inside the parent class, this is the only way to define/get the protected variable.
*/




class parent_class;
  protected bit [31:0] tmp_addr;
  
  function new(bit [31:0] r_addr);
    tmp_addr = r_addr + 10;
  endfunction
  
  function void display();
    $display("temp Adder = %0d", tmp_addr);
  endfunction
  
endclass

class child_class extends parent_class;
  
  function new(bit [31:0] r_addr);
    super.new(r_addr);
  endfunction
  
  function incr_addr();
    tmp_addr++;
  endfunction
  
endclass

module encapsulation;
  initial
    begin
      child_class c_c = new(10);
      c_c.incr_addr();
      c_c.display();
    end
endmodule


// -------------------------- OUTPUT --------------------------
temp Adder = 21
