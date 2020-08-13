module MUX (i0, i1, i2, i3, i4, i5, i6, i7, sel, out);
    input [7:0] i0, i1, i2, i3, i4, i5, i6, i7;
    input [2:0] sel;
    output [7:0] out;

    assign out =
        sel == 3'b000 ? i0 :
        sel == 3'b001 ? i1 :
        sel == 3'b010 ? i2 :
        sel == 3'b011 ? i3 :
        sel == 3'b100 ? i4 :
        sel == 3'b101 ? i5 :
        sel == 3'b110 ? i6 : i7;
endmodule

module SEG7 (a, S); // BCD：4 bit BCD 入力，S：7 segment 出力
    input a;
    output [6:0] S;

    assign S = a ? 7'b0110000 : 7'b1111110;
endmodule

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


module calc1 (a, b, ans);
    input [3:0] a, b;
    output [4:0] ans;
	wire [4:0] sum;

    FA4b5b f1 (a, b, 1'b0, sum);
    assign ans = ~sum;
endmodule