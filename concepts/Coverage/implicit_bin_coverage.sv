// implicit Bin

module implicit_bin_functional_coverage();
  logic [3:0] addr;
  logic [2:0] data;
  logic en;
  
  
  covergroup cg;
    // it will display all the bin created
    option.per_instance = 1;
    
    cp1: coverpoint addr;
    cp2: coverpoint data;
    cp3: coverpoint en;
    
  endgroup
  
//   instantiating Cover group
  cg cg1 = new();
  
  initial
    begin
      repeat(20)
        begin
          #1; addr = $random;
          	  data = $random;
          	  en = $random;
          
          cg1.sample();
        end
    end
  
endmodule

// RUN.DO
vsim +access+r;
run -all;
acdb save;
acdb report -db fcover.acdb -txt -o cov.txt -verbose;
exec cat cov.txt;
exit


// ------------------------------ REPORT ---------------------------------------------

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
# | Host             | 2e8468976a1c             |
# | Tool             | Riviera-PRO 2025.04      |
# | Report file      | /home/runner/cov.txt     |
# | Report date      | 2026-05-12 09:06         |
# | Report arguments | -verbose                 |
# | Input file       | /home/runner/fcover.acdb |
# | Input file date  | 2026-05-12 09:06         |
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
# | Date     | 2026-05-12 09:06                |
# | User     | runner                          |
# | Host     | 2e8468976a1c                    |
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
# | Covergroup Coverage |      1 |    83.333% |
# |---------------------|--------|------------|
# | Types               |        |      0 / 1 |
# =============================================
# CUMULATIVE INSTANCE-BASED COVERAGE: 83.333%
# COVERED INSTANCES: 0 / 1
# FILES: 1
# 
# 
# INSTANCE - /implicit_bin_functional_coverage : work.implicit_bin_functional_coverage
# 
# 
#     SUMMARY
#     =============================================
#     |    Coverage Type    | Weight | Hits/Total |
#     =============================================
#     | Covergroup Coverage |      1 |    83.333% |
#     |---------------------|--------|------------|
#     | Types               |        |      0 / 1 |
#     =============================================
#     WEIGHTED AVERAGE LOCAL: 83.333%
# 
# 
#     COVERGROUP COVERAGE
#     ===============================================================================
#     |                Covergroup                 |   Hits   |  Goal /  |  Status   |
#     |                                           |          | At Least |           |
#     ===============================================================================
#     | TYPE /implicit_bin_functional_coverage/cg |  83.333% | 100.000% | Uncovered |
#     ===============================================================================
#     | INSTANCE <UNNAMED1>                       |  83.333% | 100.000% | Uncovered |
#     |-------------------------------------------|----------|----------|-----------|
#     | COVERPOINT <UNNAMED1>::cp1                |  62.500% | 100.000% | Uncovered |
#     |-------------------------------------------|----------|----------|-----------|
#     | bin auto[0]                               |        1 |        1 | Covered   |
#     | bin auto[1]                               |        0 |        1 | Zero      |
#     | bin auto[2]                               |        1 |        1 | Covered   |
#     | bin auto[3]                               |        3 |        1 | Covered   |
#     | bin auto[4]                               |        1 |        1 | Covered   |
#     | bin auto[5]                               |        2 |        1 | Covered   |
#     | bin auto[6]                               |        3 |        1 | Covered   |
#     | bin auto[7]                               |        0 |        1 | Zero      |
#     | bin auto[8]                               |        2 |        1 | Covered   |
#     | bin auto[9]                               |        0 |        1 | Zero      |
#     | bin auto[10]                              |        2 |        1 | Covered   |
#     | bin auto[11]                              |        0 |        1 | Zero      |
#     | bin auto[12]                              |        0 |        1 | Zero      |
#     | bin auto[13]                              |        3 |        1 | Covered   |
#     | bin auto[14]                              |        0 |        1 | Zero      |
#     | bin auto[15]                              |        2 |        1 | Covered   |
#     |-------------------------------------------|----------|----------|-----------|
#     | COVERPOINT <UNNAMED1>::cp2                |  87.500% | 100.000% | Uncovered |
#     |-------------------------------------------|----------|----------|-----------|
#     | bin auto[0]                               |        0 |        1 | Zero      |
#     | bin auto[1]                               |        3 |        1 | Covered   |
#     | bin auto[2]                               |        4 |        1 | Covered   |
#     | bin auto[3]                               |        3 |        1 | Covered   |
#     | bin auto[4]                               |        2 |        1 | Covered   |
#     | bin auto[5]                               |        4 |        1 | Covered   |
#     | bin auto[6]                               |        3 |        1 | Covered   |
#     | bin auto[7]                               |        1 |        1 | Covered   |
#     |-------------------------------------------|----------|----------|-----------|
#     | COVERPOINT <UNNAMED1>::cp3                | 100.000% | 100.000% | Covered   |
#     |-------------------------------------------|----------|----------|-----------|
#     | bin auto[0]                               |        9 |        1 | Covered   |
#     | bin auto[1]                               |       11 |        1 | Covered   |
#     ===============================================================================
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
# | Covergroup Coverage |      1 |    83.333% |
# |---------------------|--------|------------|
# | Types               |        |      0 / 1 |
# =============================================
# CUMULATIVE DESIGN-BASED COVERAGE: 83.333%
# COVERED DESIGN UNITS: 0 / 1
# FILES: 1
# 
# 
# MODULE - work.implicit_bin_functional_coverage
# 
# 
#     SUMMARY
#     =============================================
#     |    Coverage Type    | Weight | Hits/Total |
#     =============================================
#     | Covergroup Coverage |      1 |    83.333% |
#     |---------------------|--------|------------|
#     | Types               |        |      0 / 1 |
#     =============================================
#     WEIGHTED AVERAGE: 83.333%
# 
# 
#     COVERGROUP COVERAGE
#     ===============================================================================
#     |                Covergroup                 |   Hits   |  Goal /  |  Status   |
#     |                                           |          | At Least |           |
#     ===============================================================================
#     | TYPE /implicit_bin_functional_coverage/cg |  83.333% | 100.000% | Uncovered |
#     ===============================================================================
#     | INSTANCE <UNNAMED1>                       |  83.333% | 100.000% | Uncovered |
#     |-------------------------------------------|----------|----------|-----------|
#     | COVERPOINT <UNNAMED1>::cp1                |  62.500% | 100.000% | Uncovered |
#     |-------------------------------------------|----------|----------|-----------|
#     | bin auto[0]                               |        1 |        1 | Covered   |
#     | bin auto[1]                               |        0 |        1 | Zero      |
#     | bin auto[2]                               |        1 |        1 | Covered   |
#     | bin auto[3]                               |        3 |        1 | Covered   |
#     | bin auto[4]                               |        1 |        1 | Covered   |
#     | bin auto[5]                               |        2 |        1 | Covered   |
#     | bin auto[6]                               |        3 |        1 | Covered   |
#     | bin auto[7]                               |        0 |        1 | Zero      |
#     | bin auto[8]                               |        2 |        1 | Covered   |
#     | bin auto[9]                               |        0 |        1 | Zero      |
#     | bin auto[10]                              |        2 |        1 | Covered   |
#     | bin auto[11]                              |        0 |        1 | Zero      |
#     | bin auto[12]                              |        0 |        1 | Zero      |
#     | bin auto[13]                              |        3 |        1 | Covered   |
#     | bin auto[14]                              |        0 |        1 | Zero      |
#     | bin auto[15]                              |        2 |        1 | Covered   |
#     |-------------------------------------------|----------|----------|-----------|
#     | COVERPOINT <UNNAMED1>::cp2                |  87.500% | 100.000% | Uncovered |
#     |-------------------------------------------|----------|----------|-----------|
#     | bin auto[0]                               |        0 |        1 | Zero      |
#     | bin auto[1]                               |        3 |        1 | Covered   |
#     | bin auto[2]                               |        4 |        1 | Covered   |
#     | bin auto[3]                               |        3 |        1 | Covered   |
#     | bin auto[4]                               |        2 |        1 | Covered   |
#     | bin auto[5]                               |        4 |        1 | Covered   |
#     | bin auto[6]                               |        3 |        1 | Covered   |
#     | bin auto[7]                               |        1 |        1 | Covered   |
#     |-------------------------------------------|----------|----------|-----------|
#     | COVERPOINT <UNNAMED1>::cp3                | 100.000% | 100.000% | Covered   |
#     |-------------------------------------------|----------|----------|-----------|
#     | bin auto[0]                               |        9 |        1 | Covered   |
#     | bin auto[1]                               |       11 |        1 | Covered   |
#     ===============================================================================
# 
exit
