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




  
