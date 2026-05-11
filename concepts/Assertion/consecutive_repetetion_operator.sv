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


// ========================== Go To reptetion =============================
//  In this case signal will match number of time, but not in continous cycle;
    //  Syntax: a[->2]
    // Here a will have to occur in 2 time, but not in continous cycle.

//  --------------------------- Example --------------------------------
// Go to reptetion
module got0_repetetion();

  bit clk;
  bit a;
  
//   initializing clock
  initial
    begin
      clk = 0;
    end
  
//   Clock Generation
  always #5 clk = ~clk;
  
//   Prepairing pass or fail condition
  initial
    begin
      a = 0;
      #10; a = 1;
      #10; a = 0;
      #10; a = 1;
      #10; a = 0;
      
//       Finish
      #20; $finish();
    end
  
  
// Assert condition
  assert property( @(posedge clk)
                  a[->2]
  )
    else
      $error("Fail");
  
endmodule


//   ============================== NON CONSECUTIVE REPETITION ===============================
    // Syntax: a[=3];
    /*
      ->  In this a have to become high for 3 time, not continously, but 'a' must not high for more than 3 times.
    */


    // Go to reptetion
module goto_repetetion();

  bit clk;
  bit a;
  
//   initializing clock
  initial
    begin
      clk = 0;
    end
  
//   Clock Generation
  always #5 clk = ~clk;
  
//   Prepairing pass or fail condition
  initial
    begin
      a = 0;
      #10; a = 1;
      #10; a = 0;
      #10; a = 1;
      #10; a = 0;
      #10; a = 1;
      
//       Finish
      #20; $finish();
    end
  
  
// Assert condition
  assert property( @(posedge clk)
                  a[=2]
  )
    else
      $error("Fail");
  
endmodule
