#line 1 "E:/Course/3-1/Microcontroler/Lab/9.DC Motor PWM/pwm.c"
unsigned short current_duty, old_duty, current_duty1, old_duty1;

void InitMain() {


}

void main() {

 trisd=0xff;
 TRISB = 0x00;
 PORTB = 0b00000001;
 TRISC = 0x00;
 PWM1_Init(5000);
 current_duty = 0;


 PWM1_Start();
 PWM1_Set_Duty(current_duty);

 while (1) {
 if (portd.f0==1 && current_duty<255) {
 Delay_ms(100);
 current_duty+=10;
 PWM1_Set_Duty(current_duty);
 }

 if (portd.f1==1 && current_duty>0) {
 Delay_ms(100);
 current_duty-=10;
 PWM1_Set_Duty(current_duty);
 }


 Delay_ms(10);
 }
}
