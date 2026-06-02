// ------------------------------- RANDOMIZATION -------------------------------
/*
- Process of creating random variable ( a variable getting random value on random is known as random variable ).
- It is easy in the case of variable alone. In the case of class it is very hard.
- For making it easy in the case of class. System verilog provide ---*rand*--- keyword and ---*randomize*--- Method.
- Class must havet to declared using random keyword and rardomize() method.
- Keyword: Rand and RandC
    - rand : example, rand bit [3:0] addr; In this it will give random variable from 0 to 15, same value can come again before completing 0 to 15 sequence.
    - randc : example randc bit [3:0] addr; It won't repeat the probability values until completing 0 to 15;
- Method: randomize();
    - randomize the variable inside the object; Example : object.randomize();
    - this is mandatory to declare for getting random value;
    
*/

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
          c.randomize();
          $display("Random variable generator rand = %0d | randc = %0d | Sum = %0d", c.addr_rand, c.addr_randc, c.sum(c.addr_rand, c.addr_randc));
        end
    end
endmodule

// -------------------------- OUTPUT --------------------------
/*
# KERNEL: Random variable generator rand = 7 | randc = 0 | Sum = 7
# KERNEL: Random variable generator rand = 1 | randc = 1 | Sum = 2
# KERNEL: Random variable generator rand = 3 | randc = 7 | Sum = 10
# KERNEL: Random variable generator rand = 3 | randc = 2 | Sum = 5
# KERNEL: Random variable generator rand = 0 | randc = 4 | Sum = 4
# KERNEL: Random variable generator rand = 6 | randc = 6 | Sum = 12
# KERNEL: Random variable generator rand = 3 | randc = 3 | Sum = 6
# KERNEL: Random variable generator rand = 5 | randc = 5 | Sum = 10
# KERNEL: Random variable generator rand = 0 | randc = 6 | Sum = 6
# KERNEL: Random variable generator rand = 0 | randc = 3 | Sum = 3      
*/

// =================== $URANDOM =================
/*
    - It will generate random unsigned 32 bit number.
    
*/
