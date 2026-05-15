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


// ====================================================== CROSS COVERAGE ============================================================

/*
   -   A coverage group can specify the cross coverage between the variable or coverage points.
   -   Cross coverage is specified using cross contruct.
         - Syntax: <cross_label>: cross <coverage_points1, coverage_points2, etc... >;
   -   If variable is in part of the cross coverage, SV will implicitly convert those variable to cross coverage.
   -   Cross involves only coverage points.
   -   if we want to use expressions inside the cross coverage, we have to define those explicitly as coverage points.
   -   
*/


//---------------------- EXAMPLE ---------------------
/*
   bit [4:0] data addr;
   bit [3:0] valid;
   bit en;

   covergroup c_group @(posedge clk);
      cp1: coverpoint addr&en; (for cp1 10 bins will be created)
      cp2: coverpoint data;(for cp2 2^6 = 64 bins will be created)

      cp1_x_cp2: cross cp1, cp2; (cross coverage between 2 expression, 10 X 64 = 640 coverage bins will be created).
      valid_x_cp2: cross valid, cp2; (2^4 X 10 = 160) cross bins will be created
   endgroup
*/


/*
   -   If any coverage points are defined a illegal, default or ignored. we cannot define the cross coverage of that coverage_points.
   -   Cross coverage will only allowed in between the coverage point defined within the same coverage group.
   -   if so try, it will generate an error.
   -   
*/


// ============================================ COVERAGE CONSTRUCTS ==============================================
/*
   -   >>>>>> IFF Construct <<<<<<<
         -   Similar to if and else condition, based on the condition it will include and exclude the coverpoint inside the coverage group.
         -   Example:
               - covergroup cg;
                     cp1: coverpoint data iff(!reset) {bins for data}
                 endgroup: c_group
         -   if the reset is 0, coverpoint data will collected inside the coverage report.
   
   -   >>>>>> BINSOF Construct <<<<<<<
         -   Bins of one coverpoint can be used another coverpoint without redefining them.
         -   SYNTAX: binsof(<coverage_point>);
               -   cp1: coverpoint v;
                   cp2: coverpoint v {
                                        bins v1 = {4, 5, 6};
                                        bins v2 = {1, 2, 3};
                                     }
                   bins xy1 = binsof(cp1);
                   bins xy2 = binsof(cp2,v2);

   -   >>>>>> INTERSECT CONSTRUCT <<<<<<<
         -   It is generally used with binsof construct which is used to include or exlude set of value in bins that intersect a set of values
         -   SYNTAX: binsof(<coverage_points>) intersect (<range_of_values>);
   
   -   binsof(cp) intersect {r}
         -   cp: coverpoint a {
                 bins b1 = {0,1};
                 bins b2 = {2,3};
               }
               
            -   “From all bins of cp, pick only those bins that contain value r”
             
         -   !binsof(cp) intersect {r} 
            -   Select all bins of cp that do NOT contain value r.

         -   coveragegroup_value_range can have single value {5}, range of value {[10:20]} or an oper range
               - open range: 
                        -   {[$:50]}: cover all value from <= 50
                        -   {[100:$]}: cover all value from >=100;
         bit [7:0] v_a, v_b;

         covergroup cg @(posedge clk);
         
           a: coverpoint v_a {
             bins a1 = {[0:63]};
             bins a2 = {[64:127]};
             bins a3 = {[128:191]};
             bins a4 = {[192:255]};
           }
         
           b: coverpoint v_b {
             bins b1 = {0};
             bins b2 = {[1:84]};
             bins b3 = {[85:169]};
             bins b4 = {[170:255]};
           }
         
           c: cross a, b {
         
             bins c1 = !binsof(a) intersect {[100:200]};
             // 4 cross products: <a1,b1>, <a1,b2>, <a1,b3>, and <a1,b4>
         
             bins c2 = binsof(a.a2) || binsof(b.b2);
             // 7 cross products:
             // <a2,b1>, <a2,b2>, <a2,b3>, <a2,b4>,
             // <a1,b2>, <a3,b2>, <a4,b2>
         
             bins c3 = binsof(a.a1) && binsof(b.b4);
             // 1 cross product: <a1,b4>
         
           }
         
         endgroup
*/





