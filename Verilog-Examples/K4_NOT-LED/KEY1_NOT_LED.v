
    module KEY1_NOT_LED ( A, F );
        input A ;      // ??????,??KEY1????I/O??31?
        output F;      // ??????,LED?????I/O??41?
        assign F =~A;  //??F??1 LED?????
                       //??F??0 LED????
    endmodule   
