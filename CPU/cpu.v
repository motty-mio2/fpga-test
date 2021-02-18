module prescaler(nRST, nCLK, out_clk);
    input nCLK;
    input nRST;
    output out_clk;
    reg [25:0] cnt;
    reg out_clk;

    initial begin
        cnt = 26'b0;
    end

    always @(posedge nCLK or negedge nRST) begin
        if(nRST == 1'b0)begin
            out_clk <= 1'b0;
        end else if(cnt == 26'b10_11111010_11110000_10000000) begin
            cnt <= 26'b0;
            out_clk <= 1'b1;
        end else begin
            cnt <= cnt +1'b1;
            out_clk <= 1'b0;
        end
    end
/*
    always @(negedge nRST)begin
        cnt <= cnt +1'b1;
        out_clk <= 1'b0;
    end
*/
endmodule

module cpu(clk, nRST, nled);
    input clk, nRST;
    output nled;

    reg a, next_a, led, nled;

    always @(posedge clk) begin
        if(~nRST) begin
            a <=1'b0;
        end else begin
            a <= next_a;
        end

        led = a;
        nled = ~led;
        next_a = ~a;
    end
endmodule

module top(pin_clk, pin_nRST, pin_led);
    input pin_clk, pin_nRST;
    output pin_led;

    wire clk;
    prescaler psc(pin_nRST, pin_clk , clk);

    cpu cpu1 (clk, pin_nRST, pin_led);
endmodule