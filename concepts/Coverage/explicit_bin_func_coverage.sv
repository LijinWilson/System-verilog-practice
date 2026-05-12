// 17:08

// explicit bin functional coverage

module explicit_bin_fun_coverage();
  
  logic [3:0] addr;
  logic [2:0] data;
  logic en;
  
//   Defining the cover group
  
  covergroup cg;
    
//     It show the details of all bins created
    option.per_instance = 1;
    
    cp1: coverpoint addr {bins b1 = {1, 10, 12};
    						bins b2[] = {[2:9], 11};
                          bins b3[4] = {[0:7]};
    }
    cp2: coverpoint data {bins b1 = {[5:$]};
                            bins b2[] = {2, 3, 6};
                            bins others = default;
    }
    cp3: coverpoint en {bins one = {1};}
    
    
  endgroup
  
//   Instantiating coverage group
  cg cg1 = new();
  
  initial
    begin
      repeat(20)
        begin
          
          #1; addr = $random;
          data = $random;
          en = $random;
          
          cg1.sample();
          
          $display("Address = %0d | Data = %0d | Enable = %0d", addr, data, en);
          
        end
    end
  
endmodule

// RUN.DO file
vsim +access+r;
run -all;
acdb save;
acdb report -db fcover.acdb -txt -o cov.txt -verbose;
exec cat cov.txt;
exit



// ----------------------------------------- REPORT -----------------------------------------

# KERNEL: Address = 4 | Data = 1 | Enable = 1
# KERNEL: Address = 3 | Data = 5 | Enable = 1
# KERNEL: Address = 5 | Data = 2 | Enable = 1
# KERNEL: Address = 13 | Data = 6 | Enable = 1
# KERNEL: Address = 13 | Data = 4 | Enable = 1
# KERNEL: Address = 6 | Data = 5 | Enable = 0
# KERNEL: Address = 5 | Data = 7 | Enable = 0
# KERNEL: Address = 15 | Data = 2 | Enable = 0
# KERNEL: Address = 8 | Data = 5 | Enable = 0
# KERNEL: Address = 13 | Data = 5 | Enable = 1
# KERNEL: Address = 3 | Data = 2 | Enable = 0
# KERNEL: Address = 0 | Data = 2 | Enable = 1
# KERNEL: Address = 6 | Data = 3 | Enable = 1
# KERNEL: Address = 3 | Data = 3 | Enable = 1
# KERNEL: Address = 2 | Data = 6 | Enable = 1
# KERNEL: Address = 15 | Data = 3 | Enable = 0
# KERNEL: Address = 10 | Data = 4 | Enable = 0
# KERNEL: Address = 10 | Data = 1 | Enable = 0
# KERNEL: Address = 8 | Data = 1 | Enable = 1
# KERNEL: Address = 6 | Data = 6 | Enable = 0



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
# | Host             | 35d132d5bfc4             |
# | Tool             | Riviera-PRO 2025.04      |
# | Report file      | /home/runner/cov.txt     |
# | Report date      | 2026-05-12 09:52         |
# | Report arguments | -verbose                 |
# | Input file       | /home/runner/fcover.acdb |
# | Input file date  | 2026-05-12 09:52         |
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
# | Simtime  | 20 ns                           |
# | Cputime  | 0.001 s                         |
# | Seed     | 1                               |
# | Date     | 2026-05-12 09:52                |
# | User     | runner                          |
# | Host     | 35d132d5bfc4                    |
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
# | Covergroup Coverage |      1 |    92.857% |
# |---------------------|--------|------------|
# | Types               |        |      0 / 1 |
# =============================================
# CUMULATIVE INSTANCE-BASED COVERAGE: 92.857%
# COVERED INSTANCES: 0 / 1
# FILES: 1
# 
# 
# INSTANCE - /explicit_bin_fun_coverage : work.explicit_bin_fun_coverage
# 
# 
#     SUMMARY
#     =============================================
#     |    Coverage Type    | Weight | Hits/Total |
#     =============================================
#     | Covergroup Coverage |      1 |    92.857% |
#     |---------------------|--------|------------|
#     | Types               |        |      0 / 1 |
#     =============================================
#     WEIGHTED AVERAGE LOCAL: 92.857%
# 
# 
#     COVERGROUP COVERAGE
#     ========================================================================
#     |             Covergroup             |   Hits   |  Goal /  |  Status   |
#     |                                    |          | At Least |           |
#     ========================================================================
#     | TYPE /explicit_bin_fun_coverage/cg |  92.857% | 100.000% | Uncovered |
#     ========================================================================
#     | INSTANCE <UNNAMED1>                |  92.857% | 100.000% | Uncovered |
#     |------------------------------------|----------|----------|-----------|
#     | COVERPOINT <UNNAMED1>::cp1         |  78.571% | 100.000% | Uncovered |
#     |------------------------------------|----------|----------|-----------|
#     | bin b1                             |        2 |        1 | Covered   |
#     | bin b2[2]                          |        1 |        1 | Covered   |
#     | bin b2[3]                          |        3 |        1 | Covered   |
#     | bin b2[4]                          |        1 |        1 | Covered   |
#     | bin b2[5]                          |        2 |        1 | Covered   |
#     | bin b2[6]                          |        3 |        1 | Covered   |
#     | bin b2[7]                          |        0 |        1 | Zero      |
#     | bin b2[8]                          |        2 |        1 | Covered   |
#     | bin b2[9]                          |        0 |        1 | Zero      |
#     | bin b2[11]                         |        0 |        1 | Zero      |
#     | bin b3[0]                          |        1 |        1 | Covered   |
#     | bin b3[1]                          |        4 |        1 | Covered   |
#     | bin b3[2]                          |        3 |        1 | Covered   |
#     | bin b3[3]                          |        3 |        1 | Covered   |
#     |------------------------------------|----------|----------|-----------|
#     | COVERPOINT <UNNAMED1>::cp2         | 100.000% | 100.000% | Covered   |
#     |------------------------------------|----------|----------|-----------|
#     | bin b1                             |        8 |        1 | Covered   |
#     | bin b2[2]                          |        4 |        1 | Covered   |
#     | bin b2[3]                          |        3 |        1 | Covered   |
#     | bin b2[6]                          |        3 |        1 | Covered   |
#     | default bin others                 |        5 |    -     | Occurred  |
#     |------------------------------------|----------|----------|-----------|
#     | COVERPOINT <UNNAMED1>::cp3         | 100.000% | 100.000% | Covered   |
#     |------------------------------------|----------|----------|-----------|
#     | bin one                            |       11 |        1 | Covered   |
#     ========================================================================
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
# | Covergroup Coverage |      1 |    92.857% |
# |---------------------|--------|------------|
# | Types               |        |      0 / 1 |
# =============================================
# CUMULATIVE DESIGN-BASED COVERAGE: 92.857%
# COVERED DESIGN UNITS: 0 / 1
# FILES: 1
# 
# 
# MODULE - work.explicit_bin_fun_coverage
# 
# 
#     SUMMARY
#     =============================================
#     |    Coverage Type    | Weight | Hits/Total |
#     =============================================
#     | Covergroup Coverage |      1 |    92.857% |
#     |---------------------|--------|------------|
#     | Types               |        |      0 / 1 |
#     =============================================
#     WEIGHTED AVERAGE: 92.857%
# 
# 
#     COVERGROUP COVERAGE
#     ========================================================================
#     |             Covergroup             |   Hits   |  Goal /  |  Status   |
#     |                                    |          | At Least |           |
#     ========================================================================
#     | TYPE /explicit_bin_fun_coverage/cg |  92.857% | 100.000% | Uncovered |
#     ========================================================================
#     | INSTANCE <UNNAMED1>                |  92.857% | 100.000% | Uncovered |
#     |------------------------------------|----------|----------|-----------|
#     | COVERPOINT <UNNAMED1>::cp1         |  78.571% | 100.000% | Uncovered |
#     |------------------------------------|----------|----------|-----------|
#     | bin b1                             |        2 |        1 | Covered   |
#     | bin b2[2]                          |        1 |        1 | Covered   |
#     | bin b2[3]                          |        3 |        1 | Covered   |
#     | bin b2[4]                          |        1 |        1 | Covered   |
#     | bin b2[5]                          |        2 |        1 | Covered   |
#     | bin b2[6]                          |        3 |        1 | Covered   |
#     | bin b2[7]                          |        0 |        1 | Zero      |
#     | bin b2[8]                          |        2 |        1 | Covered   |
#     | bin b2[9]                          |        0 |        1 | Zero      |
#     | bin b2[11]                         |        0 |        1 | Zero      |
#     | bin b3[0]                          |        1 |        1 | Covered   |
#     | bin b3[1]                          |        4 |        1 | Covered   |
#     | bin b3[2]                          |        3 |        1 | Covered   |
#     | bin b3[3]                          |        3 |        1 | Covered   |
#     |------------------------------------|----------|----------|-----------|
#     | COVERPOINT <UNNAMED1>::cp2         | 100.000% | 100.000% | Covered   |
#     |------------------------------------|----------|----------|-----------|
#     | bin b1                             |        8 |        1 | Covered   |
#     | bin b2[2]                          |        4 |        1 | Covered   |
#     | bin b2[3]                          |        3 |        1 | Covered   |
#     | bin b2[6]                          |        3 |        1 | Covered   |
#     | default bin others                 |        5 |    -     | Occurred  |
#     |------------------------------------|----------|----------|-----------|
#     | COVERPOINT <UNNAMED1>::cp3         | 100.000% | 100.000% | Covered   |
#     |------------------------------------|----------|----------|-----------|
#     | bin one                            |       11 |        1 | Covered   |
#     ========================================================================
# 
