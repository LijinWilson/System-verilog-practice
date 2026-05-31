// -------------------- THIS keyword ---------------------
class packet();
  byte a;
  byte b;
  
  function void set_data(byte a, b);
    a = a;
    b = b
  endfunction
  
endclass

/*
  - In this time compiler will confuse which is class variable and argument passed to the method.
  - Inorder to avoid this we use the keyword this to mention/refer the class properties, paramter and methods of the current class.
  - This keyword can be used only inside the non-static methods
*/ 
class packet();
  byte a;
  byte b;
  
  function void set_data(byte a, b);
    this.a = a;
    this.b = b
  endfunction
  
endclass

// ======================= EXAMPLE - 1 ===========================
class transaction;
  bit [31:0] addrs;
  int id;
  
  function new(bit [31:0] addrs, int id);
    this.addrs = addrs;
    this.id = id;
  endfunction
  
  function display();
    $display("Addrs = %0d | Id = %0d", this.addrs, this.id);
  endfunction

endclass

module trans_mod();
  transaction tr;
  
  initial
    begin
      tr = new(10, 2);
      tr.display();
    end
endmodule

// OUTPUT
# KERNEL: Addrs = 10 | Id = 1
