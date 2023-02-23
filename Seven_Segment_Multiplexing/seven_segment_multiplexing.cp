#line 1 "E:/Course/3-1/Microcontroler/Lab/Seven_Segment_Multiplexing/seven_segment_multiplexing.c"
char segment[]= {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};
int i=0,j=0,k;
void main()
{
 TRISB = 0; TRISD = 0; TRISC = 0xff;
 portb = 0; portd = 0;

 while(1)
 {
 for(i=0;i<140;i++){
 portb=segment[j/1000];
 portd.f0=0;
 delay_ms(1);
 portd.f0=1;

 portb=segment[(j%1000)/100];
 portd.f1=0;
 delay_ms(1);
 portd.f1=1;

 portb=segment[((j%1000)%100)/10];
 portd.f2=0;
 delay_ms(1);
 portd.f2=1;

 portb=segment[(((j%1000)%100)%10)%10];
 portd.f3=0;
 delay_ms(1);
 portd.f3=1;
 }
 j++;
#line 41 "E:/Course/3-1/Microcontroler/Lab/Seven_Segment_Multiplexing/seven_segment_multiplexing.c"
 if(j<0||j>9999)j=0;

 }

}
