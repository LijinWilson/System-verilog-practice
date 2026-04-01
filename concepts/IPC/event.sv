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

//                                                >>>>>>>>>>>>>>>>>>>>> EXAMPLES <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


//                 >->->->-> Example - 1 for @ OPERATOR <-<-<-<-<

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

//                 >->->->-> Example - 2 for WAIT OPERATOR <-<-<-<-<

    module WAIT_eventOperator();
  event ev_1;
  
  initial
    begin
      fork
//         process - 1
        begin
          $display("At %0t Triggering the event", $time);
          ->ev_1;
        end
        	
//         Process - 2
        begin
          $display("At %0t Waiting for an event to trigger", $time);
          wait(ev_1.triggered)
          $display("At %0t Event Triggered", $time);
        end
        
      join
    end
endmodule
/*
    - WAIT operator will resolve issue related with @ operator
*/
// --------------------------- OUTPUT ------------------------------  

# KERNEL: At 0 Triggering the event
# KERNEL: At 0 Waiting for an event to trigger
# KERNEL: At 0 Event Triggered

//                 >->->->-> Example - 3 for WAIT_ORDER OPERATOR <-<-<-<-<

    module AT_eventOperator();
  event ev_1, ev_2, ev_3;
  
  initial
    begin
      fork
//         Process - 1
        begin
          #2; $display("At %0t Triggering the event 1", $time);
          ->ev_1;
        end
        
//         Process - 2
        begin
          #4; $display("At %0t Triggering the event 2", $time);
          ->ev_2;
        end
        
//         Process - 3
        begin
          #6; $display("At %0t Triggering the event 3", $time);
          ->ev_3;
        end
        	
//         WAIT_ORDER OPERATOR
        begin
          $display("At %0t Waiting for an event to trigger", $time);
          wait_order(ev_1, ev_2, ev_3)
          $display("At %0t Events ev_1|ev_2|ev_3 Triggered in order", $time);
          else 
            $display("Event trigger not in order");
        end
        
      join
    end
endmodule

// -------------------------- OUTPUT ----------------------------------
# KERNEL: At 0 Waiting for an event to trigger
# KERNEL: At 2 Triggering the event 1
# KERNEL: At 4 Triggering the event 2
# KERNEL: At 6 Triggering the event 3
# KERNEL: At 6 Events ev_1|ev_2|ev_3 Triggered in order
