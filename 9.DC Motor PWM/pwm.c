int duty=0;
void main() {
    TRISD=0xff; TRISB=0x00;
    PORTB.f0=1; PORTB.f1=0;
    PWM1_Init(1000);
    PWM1_start();
    PWM1_set_duty(duty);
    while(1){
        if(RD0_bit && duty<250){
            delay_ms(100);
            if(RD0_bit && duty<250){
                duty=duty+10;
                PWM1_set_duty(duty);
            }
        }
        if(RD0_bit && duty>0){
            delay_ms(100);
            if(RD0_bit && duty>0){
                duty=duty-10;
                PWM1_set_duty(duty);
            }
        }
        delay_ms(10);
    }
}