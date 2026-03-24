//---------------------------------- INSIDE OPERATOR ----------------------------------
// Random variable will get value specified inside the inside operator.
// ---------------------------------- SYNTAX ----------------------------------
// -> constraint constraint_name{variable_name inside{1, 3, [4..10], 11}};

class packet;
  rand bit [2:0] addr;
  // Here it will generate the value in between 0, 1, 2 to 7
  constraint packet_constraint {addr inside {0, 1, [2:7]};}
  
endclass

module inside_operator();
  initial
    begin
      packet p; 
      p = new();
      
      repeat(8)
        begin
          p.randomize();  
          $display("%0t | random_addr = %0d", $time, p.addr);
        end
    end
endmodule


// ------------------- OUTPUT ---------------------
# KERNEL: 0 | random_addr = 5
# KERNEL: 0 | random_addr = 4
# KERNEL: 0 | random_addr = 3
# KERNEL: 0 | random_addr = 6
# KERNEL: 0 | random_addr = 5
# KERNEL: 0 | random_addr = 6
# KERNEL: 0 | random_addr = 0
# KERNEL: 0 | random_addr = 2
  
