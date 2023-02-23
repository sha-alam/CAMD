char a[]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};
int i;
void main()
{
     TRISB =0;
     portb=0;
     while(1)
     {
         for(i=0;i<=10;i++)
         {
                 portb=a[i];
                 delay_ms(500);
         }
         for(i=8;i>=0;i--)
         {
                 portb=a[i];
                 delay_ms(500);
         }
         portb=0;
         break;
     }
     

}