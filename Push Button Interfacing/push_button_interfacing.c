unsigned short flag=0,rom;
void main()
{
     TRISB = 0x00;
     TRISD = 0xff;
     while(1)
     {
         if(portd.f0 == 1)
         {
             delay_ms(00);
             if(portd.f0 ==1)
             {
                 if(flag==0){
                     flag=1;
                     eeprom_write(0x01,1);
                 }
                 else{
                     flag=0;
                     eeprom_write(0x01,0);
                 }
             }
         }
         delay_ms(50);
         rom=eeprom_read(0x01);

         if(rom==0)
             portb.f0=0;
         else
             portb.f0=1;
     }
}