//======================================================================
// // DUT
//======================================================================
module traffic_light (
    input  logic clk,
    input  logic rst,
    output logic [1:0] state
);

typedef enum logic [1:0] {
    RED    = 2'b00,
    YELLOW = 2'b01,
    GREEN  = 2'b10,
    OFF    = 2'b11
} light_t;

light_t current_state, next_state;

always_ff @(posedge clk or posedge rst)
begin
    if (rst)
        current_state <= RED;
    else
        current_state <= next_state;
end

always_comb
begin
    case(current_state)
        RED    : next_state = GREEN;
        GREEN  : next_state = YELLOW;
        YELLOW : next_state = RED;
        default: next_state = RED;
    endcase
end

assign state = current_state;

endmodule

//======================================================================
// TEST BENCH
//======================================================================
module tb_traffic;

    logic clk;
    logic rst;
    logic [1:0] state;
	
    // Instantiating design module
    traffic_light dut (
        .clk(clk),
        .rst(rst),
        .state(state)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

class cov_class;

    // sampled variable
    logic [1:0] st;
    
    covergroup cg @(posedge tb_traffic.clk);

        //-----------------------------------------------------
        // 1. Explicit bins
        //-----------------------------------------------------
        cp_state : coverpoint st
        {
            bins red_bin    = {2'b00};
            bins yellow_bin = {2'b01};
            bins green_bin  = {2'b10};

            //-----------------------------------------------------
            // 2. Illegal bins
            //-----------------------------------------------------
            illegal_bins off_bin = {2'b11};

            //-----------------------------------------------------
            // 3. Ignore bins
            //-----------------------------------------------------
            // ignore duplicated green (example purpose)
            ignore_bins ignore_green = {2'b10};
        }

	//-----------------------------------------------------
        // 4. Transition bins
        //-----------------------------------------------------
        cp_trans : coverpoint st
        {
            bins red_to_green    = (2'b00 => 2'b10);
            bins green_to_yellow = (2'b10 => 2'b01);
            bins yellow_to_red   = (2'b01 => 2'b00);

            // sequence of transitions
            bins full_cycle = (2'b00 => 2'b10 => 2'b01 => 2'b00);
        }

        //-----------------------------------------------------
        // 5. Auto / default bins / Implicit Bin - 4 automatic bin will created as st size is 2
        //-----------------------------------------------------
        cp_auto : coverpoint st;

    endgroup

    function new();
        cg = new();
    endfunction

endclass

// Declaring handles for cova class
cov_class c1;

//======================================================================
// Stimulus
//======================================================================
    initial
    begin
        c1 = new();
        
        rst = 1;
        #12;
        rst = 0;
        
        repeat(12)
        begin
            @(posedge clk);
            c1.st = state;
            
            $display("Time=%0t State=%b", $time, state);
        end
        
        //-----------------------------------------------------
        // Force illegal state manually
        //-----------------------------------------------------
        @(posedge clk);
        // force dut.current_state = 2'b11;
        // c1.st = state;

	//$display("Injected Illegal State = %b", state);

        //@(posedge clk);
        //release dut.current_state;

        #20;

        $display("---------------------------------");
        $display("Coverage = %0.2f %%", c1.cg.get_coverage());
        $display("---------------------------------");

        $finish;
    end

endmodule

// ================== STEP FOR RUNNING THE COVERAGE CODE ==============
/*
 - First compile the code
 - Start Simulation
 - Run all, then we will get the coverage value (91.67%).
== To get the actual report
 - tool => coverage Report => HTML => enable options(
*/
