// -------------------------- DISABLE RANDOMIZATION --------------------------
/*
- Used to stop generating random value for an random variable.
- It can be done using method random_mode();
        - random_mode(0); -> it will stop the variable from generating random value;
        - random_mode(1); -> It will continue the variable from generating random value;
*/

/*
SYNTAX:
      - <object_handle>.<variable_name>.rand_mode(~0/1);
      - default value is always 1;
*/

// -------------------------- DISABLING ONE VARIABLE FROM RANDOMIZATION --------------------------
class random_class;
  rand bit [2:0] addr_rand;
  randc bit [2:0] addr_randc;
  
  extern virtual function int sum(int a, int b);
  
endclass
    
//     External class
    function int random_class::sum(int a, int b);
        return a + b;
    endfunction

module rand_module();
  initial
    begin
      random_class c = new();
      repeat(10)
        begin
          c.addr_randc.rand_mode(0);
          c.randomize();
          $display("Random variable generator rand = %0d | randc = %0d | Sum = %0d", c.addr_rand, c.addr_randc, c.sum(c.addr_rand, c.addr_randc));
        end
    end
endmodule

// -------------------------- OUTPUT -------------------------- 
/*    
    # KERNEL: Random variable generator rand = 7 | randc = 0 | Sum = 7
# KERNEL: Random variable generator rand = 4 | randc = 0 | Sum = 4
# KERNEL: Random variable generator rand = 1 | randc = 0 | Sum = 1
# KERNEL: Random variable generator rand = 3 | randc = 0 | Sum = 3
# KERNEL: Random variable generator rand = 3 | randc = 0 | Sum = 3
# KERNEL: Random variable generator rand = 0 | randc = 0 | Sum = 0
# KERNEL: Random variable generator rand = 6 | randc = 0 | Sum = 6
# KERNEL: Random variable generator rand = 3 | randc = 0 | Sum = 3
# KERNEL: Random variable generator rand = 5 | randc = 0 | Sum = 5
# KERNEL: Random variable generator rand = 0 | randc = 0 | Sum = 0
*/

// -------------------------- DISABLING ALL VARIABLE FROM RANDOMIZATION --------------------------
class random_class;
  rand bit [2:0] addr_rand;
  randc bit [2:0] addr_randc;
  
  extern virtual function int sum(int a, int b);
  
endclass
    
//     External class
    function int random_class::sum(int a, int b);
        return a + b;
    endfunction

module rand_module();
  initial
    begin
      random_class c = new();
      repeat(10)
        begin
          c.rand_mode(0);
          c.randomize();
          $display("Random variable generator rand = %0d | randc = %0d | Sum = %0d", c.addr_rand, c.addr_randc, c.sum(c.addr_rand, c.addr_randc));
        end
    end
endmodule
// -------------------------- OUTPUT --------------------------
/*
# KERNEL: Random variable generator rand = 0 | randc = 0 | Sum = 0
# KERNEL: Random variable generator rand = 0 | randc = 0 | Sum = 0
# KERNEL: Random variable generator rand = 0 | randc = 0 | Sum = 0
# KERNEL: Random variable generator rand = 0 | randc = 0 | Sum = 0
# KERNEL: Random variable generator rand = 0 | randc = 0 | Sum = 0
# KERNEL: Random variable generator rand = 0 | randc = 0 | Sum = 0
# KERNEL: Random variable generator rand = 0 | randc = 0 | Sum = 0
# KERNEL: Random variable generator rand = 0 | randc = 0 | Sum = 0
# KERNEL: Random variable generator rand = 0 | randc = 0 | Sum = 0
# KERNEL: Random variable generator rand = 0 | randc = 0 | Sum = 0
*/
