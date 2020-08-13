//������21EDA����.
//www.21eda.com
//LED��ˮ������
//���÷�Ƶ�������õ���ʾ��ˮ�Ƶ�Ч��
//��Ƶ�̳��ʺ�����21EDA���ӵ�����ѧϰ��
module ledwater (clk_50M,rst,dataout);

input clk_50M,rst;     //ϵͳʱ��50M���� ��12�����롣
output [11:0] dataout;  //����������12��LED�ƣ�

reg [11:0] dataout;
reg [25:0] count; //��Ƶ������

//��Ƶ������
always @ ( posedge clk_50M )
 begin
  count<=count+1;
 end

always @ ( posedge clk_50M or negedge rst)

 begin
  case ( count[25:22] )
  //  case ( count[25:22] )��һ��ϣ����ѧ�߿�����,
  //  Ҳ�Ƿ�Ƶ�Ĺؼ�
  //  ֻ����0����һλ ��Ӧ��LED�Ʋ�����
  0: dataout<=12'b111111111110;
  1: dataout<=12'b111111111101;
  2: dataout<=12'b111111111011;
  3: dataout<=12'b111111110111;
  4: dataout<=12'b111111101111;
  5: dataout<=12'b111111011111;  
  6: dataout<=12'b111110111111; 
  7: dataout<=12'b111101111111;
  8: dataout<=12'b111011111111;
  9: dataout<=12'b110111111111;
  10:dataout<=12'b101111111111;
  11:dataout<=12'b011111111111;
  12:dataout<=12'b110110110110;
  13:dataout<=12'b101101101101;
  14:dataout<=12'b011011011011;
  15:dataout<=12'b111111111111;

  endcase
 end
endmodule










