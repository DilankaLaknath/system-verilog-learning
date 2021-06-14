module full_adder_tb ();

  //time units
  timeunit 1ns;
  timeprecision 1ps;

  localparam CLK_PERIOD = 10; //constant in time units

  logic clk; // Declare clock

  //All initial begins are run parallely
  //Inside the initial begin line by line execution happen

  //clock generation 
  initial begin
    clk = 0;
    forever #(CLK_PERIOD/2) clk <= ~clk; // Forever syntax to happen over and over again
  end

  // Declare input and output ports of test bench
  logic a     = 0;
  logic b     ; // = 0, intentionally leave un asigned to identify red indication.
  logic c_in  = 0;
  logic sum   ;
  logic c_out ;

  full_adder fa (.*); // module instantiation --> use wildcard (Use when it takes the same name)

//Instead of doing that we can do it by the following way
/*
  full_adder fa 
  (
      .a(a),
      .b(b),
      .c_in(C_in),
      .sum(sum),
      .c_out(c_out)
  );
*/

  initial begin
    // Simulation starts
    //checks at positive edge of the clock

    @(posedge clk); // leave 3 clock cycle delay to identify the un assigned red indication of input b
    #(CLK_PERIOD*3);

    @(posedge clk);
    a  <= 0;
    b  <= 0;
    c_in <= 0;

    @(posedge clk);
    a  <= 0;
    b  <= 0;
    c_in <= 1;

    #(CLK_PERIOD*2); // leave two clock cycle delay

    @(posedge clk);
    a  <= 1;
    b  <= 1;
    c_in <= 0;

    @(posedge clk);
    a  <= 1;
    b  <= 1;
    c_in <= 1;

  end
endmodule