`timescale 1ns / 1ps

module main(
output wire[6:0] seg,
output wire[3:0] an,
input clk);

hex2segment s(
.clk(clk),
.segment(seg),
.an(an));

endmodule