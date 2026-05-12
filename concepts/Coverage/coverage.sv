// ========================================= COVERAGE ================================================

/*
    *  It is used to test the tested and untested area in an design.
    *  To ensure that the design has behaved as expected under different condition.
    *  It identify the area that have overlooked or not tested.so that it minimized the undetected bugs.
    *  It show how well the design has tested and tell the area that has been less tested.
    *  It is the percentage of verifications that have met.
    *  Two Type:
        *  CODE COVERAGE: Measure how much RTL code is executed (Did code run?.., all the cases condition has been exercised by TB)[DONE AUTOMATICALY].
        *  FUNCTIONAL COVERAGE: Measure whether all importand functional things are happened (Did intended scenarios occur?..)[MANUALLY].
              * Two Types:
                    *  DATA ORIENTED COVERAGE:  checks whether all relevant input/output data values and ranges have been used (What values/data were used?..).
                    *  CONTROL ORIENTED COVERAGE:  Control-oriented coverage checks whether all control paths, states, and sequences of operation have been exercised (How design behaved / which paths taken?..)
*/

// ============================================= FUNCTIONAL COVERAGE ===================================================
/*
  -  Duringe verification we have to measure that all the design behavior, conditions, have been checked/runned.
  -  Did I verify what the design is supposed to do?
  -  Even though 100% code coverage achieved, but still can miss the corner case, illegal scenarios, protocol violation etc...
  -  FUNCTION COVERAGE ensure the VERIFICATION COMPLETNESS.
*/


// ========================================== COVER GROUP ================================================

/*
   -  It is user defined construct, that contain coverage model specifications (the list of signals to be tracked) [similar to interface].
   -  Using the keyword NEW(), we can instantiate it many time in various context.
   -  Coverage model specifications contains
                        ->  Set of coverage points (signals that are going to be tested).
                        ->  cross coverage between coverage points (combination of values b/w two or more coverage points).
                        ->  Clocking events (at which edge we have to sample the coverage points).
                        ->  Coverage options (to control the cover group, coverage points, cross coverage)
                        ->  Formal arguments
*/

// -------------------- SYNTAX --------------------
/*
   A) BASIC COVER GROUP:   
                     covergroup <cover group name>
                        ...........
                     endgroup

                     <cover model name><cover inst> = new();
   B) LIST OF ARGUMENT IN COVER GROUP
                     covergroup <cover group name> (<list of argument>)
                        ............
                     endgroup

                     <cover model name><cover inst> = new(<list of argument>);   
                     
   C) WITH CLOCKING EVENT
                     covergroup <cover group name> @(<clocking event>)
                        ............
                     endgroup

                     <cover model name><cover inst> = new();   

*/

// --------------------------- Component inside the coverage group --------------------------------
/*
   -  COVER POINTS:
                  *  list of variables that has to be considered in covering groups.
                  *  we can label the cover points if it contain more than one.
                  *  Each coverpoints is explicitly associated with single or multiple BINS.
                  * If we want to monitor the signal, we have to mention those variable with coverpoint.

                  EXAMPLE:
                           covergroup cg @(posedge clk);
                              cp1: coverpoint addr;
                              cp2: coverpoint data;
                           endgroup : cg

   -  BINS
                  *  Bins contain some specific values or range of values that are to monitored during simulation.
                  *  It is like asking question (Did i see this value).
                  *  The bins can be generated automatically and eplicitly
                  *  Using Bins we can add or remove certain value from testing/monitoring
                  *  Bin can also marked as illegal. Certain values can be marked as illegal.

                  EXAMPLE:
                           covergroup <covergroup_name>;
                              <coverpoint_label> : coverpoint <signal_name> {
                                                                              bins <bins_name> = {<values>};
                                                                              bins <bins_name> = {<values>};
                                                                            }
                                 ....
                                 ....
                           endgroup
      EXPLICIT BINS:
                  * bin b1 = {1, 2, 3}   => it willl create single bin for all this values.
                  * bin b2[] = {[0:9], 11}   => I will creat 11 bin, if size is not defined in the case vector bin, it will create each bin for each values. 
                                                ie 0 to 9 in 10 bin and 11 in 11nth bin.
                  * bin b3[4] = {[0:7]}   => create 4 bin which equally divide all value inside the bin, b3[0] = 0 and 1, b3[1] = 2 and 3 and so on.
                                             If in the case any extra value came means 9 number can be divide equally in 4 boxes.
                                             so the extra value will added in the last bin so last bin contain 3 values
                  * logic [2:0]data
                        <Label> coverpoint data = {bins b1 = {4, $}; => here it will create one bin contain values 4 to 7(as last number for [2:0] is 7).
                                                   bin b2[] = {2, 3, 6}; here it will creat three bin each having values b2[0] = 2, and so on...
                                                  }
      IMPLICIT BINS:
                  * logic [0:3] addr;
                        =>   In this case 16 implicit bins are created in this case
                        =>   why 16 bins? as size of addr is 4 bit so max values is 16 so...
                  *  logic en
                        =>   Here 2 bins will created.
                  * The default maximum autobin we can creat is 64 not more than that, which means 2^6.
                  * if it crosses more than 6 means 2^7, then value in each bin will increased by (2^7)/64 = 4 value per bin.
                  * Or we can increase it by, we can the limit value. option.auto_bin_max = 256.
*/
