//   ---------------------- ASSERTION -----------------------
/*
    -> It is an formal way to check the design is performed/running in expected manner during simulation.
    -> It is an condition that must be true during simulation.
    -> Assertion is an statement that must be true.failure will by-default calls an error.
    -> We can call this much verbosity(severity) else case:
            > $error
            > $fatal
            > $warning
            > $info 
    -> If assertion fails, no else case is called. by default $error is called.
*/

/*
        -------------- FEATURE -------------

    -> Automatic Checking
    -> Faster Debugging.
    -> Cleaner Verification.
*/

//   --------------- TYPES ----------------
/*
    1. IMMEDIATE ASSERTION
        * Check for a condition at current simulation time.
        * Used inside procedural block.
        * It is same as If-Else statements.

        SYNTAX: label assert(expression) action_block.
*/
    
//   => ----------------------------- Example - 1 ------------------------------------
module imm_assertion();
  int a = 5;
  int b = 6;
  
  initial
    begin
      assert(a==b)
        $display("PASS");
      else
        $error("FAIL");
    end
  
endmodule

// output sample
// If condition failed
# KERNEL: Error: testbench.sv (10): FAIL
// If condition pass
# KERNEL: PASS
        
// => ------------------ Example - 2 ----------------------
module asertion_ex;
  bit clk,a,b;
  
  //clock generation
  always #5 clk = ~clk; 
  
  //generating 'a'
  initial begin 
    a=1;
    b=1;
    #15 b=0;
    #10 b=1;
        a=0;
    #20 a=1;
    #10;
    $finish;
  end
  
  //Immediate assertion
  always @(posedge clk) assert (a && b);
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0, asertion_ex);
    end

endmodule
// OUTPUT 
# ASSERT: Error: ASRT_0301 testbench.sv(20): Immediate assert condition (a&&b) FAILED at time: 15ns, scope: asertion_ex
# ASSERT: Error: ASRT_0301 testbench.sv(20): Immediate assert condition (a&&b) FAILED at time: 25ns, scope: asertion_ex
# ASSERT: Error: ASRT_0301 testbench.sv(20): Immediate assert condition (a&&b) FAILED at time: 35ns, scope: asertion_ex



// --------------------------------------- CONCURRENT ASSERTION --------------------------------------- 
/*
    -> It is evaluated only at clock tick.
    -> 

*/

// ----------- SYNTAX ----------- 
//      c_assert:  assert property(@(posedge clk) not(a && b));

    
