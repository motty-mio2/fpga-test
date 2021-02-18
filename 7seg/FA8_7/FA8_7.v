module FA (a,b,ci,s,co);
  input a,b,ci;
  output s,co;
  assign s = a^b^ci;
  assign co = a&b|b&ci|ci&a;
endmodule

module FA4b5b (a, b, mo, c);
    input [3:0] a,b;
    input mo;
    //0:plus, 1:minus
    output [4:0] c;
    wire c1, c2, c3, c4;

    FA f1 (a[0], b[0]^mo, mo, c[0], c1);
    FA f2 (a[1], b[1]^mo, c1, c[1], c2);
    FA f3 (a[2], b[2]^mo, c2, c[2], c3);
    FA f4 (a[3], b[3]^mo, c3, c[3], c4);
    assign c[4] = c4^mo;
endmodule

module MULTI1x4 (a,b,s);
    input [3:0] a;
    input b;
    output [3:0] s;

    assign s = {a[3]&b, a[2]&b, a[1]&b, a[0]&b};
endmodule

module MULTI4b8b (a,b,s);
    input [3:0] a,b;
    output [7:0] s;
    wire [3:0] ab0, ab1, ab2, ab3;
    wire [4:0] c1, c2, c3;

    MULTI1x4 m0 (a, b[0], ab0);
    MULTI1x4 m1 (a, b[1], ab1);
    MULTI1x4 m2 (a, b[2], ab2);
    MULTI1x4 m3 (a, b[3], ab3);

    assign s[0] = a[0]&b[0];
    FA4b5b f1 (.a({1'b0,ab0[3:1]}), .b(ab1), .mo(1'b0), .c(c1));
    assign s[1] = c1[0];
    FA4b5b f2 (.a(c1[4:1]), .b(ab2), .mo(1'b0), .c(c2));
    assign s[2] = c2[0];
    FA4b5b f3 (.a(c2[4:1]), .b(ab3), .mo(1'b0), .c(s[7:3]));
endmodule

module FA8_7(a, b, CLK, digits, number);
    input [3:0] a, b;
    input CLK;
    output [7:0] digits, number;

    wire [7:0] s;
    reg [7:0] digits, number;
    reg [29:0] count;

    MULTI4b8b mx (a,b,s);

    always @ (posedge CLK) begin
        count <= count + 1;

                 if (count[12:10] == 3'b000) begin digits = 8'b11111110; number = s[0] ? 8'b11111001 : 8'b11000000;
        end else if (count[12:10] == 3'b001) begin digits = 8'b11111101; number = s[1] ? 8'b11111001 : 8'b11000000;
        end else if (count[12:10] == 3'b010) begin digits = 8'b11111011; number = s[2] ? 8'b11111001 : 8'b11000000;
        end else if (count[12:10] == 3'b011) begin digits = 8'b11110111; number = s[3] ? 8'b11111001 : 8'b11000000;
        end else if (count[12:10] == 3'b100) begin digits = 8'b11101111; number = s[4] ? 8'b11111001 : 8'b11000000;
        end else if (count[12:10] == 3'b101) begin digits = 8'b11011111; number = s[5] ? 8'b11111001 : 8'b11000000;
        end else if (count[12:10] == 3'b110) begin digits = 8'b10111111; number = s[6] ? 8'b11111001 : 8'b11000000;
        end else if (count[12:10] == 3'b111) begin digits = 8'b01111111; number = s[7] ? 8'b11111001 : 8'b11000000;
        end
    end
endmodule