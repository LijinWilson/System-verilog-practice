//   ---------------------- ASSERTION -----------------------
/*
    -> It is an formal way to check the design is performed/running in expected manner during simulation.
    -> It is an condition that must be true during simulation.
    -> 
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
    
//   => Example
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
        
