
module swith_led(
		switch,
		led
		);					    // ģ����led
		
input	[7:0] 	switch;		    //���뿪��
output	[7:0]	led;			//LED�������ʾ

assign led =	switch;			//�Ѳ��뿪�ص�������LED��������ʾ

endmodule