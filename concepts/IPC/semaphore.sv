// ----------------------------------- SEMAPHORE -----------------------------------

/*
                    <------------------ CONCEPT -------------------->
-> Used to control access across the shared resource(Memory) to avoid race around condition.
-> Scenario example: consider a situation taking one item from store house. In store house one person can enter at a time. 
-> For entering and exiting from store house we need key/token
-> We have to get() key while entering store house and put() key while leaving from store house so other person can use it.
*/

//     <------------------------ SYNTAX ------------------------>
/*
-> new(); Create a semaphore with a specified number of keys
-> get();   Obtain one or more keys from the bucket
-> put();   Return one or more keys into the bucket
-> try_get(); Try to obtain one or more keys without blocking
*/

// parking slot booking and exiting
module parking_slot();
  semaphore slot;
  
 	initial
      begin
        slot = new(2);
        fork
          car(1, 4);
          car(2, 3);
          car(3, 2);
          car(4, 1);
//           car(5, 3);
        join
      end

  // Whenever using task/function is fork-join(parallel execution) use AUTOMATIC
  /*
          ---------------- AUTOMATIC ----------------
  -> tasks and functions re-entrant by allocating separate storage for each invocation.
  -> preventing data corruption in concurrent execution (Race Around Condition)
  */
  
  task automatic car(int car_id, int park_time);
    $display("-----------------------------------");
    $display("%0t time car %0d arriving", $time, car_id);
    slot.get();
    
    $display("%0t time car %0d parked", $time, car_id);
    #park_time;
    
    $display("%0t time, car %0d leaving", $time, car_id);
    slot.put();
    
  endtask

endmodule


//                 OUTPUT 
# KERNEL: -----------------------------------
# KERNEL: 0 time car 1 arriving
# KERNEL: 0 time car 1 parked
# KERNEL: -----------------------------------
# KERNEL: 0 time car 2 arriving
# KERNEL: 0 time car 2 parked
# KERNEL: -----------------------------------
# KERNEL: 0 time car 3 arriving
# KERNEL: -----------------------------------
# KERNEL: 0 time car 4 arriving
# KERNEL: 3 time, car 2 leaving
# KERNEL: 3 time car 3 parked
# KERNEL: 4 time, car 1 leaving
# KERNEL: 4 time car 4 parked
# KERNEL: 5 time, car 3 leaving
# KERNEL: 5 time, car 4 leaving


// ----------------------------- EXAMPLE - 2 --------------------------------
/*
Statement.
-> Their are 4 powerunit, 4 robots.
-> Each robot need 2 power unit.
-> Means 2 process/robot will run/work at a time.
*/



module semaphore_multi_key();
  semaphore power_unit;
  
  initial
    begin
//       4 keys are avaialble
      power_unit = new(4);
      
		fork
//       robot(id, work_time);
      		robot(1, 5);
      		robot(2, 4);
      		robot(3, 3);
      		robot(4, 2);
        join
    end
  
//   Defining robot allocation
  task automatic robot(int id, int run_time);
    
    $display("At time %0t, Robot %0d REQUESTED 2 power unit ", $time, id);
//     each machine/bot need 2 power unit/KEYS
    power_unit.get(2);
    
    $display("------------------------------------------------------------");
    
    $display("At time %0t, Robot %0d STARTED (GOT 2 UNIT)", $time, id);
    #run_time;
    
    
    $display("At time %0t, Robot %0d work FINISHED (LEAVES @ UNIT)", $time, id);
    power_unit.put(2);
//     disconnected the power unit after working, DUMP KEYS.
    $display("------------------------------------------------------------");
  endtask
  
endmodule

//                 OUTPUT 
# KERNEL: At time 0, Robot 1 REQUESTED 2 power unit 
# KERNEL: ------------------------------------------------------------
# KERNEL: At time 0, Robot 1 STARTED (GOT 2 UNIT)
# KERNEL: At time 0, Robot 2 REQUESTED 2 power unit 
# KERNEL: ------------------------------------------------------------
# KERNEL: At time 0, Robot 2 STARTED (GOT 2 UNIT)
# KERNEL: At time 0, Robot 3 REQUESTED 2 power unit 
# KERNEL: At time 0, Robot 4 REQUESTED 2 power unit 
# KERNEL: At time 4, Robot 2 work FINISHED (LEAVES @ UNIT)
# KERNEL: ------------------------------------------------------------
# KERNEL: ------------------------------------------------------------
# KERNEL: At time 4, Robot 3 STARTED (GOT 2 UNIT)
# KERNEL: At time 5, Robot 1 work FINISHED (LEAVES @ UNIT)
# KERNEL: ------------------------------------------------------------
# KERNEL: ------------------------------------------------------------
# KERNEL: At time 5, Robot 4 STARTED (GOT 2 UNIT)
# KERNEL: At time 7, Robot 3 work FINISHED (LEAVES @ UNIT)
# KERNEL: ------------------------------------------------------------
# KERNEL: At time 7, Robot 4 work FINISHED (LEAVES @ UNIT)
# KERNEL: ------------------------------------------------------------
