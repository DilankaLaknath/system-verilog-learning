/*
  This code describes a full_adder circuit
*/

module full_adder 
(   //port declaration
  input  logic a   ,
  input  logic b   ,
  input  logic c_in,
  output logic sum ,
  output logic c_out
);

  logic wire_1, wire_2, wire_3; //declaring intermediate wires (nets /variables)

  assign wire_1 = a ^ b        ; // bitwise XOR
  assign wire_2 = wire_1 & c_in; // bitwise AND

  always_comb begin //Combinational always --> there are two types of assignment
    wire_3 = a & b; // bitwise AND
  end

  assign sum  = wire_1 ^ c_in    ;
  assign c_out  = wire_2 | wire_3; // bitwise OR

endmodule