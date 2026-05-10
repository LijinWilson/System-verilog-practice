// -------------------------- IMPLICATION OPERATOR --------------------------

sequence seq;
  @(posedge clk) a ##2 b;
endsequence

/*
  -  In the above mentioned code, if 'a' not become high at any possitive cycle, it will generate error.
  -  If we want to check the sequence only after 'a' become high, then we can use the impication operator.
*/

/*
          --------- Implication Operator ----------
  -  This operator is similar to if-then operator.
  -  The left-hand side of the implication is called the “antecedent” and the right-hand side is called the “consequent.
  -  The antecedent is the gating condition. If the antecedent succeeds, then the consequent is evaluated.
  -  Thera are two implication
      -> Overlapped Implication.
      -> Non-Overlapped Implication.
  
*/

/*

  -------------------------- OVERLAPPED IMPLICATION ------------------------------
    *  Symbol: |->
    *  If their is match in antecedent, the consequent will be evaluated in same cycle.
    *    
*/

property p;
  @(posedge clk) a |-> b;
endproperty
a: assert property(p);


  /*
    ->  If a happens b should also happen in same cycle, other wise error will generated
  */

// Example:
  
module overlapped_implication();
  bit clk;
  bit valid, ready;
  
  always #5 clk = ~clk;
  
  initial
    begin
      clk = 0;
      
      valid = 0; ready = 0;
      #10; valid = 1; ready = 1;
      #10; valid = 0; ready = 0;
      #10; valid = 1; ready = 0;
      #20; $finish();
      
    end
        
// overlapped implication assertion
      
      assert property (@(posedge clk)
                      valid |-> ready
                      ) $display("Pass at valid=%0b, ready=%0b", valid, ready);
        else
          $error("failed at valid = %0b ready = %0b", valid, ready);
        
        
        initial
          begin
            $dumpfile("dump.vcd");
            $dumpvars(0, overlapped_implication);
          end
endmodule

        // Output 
        # KERNEL: Error: testbench.sv (25): failed at valid = 1 ready = 0

/*

  -------------------------- NON OVERLAPPED IMPLICATION ------------------------------
  *  Symbol: |=>.
  *  If their is match in antecedent, then consequent will evaluated in next clock cycle.
  
*/

  property p;
  @(posedge clk) a |=> b;
endproperty
a: assert property(p);

  /*
    *  if 'a' become then 'b' should also high in next clock cycle.
  */

  // Example
  // non overlap implication operator
module nonoverlap_implication_operator();
  bit clk;
  bit req, grant;
  
//   clock generator
  always #5 clk = ~clk;
  
//   Clock initialization
  initial
    begin
      clk = 0;
    end
  
//   pass fail condition
  initial
    begin
      req = 0; grant = 0;
      
//       pass case
      #10; req = 1; grant = 0;
      #10; grant = 1;
      
//       rising edge reset case
       #10; req = 0; grant = 0;
      
//       Fail case
      #10; req = 1; grant = 0;
      #10; grant = 0;
      
//       finish statement
      #20; $finish();
    end
  
//   Non-overlapping implication operation
  assert property(@(posedge clk)
                  $rose(req) |=> grant
                 )
    else
      $error("fail");
  
  
endmodule

// Output
# KERNEL: Error: testbench.sv (40): fail




  
