// --------------------------- SVA SEQEUNCE ---------------------------

/*
  - A sequence in SystemVerilog Assertions (SVA) is a construct used to describe a specific pattern of events or conditions occurring over one or more clock cycles.
  - It does NOT check or fail by itself.
  - It just defines a timing pattern.
  - 👉 Sequence = description of “what should happen over time”
*/



module asser_seq();
  bit clk;
  bit a, b;
  
 
//  Clock Generation 
  always #5 clk = ~clk;
  
// Dump File
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0, asser_seq);
    end
  
  // Stimulus
  initial begin
    
    clk = 0;
    
    a = 0; b = 0;

    #10 a = 1; b = 0;
    #10 a = 0;
    #10 b = 1;

    #10 a = 1; b = 0;
    #10 a = 0;
    #10 b = 0;

    #20 $finish;
  end
  
//   sequence definition
  sequence seq;
    a ##2 b;
  endsequence
  
//   defining assertion
  assert property(@(posedge clk) seq)
    $display("PASS - ");
    else $error("ERROR - sequence failed, As B has not become high after 2 cycle");
    
  
endmodule
