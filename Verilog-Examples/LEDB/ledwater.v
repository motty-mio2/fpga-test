//������21EDA����.
//www.21eda.com
//LED��ˮ������
//���÷�Ƶ�������õ���ʾ��ˮ�Ƶ�Ч��
//��Ƶ�̳��ʺ�����21EDA���ӵ�����ѧϰ��
module ledwater (clk_50M,rst,dataout);

input clk_50M,rst;     //ϵͳʱ��50M���� ��12�����롣
output [11:0] dataout;  //����������12��LED�ƣ�
reg [11:0] dataout;
reg [27:0] count; //��Ƶ������

//��Ƶ������
always @ ( posedge clk_50M )
 begin
  count<=count+1;
 end

always @ ( posedge clk_50M or negedge rst)

 begin
  case ( count[27:24] )
  //  case ( count[25:22] )��һ��ϣ����ѧ�߿�����,
  //  Ҳ�Ƿ�Ƶ�Ĺؼ�
  //  ֻ����0����һλ ��Ӧ��LED�Ʋ�����
  0: dataout<=12'b111000111000;
  
  1: dataout<=12'b000111000111;
  
  2: dataout<=12'b110110110110;
  
  3: dataout<=12'b101101101101;
  
  4: dataout<=12'b011011011011;
  
  5: dataout<=12'b000000000000;
  
  6: dataout<=12'b010000010000;
    
  7: dataout<=12'b111000111000; 
  
  8: dataout<=12'b111101111101;
  
  9: dataout<=12'b111111111111;
  
  10: dataout<=12'b111101111101;
  
  11:dataout<=12'b111000111000;
  
  12:dataout<=12'b010000010000;
  
  13:dataout<=12'b000000000000;
  
  14:dataout<=12'b111110000011;
  
  15:dataout<=12'b000011111110;
  endcase
 end
endmodule










