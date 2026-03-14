// Virtual class example
/*
- virtual class cannot be instantiated using new() keyword;
- it can be used/derived from another child class.
- cannot create the object of virtual class.
*/
virtual class Vehicle;

  function void start();
    $display("Vehicle starting");
  endfunction

endclass


class Car extends Vehicle;

  function void drive();
    $display("Car driving");
  endfunction

endclass


module tb;

  Car c;

  initial begin
    c = new();
    c.start();
    c.drive();
  end

endmodule
