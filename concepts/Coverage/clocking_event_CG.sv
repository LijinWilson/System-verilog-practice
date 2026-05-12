module clocking_CG();
  
//   Declaring the variable
  logic [1:0] mode;
  logic [2:0] cfg;
  
  bit clk;
  
//   Clock Generator
  always #20 clk = ~clk;
  
  
// declaring the cover group
  covergroup cg @(posedge clk);
    
//     to see the detail of bins created
    option.per_instance = 1;
    
//     creating coverpoint
    
    cp_mode: coverpoint mode;
    cp_cfg: coverpoint cfg[1:0]; // here 4 bins are created, because cfg[1:0] has 4 possible values
    cp_cfg_lsb: coverpoint cfg[0];
    cp_sum: coverpoint (mode + cfg);  // here number of bin created is 8(2^max_bit_width), because bit width is more for cfg. this method is used for finding the number of bin created in operation mode
    
    
  endgroup
  
//   Instantiating Cover group
  cg cg1 = new();
  
// Generating the values
  initial
    begin
      for(int i = 0; i < 5; i++)
        begin
          @(negedge clk);
          mode = $random;
          cfg = $random;
          $display("Mode = %0d | CFG = %0d", mode, cfg);
        end
    end
  
//   Stop statment
  initial
    begin
      #500; $finish();
    end
  
  
endmodule



// ----------------------------------- REPORT ------------------------------------

# KERNEL: Mode = 0 | CFG = 1
# KERNEL: Mode = 1 | CFG = 3
# KERNEL: Mode = 1 | CFG = 5
# KERNEL: Mode = 1 | CFG = 2
# KERNEL: Mode = 1 | CFG = 5



# +++++++++++++++++++++++++++++++++++++++++++++
# ++++++++++       REPORT INFO       ++++++++++
# +++++++++++++++++++++++++++++++++++++++++++++
# 
# 
# SUMMARY
# ===============================================
# |     Property     |          Value           |
# ===============================================
# | User             | runner                   |
# | Host             | 29e6620bd0cf             |
# | Tool             | Riviera-PRO 2025.04      |
# | Report file      | /home/runner/cov.txt     |
# | Report date      | 2026-05-12 10:38         |
# | Report arguments | -verbose                 |
# | Input file       | /home/runner/fcover.acdb |
# | Input file date  | 2026-05-12 10:38         |
# | Number of tests  | 1                        |
# ===============================================
# 
# 
# TEST DETAILS
# ==============================================
# | Property |              Value              |
# ==============================================
# | Test     | fcover.acdb:fcover              |
# | Status   | Ok                              |
# | Args     | asim +access+r                  |
# | Simtime  | 500 ns                          |
# | Cputime  | 0.002 s                         |
# | Seed     | 1                               |
# | Date     | 2026-05-12 10:38                |
# | User     | runner                          |
# | Host     | 29e6620bd0cf                    |
# | Host os  | Linux64                         |
# | Tool     | Riviera-PRO 2025.04 (simulator) |
# ==============================================
# 
# 
# +++++++++++++++++++++++++++++++++++++++++++++
# ++++++++++     DESIGN HIERARCHY    ++++++++++
# +++++++++++++++++++++++++++++++++++++++++++++
# 
# 
# CUMULATIVE SUMMARY
# =============================================
# |    Coverage Type    | Weight | Hits/Total |
# =============================================
# | Covergroup Coverage |      1 |    68.750% |
# |---------------------|--------|------------|
# | Types               |        |      0 / 1 |
# =============================================
# CUMULATIVE INSTANCE-BASED COVERAGE: 68.750%
# COVERED INSTANCES: 0 / 1
# FILES: 1
# 
# 
# INSTANCE - /clocking_CG : work.clocking_CG
# 
# 
#     SUMMARY
#     =============================================
#     |    Coverage Type    | Weight | Hits/Total |
#     =============================================
#     | Covergroup Coverage |      1 |    68.750% |
#     |---------------------|--------|------------|
#     | Types               |        |      0 / 1 |
#     =============================================
#     WEIGHTED AVERAGE LOCAL: 68.750%
# 
# 
#     COVERGROUP COVERAGE
#     =======================================================================
#     |            Covergroup             |   Hits   |  Goal /  |  Status   |
#     |                                   |          | At Least |           |
#     =======================================================================
#     | TYPE /clocking_CG/cg              |  68.750% | 100.000% | Uncovered |
#     =======================================================================
#     | INSTANCE <UNNAMED1>               |  68.750% | 100.000% | Uncovered |
#     |-----------------------------------|----------|----------|-----------|
#     | COVERPOINT <UNNAMED1>::cp_mode    |  50.000% | 100.000% | Uncovered |
#     |-----------------------------------|----------|----------|-----------|
#     | bin auto[0]                       |        1 |        1 | Covered   |
#     | bin auto[1]                       |       10 |        1 | Covered   |
#     | bin auto[2]                       |        0 |        1 | Zero      |
#     | bin auto[3]                       |        0 |        1 | Zero      |
#     |-----------------------------------|----------|----------|-----------|
#     | COVERPOINT <UNNAMED1>::cp_cfg     |  75.000% | 100.000% | Uncovered |
#     |-----------------------------------|----------|----------|-----------|
#     | bin auto[0]                       |        0 |        1 | Zero      |
#     | bin auto[1]                       |        9 |        1 | Covered   |
#     | bin auto[2]                       |        1 |        1 | Covered   |
#     | bin auto[3]                       |        1 |        1 | Covered   |
#     |-----------------------------------|----------|----------|-----------|
#     | COVERPOINT <UNNAMED1>::cp_cfg_lsb | 100.000% | 100.000% | Covered   |
#     |-----------------------------------|----------|----------|-----------|
#     | bin auto[0]                       |        1 |        1 | Covered   |
#     | bin auto[1]                       |       10 |        1 | Covered   |
#     |-----------------------------------|----------|----------|-----------|
#     | COVERPOINT <UNNAMED1>::cp_sum     |  50.000% | 100.000% | Uncovered |
#     |-----------------------------------|----------|----------|-----------|
#     | bin auto[0]                       |        0 |        1 | Zero      |
#     | bin auto[1]                       |        1 |        1 | Covered   |
#     | bin auto[2]                       |        0 |        1 | Zero      |
#     | bin auto[3]                       |        1 |        1 | Covered   |
#     | bin auto[4]                       |        1 |        1 | Covered   |
#     | bin auto[5]                       |        0 |        1 | Zero      |
#     | bin auto[6]                       |        8 |        1 | Covered   |
#     | bin auto[7]                       |        0 |        1 | Zero      |
#     =======================================================================
# 
# 
# +++++++++++++++++++++++++++++++++++++++++++++
# ++++++++++       DESIGN UNITS      ++++++++++
# +++++++++++++++++++++++++++++++++++++++++++++
# 
# 
# CUMULATIVE SUMMARY
# =============================================
# |    Coverage Type    | Weight | Hits/Total |
# =============================================
# | Covergroup Coverage |      1 |    68.750% |
# |---------------------|--------|------------|
# | Types               |        |      0 / 1 |
# =============================================
# CUMULATIVE DESIGN-BASED COVERAGE: 68.750%
# COVERED DESIGN UNITS: 0 / 1
# FILES: 1
# 
# 
# MODULE - work.clocking_CG
# 
# 
#     SUMMARY
#     =============================================
#     |    Coverage Type    | Weight | Hits/Total |
#     =============================================
#     | Covergroup Coverage |      1 |    68.750% |
#     |---------------------|--------|------------|
#     | Types               |        |      0 / 1 |
#     =============================================
#     WEIGHTED AVERAGE: 68.750%
# 
# 
#     COVERGROUP COVERAGE
#     =======================================================================
#     |            Covergroup             |   Hits   |  Goal /  |  Status   |
#     |                                   |          | At Least |           |
#     =======================================================================
#     | TYPE /clocking_CG/cg              |  68.750% | 100.000% | Uncovered |
#     =======================================================================
#     | INSTANCE <UNNAMED1>               |  68.750% | 100.000% | Uncovered |
#     |-----------------------------------|----------|----------|-----------|
#     | COVERPOINT <UNNAMED1>::cp_mode    |  50.000% | 100.000% | Uncovered |
#     |-----------------------------------|----------|----------|-----------|
#     | bin auto[0]                       |        1 |        1 | Covered   |
#     | bin auto[1]                       |       10 |        1 | Covered   |
#     | bin auto[2]                       |        0 |        1 | Zero      |
#     | bin auto[3]                       |        0 |        1 | Zero      |
#     |-----------------------------------|----------|----------|-----------|
#     | COVERPOINT <UNNAMED1>::cp_cfg     |  75.000% | 100.000% | Uncovered |
#     |-----------------------------------|----------|----------|-----------|
#     | bin auto[0]                       |        0 |        1 | Zero      |
#     | bin auto[1]                       |        9 |        1 | Covered   |
#     | bin auto[2]                       |        1 |        1 | Covered   |
#     | bin auto[3]                       |        1 |        1 | Covered   |
#     |-----------------------------------|----------|----------|-----------|
#     | COVERPOINT <UNNAMED1>::cp_cfg_lsb | 100.000% | 100.000% | Covered   |
#     |-----------------------------------|----------|----------|-----------|
#     | bin auto[0]                       |        1 |        1 | Covered   |
#     | bin auto[1]                       |       10 |        1 | Covered   |
#     |-----------------------------------|----------|----------|-----------|
#     | COVERPOINT <UNNAMED1>::cp_sum     |  50.000% | 100.000% | Uncovered |
#     |-----------------------------------|----------|----------|-----------|
#     | bin auto[0]                       |        0 |        1 | Zero      |
#     | bin auto[1]                       |        1 |        1 | Covered   |
#     | bin auto[2]                       |        0 |        1 | Zero      |
#     | bin auto[3]                       |        1 |        1 | Covered   |
#     | bin auto[4]                       |        1 |        1 | Covered   |
#     | bin auto[5]                       |        0 |        1 | Zero      |
#     | bin auto[6]                       |        8 |        1 | Covered   |
#     | bin auto[7]                       |        0 |        1 | Zero      |
#     =======================================================================
# 
