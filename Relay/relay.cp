#line 1 "E:/Course/3-1/Microcontroler/Lab/Relay/relay.c"
void main()
{
 TRISB=0;
 portb=0;
 while(1)
 {
 portb.f0=1;
 delay_ms(500);
 portb.f0=0;
 delay_ms(500);
 }
}
