// Virtual class
/*
- contain pure virtual methods which must be implemented by derived classes.
- In this case we have defined a function area, which must have to defined in all child classes.
*/


virtual class shape;
//   every shape must implement area
  pure virtual function int area();
endclass
    
    class Rectangle extends shape;
      
      int length;
      int breadth;
      
      function new(int l, int b);
        this.length = l;
        this.breadth = b;
      endfunction
      
      function int area();
        return length*breadth;
      endfunction
      
    endclass
    
    class Circle extends shape;

  int radius;

  function new(int r);
    radius = r;
  endfunction

  function int area();
    return 3 * radius * radius;
  endfunction

endclass
    
    module tb;

  Rectangle r;
  Circle c;

  initial begin
    r = new(5,4);
    $display("Rectangle area = %0d", r.area());

    c = new(3);
    $display("Circle area = %0d", c.area());
  end

endmodule

    // -------------------------- OUTPUT --------------------------
//     # KERNEL: Rectangle area = 20
// # KERNEL: Circle area = 27

    //---------------------------- VIRTUAL CLASS ----------------------------

/*
- we cannot instantiate the virtual class using new() keyword;
- it can be extended to another class using inheritance.
*/

virtual class animal;
  function void eat();
    $display("Animal eats!.. ");
  endfunction
endclass

class dog extends animal;
  function bark();
    $display("Dog Barks!..");
  endfunction
endclass


module sample();
  
  dog d;
  
  initial
    begin
      d = new();
      d.bark();
      d.eat();
    end
endmodule
