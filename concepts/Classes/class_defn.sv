/*
	* Class: Class can be considered as the blue print of the house
	* Object: Object is the physical house, and can built multiple houses using those blue print. In this memory allocation is happening
	* Class properties contain data members of different data types and class methods contain function and task.

*/

class packet;
  
  bit [7:0] data;
  bit [3:0] addrs;
  
  function new(bit [7:0] d, bit [3:0] a);
    data = d;
    addrs = a;
  endfunction 
  
  function display();
    $display("Data = %0d | Address = %0d", data, addrs);
  endfunction
  
endclass

module class_def();
  
  initial
    begin
      packet p1;
      
      p1 = new(8'hA5, 4'h3);
      
      p1.display();
    end
  
endmodule

// ------------------------------------ Assosiative Class ------------------------------------
// Assosiative Class

typedef enum{idle, setup, access} state;

class transaction;
  bit [31:0] data;
  int id;
endclass

module transaction_en();
  
  transaction tr[state];
  
  initial
    begin
      tr[idle] = new();
      tr[setup] = new();
      tr[access] = new();
      
      foreach(tr[i])begin
        tr[i].data = i**3;
        tr[i].id = i+1;
      end
      
      foreach(tr[i]) begin
        $display("tr[%0s].data = %0d | tr[%0s].id = %0d", i.name, tr[i].data, i.name, tr[i].id);
      end
   
    end
  
endmodule

// Solution
# KERNEL: tr[idle].data = 0 | tr[idle].id = 1
# KERNEL: tr[setup].data = 1 | tr[setup].id = 2
# KERNEL: tr[access].data = 8 | tr[access].id = 3








