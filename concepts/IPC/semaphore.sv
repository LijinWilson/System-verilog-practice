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


// ----------------------- OUTPUT -----------------------
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
