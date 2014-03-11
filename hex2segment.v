`timescale 1ns / 1ps
module hex2segment(
input clk,
output reg[6:0] segment,
output reg[3:0] an
);

reg[3:0] v_anodes = 0;
reg[16:0] prescalar = 17'b11000011010100000;
reg[16:0] prescalar_counter = 0;

reg[6:0] number1 = 7'b1111001;
reg[6:0] number2 = 7'b0100100;
reg[6:0] number3 = 7'b0110000;
reg[6:0] number4 = 7'b0011001;
reg[1:0] counter_anode = 0;

always@(counter_anode)
begin
	case(counter_anode)
		2'b00: an <= 4'b1110;
		2'b01: an <= 4'b1101;
		2'b11: an <= 4'b1011;
		2'b10: an <= 4'b0111;
	endcase
	
	case(an)
		4'b1110: segment <= number1;
		4'b1101: segment <= number2;
		4'b1011: segment <= number3;
		4'b0111: segment <= number4;
	endcase	
end

always@(posedge clk)
begin
	prescalar_counter <= prescalar_counter + 1;
	if(prescalar_counter == prescalar)
	begin
		counter_anode <= counter_anode + 1;
		prescalar_counter <= 0;
	end
end

/*
always@(*)
begin
case(digit)
	0: segment = 7'b1000000;
	1: segment = 7'b1111001;
	2: segment = 7'b0100100;
	3: segment = 7'b1000111;
	4: segment = 7'b1001100;
	5: segment = 7'b0100100;
	6: segment = 7'b0100000;
	7: segment = 7'b0001111;
	8: segment = 7'b0000000;
	9: segment = 7'b0000100;
endcase
end
*/

endmodule