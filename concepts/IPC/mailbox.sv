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















