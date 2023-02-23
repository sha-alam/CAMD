void main() {
TRISB = 0;
while(1)
{
        portb.f0=1;
        delay_ms(200);
        portb.f0=0;
        delay_ms(200);
}

}