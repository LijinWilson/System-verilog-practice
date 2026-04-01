//         SYSTEM VERILOG EVENT
/*
    ->  Maintain synchronization between process.
    
    ->  Event operation is of Two staged process.
          *  One process will trigger the event.
              => Event can be triggered using -> or ->> operator
          *  Other process will wait for event to get trigger.
              => Triggered using wait or @ opeartor.
    
    ->  EVENT TRIGGERING.
        *  Named event are reprsneted using (->)
        *  Triggering an event unblocks all event that is waiting on that event.
        *  Non-Blocking events are trigggered using this (->>) operator
    
    ->  WAITING FOR EVENT TRIGGER.
        =>  @ Operator.
            *  SHORT MEANING: Don't do anything, just wait until something happens.
            *  @event → wait for something to happen.
            *  ->event → something just happened.
            *  You must start waiting (@event) before the event happens (->event).
            *  [VIMP] The waiting process must execute the @ statement before the triggering process executes the trigger operator, ->.
                -> Real Life Example.
                    -  Case 1: Correct (Works)
                        1) You stand ready and listen (@event → waiting)
                        2) Teacher says “start” (->event → trigger)
                        3) You hear it and begin  
    
        =>  WAIT OPERATOR
            *  @event → can miss the event if both happen at the same time
            *  wait(event.triggered) → will not miss it.

        =>  WAIT_ORDER OPERATOR
            *  wait_order() waits for multiple events to happen in a specific order
            *  If it not triggered in order it will not unblock the process and cause runtime error.
*/

// >>>>>>>>>>>>>>>>>>>>> EXAMPLES <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
// >->->->->-    Example - 1 for @ OPERATOR
module AT_eventOperator();
  event ev_1;
  
  initial
    begin
      fork
//         process - 1
        begin
          #40; $display("At %0t Triggering the event", $time);
          ->ev_1;
        end
        
//         Process - 2
        begin
          $display("At %0t Waiting for an event to trigger", $time);
          @(ev_1.triggered)
          $display("At %0t Event Triggered", $time);
        end
        
      join
    end
endmodule

/*
        ->    PROCESS 1 and PROCESS 2 run at same time.
        ->    Here @ operator get ready before the event get trigger.
        ->    At 40'th second event and @ OPERATOR trigger at same time.
*/

// --------------------------- OUTPUT ------------------------------  
# KERNEL: At 0 Waiting for an event to trigger
# KERNEL: At 40 Triggering the event
# KERNEL: At 40 Event Triggered
