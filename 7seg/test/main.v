module test(sel, seg);
	output [7:0] seg;
	output sel;

	assign seg = 8'b01100000;
	assign sel = 1'b1;
endmodule

/*
module test(CLK, CLR, sel, seg);
	input CLK, CLR;
	output [7:0] sel, seg;
	reg [7:0] sel, seg;
	reg [2:0] cnt;

	always @ (posedge CLK or negedge CLR) begin
		if(~CLR) begin
			cnt = 3'b000;
		end else if (cnt == 3'b111) begin
			cnt = 3'b000;
        end else begin
            cnt = cnt + 3'b001;
        end
        case(cnt)
            1 : seg = ~8'b01100000;
            2 : seg = ~8'b11011010;
            3 : seg = ~8'b11110010;
            4 : seg = ~8'b01100110;
            5 : seg = ~8'b10110110;
            6 : seg = ~8'b10111110;
            7 : seg = ~8'b11100000;
            default : seg = ~8'b11111100;
		endcase
        case(cnt)
            1 : sel = 8'b00000010;
            2 : sel = 8'b00000100;
            3 : sel = 8'b00001000;
            4 : sel = 8'b00010000;
            5 : sel = 8'b00100000;
            6 : sel = 8'b01000000;
            7 : sel = 8'b10000000;
            default : sel = 8'b00000001;
		endcase
	end
endmodule
*/

