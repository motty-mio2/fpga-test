//深圳市21EDA电子.
//www.21eda.com
//学习PWM原理，
//拨码开关的 1 2 3 4 5 6 7 8作为输入
//本实验采用拨码开关来控制LED灯
//当然如果你的学习板没有拨码开关，可以用key1 key2 key3 key4 作为输入。
//视频教程适合我们21EDA电子的所有学习板
module swith(
		switch,
		led
		);					    // 模块名led
		
input	[7:0] 	switch;		    //拨码开关
output	[7:0]	led;			//LED灯输出显示

assign led =	switch;			//把拨码开关的数据在LED灯上面显示

endmodule