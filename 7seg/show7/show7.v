module show7 (CLK, RST, digits, number);
    input CLK, RST;
    output [7:0] digits, number;
    reg [7:0] digits, number;
    reg [29:0] count;

    always @ (posedge CLK/* or negedge RST*/) begin
        count <= count + 1;

        if(RST == 1'b0) begin
            digits = 8'b11111111;
        end else if (count[12:10] == 3'b000) begin digits = 8'b11111110; number = 8'b11000000;
        end else if (count[12:10] == 3'b001) begin digits = 8'b11111101; number = 8'b11111001;
        end else if (count[12:10] == 3'b010) begin digits = 8'b11111011; number = 8'b10100100;
        end else if (count[12:10] == 3'b011) begin digits = 8'b11110111; number = 8'b10110000;
        end else if (count[12:10] == 3'b100) begin digits = 8'b11101111; number = 8'b10011001;
        end else if (count[12:10] == 3'b101) begin digits = 8'b11011111; number = 8'b10010010;
        end else if (count[12:10] == 3'b110) begin digits = 8'b10111111; number = 8'b10000010;
        end else if (count[12:10] == 3'b111) begin digits = 8'b01111111; number = 8'b11111000;
        end
    end
endmodule