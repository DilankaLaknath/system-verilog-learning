# system-verilog-learning

In Test bench,
* All initial begins are run parallely.
* Inside the initial begin line by line execution happen

* Logic Keyword have 4 state --> have advantage over bit type; we can see errors
    - 1
    - 0
    - x --> Undefined value
    - z --> High Impedance

* Bit Keyword have only two stages
    - 1
    - 0

* We usually do things at pose edge
* We don't mix pose edge nd neg edge usually
    - In cases like DDR(RAM) we mix both

* We can find errors in elaborate log file (We can find the location in the error message)