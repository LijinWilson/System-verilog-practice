// ------------------------------- RANDOMIZATION -------------------------------
/*
- Process of creating random variable ( a variable getting random value on random is known as random variable ).
- It is easy in the case of variable alone. In the case of class it is very hard.
- For making it easy in the case of class. System verilog provide ---*rand*--- keyword and ---*randomize*--- Method.
- Class must havet to declared using random keyword and rardomize() method.
- Keyword: Rand and RandC
    - rand : example, rand bit [3:0] addr; In this it will give random variable from 0 to 15, same value can come again before completing 0 to 15 sequence.
    - randc : example randc bit [3:0] addr; It won't repeat the probability values until completing 0 to 15;
- Method: randomize();
    - randomize the variable inside the object; Example : object.randomize();
    
*/
