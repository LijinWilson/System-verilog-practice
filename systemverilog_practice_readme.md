# 🚀 SystemVerilog Practice Repository

Welcome to my **SystemVerilog Practice Repository**!

Whether you are a beginner looking to understand the basics of Object-Oriented Programming (OOP) in SystemVerilog, or an intermediate engineer looking for complex constraint-solving examples, this repository is designed to be easy to explore. It contains raw, tested code for various Design Verification (DV) concepts and algorithmic puzzles.

## 📑 Table of Contents

* [How to Navigate This Repo](#-how-to-navigate-this-repo)

* [Directory Map](#-directory-map)

* [🧩 Quick Code Previews](#-quick-code-previews)

* [How to Run the Simulations](#-how-to-run-the-simulations)

* [Connect with Me](#-connect-with-me)

## 🗺️ How to Navigate This Repo

To avoid getting overwhelmed, I recommend exploring the repository in this order:

1. **Start with the Basics (`/concepts/`):**
   If you are new, head over to the `concepts` folder. Here you will find bite-sized examples of core SystemVerilog features.

   * **Classes:** Learn about OOP, inheritance, and encapsulation.

   * **IPC (Inter-Process Communication):** Understand how to use Mailboxes, Semaphores, and Events.

   * **Assertion & Coverage:** See how to write sequences and collect functional coverage.

2. **Move to Standard Constraints (`/concepts/randomizations and constraints/`):**
   Explore standard `$urandom` features, the `inside` operator, and basic array sorting.

3. **Challenge Yourself (`/Example/constraints/`):**
   Once you are comfortable, dive into the `Example` folder. This is a collection of mini-projects and algorithmic brain teasers, such as generating real numbers, solving a 9x9 Sudoku, and writing sliding window color constraints.

## 📁 Directory Map

Here is the exact layout of the files so you can find exactly what you need:

```
📦 System-verilog-practice
 ┣ 📂 concepts
 ┃ ┣ 📂 Assertion             # Implication, consecutive repetition, sequences
 ┃ ┣ 📂 Classes               # OOP: Virtual, abstract, super classes, encapsulation
 ┃ ┣ 📂 Coverage              # Implicit/explicit bins, clocking events, traffic controller
 ┃ ┣ 📂 IPC                   # Inter-Process Communication: Events, Mailboxes, Semaphores
 ┃ ┗ 📂 randomizations and constraints  
 ┃   ┗ 📂 constraint_practice # Bubble sort, dynamic arrays, alternating patterns
 ┃
 ┗ 📂 Example
   ┣ 📂 constraints           # 💡 COMPLEX ALGORITHMIC PUZZLES
   ┃ ┣ 📂 array_sum_300
   ┃ ┣ 📂 factorial of random number
   ┃ ┣ 📂 prime_numer
   ┃ ┣ 📂 randC_using_rand
   ┃ ┣ 📂 real_number_between_1.21_to_2.57
   ┃ ┣ 📂 seq 01020304 etc..
   ┃ ┣ 📂 sequence_9_19_29_39
   ┃ ┣ 📂 sliding_window_color
   ┃ ┣ 📂 sudoku9x9
   ┃ ┣ 📂 triangle
   ┃ ┗ 📂 unique_array_without_using_unique_keyword
   ┣ 📂 seq_1_22_333_4444_55
   ┗ 📂 sequence Generator 11101110

```

## 🧩 Quick Code Previews

Curious about how to solve some of the tricky constraint problems inside the `/Example` folder? Click the dropdowns below for a quick look at some of the solutions!

Constraint solvers only work with integers. Here is how I bypassed this to generate real numbers between 1.21 and 2.57.

```
class sample;
    rand bit [11:0] x;
    real y;
    
    constraint my_con {
        x inside {[121:257]}; 
    }
    
    function void post_randomize();
        // Main logic in making int to real number
        y = (x / 100.0); 
    endfunction
endclass

```

Solvers often crash if you put recursive functions inside a `constraint` block. Here is the safe way to do it.

```
class sample;
    rand bit [4:0] number; 
    bit [31:0] res;        
    
    constraint my_con { number inside {[1:10]}; }
    
    function int factorial(int number);
        if(number < 2) return 1; 
        else return number * factorial(number - 1);
    endfunction
    
    function void post_randomize();
        res = factorial(number); // Safe procedural execution
    endfunction
endclass

```

Using algebra inside a `foreach` loop to generate a specific indexed pattern.

```
class sample;
    rand bit [4:0] x [8];
    
    constraint my_con {
        foreach(x[i]) {
            if (i % 2 == 0) 
                x[i] == 0;
            else 
                x[i] == (i + 1) / 2; 
        }
    }
endclass

```

## ⚙️ How to Run the Simulations

All code in this repository is written in standard SystemVerilog. You can clone the repo and run any of the `tb.sv` or `design_tb.sv` files on your preferred simulator (QuestaSim, ModelSim, VCS, Xcelium, etc.).

**Example using Questa/ModelSim:**

```
# 1. Compile the SystemVerilog file
vlog tb.sv

# 2. Run the simulation
vsim -c top_module -do "run -all; quit"

```

## 📬 Connect with Me

If you have questions about the code, or just want to discuss Design Verification, feel free to reach out!

* **GitHub:** [@LijinWilson](https://github.com/LijinWilson)

* **LinkedIn:** \[Your LinkedIn Profile Link\]