// ---------------------------- MAIL BOX ------------------------------
/*
  -> It is also used for communication, where it TRANSFER DATA BETWEEN TWO PROCESS or PASS MESSAGE BETWEEN EACH PROCESS.
  -> It like normal gmail, one process PUT DATA and another process takes data (FIFO).
  -> 
  ->
*/

/*
        ----------------- USE CASE -----------------
    -> avoid RACE CONDITION
*/

/*
          -------------------- BOUNDED AND UNBOUNDED MAILBOX -------------------
  -> BOUNDED MAILBOX: - Size is defined.
                      - Chances are their to get mail box full.
                      - If full it wont allow / suspend putting mail inside mail box until sufficeint space is free
  
  -> UNBOUNDED MAILBOX: Unlimited Size.
  
*/

/*
        -------------------------- MAIL BOX TYPE ----------------------------
  -> GENERIC MAIL BOX: We can send message/data of any datatype.
  -> PARAMETRIZED MAILBOX: Send message/data of specific data type.
*/

/*
    -------------------------------------- MAILBOX METHODS -------------------------------------
  -> NEW(): - Create new mailbox.
            - mailbox mailbox_name =  new();
  -> PUT(): put some data inside mail box.
  -> GET(): Get the message from the mailbox.
*/

//                                 -----------SAMPLE CODE -----------
module simple_mailbox();
  mailbox mail;
  initial
    begin
      mail = new();
      fork
        sender();
        reciever();
      join
    end
  //   defining the sender logic;
  task sender();
    for(int i = 0; i <= 10; i=i+1)
      begin
        #2;
        $display("At %0t time, sending %0d to mailbox", $time, i);
        mail.put(i);
      end
  endtask
  
//   defining the logic of reciever
  task reciever();
//     defining the variable for getting data
    int data;
    repeat(3)
      begin
        mail.get(data);
        $display("At time %0t recieved %0d", $time, data);
      end
  endtask
  
  
  
endmodule
/*
  -> Task and reciver will exicute parallely at same time
  -> Semder will keep on sending data and reciver will recieve those data at same time.and display those values.
*/

// --------------------------- OUTPUT -------------------------------
# KERNEL: At 2 time, sending 0 to mailbox
# KERNEL: At time 2 recieved 0
# KERNEL: At 4 time, sending 1 to mailbox
# KERNEL: At time 4 recieved 1
# KERNEL: At 6 time, sending 2 to mailbox
# KERNEL: At time 6 recieved 2
# KERNEL: At 8 time, sending 3 to mailbox
# KERNEL: At 10 time, sending 4 to mailbox
# KERNEL: At 12 time, sending 5 to mailbox
# KERNEL: At 14 time, sending 6 to mailbox
# KERNEL: At 16 time, sending 7 to mailbox
# KERNEL: At 18 time, sending 8 to mailbox
# KERNEL: At 20 time, sending 9 to mailbox
# KERNEL: At 22 time, sending 10 to mailbox

// ------------------------------------------- EXAMPLE - 2 ------------------------------------------











