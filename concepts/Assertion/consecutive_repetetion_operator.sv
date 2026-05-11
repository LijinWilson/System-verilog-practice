// ============================== CONSECUTIVE REPETETIVE OPERATOR =================================

// ->  It is used to specify that, signal must match over a consecutive cycle.

// Syntax: signal[*n] or sequence[*n]
// 'n' is number of reptetion.

// ------------- Example ----------------
// Consecutive reptetion
module repetetion_operator();
  
  bit clk;
  bit a;
  
//   Clock Generation
  always #5 clk = ~clk;
  
//   Initializing clock
  initial
    begin
      clk = 0;
    end
  
//   Initialising pass and fail condition
  initial
    begin
      a = 0;
      
//       Pass condition
      #10; a = 1;
      #10; a = 1;
      #10; a = 1;
      
//       Fail Condition
      #10; a = 1;
      #10; a = 0;
      
//       Stop
      $stop();
    end
  
//   Defining assertion
  assert property(@(posedge clk)
                  a[*3]
                 )
    else
      $error("Fail :)");
  
  
endmodule

// Output
# KERNEL: Error: testbench.sv (39): Fail :)
