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
