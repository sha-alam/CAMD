char segment[]= {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};
int i=0,j=0,k;
void main()
{
     TRISB = 0; TRISD = 0x00; TRISC = 0xff;
     portb = 0; portc = 0;

     while(1)
     {   
         for(i=0;i<25;i++){
             portb=segment[j/10];
             portd.f0=0;
             delay_ms(1);
             portd.f0=1;
         
             portb=segment[(j%10)];
             portd.f1=0;
             delay_ms(1);
             portd.f1=1;
         
         }
         //j++;  for automatic increment
         if(portc.f6==1){
             delay_ms(100);
             if(portc.f6==1){
                 j++;
             }
         }
         if(portc.f7==1){
             delay_ms(100);
             if(portc.f7==1){
                 j--;
             }
         }
         if(j<0||j>99) j=0;

     }

}