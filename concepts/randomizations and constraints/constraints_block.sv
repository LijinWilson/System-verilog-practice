// ----------------------- CONSTRAINED BLOCK -----------------------

/* ----------------------- CONSTRAINED RANDOMIZATION -----------------------
- It is used in controlling the random value we will get specific value in a range.
- 
*/

// ----------------------- CONSTRAINED BLOCKS -----------------------
/*
- It looks similar to classes.
- Unique name inside class.
- Contains conditions to controls the random value.
- Enclosed with in braces {}.
- It can defined inside or outside class.     
*/

// ----------------------- SYNTAX -----------------------
/*
- constraints constraint_name {}.
- example: constraints addr_constr { addr < 5; }.
-> Solution: addr will get value more than 5;
*/


// ----------------------- CONSTRAINTS DEFINED OUTSIDE CLASS -----------------------

class constraints_rand;
//   rand will get value from 0 to 15 as it is 3 bit;
  rand bit [3:0] addr;

// randomizing the constraints, addr will get value 5 to 15
  constraint addr_range {addr > 5;}
  
endclass

module constraints_rand_module();
  initial
    begin
      constraints_rand cr = new();
      repeat(5)
        begin
//  enabling the randomization
          cr.randomize();
          $display("addr = %0d", cr.addr);
        end
    end
endmodule

// ----------------------- OUTPUT -----------------------
# KERNEL: addr = 15
# KERNEL: addr = 12
# KERNEL: addr = 14
# KERNEL: addr = 8
# KERNEL: addr = 8


// ----------------------- CONSTRAINTS DEFINED OUTSIDE CLASS -----------------------
class constraints_rand;
//   rand will get value from 0 to 15 as it is 3 bit;
  rand bit [3:0] addr;
  
// constraints defined outside class  
  constraint addr_range;
  
endclass

// constraints defined outside class
  constraint constraints_rand::addr_range {addr > 5;}

module constraints_rand_module();
  initial
    begin
      constraints_rand cr = new();
      repeat(5)
        begin
//  enabling the randomization
          cr.randomize();
          $display("addr = %0d", cr.addr);
        end
    end
endmodule

// ----------------------- OUTPUT -----------------------
# KERNEL: addr = 15
# KERNEL: addr = 12
# KERNEL: addr = 14
# KERNEL: addr = 8
# KERNEL: addr = 8


// ------------------------------ CONSTRAINTS USING INHERITANCE PROPERTY -------------------------------
// constraints using inheritance

class packet;
  rand bit [3:0] addr;
//   here random value is between 5 to 15;
  constraint adder_range {addr > 5;}
endclass

class packet_extnd extends packet;
//   Here random value will be in between 0 to 5;
  constraint adder_range {addr < 5;}
endclass

module constraint_mod();
  initial
    begin
      
      packet p = new();
      packet_extnd pe = new();
      
      
      $display("--------------------Parent Packet--------------------");
      repeat(10)
        begin
          p.randomize();
          $display("Packet random value: %0d", p.addr);
        end
      $display("--------------------Child Packet--------------------");
      repeat(10)
        begin
          pe.randomize();
          $display("Packet_extend random value: %0d", pe.addr);
        end
    end
endmodule

// OUTPUT
# KERNEL: --------------------Parent Packet--------------------
# KERNEL: Packet random value: 7
# KERNEL: Packet random value: 15
# KERNEL: Packet random value: 10
# KERNEL: Packet random value: 12
# KERNEL: Packet random value: 15
# KERNEL: Packet random value: 7
# KERNEL: Packet random value: 14
# KERNEL: Packet random value: 12
# KERNEL: Packet random value: 11
# KERNEL: Packet random value: 12
# KERNEL: --------------------Child Packet--------------------
# KERNEL: Packet_extend random value: 0
# KERNEL: Packet_extend random value: 0
# KERNEL: Packet_extend random value: 2
# KERNEL: Packet_extend random value: 0
# KERNEL: Packet_extend random value: 1
# KERNEL: Packet_extend random value: 1
# KERNEL: Packet_extend random value: 1
# KERNEL: Packet_extend random value: 0
# KERNEL: Packet_extend random value: 2
# KERNEL: Packet_extend random value: 1
